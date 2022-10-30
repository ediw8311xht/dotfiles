#!/bin/bash

OUT='$6'

while 	 [[ "${1}" =~ ^-           ]] ; do
	if   [[ "${1}" =~ ^-d(ate)?    ]] ; then
		OUT='$4  " : " '"${OUT}"
	elif [[ "${1}" =~ ^-t(ime)?    ]] ; then
		OUT='$5  " : " '"${OUT}"
	elif [[ "${1}" =~ ^-p(ercent)? ]] ; then
		OUT='$10 " : " '"${OUT}"
	fi
	shift
done

if ! [[ "$1" =~ (AG|AU|PD|PT) ]] ; then
	exit 1
fi

while true ; do
	wget -S --header='Accept: */*'                             \
			--header='Accept-Encoding: gzip, deflate, br'      \
			--header='Accept-Language: en-US,en;q=0.9'         \
			--header='Connection: keep-alive'                  \
			--header='Host: proxy.kitco.com'				   \
			--header='Origin: https://www.kitco.com' 		   \
			--header='Referer: https://www.kitco.com/'         \
			--header='Sec-Fetch-Dest: empty'                   \
			--header='Sec-Fetch-Mode: cors'                    \
			--header='Sec-Fetch-Site: same-site'               \
			--header='Sec-GPC: 1'                              \
			--header='User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.114 Safari/537.36' \
			"proxy.kitco.com/getPM?symbol=${1}" 	           \
			--output-document="/tmp/${1}.gz"   				   \
			2> /dev/null
	sleep 2
	if [[ "$?" = "0" ]] && [[ -f "/tmp/${1}.gz" ]] ; then
		AX="$(gunzip -k -d "/tmp/${1}.gz" -c | column -t -s ',')"
		if [[ "$?" = "0" ]] && [[ -n "${AX}" ]]; then
			echo "${AX}" >> "$HOME/.config/polybar/my_modules/log.txt"
			awk "{print ${OUT}}" <<< "${AX}"
			exit 0
		fi
	fi
done

