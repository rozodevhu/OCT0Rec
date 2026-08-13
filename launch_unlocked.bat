@echo off
title Rec Room EAC Bypass Launcher

:: Set standard Steam ID markers so the game knows it is running on PC
set SteamAppId=471710
set SteamGameId=471710

echo =========================================================
echo  LAUNCHING REC ROOM WITHOUT EASY ANTI-CHEAT (EAC)
echo  TARGETING: http://localhost:2059
echo =========================================================
echo.
echo Make sure your python app.py and PhotonControl are running!
echo.
pause

:: Start the game directly, bypassing the EAC bootloader splash screen.
:: "-asdevice 5" forces PC Screen Mode (Mouse + Keyboard). 
:: Change "-asdevice 5" to "-asdevice 1" if you want to launch in VR mode instead.
start RecRoom.exe -asdevice 5

exit
