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
    return Config.LocationText .. ' ' .. location
end

function nameandid() 
    if Config.Framework == 'QB' then
       return 'ID: ' .. GetPlayerServerId() .. ' | ' .. playerData.charinfo.firstname  .. ' ' .. playerData.charinfo.lastname
    elseif Config.Framework == 'ESX' then
        return 'ID: ' .. GetPlayerServerId() .. ' | ' .. ESX.GetPlayerData().firstName  .. ' ' .. ESX.GetPlayerData().lastName
    end
end

--- Actual RPC part.
Citizen.CreateThread(function()
    while true do
        if LoadedAndReady then
                SetDiscordAppId(Config.Discord.AppId)
                SetRichPresence(_G[Config.Style]())
                SetDiscordRichPresenceAsset(Config.Discord.BigAsset)
                SetDiscordRichPresenceAssetText(Config.Discord.BigText)
                SetDiscordRichPresenceAssetSmall(Config.Discord.SmallAsset)
                SetDiscordRichPresenceAssetSmallText(Config.Discord.SmallText)
                SetDiscordRichPresenceAction(0, Config.Discord.Button1Text, Config.Discord.Button1Link)
                SetDiscordRichPresenceAction(1, Config.Discord.Button2Text, Config.Discord.Button2Link)
        end
        Citizen.Wait(Config.Delay)
    end
end)




-- Useless stuff just to know when player has chosen a character so we dont try getting his status when he doesnt have one.
RegisterNetEvent('esx:playerLoaded', function(playerData)
LoadedAndReady = true
end)
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
LoadedAndReady = true  
playerData = QBCore.Functions.GetPlayerData()
end)
