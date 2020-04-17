#define WHITELISTFILE "data/whitelist.txt"

var/list/second_whitelist = file2list("config/whitelist/second_level.txt")
var/list/commissar_whitelist = file2list("config/whitelist/commissar.txt")

/hook/startup/proc/loadWhitelist()
	if(config.usewhitelist)
		load_whitelist()
	return 1

/proc/load_whitelist()
	second_whitelist = file2list("config/whitelist/second_level.txt")
	commissar_whitelist = file2list("config/whitelist/commissar.txt")
	if(!second_whitelist.len)
		second_whitelist = null
	if(!commissar_whitelist.len)
		commissar_whitelist = null

/proc/check_second_whitelist(key)
	if(!second_whitelist)
		return 0
	return (key in second_whitelist)

/proc/check_commissar_whitelist(key)
	if(!commissar_whitelist)
		return 0
	return (key in commissar_whitelist)

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