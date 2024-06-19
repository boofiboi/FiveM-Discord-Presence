-- Check what framework we reppin. Returns false if ESX, true if QB.
ESX = exports['es_extended']:getSharedObject()
RegisterServerEvent('Discord:Server:CheckFramework')
AddEventHandler("Discord:Server:CheckFramework", function()
ESX = GetResourceState("es_extended")
QB = GetResourceState("qb-core")

if ESX == "started" then
    print('^3 [DEBUG]: Framework detected: ESX.')
    return false
elseif ESX == "missing" and QB == "started" then
    print('^3 [DEBUG]: Framework detected: QB-Core.')
    return true
elseif ESX == "missing" and QB == "missing" then
    print('^3 [DEBUG]:  No framework detected! Defaulting to standalone ')
    return true
end

end)
-- Update checking done very easily!!


PerformHttpRequest('https://raw.githubusercontent.com/boofiboi/FiveM-Discord-Presence/main/VERSION', function(Error, OnlineVersion, Header)
    OfflineVersion = LoadResourceFile('FiveM-Discord-Presence', 'VERSION')
    if OnlineVersion <= OfflineVersion then -- Else if downloaded version file is the same then we dont need to update. 
    print('^3 [DEBUG]: \x1b[97m You are running the latest version of this script!. \x1b[0m')
    end
    if OnlineVersion > OfflineVersion then
        print('^3 [DEBUG]: \x1b[97m There is a new version of this script available, please update ASAP. \x1b[0m')
    end
end)

