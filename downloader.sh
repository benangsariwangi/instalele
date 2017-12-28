#! bin/bash

cyan='\e[0;36m'
green='\e[1;32m'
okegreen='\033[92m'
lightgreen='\e[1;32m'
white='\e[1;37m'
red='\e[1;31m'
yellow='\e[1;33m'
BlueF='\e[1;34m'
pink='\e[38;5;206m'
echo `clear`
echo -e "$pink"
echo '
			__  .__   __.      _______.___________.    ___       __       _______  __       _______ 
			|  | |  \ |  |     /       |           |   /   \     |  |     |   ____||  |     |   ____|
			|  | |   \|  |    |   (----`---|  |----`  /  ^  \    |  |     |  |__   |  |     |  |__   
			|  | |  . `  |     \   \       |  |      /  /_\  \   |  |     |   __|  |  |     |   __|  
			|  | |  |\   | .----)   |      |  |     /  _____  \  |  `----.|  |____ |  `----.|  |____ 
			|__| |__| \__| |_______/       |__|    /__/     \__\ |_______||_______||_______||_______'
echo -e "$white"
echo '
 	                   			 --+[ Instagram Mass Downloader    ]+--   
				          	 --+[ Github : github.com/prabs401 ]+--                                                  

			   	       +----------------------| Credit |----------------------+
				       |    Screetsec - Ngupi - Hightech - KOD3N - Sikuder    |
				       |  Wingkocoli - Janda Squad - Backbox Linux Indonesisa |
				       +------------------------------------------------------+
'
tput sgr0

mkdir output >/dev/null 2>&1 &
printf "          Input mass target location : "
read target
echo ""
	for line in `cat $target`
	 do
	 	page=$(curl -s "$line?__a=1")
	 	donlot=$(echo $page | jq .graphql.shortcode_media.display_url | tr -d \")
	 	isvideo=$(echo $page | jq .graphql.shortcode_media.is_video | tr -d \")
	 	video=$(echo $page | jq .graphql.shortcode_media.video_url | tr -d \")
	 	if [[ $isvideo != "true" ]]; then
	 		echo -e "         $cyan [!] Processing -> $line" 
	 		echo -e "         $pink [+] Success Saved to output"	
	 		wget -P output/ $donlot -i- >/dev/null 2>&1 &
	 	else
	 		echo -e "         $cyan [!] Processing -> $line" 
	 		echo -e "         $pink [+] Success Saved to output"	
			wget -P output/ $video -i- >/dev/null 2>&1 &
	 	fi
	 	echo "	"
	done

	echo ""
	echo -e "         $green [*] All Process Completed"
	echo ""
	tput sgr0



