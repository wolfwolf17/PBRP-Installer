@echo off
title PitchBlack Recovery Installer
echo.
echo  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
echo  " __________   __    __              __      __________   __                       __     "
echo  " \______   \ |__| _/  |_    ____   |  |__   \______   \ |  |   _____      ____   |  | __ "
echo  "  |     ___/ |  | \   __\ _/ ___\  |  |  \   |    |  _/ |  |   \__  \   _/ ___\  |  |/ / "
echo  "  |    |     |  |  |  |   \  \___  |   Y  \  |    |   \ |  |__  / __ \_ \  \___  |    <  "
echo  "  |____|     |__|  |__|    \___  > |___|  /  |______  / |____/ (____  /  \___  > |__|_ \ "
echo  "                               \/       \/          \/              \/       \/       \/ "
echo  "               __________                                                                " 
echo  "               \______   \ ____   ____  _______  __ ___________ ___.__.                  "
echo  "                |       _// __ \_/ ___\/  _ \  \/ // __ \_  __ <   |  |                  "
echo  "                |    |   \  ___/\  \__(  <_> )   /\  ___/|  | \/\___  |                  "
echo  "                |____|_  /\___  >\___  >____/ \_/  \___  >__|   / ____|                  "
echo  "                       \/     \/     \/                \/       \/                       "
echo  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
echo. 
echo                                Welcome to PBRP installer
echo. 
echo  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
echo.
echo Press enter if you are in bootloader mode...
pause
echo.
echo Getting stuff ready...
echo.
bin\7z x PitchBlack*.zip >nul
rmdir /s /q META-INF >nul
echo Flashing PBRP...
bin\fastboot flash recovery TWRP\recovery.img >nul 2>nul
echo.
echo Booting into PBRP...
bin\fastboot boot TWRP\recovery.img >nul 2>nul
rmdir /s /q  TWRP >nul
echo.
echo Press enter when PBRP fully boots...
pause
echo.
echo Pushing tools... 
bin\adb shell rm -r /sdcard/PBRP/tools >nul 2>nul
bin\adb push PBRP /sdcard >nul 2>nul
echo.
echo Rebooting into PBRP...
echo.
bin\adb reboot recovery
rmdir /s /q PBRP >nul
echo ALL DONE
echo.
pause