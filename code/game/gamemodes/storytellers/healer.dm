/datum/storyteller/healer
	config_tag = "healer"
	name = "The Healer"
	welcome = "Добро пожаловать на CEV Eris!"
	description = "Мирный и спокойный рассказчик, пытающийся помочь персоналу."

	gain_mult_mundane = 0.6
	gain_mult_moderate = 0.4
	gain_mult_major = 0.4
	gain_mult_roleset = 0.4

	repetition_multiplier = 0.95
	tag_weight_mults = list(TAG_COMBAT = 0.75, TAG_NEGATIVE = 0.5, TAG_POSITIVE = 2)

	//Healer gives you half an hour to setup before any antags
	points = list(
	EVENT_LEVEL_MUNDANE = 0, //Mundane
	EVENT_LEVEL_MODERATE = 0, //Moderate
	EVENT_LEVEL_MAJOR = 0, //Major
	EVENT_LEVEL_ROLESET = 90 //Roleset
	)