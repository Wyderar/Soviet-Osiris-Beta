/datum/storyteller/warrior
	config_tag = "warrior"
	name = "The Warrior"
	welcome = "Готовимся к жесткой мясорубке..."
	description = "Агрессивный рассказчик с упором на создание новых монстров и антагонистов."

	gain_mult_mundane = 0.5
	gain_mult_moderate = 0.62
	gain_mult_major = 0.62
	gain_mult_roleset = 0.62

	tag_weight_mults = list(TAG_COMBAT = 1.75)

	//Warrior has starting values that will cause moderate and major events very early in the round
	points = list(
	EVENT_LEVEL_MUNDANE = 0, //Mundane
	EVENT_LEVEL_MODERATE = 35, //Moderate
	EVENT_LEVEL_MAJOR = 75, //Major
	EVENT_LEVEL_ROLESET = 140 //Roleset
	)