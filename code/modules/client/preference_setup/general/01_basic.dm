datum/preferences
	var/gender = MALE					//gender of character (well duh)
	var/age = 20						//age of character
	var/spawnpoint = "Aft Cryogenic Storage" 			//where this character will spawn
	var/real_name						//our character's name
//	var/be_random_name = 0				//whether we are a random name every round
	var/bank_pin
	var/bank_balance = 0
	var/char_exists = 0
	var/character_id

	var/birth_day = 1
	var/birth_month = 1
	var/birth_year

	var/stat_mec
	var/stat_cog
	var/stat_bio
	var/stat_rob
	var/stat_tgh
	var/stat_vig

/datum/category_item/player_setup_item/physical/basic
	name = "Basic"
	sort_order = 1

/datum/category_item/player_setup_item/physical/basic/load_character(var/savefile/S)
	from_file(S["gender"],                pref.gender)
	from_file(S["age"],                   pref.age)
	from_file(S["spawnpoint"],            pref.spawnpoint)
	from_file(S["real_name"],             pref.real_name)
//	from_file(S["name_is_always_random"], pref.be_random_name)
	from_file(S["bank_pin"],              pref.bank_pin)
	from_file(S["bank_balance"],          pref.bank_balance)
	from_file(S["character_id"],          pref.character_id)
	from_file(S["char_exists"],           pref.char_exists)

	from_file(S["birth_day"],             pref.birth_day)
	from_file(S["birth_month"],           pref.birth_month)
	from_file(S["birth_year"],            pref.birth_year)

	from_file(S["stat_mec"],              pref.stat_mec)
	from_file(S["stat_cog"],              pref.stat_cog)
	from_file(S["stat_bio"],              pref.stat_bio)
	from_file(S["stat_rob"],              pref.stat_rob)
	from_file(S["stat_tgh"],              pref.stat_tgh)
	from_file(S["stat_vig"],              pref.stat_vig)

/datum/category_item/player_setup_item/physical/basic/save_character(var/savefile/S)
	to_file(S["gender"],                  pref.gender)
	to_file(S["age"],                     pref.age)
	to_file(S["spawnpoint"],              pref.spawnpoint)
	to_file(S["real_name"],               pref.real_name)
//	to_file(S["name_is_always_random"],   pref.be_random_name)
	to_file(S["bank_pin"],                pref.bank_pin)
	to_file(S["bank_balance"],            pref.bank_balance)
	to_file(S["char_exists"],             pref.char_exists)

	to_file(S["birth_day"],               pref.birth_day)
	to_file(S["birth_month"],             pref.birth_month)
	to_file(S["birth_year"],              pref.birth_year)

	to_file(S["stat_mec"],                pref.stat_mec)
	to_file(S["stat_cog"],                pref.stat_cog)
	to_file(S["stat_bio"],                pref.stat_bio)
	to_file(S["stat_rob"],                pref.stat_rob)
	to_file(S["stat_tgh"],                pref.stat_tgh)
	to_file(S["stat_vig"],                pref.stat_vig)

/datum/category_item/player_setup_item/physical/basic/reset_character(var/savefile/S)
	pref.real_name = random_name(pref.gender, pref.species)
	pref.bank_balance = null
	pref.char_exists = null
	pref.character_id = null
	pref.birth_day = null
	pref.birth_month = null
	pref.birth_year = null
	pref.stat_mec = null
	pref.stat_cog = null
	pref.stat_bio = null
	pref.stat_rob = null
	pref.stat_tgh = null
	pref.stat_vig = null

/datum/category_item/player_setup_item/physical/basic/sanitize_character()
	var/datum/species/S = all_species[pref.species ? pref.species : SPECIES_HUMAN]
	if(!S) S = all_species[SPECIES_HUMAN]
	pref.age                = sanitize_integer(pref.age, S.min_age, S.max_age, initial(pref.age))
	pref.gender             = sanitize_inlist(pref.gender, S.genders, pick(S.genders))
	pref.spawnpoint         = sanitize_inlist(pref.spawnpoint, get_late_spawntypes(), initial(pref.spawnpoint))
	pref.birth_day          = sanitize_integer(pref.birth_day, 1, 31, initial(pref.birth_day))
	pref.birth_month        = sanitize_integer(pref.birth_month, 1, 12, initial(pref.birth_month))
	if(!pref.birth_year)
		adjust_year()
