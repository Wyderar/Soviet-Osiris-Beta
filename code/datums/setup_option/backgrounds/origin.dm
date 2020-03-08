//As a general rule, all origin backrounds must have summ of +5 of stat values

/datum/category_group/setup_option_category/background/origin
	name = "Origin"
	category_item_type = /datum/category_item/setup_option/background/origin

/datum/category_item/setup_option/background/origin

/datum/category_item/setup_option/background/origin/oberth
	name = "Оберт"
	desc = "Независимая колония, основанная немецкими иммигрантами со старой Земли и состоящая из одного гигантского улья на пустынной планете.. \
			Когда-то, когда процесс терраформирования только начинался, это была одна из самых многообещающих колоний; тогда собралась группа ученых, чтобы вместе создать светлое будущее. \
			Теперь же, после зашедшей в тупик гражданской войны, Оберт превратился в анархо-капиталистический ад, управляемый тремя правительствами, которые все еще не в состоянии установить контроль над городом или прекратить разрушительные войны. \
			Даже Ханза и NeoTheology не смогли навести порядок. Хоть это все еще и является местом с бесконечными просмотрами для реализации, все же большинство из них являются незаконными."

	stat_modifiers = list(
		STAT_ROB = 6,
		STAT_TGH = -5,
		STAT_BIO = 0,
		STAT_MEC = 6,
		STAT_VIG = 6,
		STAT_COG = -8
	)


/datum/category_item/setup_option/background/origin/predstraza
	name = "Предстраза"
	desc = "Результат широко распространенной на Земле идеи о том, что если бы кто-то перенес все население Балкан на один корабль-колонию, то они были бы вынуждены отложить в сторону все свои разногласия и работать вместе, чтобы выжить.. \
			К великому сожалению, эта идея с треском провалилась. \
			Теперь это мир, полный враждебной фауны и погрязший в бесконечных вооруженных конфликтах. \
			Правительство Сербии оккупировало все космические порты Предстразы и контролирует большинство цивилизованных регионов. \
			Благодаря тому, что Предстараз расположена далеко от территорий Ханзы или NanoTrasen, это место предпочитают многие пираты, контрабандисты и всевозможные преступники."

	stat_modifiers = list(
		STAT_ROB = 10,
		STAT_TGH = 10,
		STAT_BIO = 0,
		STAT_MEC = -10,
		STAT_VIG = 5,
		STAT_COG = -10
	)


/datum/category_item/setup_option/background/origin/sich_prime
	name = "Сич Прайм"
	desc = "Украинская колония, что являлась весьма крупным промышленным центром во время Корпорационной войны, во время которой они совершили самую роковую ошибку, перейдя на сторону NanoTrasen. \
			Планета, подвергшаяся бомбардировке, понесла самые тяжелые потери на войне. Погибло огромное количество людей, а окружающая среда была серьезно разрушена. \
			Несмотря на то, что находится под прямым контролем Ханзы, ее местные военные крайне нелояльны и, как известно, поддерживают Основателей - реваншистскую международную группу, что стремится вернуть национальный контроль планетарного правительства над космосом."

	stat_modifiers = list(
		STAT_ROB = 5,
		STAT_TGH = -5,
		STAT_BIO = 10,
		STAT_MEC = 5,
		STAT_VIG = -5,
		STAT_COG = -5
	)


/datum/category_item/setup_option/background/origin/new_rome
	name = "Новый Рим"
	desc = "Это одна из первых колоний, основанная американскими поселенцами. Новый Рим был богат биосферой и природными ресурсами, поэтому служила штаб-квартирой NanoTrasen, когда она еще развивалась. Содержит самую высокую человеческую популяцию среди планет в галактике.. \
			Хоть война закончилась еще до осады, Новый Рим пережил серьезный экономический кризис после падения Nanotrasen. Настолько серьезный, что не может оправиться до сих пор.\
			Ныне колония усеяна городами-ульями, имеет проблемы огромной бедностью населения и экологией. NeoTheology отчаянно пытается искусственно возродить экологию с помощью технологии биоматерии. \
			Чтобы жить в Новом Риме необходимо сделать выбор - остаться свободным, но умереть нищим, или же присоединиться к культу неотеологии, чтобы выжить и иметь стабильную работу и место для жизни."

	stat_modifiers = list(
		STAT_ROB = 5,
		STAT_TGH = 5,
		STAT_BIO = 10,
		STAT_MEC = 5,
		STAT_VIG = -10,
		STAT_COG = -10
	)


/datum/category_item/setup_option/background/origin/shimatengoku
	name = "Симатенгоку"
	desc = "Основанная японской мегакорпорацией, Симатенгоку была и остается раем высоких технологий. Поверхность планеты на 95% покрыта морской водой, так что ее жители в основном живут на островах. \
			Когда пришло время Корпорационной войны, Симатенгоку принял мудрое решение встать на сторону Синдиката и в результате добился огромного процветания. \
			Несмотря на то, что существует местная государственная администрация, планета в основном контролируется Frozen Star - огромной компанией, что производстит большую часть военной продукции в Ханзе. \
			Сама Frozen Star принадлежит семье, связанной с Якудза - организованными преступными синдикатами, происходящими из старой Земли в Японии."

	stat_modifiers = list(
		STAT_ROB = -6,
		STAT_TGH = -7,
		STAT_BIO = -7,
		STAT_MEC = 10,
		STAT_VIG = 10,
		STAT_COG = 5
	)


