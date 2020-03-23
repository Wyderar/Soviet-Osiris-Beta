// Looks if limb is severed and returns TRUE if it is
/proc/organ_is_severed(obj/item/organ/organ)
	if(organ.owner == null)
		return TRUE
	else
		return FALSE


// Looks if limb/organ is covered with clothes
/proc/no_clothes_over_body(obj/item/organ/organ, mob/living/user)

	if(!organ)
		return

	if(!user)
		return

	if(organ_is_severed(organ))
		return TRUE

	var/mob/living/carbon/human/target = organ.owner
	var/parent_organ_name = null

	if(istype(organ, /obj/item/organ/external))		// If organ is external
		parent_organ_name = organ.organ_tag	  		// we get its name

	if(istype(organ, /obj/item/organ/internal)) 	// If organ is internal
		parent_organ_name = organ.organ_tag 		// we get its parent organ name


	switch(parent_organ_name)
		if(BP_HEAD)
			if( (target.glasses != null) || (target.head != null) )
				return FALSE
			if(target.wear_mask != null && !istype(target.wear_mask, /obj/item/clothing/mask/breath/medical))
				return FALSE

		if(BP_CHEST)
			if( (target.w_uniform != null) || (target.wear_suit != null) )
				return FALSE
			if( (target.back != null) && !istype(target.back, /obj/item/weapon/tank) )
				return FALSE

		if(BP_GROIN)
			if( (target.w_uniform != null) || (target.wear_suit != null) || (target.belt != null) )
				return FALSE

		if(BP_L_LEG, BP_R_LEG)
			if( (target.w_uniform != null) || (target.wear_suit != null) || (target.shoes != null) )
				return FALSE

		if(BP_L_ARM, BP_R_ARM)
			if( (target.w_uniform != null) || (target.wear_suit != null) || (target.gloves != null) )
				return FALSE

	return TRUE