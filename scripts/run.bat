setlocal enabledelayedexpansion

set MODS_FILE=./mods.cfg
set MODS_SERVERONLY_FILE=./mods_serveronly.cfg

set MODS_STRING=
set SERVER_MODS_STRING=

for /f "tokens=1,2 delims=," %%a in (%MODS_FILE%) do set MODS_STRING=!MODS_STRING!%%b;
for /f "tokens=1,2 delims=," %%a in (%MODS_SERVERONLY_FILE%) do set SERVER_MODS_STRING=!SERVER_MODS_STRING!%%b;
echo MODS_STRING is %MODS_STRING%
echo SERVER_MODS_STRING is %SERVER_MODS_STRING%

for /l %%n in () do (
call install_dayz_server.bat
call install_mods.bat
cd ../dayzserver
DayZServer_x64.exe -port=2302 "-mod=%MODS_STRING%" "-servermod=%SERVER_MODS_STRING%" -profiles=profiles -config=serverDZ.cfg -adminlog -freezecheck -noFilePatching -scrAllowFileWrite -nopause
cd ../scripts
)