/datum/category_item/setup_option/background/origin/hmss_destined
	name = "HMSS \"Предназначение\""
	desc = "Бывший Британский колониальный корабль, что не смог найти пригодную планету до того, как исчерпал запас топлива; однако, в отличие от других, экипажу удалось выжить и превратить свой корабль в крупнейшую станцию в контролируемом Ханзой пространстве. \
			\"Предназначение\" можно спокойно назвать индустриальным адом - станция вся покрыта ржавым металлом, естесственная экология отсутствует, а жить здесь невероятно дорого. \
			Во время Корпорационной войны станция оставалась нейтральной в течение большей части конфликта, но под конец она была оккупирована Синдикатом. \
			\"Предназначение\" широко известно своим анахроничным монархическим правительством и системой пэрства. Большинство успешных дворян контролируют небольшие станции рядом с ней, а другие стремятся подавить хаос внутри самой колонии. \
			Также они являются членами Гильдии Астерс, а станция считается главной территорией Гильдии."

	stat_modifiers = list(
		STAT_ROB = 5,
		STAT_TGH = 5,
		STAT_BIO = -10,
		STAT_MEC = 5,
		STAT_VIG = 10,
		STAT_COG = -10
	)


/datum/category_item/setup_option/background/origin/crozet
	name = "Кроз"
	desc = "Безжизненный ледяной мир, богатый редкими минералами. Жизнь на Крозе возможна только под землей. \
			Первая колония основана французской горнодобывающей компанией, позднее она была под контролем изгнанной знати из HMSS \"Предназначение\". \
			Изгнанники основали Четыре Великих Дома, чтобы защитить суверенитет колонии. \
			Это продолжалось ровно до тех пор, пока NanoTrasen не вторглась при поддержке одного из Домов. Позже Кроз был передан под контроль NeoTheology в соответствии с условиями мирного договора. \
			Местное население склонно к восстанию после десятилетий жестокого обращения и хочет, чтобы его оставили в покое."

	stat_modifiers = list(
		STAT_ROB = 5,
		STAT_TGH = 10,
		STAT_BIO = -7,
		STAT_MEC = -7,
		STAT_VIG = 10,
		STAT_COG = -6
	)


/datum/category_item/setup_option/background/origin/first_expeditionary_fleet
	name = "Первый Экспедиционный Флот"
	desc = "Коллекция старых модифицированных колониальных кораблей, верфей, мобильных гидропоник и, помимо всего прочего, еще и армада военных кораблей. \
			Де-факто является штаб-квартирой ЧВК Ironhammer. Армада может быть развернута всякий раз, когда это нужно для выполнения контракта, или даже эвакуироваться в дальний космос, если это необходимо. \
			Перемещается с планеты на планету по территории Ханзы и используется для устрашения планетарных правительств. \
			Для функционирования флота требуется гигантское количество рабочей силы, а корабли армады, как правило, столь же многолюдны, как небольшие города, в которых есть как гражданское население, так и военный персонал. \
			Жизнь во флоте в большинстве случаев довольно скучная, с глубокими традициями аскетизма, коренящимися в экипаже каждого корабля. \
			Само собой разумеется, что каждая планета, которую она посещает, испытывает огромный туристический бум, рост потребления, и у каждого бара или склада заканчиваются вакансии менее чем за день."

	stat_modifiers = list(
		STAT_ROB = 5,
		STAT_TGH = 5,
		STAT_BIO = -15,
		STAT_MEC = 5,
		STAT_VIG = 15,
		STAT_COG = -10
	)


/datum/category_item/setup_option/background/origin/end_point
	name = "Точка невозврата"
	desc = "A trinary system with complicated orbits and black hole located in a safe distance from all of the habitable planets in the system. \
			One of the first colonies, because of how rich the planets are in resources, and their abundance - the system being composed of more than a hundred of large celestial bodies. \
			It’s also an extremely valuable place for scientists, due to its habitable planets, the black hole and rare materials. \
			End Point was never controlled by a single power. \
			Smaller colony ships, belonging to third-world countries, damaged ships or just exploration cruisers - they have all found their place here, guided by a black hole and the riches highlighted by it. \
			Even before the war it was full of conflicts between local governments, pirates and corporations, and it just got worse afterwards. \
			While it’s formally under Hanza control now, the war resulted in a fall of many governments, thus the anarchy spreads, and patchwork states are being born and die every year. \
			Nations are mixed in a spiral of endless conflict, all of the old Earth languages are present there, and any ideology and religion can be found here. \
			This system is also known for Moebius HQ - a large station orbiting the End Point black hole."

	stat_modifiers = list(
		STAT_ROB = -9,
		STAT_TGH = -8,
		STAT_BIO = 10,
		STAT_MEC = 10,
		STAT_VIG = -8,
		STAT_COG = 10
	)


/datum/category_item/setup_option/background/origin/nss_forecaster
	name = "NSS \"Forecaster\""
	desc = "Designed to serve as large, FTL capable mining platform by the first days of NanoTrasen. \
			And it was used for that, until stars started coming back from Null Space. \
			In order to salvage those wonders first, NanoTrasen has sent this platform, reworked to serve as a local forward operating base, and renamed it to Central Command. \
			The war broke out, and without any support from the mainland, after relentless attacks from the Syndicate, and the destruction of many stations under CentComm’s control, such as NSS 13 \"Exodus\", they surrendered to Syndicate. \
			Now it’s an independent station under Ironhammer control, that oversees the spread of Null Space artifacts, or at least is trying to. \
			It’s a place for grand deals to be made, friends to be sold, a place where people run from law and boring life,for a fresh start in Null Space. \
			And - in most cases - die a horrible death in the end."

	stat_modifiers = list(
		STAT_ROB = 2,
		STAT_TGH = 2,
		STAT_BIO = -10,
		STAT_MEC = 2,
		STAT_VIG = 10,
		STAT_COG = 2
	)
