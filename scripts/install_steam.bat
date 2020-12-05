md ..\steam
cd ..\steam

curl -l https://steamcdn-a.akamaihd.net/client/installer/steamcmd.zip -o download.zip
tar -xf download.zip
del download.zip

steamcmd +login anonymous +quit
cd ..\scripts