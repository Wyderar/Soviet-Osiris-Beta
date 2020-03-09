#define WHITELISTFILE "data/whitelist.txt"

var/list/third_whitelist = file2list("config/whitelist/third_level.txt")
var/list/second_whitelist = file2list("config/whitelist/second_level.txt")

/hook/startup/proc/loadWhitelist()
	if(config.usewhitelist)
		load_whitelist()
	return 1

/proc/load_whitelist()
	third_whitelist = file2list("config/whitelist/third_level.txt")
	second_whitelist = file2list("config/whitelist/second_level.txt")
	if(!third_whitelist.len)
		third_whitelist = null
	if(!second_whitelist.len)
		second_whitelist = null

/proc/check_third_whitelist(key)
	if(!third_whitelist)
		return 0
	return (key in third_whitelist)

/proc/check_second_whitelist(key)
	if(!second_whitelist)
		return 0
	return (key in second_whitelist)


/proc/is_alien_whitelisted(mob/M, var/species)
	// always return true because we don't have xenos and related whitelist
	return 1
/*
 var/list/ckeywhitelist = file2list("config/whitelist.txt")

//Check player in whitelist
/hook/startup/proc/loadCkeyWhitelist()
	if(config.useckeywhitelist)
		load_ckeywhitelist()
	return 1

/proc/CheckWhitelist(key)
	if (!ckeywhitelist)
		return 0
	key = ckey(key)
	return (key in ckeywhitelist)

/proc/load_ckeywhitelist()
	ckeywhitelist = file2list("config/whitelist.txt")
	if(!ckeywhitelist.len)	ckeywhitelist = null

#undef WHITELISTFILE
*/