# **FiveM Discord Rich Presence**
Fully customizable, open source script to create a custom, "high effort" rich presence for your server. 

The script itself is not framework dependent, but without a framework most styles currently included don't work. 

# Installation

1.1 Either download the latest release from the [Releases](https://github.com/boofiboi/FiveM-Discord-Presence/releases) tab or clone the repository
 2. If you cloned the repo, clone it into `resources`, if you downloaded a release, create a new folder and put all the files in there.
 4. Configure the script according to the config file.
 5. Put `ensure *FolderName*` anywhere in your server.cfg
 6. Restart your server or start the resource through TxAdmin

# Updating
Replace these files in your existing script folder:
- client.lua
- server.lua
- VERSION

And depending on the notes of a release, possibly this:
- config.lua

# Usage

Edit **config.lua** according to the comments in it.
![paintdotnet_13BW96B3Wn](https://github.com/boofiboi/FiveM-Discord-Presence/assets/79476279/857e1ef6-97be-4682-a8e4-73009afdf6bc)

## Standalone requires modifications to the client.lua, specifically:
#### Changing the first line from `local LoadedAndReady = false` to `LoadedAndReady = true`

# Issues?

### Keep in mind that buttons wont show on your Discord client, but will for other people.

Create a new [issue](https://github.com/boofiboi/FiveM-Discord-Presence/issues/new) or message me on Discord: boofiboi

# Final words

Big thanks to Virtual Vision Studios over on discord, who helped me catch a lot of errors.

