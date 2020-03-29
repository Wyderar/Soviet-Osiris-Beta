/////////////VISION CONE///////////////
//Vision cone code by Matt and Honkertron. This vision cone code allows for mobs and/or items to blocked out from a players field of vision.
//This code makes use of the "cone of effect" proc created by Lummox, contributed by Jtgibson. More info on that here:
//http://www.byond.com/forum/?post=195138
///////////////////////////////////////

//"Made specially for Otuska"
// - Honker



//Defines.

client/
	var/list/hidden_atoms = list()
	var/list/hidden_mobs = list()



atom/proc/InCone(atom/center = usr, dir = NORTH)
	if(get_dist(center, src) == 0 || src == center) return 0
	var/d = get_dir(center, src)

	if(!d || d == dir) return 1
	if(dir & (dir-1))
		return (d & ~dir) ? 0 : 1
	if(!(d & dir)) return 0
	var/dx = abs(x - center.x)
	var/dy = abs(y - center.y)
	if(dx == dy) return 1
	if(dy > dx)
		return (dir & (NORTH|SOUTH)) ? 1 : 0
	return (dir & (EAST|WEST)) ? 1 : 0

mob/dead/InCone(mob/center = usr, dir = NORTH)
	return

mob/living/InCone(mob/center = usr, dir = NORTH)
	. = ..()
	for(var/obj/item/weapon/grab/G in center)//TG doesn't have the grab item. But if you're porting it and you do then uncomment this.
		if(src == G.affecting)
			return 0
		else
			return .


proc/cone(atom/center = usr, dir = NORTH, list/list = oview(center))
	for(var/atom/O in list) if(!O.InCone(center, dir)) list -= O
	return list

proc/cone_reverse(atom/center = usr, dir = NORTH, list/list = oview(center))
	for(var/atom/O in list) if(O.InCone(center, dir)) list -= O
	return list

mob/proc/update_vision_cone()
	return

mob/living/carbon/human/update_vision_cone()
	if (HUDtech.Find("visioncone"))
		var/obj/screen/visioncone/I = HUDtech["visioncone"]
		I.update_icon()