obj/structure/smooth/table
	name = "table"
	desc = "A table for placing objects down or taking them"
	icon = 'icons/obj/structure/smooth/table/normal.dmi'
	icon_state = "table"

	corner_category = "table"
	corner_icons = TRUE

	layer = LAYER_TABLE

	collision_flags = FLAG_COLLISION_WALKING
	collision_bullet_flags = FLAG_COLLISION_BULLET_NONE

/* Just hold Q lol
obj/structure/smooth/table/clicked_on_by_object(var/mob/caller,var/atom/object,location,control,params)

	if(!is_living(caller))
		return ..()

	INTERACT_CHECK

	var/mob/living/L = caller

	if(L.intent == INTENT_HARM)
		return ..()

	if(is_item(object) && is_inventory(object.loc))
		var/obj/item/I = object
		var/obj/hud/inventory/I2 = object.loc
		if(!params)
			params = list(PARAM_ICON_X = 16,PARAM_ICON_Y=16)
		I2.remove_object(I,src.loc,params[PARAM_ICON_X],params[PARAM_ICON_Y])
		return TRUE

	return ..()
*/

obj/structure/smooth/table/dropped_on_by_object(var/atom/caller,var/atom/object)

	if((is_item(object) || is_structure(object)) && get_dist(src,object) <= 1 && get_dist(caller,object) <= 1)
		var/obj/O = object
		if(anchored)
			return FALSE
		O.force_move(src.loc)
		return TRUE

	return ..()

obj/structure/smooth/table/Cross(var/atom/movable/O,var/atom/NewLoc,var/atom/OldLoc)

	if(is_living(O) && O.collision_flags & FLAG_COLLISION_WALKING)
		var/mob/living/L = O
		var/obj/structure/smooth/table/T = locate() in OldLoc.contents
		if(T)
			return TRUE

		if(L.table_count >= 3)
			L.table_count = 0
			return TRUE

		L.table_count++

		return FALSE

	return ..()

/obj/structure/smooth/table/Crossed(var/atom/movable/O,var/atom/new_loc,var/atom/old_loc)
	if(old_loc && is_living(O) && O.collision_flags & FLAG_COLLISION_WALKING)
		var/mob/living/L = O
		var/obj/structure/smooth/table/T = locate() in old_loc.contents
		if(!T)
			animate(L,pixel_z = initial(L.pixel_z) + 10,time = TICKS_TO_DECISECONDS(L.move_delay), easing = CIRCULAR_EASING | EASE_OUT)
			L.move_delay += DECISECONDS_TO_TICKS(10)

	return ..()

/obj/structure/smooth/table/Uncrossed(var/atom/movable/O,var/atom/new_loc,var/atom/old_loc)
	if(is_living(O) && O.collision_flags & FLAG_COLLISION_WALKING)
		var/mob/living/L = O
		var/obj/structure/smooth/table/T = locate() in new_loc.contents
		if(!T)
			animate(L,pixel_z = initial(L.pixel_z),time = TICKS_TO_DECISECONDS(L.move_delay), easing = CIRCULAR_EASING | EASE_OUT)
			L.move_delay += DECISECONDS_TO_TICKS(5)

	return ..()

obj/structure/smooth/table/rack
	name = "table"
	desc = "What does it do?"
	icon = 'icons/obj/structure/rack.dmi'
	icon_state = "rack"

	corner_category = "rack"
	corner_icons = FALSE

	collision_flags = FLAG_COLLISION_WALKING
	collision_bullet_flags = FLAG_COLLISION_BULLET_NONE

obj/structure/smooth/table/rack/grey
	color = COLOR_GREY

obj/structure/smooth/table/rack/steel
	color = COLOR_STEEL

obj/structure/smooth/table/fancy
	name = "fancy table"
	icon = 'icons/obj/structure/smooth/table/fancy.dmi'
	pixel_y = -1

	corner_category = "table_fancy"

obj/structure/smooth/table/glass
	name = "glass table"
	icon = 'icons/obj/structure/smooth/table/glass.dmi'

	corner_category = "table_glass"

obj/structure/smooth/table/dark
	color = "#999999"

obj/structure/smooth/table/wood
	name = "wood table"
	color = "#A05120"

	corner_category = "table_wood"

obj/structure/smooth/table/wood/poor
	name = "wood table"
	color = "#6B4E3A"


obj/structure/smooth/table/reinforced
	name = "reinforced table"
	desc = "Extra sturdy."
	icon = 'icons/obj/structure/smooth/table/reinforced.dmi'
	icon_state = "table"

	corner_category = "table_reinforced"


obj/structure/smooth/table/reinforced/dark
	color = "#999999"

obj/structure/smooth/table/reinforced/dark/pvp
	name = "table of doom"
	desc = "<font color='red'><b>WARNING: OTHERS PAST THIS TABLE WILL BE ALLOWED TO KILL YOU AND YOU WILL BE ALLOWED TO KILL THEM.</b></font>"
	desc_extended = "An absolutely cursed table that disrupts loyalty implant signals, but not IFF, when the user is standing on it. A favorite among those looking for something to prove."

obj/structure/smooth/table/reinforced/yellow
	color = "#FFFF00"



obj/structure/smooth/table/brass
	name = "clockwork table"
	desc = "Extra sturdy."
	icon = 'icons/obj/structure/clockwork/table.dmi'
	icon_state = "table"

	corner_category = "table_clockwork"

	desired_light_power = 0.5
	desired_light_range = 2
	desired_light_color = "#E29E00"

obj/structure/smooth/table/cult

	name = "cult table"
	color = "#261E1C"



	corner_category = "table_cult"
