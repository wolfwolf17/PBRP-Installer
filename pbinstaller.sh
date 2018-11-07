#!/bin/bash
#A script to flash PitchBlack Recovery from linux
#sloppy20181014 alpha
blue='\033[0;34m'
cyan='\033[0;36m'
green='\e[0;32m'
yellow='\033[0;33m'
nocol='\033[0m'
purple='\e[0;35m'
white='\e[0;37m'
RED='\033[0;31m'
NC='\033[0m'
echo -e "${blue} __________   __    __              __     ${purple} __________   __                       __     "
echo -e "${blue} \______   \ |__| _/  |_    ____   |  |__  ${purple} \______   \ |  |   _____      ____   |  | __ "
echo -e "${blue}  |     ___/ |  | \   __\ _/ ___\  |  |  \ ${purple}  |    |  _/ |  |   \__  \   _/ ___\  |  |/ / "
echo -e "${blue}  |    |     |  |  |  |   \  \___  |   Y  \ ${purple} |    |   \ |  |__  / __ \_ \  \___  |    <  "
echo -e "${blue}  |____|     |__|  |__|    \___  > |___|  /${purple}  |______  / |____/ (____  /  \___  > |__|_ \ "
echo -e "${blue}                               \/       \/ ${purple}         \/              \/       \/       \/ "
echo -e "${green}                     __________    "
echo -e "                     \______   \ ____   ____  _______  __ ___________ ___.__.            "
echo -e "                      |       _// __ \_/ ___\/  _ \  \/ // __ \_  __ <   |  |            "
echo -e "                      |    |   \  ___/\  \__(  <_> )   /\  ___/|  | \/\___  |            "
echo -e "                      |____|_  /\___  >\___  >____/ \_/  \___  >__|   / ____|            "
echo -e "                             \/     \/     \/                \/       \/         ${NC}\n "
echo                                                                     
printf "${RED}                                 Welcome to PBRP installer ${NC}\n"
echo -e
printf "${RED}Press enter if you are in bootloader mode... ${NC}\n"
read
printf "${RED}Getting stuff ready... ${NC}\n"
unzip PitchBlack*.zip > /dev/null
rm -R META-INF
echo
printf "${RED}Flashing PBRP... ${NC}\n"
fastboot flash recovery TWRP/*.img 2>/dev/null
echo
printf "${RED}Booting into PBRP... ${NC}\n"
fastboot boot TWRP/*.img 2>/dev/null
rm -R TWRP
echo
printf "${RED}Press enter when PBRP fully boots... ${NC}\n"
read
printf "${RED}Pushing tools... ${NC}\n"
adb shell rm -r /sdcard/PBRP/tools 2>/dev/null
adb push PBRP /sdcard >/dev/null
echo -e
printf "${RED}Rebooting into PBRP... ${NC}\n"
echo -e
adb reboot recovery
sleep 10
rm -R PBRP
printf "${RED}ALL DONE! ${NC}\n"
echo -e
