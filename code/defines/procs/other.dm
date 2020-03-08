/proc/save_characters()
	for (var/mob/living/carbon/human/H in SSmobs.mob_list)
		H.save_to_prefs()
