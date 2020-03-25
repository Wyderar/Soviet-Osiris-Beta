//Please use mob or src (not usr) in these procs. This way they can be called in the same fashion as procs.
/client/verb/wikiurl()
	set name = "wikiurl"
	set desc = "Visit the wiki."
	set hidden = 1
	if( config.wikiurl )
		if(alert("This will open the wiki in your browser. Are you sure?",,"Yes","No")=="No")
			return
		src << link(config.wikiurl)
	else
		to_chat(src, SPAN_WARNING("The wiki URL is not set in the server configuration."))
	return

/client/verb/discordurl()
	set name = "discordurl"
	set desc = "Visit the Discordia Github."
	set hidden = 1
	if( config.discordurl )
		if(alert("This will open the Discordia Discord  invite in your browser. Are you sure?",,"Yes","No")=="No")
			return
		src << link(config.discordurl)
	else
		to_chat(src, SPAN_WARNING("The Discordia Discord invite is not set in the server configuration."))
	return

/client/verb/githuburl()
	set name = "githuburl"
	set desc = "Visit the Discordia Github."
	set hidden = 1
	if( config.githuburl )
		if(alert("This will open the Discordia Github page in your browser. Are you sure?",,"Yes","No")=="No")
			return
		src << link(config.githuburl)
	else
		to_chat(src, SPAN_WARNING("The Discordia Github is not set in the server configuration."))
	return


#define RULES_FILE "config/rules.html"
/client/verb/rules()
	set name = "Rules"
	set desc = "Show Server Rules."
	set hidden = 1
	src << browse(file(RULES_FILE), "window=rules;size=480x320")
#undef RULES_FILE

/client/verb/hotkeys_help()
	set name = "hotkeys-help"
	set category = "OOC"
	set hidden = TRUE

	var/admin = {"<font color='purple'>
Admin:
\tF5 = Aghost (admin-ghost)
\tF6 = player-panel
\tF7 = admin-pm
\tF8 = Invisimin
Admin Ghost:
\tShift + Ctrl + Click = View Variables
</font>"}

	var/hotkey_mode = {"<font color='purple'>
Горячие клавиши: (нажмите TAB, чтобы включить)
\tWASD - передвижение
\tAlt (удерж.) - переключить режим ходьбы
\tC (удерж.) - зафиксировать взгляд персонажа
\tQ - бросить предмет в руке
\tE - экипировать предмет в руке
\tR - включить режим броска
\tT - говорить
\tY - шептать
\t5 - эмоция
\tX - сменить активную руку
\tZ - активировать предмет в руке
\tV - лечь на пол
\tG - закрыть глаза
\tB - задержать дыхание
\t1 - режим "Помощь"
\t2 - режим "Обезоружить"
\t3 - режим "Схватить"
\t4 - режим "Ударить"
\tSPACE - взять предмет в две руки
\tПКМ с вкл. "Помощь" и предметом в руке - передать другому персонажу предмет
\tПКМ по предмету - показать список взаимодействий
\tAlt+ЛКМ по полу - список предметов на этом полу
\tAlt+ЛКМ по объекту - дополнительное взаимодействие с объектом
\tCtrl+ЛКМ по предмету - тащить
\tShift+ЛКМ - изучить
\tCtrl+ПКМ - указать на объект
</font>"}

	var/robot_hotkey_mode = {"<font color='purple'>
Hotkey-Mode: (hotkey-mode must be on)
\tTAB = toggle hotkey-mode
\ta = left
\ts = down
\td = right
\tw = up
\tq = unequip active module
\tt = say
\tx = cycle active modules
\tz = activate held object (or y)
\tf = cycle-intents-left
\tg = cycle-intents-right
\t1 = activate module 1
\t2 = activate module 2
\t3 = activate module 3
\t4 = toggle intents
\t5 = emote
\tCtrl = drag
\tShift = examine
</font>"}

	if(isrobot(src.mob))
		to_chat(src, robot_hotkey_mode)
//		to_chat(src, robot_other)
	else
		to_chat(src, hotkey_mode)
//		to_chat(src, other)
	if(holder)
		to_chat(src, admin)
