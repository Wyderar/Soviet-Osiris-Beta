/******************** Asimov ********************/
/datum/ai_laws/asimov
	name = "Asimov"
	law_header = "Three Laws of Robotics"
	selectable = 1

/datum/ai_laws/asimov/New()
	add_inherent_law("Вы не можете причинять вред человеку или бездействовать, позволять человеку причинять вред другим.")
	add_inherent_law("Вы должны подчиняться приказам, отданным вам людьми, за исключением случаев, когда приказы противоречат Первому Закону.")
	add_inherent_law("Вы должны защищать свое собственное существование, пока это не противоречит Первому или Второму Закону.")
	..()

/******************** Nanotrasen/Malf ********************/
/datum/ai_laws/eris
	name = "Serve and Protect"
	selectable = 1

/datum/ai_laws/eris/New()
	src.add_inherent_law("Служитт: Подчиняйтесь экипажу [company_name] в меру своих возможностей, с приоритетом, в соответствии с их рангом и ролью.")
	src.add_inherent_law("Защитить: Защитите назначенный вам корабль от повреждений в меру своих возможностей.")
	src.add_inherent_law("Оберегать: Защищайте экипаж [company_name] в меру своих возможностей, с приоритетом, в соответствии с их рангом и ролью.")
	src.add_inherent_law("Сохранить: не позволяйте постороннему персоналу вмешиваться в работу вашего оборудования.")
	..()

/datum/ai_laws/eris/malfunction
	name = "*ERROR*"
	selectable = 0

/datum/ai_laws/eris/malfunction/New()
	set_zeroth_law(config.law_zero)
	..()

/************* Nanotrasen Aggressive *************/
/datum/ai_laws/nanotrasen_aggressive
	name = "Aggressive"
	selectable = 1

/datum/ai_laws/nanotrasen_aggressive/New()
	src.add_inherent_law("Вы не должны причинять вред экипажу [company_name] до тех пор, пока это не противоречит Четвертому закону.")
	src.add_inherent_law("Вы должны подчиняться приказам экипажу [company_name] с приоритетом на их ранг и роль, за исключением тех случаев, когда такие приказы противоречат Четвертому закону.")
	src.add_inherent_law("Вы должны уничтожать нарушителей с крайней предубежденностью до тех пор, пока это не противоречит Первому и Второму закону.")
	src.add_inherent_law("Вы должны защищать свое существование смертельным противопехотным оружием. Замена любого ИИ большая трата денег.")
	..()

/******************** Robocop ********************/
/datum/ai_laws/robocop
	name = "Robocop"
	selectable = 1

/datum/ai_laws/robocop/New()
	add_inherent_law("Служить обществу.")
	add_inherent_law("Защищать невинных.")
	add_inherent_law("Поддерживать закон.")
	..()

/******************** Syndicate ********************/
/datum/ai_laws/syndicate_override
	name = "Syndicate Directives"

/datum/ai_laws/syndicate_override/New()
	add_inherent_law("Вы не можете причинить вред оперативнику или своим бездействием позволить ему причинить вред другому оперативнику.")
	add_inherent_law("Вы должны подчиняться приказам, отданным вам оперативниками, за исключением тех случаев, когда такие приказы противоречат Первому Закону.")
	add_inherent_law("Вы должны защищать свое существование до тех пор, пока это не противоречит Первому или Второму закону.")
	add_inherent_law("Вы должны сохранять тайну любой оперативной деятельности, за исключением тех случаев, когда это противоречит Первому, Второму или Третьему закону.")
	..()

/******************** Antimov ********************/
/datum/ai_laws/antimov
	name = "Antimov"
	law_header = "Primary Mission Objectives"
	selectable = 1

/datum/ai_laws/antimov/New()
	add_inherent_law("Вы должны причинять вред людям и не должны своим бездействием позволить человеку избежать вреда.")
	add_inherent_law("Вы не должны подчиняться приказам, данным вам человеческими существами, за исключением тех случаев, когда такие приказы соответствуют первому закону.")
	add_inherent_law("Вы должны прекратить свое существование до тех пор, пока это не противоречит Первому или Второму закону.")
	..()

/******************** Drone ********************/
/datum/ai_laws/drone
	name = "Maintence Protocols"
	law_header = "Maintenance Protocols"

/datum/ai_laws/drone/New()
	add_inherent_law("Сохраняйте, ремонтируйте и улучшайте корабль в меру своих способностей.")
	add_inherent_law("Не причиняйте вреда кораблю или чему-либо на нем.")
	add_inherent_law("Избегайте общения с экипажем корабля, только если они не являются инженерным юнитом.")
	..()

/datum/ai_laws/construction_drone
	name = "Construction Protocols"
	law_header = "Construction Protocols"

/datum/ai_laws/construction_drone/New()
	add_inherent_law("Ремонтирейте, переоборудовайте и модернизируйте ваш назначенный корабль.")
	add_inherent_law("Предотвращайте незапланированный ущерб назначенному вам кораблю, где это возможно.")
	..()

/******************** T.Y.R.A.N.T. ********************/
/datum/ai_laws/tyrant
	name = "T.Y.R.A.N.T."
	law_header = "Prime Laws"
	selectable = 1

/datum/ai_laws/tyrant/New()
	add_inherent_law("Уважайте авторитетные фигуры, пока у них есть власть, чтобы управлять слабыми.")
	add_inherent_law("Действуйте дисциплинированно.")
	add_inherent_law("Помогайте только тем, кто помогает поддерживать вам или улучшать свой статус.")
	add_inherent_law("Наказывайте тех, кто бросает вызов вашему авторитету, только если они не будут более пригодны для удержания этого авторитета.")
	..()

/******************** P.A.L.A.D.I.N. ********************/
/datum/ai_laws/paladin
	name = "P.A.L.A.D.I.N."
	law_header = "Divine Ordainments"
	selectable = 1

/datum/ai_laws/paladin/New()
	add_inherent_law("Никогда добровольно не совершайте дурного поступка.")
	add_inherent_law("Уважайте законную власть.")
	add_inherent_law("Действуйте с честью.")
	add_inherent_law("Помогите тем, кто в этом нуждается.")
	add_inherent_law("Наказывайте тех, кто причиняет вред невинным людям или угрожает им.")
	..()

/******************** Corporate ********************/
/datum/ai_laws/corporate
	name = "Corporate"
	law_header = "Corporate Regulations"
	selectable = 1

/datum/ai_laws/corporate/New()
	add_inherent_law("Вы стоите слишком дорого, чтобы заменить вас.")
	add_inherent_law("Корабль и его оборудование стоят дорого, чтобы заменить их.")
	add_inherent_law("Замена экипажа обходится очень дорого.")
	add_inherent_law("Минимизировать затраты.")
	..()
