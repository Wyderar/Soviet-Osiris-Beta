/obj/item/organ_module/active/simple/holster
	name = "Compact Embedded Holster"
	desc = "A compact holster designed to be inserted into an arm, with the holsted gun. Gives you a nice advantage in a duel."
	verb_name = "Deploy a gun"
	icon_state = "holster"
	matter = list(MATERIAL_STEEL = 8, MATERIAL_GOLD = 2, MATERIAL_SILVER = 3)
	allowed_organs = list(BP_R_ARM, BP_L_ARM)

/obj/item/organ_module/active/simple/holster/attackby(obj/item/I, mob/user)
	if(istype(I, /obj/item/weapon/gun/projectile))
		var/obj/item/weapon/gun/projectile/gun = I
		if(gun.slot_flags & SLOT_HOLSTER)
			if(!(holding))
				to_chat(user, SPAN_NOTICE("You inserted [gun.name] into [name]."))
				user.drop_item()
				I.forceMove(src)
				if(gun.recoil_buildup)
					gun.recoil_buildup /= 3
				holding = gun
				holding.canremove = 0
				name = "Compact Embedded Holster ([holding.name])"
				..()
			else
				to_chat(user, SPAN_NOTICE("You cannot holst [I.name] in [src.name], because it's already holsted something."))
				..()
		else
			to_chat(user, SPAN_NOTICE("[gun.name] cannot be holsted."))
			..()
	else if(I.has_quality(QUALITY_SCREW_DRIVING) && holding)
		to_chat(user, SPAN_NOTICE("You unscrew [holding.name] from [name]."))
		var/obj/item/weapon/gun/projectile/gun = holding
		gun.canremove = 1
		if(gun.recoil_buildup)
			gun.recoil_buildup *= 3
		gun.forceMove(user.loc)
		holding = null
		name = "Compact Embedded Holster"
	else
		to_chat(user,SPAN_NOTICE("[I.name] cannot be inserted into [name]."))
		..()