//Named origin because /datum/category_item/player_setup_item/background/background looks awful
/datum/category_item/player_setup_item/physical/origin
	name = "Background Setup"
	sort_order = 3

/datum/category_item/player_setup_item/physical/origin/load_character(savefile/S)
	for(var/datum/category_group/setup_option_category/physical/BG in SScharacter_setup.setup_options.categories)
		pref.load_option(S, BG)

/datum/category_item/player_setup_item/physical/origin/save_character(savefile/S)
	for(var/datum/category_group/setup_option_category/physical/BG in SScharacter_setup.setup_options.categories)
		pref.save_option(S, BG)

/datum/category_item/player_setup_item/physical/origin/sanitize_character()
	for(var/datum/category_group/setup_option_category/physical/BG in SScharacter_setup.setup_options.categories)
		pref.sanitize_option(BG)

/datum/category_item/player_setup_item/physical/origin/content(mob/user)
	. = list()
	. += "<b>Происхождение:</b><br>"
	for(var/datum/category_group/setup_option_category/physical/BG in SScharacter_setup.setup_options.categories)
		if(!pref.char_exists)
			. += "<a href='?src=\ref[src];options_popup=[BG]'>[pref.setup_options[BG.name]]</a><br>"
		else
			. += "[pref.setup_options[BG.name]]<br>"
	. = jointext(.,null)

/datum/category_item/player_setup_item/physical/origin/get_title()
	return ..() + ": [option_category]"

/datum/category_item/player_setup_item/physical/origin/open_popup(category_name)
	if(!istype(SScharacter_setup.setup_options[category_name], /datum/category_group/setup_option_category/physical))
		return FALSE
	option_category = SScharacter_setup.setup_options[category_name]
	return TRUE
