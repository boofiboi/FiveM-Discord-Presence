Config = {} 
Config.Version = '1.1'

-- Check what framework we reppin.
ESX = GetResourceState("es_extended")
QB = GetResourceState("qb-core")

if ESX == "started" then
    print('^3 [DEBUG]: Framework detected: ESX.')
    Config.Framework = "ESX"
elseif ESX == "missing" and QB == "started" then
    print('^3 [DEBUG]: Framework detected: QB-Core.')
    Config.Framework = "QB"
elseif ESX == "missing" and QB == "missing" then
    print('^3 [DEBUG]:  No framework detected! Defaulting to standalone ')
    Config.Framework = "STANDALONE"
end

-- Update checking done very easily!!

PerformHttpRequest('https://raw.githubusercontent.com/boofiboi/FiveM-Discord-Presence/main/config.lua', function(Error, V, Header)
    local env = {}
    local loadConfig = load(V, nil, 't', env)
    loadConfig()

    -- Step 3: Transfer the Config Values to DownConfig
    DownConfig = {}
    DownConfig.Config = env.Config
    -- If the downloaded config file has Config.Version higher than the local one, we need to update.
    if DownConfig.Config.Version > Config.Version then
        print('^3 [DEBUG]: \x1b[97m There is a new version of this script available, please update ASAP. \x1b[0m')
    elseif DownConfig.Config.Version < Config.Version then -- Else if downloaded config file has Version.Config lower, then idk what happened but we dont need to update.
    print('You are running the latest version of this script!')
    end
end)

-- Check for any issues.
if Config.Framework == 'standalone' and Config.Animation == 'nameandid'  or nil then
    error("\n \x1b[101;1;97m[ERROR]\x1b[0m : \x1b[91;4m The 'nameandid' animation is not intended to be used without a framework. \x1b[0m\n\x1b[94m Please consider using a diffirent animation or using a framework.")
end
if Config.Framework == 'standalone' then
    print('^3 [DEBUG]: \x1b[97m Please consider using a framework. Doing that unlocks the full potential of this script. \x1b[0m')
end
if Config.Framework == '' then
    error('\n \x1b[101;1;97m[ERROR]\x1b[0m : \x1b[91;4m  Your framework is not set in the config file. Without it being set, this script wont work. \x1b[0m')
end
-- DON'T TOUCH ANYTHING ABOVE THIS TEXT, YOU WILL BREAK IT!


Config.Delay = 5000 -- Delay between presence updates, in ms.


--[[ Change this to whatever you like, previews are available on Github: 
healthdisplay // QB, ESX and STANDALONE - Shows the player health as coloured squares, if using QB shows a hospital emoji when knocked down. And when dead shows a skull on either.
location // QB and ESX, STANDALONE - Shows the street the player is on.
nameandid // QB, ESX - Shows the player's character name and the player ID.
custom // QB, ESX, STANDALONE - Shows custom text, if more than one option is present in the Config.CustomText array, will randomly cycle through them.
--]] 

Config.Line1 = 'CHANGEME'
Config.Line2 = 'CHANGEME'
-- You can mix&match all of the presets above.


--Also translate this if you're using custom preset.
Config.CustomText = {
    [0] = 'Be sure to join our discord to be whitelisted!',
    [1] = 'Over a million possibilities, choose yours!',
    [2] = 'Make sure to have fun!',
    [3] = "Don't break rules!"
}

--Anything you dont want to show up can be left blank.
Config.Discord = {
AppId = "CHANGEME", -- The discord application ID.
BigAsset = 'CHANGEME', -- Name of a rich presence asset, will show up as the big image
BigText = 'CHANGEME', -- Text that will show when someone hovers over the big image
SmallAsset = 'CHANGEME', -- Small image asset name
SmallText = 'CHANGEME', -- Text that will appear when hovering over small image
Button1Text = 'CHANGEME', -- Text that will appear on the first button
Button1Link = 'CHANGEME', -- Link that will open when pressing the first button
Button2Text = 'CHANGEME', -- Text that will appear on the second button
Button2Link = 'CHANGEME' -- Link that will open when pressing the second button.
}