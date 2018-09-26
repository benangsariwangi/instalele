#!/bin/bash

cyan='\e[0;36m'
green='\e[1;32m'
okegreen='\033[92m'
lightgreen='\e[1;32m'
white='\e[1;37m'
red='\e[1;31m'
yellow='\e[1;33m'
BlueF='\e[1;34m'
pink='\e[38;5;20p'
echo `clear`

cekdepe(){
	type curl >/dev/null 2>&1 || { echo -e >&2 "$yellow [!]::Curl Not Found | This tools needed curl, please install curl"; echo -e "$cyan [*]::Use : sudo apt-get install curl "; exit 1;}
	type git >/dev/null 2>&1 || { echo -e >&2 "$yellow [!]::This tools needed git, please install git";   echo -e "$cyan [*]::Use : sudo apt-get install git "; exit 1;}
	type jq >/dev/null 2>&1 || { echo -e >&2 "$yellow [!]::This tools needed jq, please install jq";   echo -e "$cyan [*]::Use : sudo apt-get install jq "; exit 1;}

}
run(){
	cekdepe
	echo -e "$yellow"
echo '
  __                 /\ \__         /\_ \         /\_ \            
 /\_\    ___     ____\ \  _\    __  \//\ \      __\//\ \      __   
 \/\ \ /  _  \  /  __\\ \ \/  / __ \  \ \ \   / __ \\ \ \   / __ \
  \ \ \/\ \/\ \/\__, `\\ \ \_/\ \L\.\_ \_\ \_/\  __/ \_\ \_/\  __/ 
   \ \_\ \_\ \_\/\____/ \ \__\ \__/.\_\/\____\ \____\/\____\ \____\
    \/_/\/_/\/_/\/___/   \/__/\/__/\/_/\/____/\/____/\/____/\/____/';
echo -e "$white"
echo '    [*]::Instagram Mass Downloader V2.1'
echo '    [*]::Coded by : malesmandisec'
echo '    [*]::Github   : github.com/prabs401'
echo '    [*]::Backbox Linux Indonesia'


echo 
mkdir output >/dev/null 2>&1 &
printf "  Input mass link location : "
tput sgr0
echo -e -n $yellow
read target
tput sgr0

echo ""
	for line in `cat $target`
	 do
	 	page=$(curl -s "$line?__a=1")
	 	donlot=$(echo $page | jq .graphql.shortcode_media.display_url | tr -d \")
	 	isvideo=$(echo $page | jq .graphql.shortcode_media.is_video | tr -d \")
	 	video=$(echo $page | jq .graphql.shortcode_media.video_url | tr -d \")
	 	if [[ $isvideo != "true" ]]; then
	 		echo -e "     $cyan [!] Processing -> $line" 
	 		echo -e "     $yellow [+] Success Saved to output"
	 		wget -P output/ $donlot -i- >/dev/null 2>&1 &
	 	else
	 		echo -e "     $cyan [!] Processing -> $line" 
	 		echo -e "     $yellow [+] Success Saved to output"	
			wget -P output/ $video -i- >/dev/null 2>&1 &
	 	fi
	 	echo "	"
	done

	echo ""
	echo -e "     $green [*] All Process Completed"
	tput sgr0
	
}
run










