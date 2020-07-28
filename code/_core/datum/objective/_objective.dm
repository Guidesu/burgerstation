#define FAILED "FAILED"
#define COMPLETED "COMPLETED"
#define IN_PROGRESS "IN PROGRESS"
#define IMPOSSIBLE "IMPOSSIBLE"


/objective/
	var/name = "Objective Name"
	var/desc = "Objective Description"
	var/atom/list/tracked_atoms = list()
	var/completion_state = IN_PROGRESS

/objective/New()

	if(!setup() || !has_valid_targets() || !start())
		completion_state = IMPOSSIBLE

	return ..()

/objective/proc/setup() //Do any setup required to make this objective work.
	return TRUE

/objective/proc/start()
	return TRUE

/objective/proc/check_completion()
	return COMPLETED

/objective/proc/get_description()
	return "[initial(desc)] ([completion_state])"

/objective/proc/update(var/update_gamemode = TRUE)

	var/gamemode/G = SSgamemode.active_gamemode

	var/old_completion_state = completion_state
	completion_state = check_completion()

	switch(completion_state)
		if(IN_PROGRESS)
			G.active_objectives |= src
			G.completed_objectives -= src
			G.failed_objectives -= src
		if(COMPLETED)
			G.active_objectives -= src
			G.completed_objectives |= src
			G.failed_objectives -= src
		if(FAILED)
			G.active_objectives -= src
			G.completed_objectives -= src
			G.failed_objectives |= src

	desc = get_description()

	. = old_completion_state != completion_state

	if(. && update_gamemode)
		G.next_objective_update = world.time + 50

	return .

/objective/proc/get_valid_targets()
	return list()

/objective/proc/has_valid_targets()
	return length(get_valid_targets()) ? TRUE : FALSE

/objective/proc/get_random_target()

	var/list/valid_targets = get_valid_targets()

	if(!length(valid_targets))
		return FALSE

	return pick(valid_targets)






