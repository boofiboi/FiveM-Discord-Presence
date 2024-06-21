

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

