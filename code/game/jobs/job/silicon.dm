/datum/job/ai
	title = "AI"
	title_ru = "Искусственный интеллект"
	flag = AI
	department_flag = COMMAND
	faction = "CEV Eris"
	total_positions = 0 // Not used for AI, see is_position_available below and modules/mob/living/silicon/ai/latejoin.dm
	spawn_positions = 1
	selection_color = "#b5b7cb"
	supervisors = "собственными законами"
	req_admin_notify = 1
	account_allowed = 0
	wage = WAGE_NONE
	outfit_type = /decl/hierarchy/outfit/job/silicon/ai

/datum/job/ai/equip(var/mob/living/carbon/human/H, var/alt_title)
	return FALSE

/datum/job/ai/is_position_available()
	return (empty_playable_ai_cores.len != 0)

/obj/landmark/join/start/AI
	icon_state = "player-grey"
	name = "AI"
	join_tag = /datum/job/ai
	delete_me = FALSE//do we really need this huh??

/obj/landmark/join/start/triai
	icon_state = "ai-green"
	name = "triai"
	join_tag = "triai"

/datum/job/cyborg
	title = "Robot"
	title_ru = "Киборг"
	flag = CYBORG
	department_flag = MISC
	faction = "CEV Eris"
	total_positions = 2
	spawn_positions = 2
	supervisors = "собственными законами и ИИ"
	selection_color = "#cdcfe0"
	account_allowed = 0
	wage = WAGE_NONE

	outfit_type = /decl/hierarchy/outfit/job/silicon/cyborg

/datum/job/cyborg/equip(var/mob/living/carbon/human/H, var/alt_title)
	return FALSE

/obj/landmark/join/start/cyborg
	join_tag = /datum/job/cyborg
