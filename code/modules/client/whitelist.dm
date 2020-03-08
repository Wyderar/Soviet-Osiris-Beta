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