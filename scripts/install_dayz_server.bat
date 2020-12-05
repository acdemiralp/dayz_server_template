call credentials.bat

set SERVER_ROOT=..\dayzserver
set GAME_ID=223350

cd ..\steam
steamcmd +login %USERNAME% %PASSWORD% +force_install_dir %SERVER_ROOT% +app_update %GAME_ID% validate +quit
cd ..\scripts