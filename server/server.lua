-- Check what framework we reppin.

RegisterServerEvent('discord:checkframework')
AddEventHandler("discord:checkframework", function()
    -- Code here will be executed once the event is triggered.
ESX = GetResourceState("es_extended")
QB = GetResourceState("qb-core")

if ESX == "started" then
    print('^3 [DEBUG]: Framework detected: ESX.')
    return "ESX"
elseif ESX == "missing" and QB == "started" then
    print('^3 [DEBUG]: Framework detected: QB-Core.')
    return "QB"
elseif ESX == "missing" and QB == "missing" then
    print('^3 [DEBUG]:  No framework detected! Defaulting to standalone ')
    return "STANDALONE"
end

end)
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
    elseif DownConfig.Config.Version <= Config.Version then -- Else if downloaded config file has Version.Config lower, then idk what happened but we dont need to update.
    print('^3 [DEBUG]: \x1b[97m You are running the latest version of this script!. \x1b[0m')
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