//	pref.be_random_name     = sanitize_integer(pref.be_random_name, 0, 1, initial(pref.be_random_name))
	if(!pref.bank_pin)
		pref.bank_pin = rand(1111,9999)
	pref.bank_pin           = sanitize_integer(pref.bank_pin, 1111, 9999, initial(pref.bank_pin))
	if(!pref.bank_balance)
		pref.bank_balance = 0
	pref.bank_balance       = sanitize_integer(pref.bank_balance, 0, 999999, initial(pref.bank_balance))
	if(!pref.character_id)
		pref.character_id	= md5("[pref.client_ckey][rand(30,50)]")

	// This is a bit noodly. If pref.cultural_info[TAG_CULTURE] is null, then we haven't finished loading/sanitizing, which means we might purge
	// numbers or w/e from someone's name by comparing them to the map default. So we just don't bother sanitizing at this point otherwise.
	/*
	if(pref.cultural_info[TAG_CULTURE])
		var/decl/cultural_info/check = SSculture.get_culture(pref.cultural_info[TAG_CULTURE])
		if(check)
			pref.real_name = check.sanitize_name(pref.real_name, pref.species)
			if(!pref.real_name)
				pref.real_name = random_name(pref.gender, pref.species)
	*/
/datum/category_item/player_setup_item/physical/basic/content()
	. = list()
	. += "<h1>Основная информация</h1><hr>"
	. += "<b>Имя:</b> "
	. += "<a href='?src=\ref[src];rename=1'><b>[pref.real_name]</b></a> "
	. += "<a href='?src=\ref[src];random_name=1'>Случайное имя</A><br>"
//	. += "<a href='?src=\ref[src];always_random_name=1'>Всегда случайное имя: [pref.be_random_name ? "Да" : "Нет"]</a>"
//	. += "<hr>"
	if(!pref.char_exists)
		. += "<b>Пол:</b> <a href='?src=\ref[src];gender=1'><b>[gender2text(pref.gender)]</b></a><br>"
		. += "<b>Возраст:</b> <a href='?src=\ref[src];age=1'>[pref.age]</a><br>"
		. += "<b>Дата рождения:</b> <a href='?src=\ref[src];birth_day=1'>[pref.birth_day]</a>/<a href='?src=\ref[src];birth_month=1'>[pref.birth_month]</a>/[pref.birth_year]<br>"
	else
		. += "<b>Пол:</b> <b>[gender2text(pref.gender)]</b><br>"
		. += "<b>Возраст:</b> [pref.age]<br>"
		. += "<b>Дата рождения:</b> [pref.birth_day]/[pref.birth_month]/[pref.birth_year]<br>"
	. += "<b>Точка появления</b>: <a href='?src=\ref[src];spawnpoint=1'>[pref.spawnpoint]</a><br>"
	. += "<b>PIN</b>: <a href='?src=\ref[src];bank_pin=1'>[pref.bank_pin]</a>"
	if(pref.char_exists)
		var/stat_none = "0"
		. += "<br><b>Баланс</b>: [pref.bank_balance][CREDS]<br>"
		. += "<hr>"
		. += "<b>Навыки:</b><br>"
		. += "Механика: [pref.stat_mec ? pref.stat_mec : stat_none]<br>"
		. += "Интеллект: [pref.stat_cog ? pref.stat_cog : stat_none]<br>"
		. += "Биология: [pref.stat_bio ? pref.stat_bio : stat_none]<br>"
		. += "Сила: [pref.stat_rob ? pref.stat_rob : stat_none]<br>"
		. += "Стойкость: [pref.stat_tgh ? pref.stat_tgh : stat_none]<br>"
		. += "Бдительность: [pref.stat_vig ? pref.stat_vig : stat_none]"

	. = jointext(.,null)

