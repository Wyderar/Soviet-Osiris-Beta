/*
	Very simple event that temporarily disables gravity all over the ship. Quite fun, but can also lead to people getting stuck
	This event used to contain some bullshit about forming black holes. No code provision exists for any such thing, so that is removed
*/

/datum/storyevent/gravity
	id = "gravity_failure"
	name = "gravity failure"

	event_type =/datum/event/gravity
	event_pools = list(EVENT_LEVEL_MUNDANE = POOL_THRESHOLD_MUNDANE*0.8)
	tags = list(TAG_COMMUNAL)
	weight = 0.4 //This is a pain, make it less common


/////////////////////////////////////////////////////////////

/datum/event/gravity
	announceWhen = 5

/datum/event/gravity/setup()
	endWhen = rand(30, 200) //1-6 minutes

/datum/event/gravity/announce()
	command_announcement.Announce("Всплеск обратной связи обнаруживается в системах массового распределения. Искусственная гравитация была отключена во время повторной инициализации системы.", "Гравитационный сбой")

/datum/event/gravity/start()
	if (GLOB.active_gravity_generator)
		GLOB.active_gravity_generator.set_state(FALSE)

/datum/event/gravity/end()
	if (GLOB.active_gravity_generator)
		GLOB.active_gravity_generator.set_state(TRUE)

	command_announcement.Announce("Гравитационные генераторы снова работают в пределах нормы. Приносим извинения за доставленные неудобства.", "Гравитация восстановлена")
