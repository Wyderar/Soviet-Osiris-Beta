// Stuff worn on the ears. Items here go in the "ears" sort_category but they must not use
// the slot_r_ear or slot_l_ear as the slot, or else players will spawn with no headset.
/datum/gear/ears
	sort_category = "Наушники"
	category = /datum/gear/ears
	slot = slot_accessory_buffer

/datum/gear/ears/headphones
	display_name = "headphones"
	path = /obj/item/clothing/ears/headphones
	sort_category = "Наушники"

/datum/gear/ears/space_pods
	display_name = "space pods"
	path = /obj/item/clothing/ears/headphones/space_pods
	sort_category = "Наушники"
	cost = 2