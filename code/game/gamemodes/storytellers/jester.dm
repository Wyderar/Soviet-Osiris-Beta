/datum/storyteller/jester
	config_tag = "jester"
	name = "The Jester"
	welcome = "А вы знаете, что такое безумие?"
	description = "Агрессивный и хаотичный рассказчик, генерирующий большое количество случайных событий."

	gain_mult_mundane = 0.92
	gain_mult_moderate = 0.82
	gain_mult_major = 0.82
	gain_mult_roleset = 0.5

	variance = 0.25
	repetition_multiplier = 0.65

	//Jester generates lots of random events, but not so many antags
	points = list(
	EVENT_LEVEL_MUNDANE = 15, //Mundane
	EVENT_LEVEL_MODERATE = 35, //Moderate
	EVENT_LEVEL_MAJOR = 75, //Major
	EVENT_LEVEL_ROLESET = 100 //Roleset
	)