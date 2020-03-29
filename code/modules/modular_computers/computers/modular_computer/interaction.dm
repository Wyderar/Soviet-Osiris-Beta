/obj/item/modular_computer/proc/can_interact(var/mob/user)
	if(usr.incapacitated())
		to_chat(user, "<span class='warning'>You can't do that.</span>")
		return FALSE

	if(!Adjacent(usr))
		to_chat(user, "<span class='warning'>You can't reach it.</span>")
		return FALSE

	return TRUE

/obj/item/modular_computer/RightClick(mob/living/user)
	if(user.Adjacent(src))
		show_radial(user)

/obj/item/modular_computer/check_menu(mob/living/user)
	if(!istype(user))
		return FALSE
	if(user.incapacitated() || !user.Adjacent(src))
		return FALSE
	return TRUE

/obj/item/modular_computer/show_radial(mob/living/user)
	if(!user) 
		return
	var/list/layer_list = list()
	if(!is_equipped())
		if(!anchored)
			layer_list += list(
				"Pull" = image(icon = 'icons/mob/radial/menu.dmi', icon_state = "radial_pull"),
				"Pickup" = image(icon = 'icons/mob/radial/menu.dmi', icon_state = "radial_pickup"),
				)
		layer_list += list("Examine" = image(icon = 'icons/mob/radial/menu.dmi', icon_state = "radial_examine"))
	if(enabled)
		layer_list += list("Forced Shutdown" = image(icon = 'icons/mob/radial/menu.dmi', icon_state = "radial_shutdown"))
	if(ai_slot)
		layer_list += list("Eject AI" = image(icon = 'icons/mob/radial/menu.dmi', icon_state = "radial_ejectai"))
	if(portable_drive)
		layer_list += list("Eject Portable Storage" = image(icon = 'icons/mob/radial/menu.dmi', icon_state = "radial_ejectusb"))
	if(card_slot && card_slot.stored_card)
		layer_list += list("Remove ID" = image(icon = 'icons/mob/radial/menu.dmi', icon_state = "radial_ejectid"))
	if(stores_pen && istype(stored_pen))
		layer_list += list("Remove Pen" = image(icon = 'icons/mob/radial/menu.dmi', icon_state = "radial_removepen"))
	var/layer_result = show_radial_menu(user, src, layer_list, custom_check = CALLBACK(src, .proc/check_menu, user), require_near = TRUE, tooltips = FALSE)
	if(!check_menu(user))
		return
	switch(layer_result)
		if("Pull")
			if(Adjacent(user))
				user.start_pulling(src)
		if("Pickup")
			if(pre_pickup(user))
				pickup(user)
		if("Examine")
			if(user.client && user.client.eye == user)
				user.examinate(src)
		if("Forced Shutdown")
			if(enabled)
				bsod = 1
				update_icon()
				shutdown_computer()
				to_chat(user, "You press a hard-reset button on \the [src]. It displays a brief debug screen before shutting down.")
				spawn(2 SECONDS)
					bsod = 0
					update_icon()
		if("Eject AI")
			proc_eject_ai(user)
		if("Eject Portable Storage")
			proc_eject_usb(user)
		if("Remove ID")
			playsound(loc, 'sound/machines/id_swipe.ogg', 100, 1)
			proc_eject_id(user)
		if("Remove Pen")
			if(istype(stored_pen))
				to_chat(user, SPAN_NOTICE("You remove [stored_pen] from [src]."))
				stored_pen.forceMove(get_turf(src))
				if(!issilicon(user))
					user.put_in_hands(stored_pen)
				stored_pen = null

/obj/item/modular_computer/proc/proc_eject_id(mob/user)
	if(!user)
		user = usr

	if(!can_interact(usr))
		return

	for(var/p in all_threads)
		var/datum/computer_file/program/PRG = p
		PRG.event_id_removed()

	card_slot.stored_card.forceMove(get_turf(src))
	if(!issilicon(user))
		user.put_in_hands(card_slot.stored_card)
	to_chat(user, SPAN_NOTICE("You remove [card_slot.stored_card] from [src]."))
	card_slot.stored_card = null
	update_uis()
	update_label()

/obj/item/modular_computer/proc/proc_eject_usb(mob/user)
	if(!user)
		user = usr

	if(!portable_drive)
		to_chat(user, "There is no portable device connected to \the [src].")
		return

	var/obj/item/weapon/computer_hardware/hard_drive/portable/PD = portable_drive

	uninstall_component(portable_drive, user)
	user.put_in_hands(PD)
	update_uis()

/obj/item/modular_computer/proc/proc_eject_ai(mob/user)
	if(!user)
		user = usr

	if(!ai_slot || !ai_slot.stored_card)
		to_chat(user, "There is no intellicard connected to \the [src].")
		return

	ai_slot.stored_card.forceMove(get_turf(src))
	ai_slot.stored_card = null
	ai_slot.update_power_usage()
	update_uis()

/obj/item/modular_computer/attack_ghost(var/mob/observer/ghost/user)
	if(enabled)
		ui_interact(user)
	else if(check_rights(R_ADMIN, 0, user))
		var/response = alert(user, "This computer is turned off. Would you like to turn it on?", "Admin Override", "Yes", "No")
		if(response == "Yes")
			turn_on(user)

