/datum/relation/friend
	name = "Друг"
	desc = "Вы давно знаете этого человека, и вы хорошо ладите между собой."
	incompatible = list(/datum/relation/enemy)

/datum/relation/friend/get_desc_string()
	return "[holder] и [other.holder] судя по всему в дружеских отношениях."

/datum/relation/kid_friend
	name = "Друг детства"
	desc = "Вы знаете этого человека еще с детства."

/datum/relation/kid_friend/get_desc_string()
	return "[holder] и [other.holder] знают друг друга еще с детства."

/datum/relation/kid_friend/get_candidates()
	var/list/creche = ..()
	var/mob/living/carbon/human/holdermob = holder.current

	if(istype(holdermob))
		for(var/datum/relation/kid in creche)
			var/mob/living/carbon/human/kidmob = kid.holder.current
			if(!istype(kidmob))
				continue
			if(abs(holdermob.age - kidmob.age) > 3)
				creche -= kid		//No creepers please, it's okay if the pool is small.
				continue
	return creche

/datum/relation/enemy
	name = "Враг"
	desc = "Вы давно знаете этого человека и вы просто ненавидете его."
	incompatible = list(/datum/relation/friend)

/datum/relation/enemy/get_desc_string()
	return "Видимо, [holder] и [other.holder] ненавидят друг друга."

/datum/relation/had_crossed
	name = "Обиженный"
	desc = "В прошлом вы обидели этого человека, и теперь он явно точит на вас зуб."
	can_connect_to = list(/datum/relation/was_crossed)

/datum/relation/had_crossed/get_desc_string()
	return "Видимо, между [holder] и [other.holder] что-то произошло, раз [other.holder] очень недоволен этим."

/datum/relation/was_crossed
	name = "Был обижен"
	desc = "Вы были обижены этим человеком, и вы прекрасно это помните.."
	can_connect_to = list(/datum/relation/had_crossed)

/datum/relation/was_crossed/get_desc_string()
	return "Видимо, между [holder] и [other.holder] что-то произошло, раз [holder] очень недоволен этим."

/datum/relation/rival
	name = "Соперник"
	desc = "С этим человеком вы находитесь в вечной борьбе за победу, и уже не особо важно в чем именно."

/datum/relation/rival/get_desc_string()
	return "[holder] и [other.holder] яро решают, кто из них номер один."

/datum/relation/rival/get_candidates()
	var/list/rest = ..()
	var/list/best = list()
	var/list/good = list()
	for(var/datum/relation/R in rest)
		if(!R.holder.assigned_job || !holder.assigned_job)
			continue
		if(R.holder.assigned_job == holder.assigned_job)
			best += R
		if(R.holder.assigned_job.department_flag & holder.assigned_job.department_flag)
			good += R
	if(best.len)
		return best
	else if (good.len)
		return good
	return rest

/datum/relation/ex
	name = "Бывший/бывшая"
	desc = "Когда-то с этим человеком вы были в романтических отношениях. Когда-то."

/datum/relation/ex/get_desc_string()
	return "[holder] и [other.holder], похоже, были вместе раньше... А сейчас то что?"