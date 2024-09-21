-- Variables
local LoadedAndReady = false
PlayerData = {}

-- Framework shared objects.
if Config.Framework == 'ESX' then
     ESX = exports['es_extended']:getSharedObject()
    if ESX.GetPlayerData().identifier ~= nil then
        LoadedAndReady = true
    end
     playerData = ESX.GetPlayerData()
elseif Config.Framework == 'QB' or Config.Framework == nil then
     QBCore = exports['qb-core']:GetCoreObject()
if QBCore.Functions.GetPlayerData().citizenid ~= nil then
    playerData = QBCore.Functions.GetPlayerData()
    LoadedAndReady = true
    end
end


-- Health indicators
local h_tbl = {
    [0] = "[☠️]",
    [1] = "[🟥]",
    [2] = "[🟥🟥]",
    [3] = "[🟧🟧🟧]",
    [4] = "[🟧🟧🟧🟧]",
    [5] = "[🟨🟨🟨🟨🟨]",
    [6] = "[🟨🟨🟨🟨🟨🟨]",
    [7] = "[🟩🟩🟩🟩🟩🟩🟩]",
    [8] = "[🟩🟩🟩🟩🟩🟩🟩🟩]"
}


--Player count handling
function playercount()
return '🎮🟢 ' .. '[' .. NetworkGetNumConnectedPlayers() .. ']'
end



function custom()
    local year, month, day, hour, second, minute = GetUtcTime()
    math.randomseed(year .. month .. day .. hour .. second .. minute)
    local randomIndex = math.random(0, #Config.CustomText) 
    local randomElement = Config.CustomText[randomIndex]
    return randomElement
end


function healthdisplay()
Health = math.floor(GetEntityHealth(PlayerPedId()) / 25)
    if Config.Framework == 'QB' then
            if playerData.metadata['isdead'] then
                return "💓 " ..  h_tbl[0] 
            elseif playerData.metadata['inlaststand'] then
                return "💓 " .. "[🏥]"
            elseif not playerData.metadata['isdead'] and not playerData.metadata['inlaststand'] then
                return "💓 " .. h_tbl[Health]
            end
        end
    if Config.Framework == 'ESX' or 'STANDALONE' then
        return "💓 " .. h_tbl[Health]
    end
end

function location()
    local coords = GetEntityCoords(PlayerPedId())
    local location = GetStreetNameFromHashKey(GetStreetNameAtCoord(coords[1], coords[2], coords[3]))
    return '🗺️ ' .. '[ ' .. location .. ' ]'
end

function nameandid() 
    if Config.Framework == 'QB' then
       return '🆔: ' .. GetPlayerServerId(PlayerId()) .. ' |' .. '👤'.. ' [ ' .. playerData.charinfo.firstname  .. ' ' .. playerData.charinfo.lastname .. ' ]'
    elseif Config.Framework == 'ESX' then
        return  '🆔: ' .. GetPlayerServerId(PlayerId()) .. ' |' .. '👤'..  ' [ ' .. ESX.GetPlayerData().firstName  .. ' ' .. ESX.GetPlayerData().lastName .. ' ]'
    end
end






--Functions to match if any lines you can change in the RPC contain a function we can run.
--I KNOW THERES A BETTER WAY TO DO THIS, IM LAZY OK? USE YOUR CODE EDITOR TO HIDE THESE WHEN EDITING THIS SCRIPT.
function find_matching_string(variable)
strings = {"nameandid", "location", "healthdisplay", "custom", "playercount"}
    for _, str in ipairs(strings) do
        if string.find(variable, str) then
            return str
        end
    end
    return nil  -- Return nil if no match is found
end
function BigText()
    local matched_string = find_matching_string(Config.Discord.BigText)
    if matched_string then
        return _G[matched_string]()
    else
        return Config.Discord.BigText
    end
end
function SmallText()
    local matched_string = find_matching_string(Config.Discord.SmallText)
    if matched_string then
        return _G[matched_string]()
    else
        return Config.Discord.SmallText
    end
end
function line1()
    local matched_string = find_matching_string(Config.Discord.Line1)
    if matched_string then
        return _G[matched_string]()
    else
        return Config.Discord.Line1
    end
end
function line2()
    local matched_string = find_matching_string(Config.Discord.Line2)
    if matched_string then
        return _G[matched_string]()
    else
        return Config.Discord.Line2
    end
end


--- Actual RPC part.
Citizen.CreateThread(function()
    while true do
        if LoadedAndReady then
                SetDiscordAppId(Config.Discord.AppId)
                SetRichPresence(line2() .. string.char(10) .. line1())
                SetDiscordRichPresenceAsset(Config.Discord.BigAsset)
                SetDiscordRichPresenceAssetText(BigText())
                SetDiscordRichPresenceAssetSmall(Config.Discord.SmallAsset)
                SetDiscordRichPresenceAssetSmallText(SmallText())
                SetDiscordRichPresenceAction(0, Config.Discord.Button1Text, Config.Discord.Button1Link)
                SetDiscordRichPresenceAction(1, Config.Discord.Button2Text, Config.Discord.Button2Link)
        else
            --- Detect if player's game is still loading, or is loaded already (This might be useless idk.)
            if not NetworkIsPlayerActive(PlayerId()) then
                SetDiscordAppId(Config.Discord.AppId)
                SetRichPresence('Loading...')
                SetDiscordRichPresenceAsset(Config.Discord.BigAsset)
                SetDiscordRichPresenceAssetSmall(Config.Discord.SmallAsset)
                SetDiscordRichPresenceAction(0, Config.Discord.Button1Text, Config.Discord.Button1Link)
                SetDiscordRichPresenceAction(1, Config.Discord.Button2Text, Config.Discord.Button2Link)
            else
                SetDiscordAppId(Config.Discord.AppId)
                SetRichPresence('Choosing a character.')
                SetDiscordRichPresenceAsset(Config.Discord.BigAsset)
                SetDiscordRichPresenceAssetSmall(Config.Discord.SmallAsset)
                SetDiscordRichPresenceAction(0, Config.Discord.Button1Text, Config.Discord.Button1Link)
                SetDiscordRichPresenceAction(1, Config.Discord.Button2Text, Config.Discord.Button2Link)
            end
        end
        Citizen.Wait(Config.Delay)
    end
end)



-- Useless stuff just to know when player has chosen a character so we dont try getting his status when he doesnt have one.
RegisterNetEvent('esx:playerLoaded', function(playerData)
LoadedAndReady = true
Config.Framework = 'ESX'
end)
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
LoadedAndReady = true
Config.Framework = 'QB'
playerData = QBCore.Functions.GetPlayerData()
end)