/datum/category_item/player_setup_item/physical/basic/OnTopic(var/href,var/list/href_list, var/mob/user)
	var/datum/species/S = all_species[pref.species]

	if(href_list["rename"])
		var/raw_name = input(user, "Введите имя своего персонажа:", "Character Name", pref.real_name)  as text|null
		if (!isnull(raw_name) && CanUseTopic(user))
			var/new_name = sanitize_name(raw_name, pref.species)
			if(new_name)
				pref.real_name = new_name
				return TOPIC_REFRESH
			else
				to_chat(user, SPAN_WARNING("Invalid name. Your name should be at least 2 and at most [MAX_NAME_LEN] characters long. It may only contain the characters A-Z, a-z, -, ' and ."))
				return TOPIC_NOACTION

	else if(href_list["random_name"])
		pref.real_name = random_name(pref.gender, pref.species)
		return TOPIC_REFRESH

//	else if(href_list["always_random_name"])
//		pref.be_random_name = !pref.be_random_name
//		return TOPIC_REFRESH

	else if(href_list["gender"])
		var/new_gender = input(user, "Выберите пол персонажа:", CHARACTER_PREFERENCE_INPUT_TITLE, pref.gender) as null|anything in S.genders
		S = all_species[pref.species]
		if(new_gender && CanUseTopic(user) && (new_gender in S.genders))
			pref.gender = new_gender
		return TOPIC_REFRESH_UPDATE_PREVIEW

	else if(href_list["age"])
		var/new_age = input(user, "Введите возраст персонажа:\n([S.min_age]-[S.max_age])", CHARACTER_PREFERENCE_INPUT_TITLE, pref.age) as num|null
		if(new_age && CanUseTopic(user))
			pref.age = max(min(round(text2num(new_age)), S.max_age), S.min_age)
			//pref.skills_allocated = pref.sanitize_skills(pref.skills_allocated)		// The age may invalidate skill loadouts
			adjust_year()
			return TOPIC_REFRESH

	else if(href_list["spawnpoint"])
		var/list/spawnkeys = list()
		for(var/spawntype in get_late_spawntypes())
			spawnkeys += spawntype
		var/choice = input(user, "Where would you like to spawn when late-joining?") as null|anything in spawnkeys
		if(!choice || !get_late_spawntypes()[choice] || !CanUseTopic(user))	return TOPIC_NOACTION
		pref.spawnpoint = choice
		return TOPIC_REFRESH

	else if(href_list["bank_pin"])
		var/new_pin = input(user, "Введите новый PIN код:\n(1111-9999)", pref.bank_pin) as num|null
		if(new_pin && CanUseTopic(user))
			pref.bank_pin = max(min(round(text2num(new_pin)), 9999), 1111)
			return TOPIC_REFRESH
	
	else if(href_list["birth_day"])
		var/min_day = 1
		var/max_day
		if(pref.birth_month in THIRTY_ONE_DAY_MONTHS)
			max_day = 31
		if(pref.birth_month in THIRTY_DAY_MONTHS)
			max_day = 30
		if(pref.birth_month in TWENTY_EIGHT_DAY_MONTHS)
			max_day = 28
		var/new_day = input(user, "Выберите день рождения персонажа:\n([min_day]-[max_day])", CHARACTER_PREFERENCE_INPUT_TITLE, pref.birth_day) as num|null
		if(new_day && CanUseTopic(user))
			pref.birth_day = max(min(round(text2num(new_day)), max_day), min_day)
			adjust_year()
			return TOPIC_REFRESH
	
	else if(href_list["birth_month"])
		var/month_min = 1
		var/month_max = 12

		var/new_month = input(user, "Выберите месяц рождения персонажа:\n([month_min]-[month_max])", CHARACTER_PREFERENCE_INPUT_TITLE, pref.birth_month) as num|null
		if(new_month && CanUseTopic(user))
			pref.birth_month = max(min(round(text2num(new_month)), month_max), month_min)
			if(pref.birth_month in THIRTY_DAY_MONTHS)
				if(pref.birth_day > 30)
					pref.birth_day = 30
			if(pref.birth_month in TWENTY_EIGHT_DAY_MONTHS)
				if(pref.birth_day > 28)
					pref.birth_day = 28
			adjust_year()
			return TOPIC_REFRESH

	return ..()

/datum/category_item/player_setup_item/physical/basic/proc/adjust_year()
	pref.birth_year = (game_year - pref.age)
	var/game_month = text2num(time2text(world.realtime, "MM"))
	var/game_day = text2num(time2text(world.realtime, "DD"))
	if((game_month < pref.birth_month) && (game_day < pref.birth_day))
		pref.birth_year --
	return TOPIC_REFRESH