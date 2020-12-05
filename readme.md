## DayZ Server Template
A template for creating DayZ Standalone servers.

### Installation
- Open `config/serverDZ.cfg` and change the server settings (at least the name and admin password).
- Optional: Open `scripts/mods.cfg` and enter each mod's workshop ID and name on a new line in the form `1560819773,@Unlimited Stamina`.
- Optional: Open `scripts/mods_serveronly.cfg` and enter each server mod's workshop ID and name on a new line in the form `2236761563,@FixVehiclePositions`.
- Optional: Open `config/mpmissions/dayzOffline.chernarusplus/server_ce/messages.xml` and change the shutdown interval (default is 360 minutes).
- Enter your steam username and password in `scripts/credentials.bat`.
- Run `scripts/install_all.bat` once.

### Running
- Run `scripts/run.bat` to launch the server. This automatically restarts the server after a shutdown or crash.

### Manual updating
- Run `scripts/install_dayz_server.bat` to manually update the server.
- Run `scripts/install_mods.bat` to manually add/remove/update the mods.

### Changing the central loot economy
- The `config/mpmissions/dayzOffline.chernarusplus/server_ce/` folder extends/overrides the central loot economy. Change its contents according to the mods you add.
- Run `scripts/configure.bat` to apply the changes.

### Storing mod settings
- The `config/profiles/` folder may be used to store your mod settings, which will be copied/overwritten to the server profiles folder.
- Run `scripts/configure.bat` to apply the changes.

### Changing the map
- Copy and rename the `config/mpmissions/dayzOffline.chernarusplus/` folder to the new map name.
- Change `cfgeconomycore.xml` according to its equivalent in the new map.
- Run `scripts/configure.bat` to apply the changes.

### Notes
- You should disable SteamGuard two-step authentication since `scripts/run.bat` otherwise requires user input, which prevents automation.
- Large mods may timeout the first time they are installed due to a steamcmd limitation, but repeatedly calling `scripts/install_mods.bat` eventually succeeds.