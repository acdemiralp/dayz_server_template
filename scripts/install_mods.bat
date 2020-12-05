setlocal enabledelayedexpansion

call credentials.bat

set SERVER_ROOT=..\dayzserver
set GAME_ID=221100

set WORKSHOP_DIR=.\steamapps\workshop\content\%GAME_ID%

set MODS_FILE=..\scripts\mods.cfg
set MODS_SERVERONLY_FILE=..\scripts\mods_serveronly.cfg

cd ..\steam

for /f "tokens=1,2 delims=," %%a in (%MODS_FILE%) do set MOD_DL_COMMANDS=!MOD_DL_COMMANDS! +workshop_download_item %GAME_ID% %%a validate
for /f "tokens=1,2 delims=," %%a in (%MODS_SERVERONLY_FILE%) do set MOD_DL_COMMANDS=!MOD_DL_COMMANDS! +workshop_download_item %GAME_ID% %%a validate
steamcmd +login %USERNAME% %PASSWORD% %MOD_DL_COMMANDS% +quit 

for /f "tokens=1,2 delims=," %%a in (%MODS_FILE%) do robocopy "%WORKSHOP_DIR%\%%a" "%SERVER_ROOT%\%%b" *.* /mir
for /f "tokens=1,2 delims=," %%a in (%MODS_FILE%) do robocopy "%SERVER_ROOT%\%%b\keys" "%SERVER_ROOT%\keys" *.*
for /f "tokens=1,2 delims=," %%a in (%MODS_SERVERONLY_FILE%) do robocopy "%WORKSHOP_DIR%\%%a" "%SERVER_ROOT%\%%b" *.* /mir
for /f "tokens=1,2 delims=," %%a in (%MODS_SERVERONLY_FILE%) do robocopy "%SERVER_ROOT%\%%b\keys" "%SERVER_ROOT%\keys" *.*

cd ..\scripts