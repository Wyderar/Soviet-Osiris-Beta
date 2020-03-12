/proc/save_characters()
	for (var/mob/living/carbon/human/H in SSmobs.mob_list)
		H.save_to_prefs()
	log_game("All character data has been saved!")
	message_admins("\blue All character data has been saved!", 1)
	