/obj/item/modular_computer/attack_ai(var/mob/user)
	return attack_self(user)

/obj/item/modular_computer/attack_hand(var/mob/user)
	if(anchored)
		return attack_self(user)
	return ..()

// On-click handling. Turns on the computer if it's off and opens the GUI.
/obj/item/modular_computer/attack_self(var/mob/user)
	if(enabled && screen_on)
		ui_interact(user)
	else if(!enabled && screen_on)
		turn_on(user)

/obj/item/modular_computer/attackby(obj/item/W, mob/user)
	if(istype(W, /obj/item/weapon/card/id)) // ID Card, try to insert it.
		var/obj/item/weapon/card/id/I = W
		if(!card_slot)
			to_chat(user, "You try to insert [I] into [src], but it does not have an ID card slot installed.")
			return

		if(card_slot.stored_card)
			to_chat(user, "You try to insert [I] into [src], but its ID card slot is occupied.")
			return

		if(!user.unEquip(I, src))
			return

		card_slot.stored_card = I
		update_label()
		update_uis()
		playsound(loc, 'sound/machines/id_swipe.ogg', 100, 1)
		to_chat(user, "You insert [I] into [src].")

		return
	if(istype(W, /obj/item/weapon/pen) && stores_pen)
		if(istype(stored_pen))
			to_chat(user, "<span class='notice'>There is already a pen in [src].</span>")
			return
		if(!insert_item(W, user))
			return
		stored_pen = W
		return

	if(scanner && scanner.do_on_attackby(user, W))
		return

	if(istype(W, /obj/item/weapon/paper) || istype(W, /obj/item/weapon/paper_bundle))
		if(printer)
			printer.attackby(W, user)
	if(istype(W, /obj/item/device/aicard))
		if(!ai_slot)
			return
		ai_slot.attackby(W, user)

	if(!modifiable)
		return ..()

	if(istype(W, suitable_cell) || istype(W, /obj/item/weapon/computer_hardware))
		try_install_component(W, user)



	var/obj/item/weapon/tool/tool = W
	if(tool)
		var/list/usable_qualities = list(QUALITY_SCREW_DRIVING, QUALITY_WELDING, QUALITY_BOLT_TURNING)
		var/tool_type = tool.get_tool_type(user, usable_qualities, src)
		switch(tool_type)
			if(QUALITY_BOLT_TURNING)
				var/list/components = get_all_components()
				if(components.len)
					to_chat(user, "Remove all components from \the [src] before disassembling it.")
					return
				if(tool.use_tool(user, src, WORKTIME_SLOW, QUALITY_BOLT_TURNING, FAILCHANCE_VERY_EASY, required_stat = STAT_COG))
					new /obj/item/stack/material/steel( get_turf(src.loc), steel_sheet_cost )
					src.visible_message("\The [src] has been disassembled by [user].")
					qdel(src)
					return

			if(QUALITY_WELDING)
				if(!damage)
					to_chat(user, "\The [src] does not require repairs.")
					return
				if(tool.use_tool(user, src, WORKTIME_SLOW, QUALITY_WELDING, FAILCHANCE_HARD, required_stat = STAT_COG))
					damage = 0
					to_chat(user, "You repair \the [src].")
					return

			if(QUALITY_SCREW_DRIVING)
				var/list/all_components = get_all_components()
				if(!all_components.len)
					to_chat(user, "This device doesn't have any components installed.")
					return
				var/list/component_names = list()
				for(var/obj/item/weapon/H in all_components)
					component_names.Add(H.name)
				var/list/options = list()
				for(var/i in component_names)
					for(var/X in all_components)
						var/obj/item/weapon/TT = X
						if(TT.name == i)
							options[i] = image(icon = TT.icon, icon_state = TT.icon_state)
				var/choice
				choice = show_radial_menu(user, src, options, radius = 32)
				if(!choice)
					return
				if(!Adjacent(usr))
					return
				if(tool.use_tool(user, src, WORKTIME_FAST, QUALITY_SCREW_DRIVING, FAILCHANCE_VERY_EASY, required_stat = STAT_COG))
					var/obj/item/weapon/computer_hardware/H = find_hardware_by_name(choice)
					if(!H)
						return
					uninstall_component(H, user)
					return
	..()

/obj/item/modular_computer/examine(var/mob/user)
	. = ..()

	if(enabled && .)
		to_chat(user, "The time [stationtime2text()] is displayed in the corner of the screen.")

	if(card_slot && card_slot.stored_card)
		to_chat(user, "The [card_slot.stored_card] is inserted into it.")

/obj/item/modular_computer/MouseDrop(atom/over_object)
	var/mob/M = usr
	if(!istype(over_object, /obj/screen) && can_interact(M))
		return attack_self(M)

	if((src.loc == M) && istype(over_object, /obj/screen/inventory/hand) && eject_item(cell, M))
		cell = null
		update_icon()

/obj/item/modular_computer/afterattack(atom/target, mob/user, proximity)
	. = ..()
	if(scanner)
		scanner.do_on_afterattack(user, target, proximity)

/obj/item/modular_computer/CtrlAltClick(mob/user)
	if(!CanPhysicallyInteract(user))
		return
	open_terminal(user)