/datum/gear/bible
	display_name = "NeoTheology ritual book"
	path = /obj/item/weapon/book/ritual/cruciform
	cost = 300

/datum/gear/flashlight
	display_name = "flashlight"
	path = /obj/item/device/lighting/toggleable/flashlight
	cost = 10

/datum/gear/crowbar
	display_name = "crowbar"
	path = /obj/item/weapon/tool/crowbar
	cost = 10

/datum/gear/cane
	display_name = "cane"
	path = /obj/item/weapon/cane
	cost = 15

/datum/gear/dice
	display_name = "dice pack"
	path = /obj/item/weapon/storage/pill_bottle/dice
	cost = 5

/datum/gear/cards
	display_name = "deck of cards"
	path = /obj/item/weapon/deck/cards
	cost = 5

/datum/gear/tarot
	display_name = "deck of tarot cards"
	path = /obj/item/weapon/deck/tarot
	cost = 20

/datum/gear/holder
	display_name = "card holder"
	path = /obj/item/weapon/deck/holder
	cost = 10

/datum/gear/cardemon_pack
	display_name = "Cardemon booster pack"
	path = /obj/item/weapon/pack/cardemon
	cost = 50

/datum/gear/spaceball_pack
	display_name = "Spaceball booster pack"
	path = /obj/item/weapon/pack/spaceball
	cost = 50

/datum/gear/mug
	display_name = "mug selection"
	path = /obj/item/weapon/reagent_containers/food/drinks/mug
	flags = GEAR_HAS_TYPE_SELECTION
	cost = 15

/datum/gear/pitcher
	display_name = "insulated pitcher"
	path = /obj/item/weapon/reagent_containers/food/drinks/pitcher
	cost = 50

/datum/gear/flask
	display_name = "flask"
	path = /obj/item/weapon/reagent_containers/food/drinks/flask/barflask
	cost = 25

// TODO: enable after reagents
/*
/datum/gear/flask/New()
	..()
	gear_tweaks += new/datum/gear_tweak/reagents(lunchables_ethanol_reagents())
*/
/datum/gear/vacflask
	display_name = "vacuum-flask"
	path = /obj/item/weapon/reagent_containers/food/drinks/flask/vacuumflask
	cost = 40
// TODO: enable after reagents
/*
/datum/gear/vacflask/New()
	..()
	gear_tweaks += new/datum/gear_tweak/reagents(lunchables_drink_reagents())
*/
// TODO: enable after reagents
/*
/datum/gear/lunchbox
	display_name = "lunchbox"
	description = "A little lunchbox."
	cost = 2
	path = /obj/item/weapon/storage/lunchbox

/datum/gear/lunchbox/New()
	..()
	var/list/lunchboxes = list()
	for(var/lunchbox_type in typesof(/obj/item/weapon/storage/lunchbox))
		var/obj/item/weapon/storage/lunchbox/lunchbox = lunchbox_type
		if(!initial(lunchbox.filled))
			lunchboxes[initial(lunchbox.name)] = lunchbox_type
	gear_tweaks += new/datum/gear_tweak/path(lunchboxes)
	gear_tweaks += new/datum/gear_tweak/contents(lunchables_lunches(), lunchables_snacks(), lunchables_drinks())
*/

/datum/gear/plush_toy
	display_name = "plush toy"
	description = "A plush toy."
	path = /obj/item/toy/plushie
	cost = 50

/datum/gear/plush_toy/New()
	..()
	var/plushes = list(
		"mouse plush"	=	/obj/item/toy/plushie/mouse,
		"kitten plush"	=	/obj/item/toy/plushie/kitten,
		"lizard plush"	=	/obj/item/toy/plushie/lizard,
		"spider plush"	=	/obj/item/toy/plushie/spider,
		"farwa plush"	=	/obj/item/toy/plushie/farwa,
	)
	gear_tweaks += new /datum/gear_tweak/path(plushes)

/datum/gear/mirror/
	display_name = "handheld mirror"
	sort_category = "Косметика"
	path = /obj/item/weapon/mirror
	cost = 30

/datum/gear/lipstick
	display_name = "lipstick selection"
	sort_category = "Косметика"
	path = /obj/item/weapon/lipstick
	flags = GEAR_HAS_TYPE_SELECTION
	cost = 70

/datum/gear/comb
	display_name = "plastic comb"
	sort_category = "Косметика"
	path = /obj/item/weapon/haircomb
	flags = GEAR_HAS_COLOR_SELECTION
	cost = 50

/datum/gear/mask
	display_name = "sterile mask"
	path = /obj/item/clothing/mask/surgical
	cost = 15

/datum/gear/smokingpipe
	display_name = "pipe, smoking"
	path = /obj/item/clothing/mask/smokable/pipe
	cost = 200

/datum/gear/cornpipe
	display_name = "pipe, corn"
	path = /obj/item/clothing/mask/smokable/pipe/cobpipe
	cost = 250

/datum/gear/matchbook
	display_name = "matchbook"
	path = /obj/item/weapon/storage/box/matches
	cost = 10

/datum/gear/lighter
	display_name = "cheap lighter"
	path = /obj/item/weapon/flame/lighter
	cost = 20

/datum/gear/schizco_packet
	display_name = "SchiZCo cigarette packet"
	path = /obj/item/weapon/storage/fancy/cigarettes/schizco
	cost = 79

/datum/gear/zippo
	display_name = "zippo"
	path = /obj/item/weapon/flame/lighter/zippo
	cost = 49

/datum/gear/cigars
	display_name = "fancy cigar case"
	path = /obj/item/weapon/storage/fancy/cigar
	cost = 249

/datum/gear/cigar
	display_name = "fancy cigar"
	path = /obj/item/clothing/mask/smokable/cigarette/cigar
	cost = 39

/datum/gear/cigar/New()
	..()
	var/cigar_type = list()
	cigar_type["premium"] = /obj/item/clothing/mask/smokable/cigarette/cigar
	cigar_type["Cohiba Robusto"] = /obj/item/clothing/mask/smokable/cigarette/cigar/cohiba
	gear_tweaks += new/datum/gear_tweak/path(cigar_type)
