Config = {} 

-- DON'T TOUCH ANYTHING ABOVE THIS TEXT, YOU WILL BREAK IT!


Config.Delay = 5000 -- Delay between presence updates, in ms. I don't reccommend changing it unless you want your player's games to lag.


--[[ These are the dynamic display options that you can use: 
healthdisplay // QB, ESX and STANDALONE - Shows the player health as coloured squares, if using QB shows a hospital emoji when knocked down. And when dead shows a skull on either.
location // QB and ESX, STANDALONE - Shows the street the player is on.
nameandid // QB, ESX - Shows the player's character name and the player ID.
custom // QB, ESX, STANDALONE - Shows custom text, if more than one option is present in the Config.CustomText array, will randomly cycle through them.
playercount // QB, ESX, STANDALONE - Shows the current amount of players online on the server.

You can use functions in the following variables:
BigText = 'healthdisplay'
SmallText = 'location'
Line1 = 'nameandid'
Line2 = 'location'

You can also mix&match:
BigText = 'The best RP experience you can have!'
SmallText = 'healthdisplay'
Line1 = 'nameandid'
Line2 = 'location'
--]] 
Config.Framework = 'CHANGEME' -- Framework, can be either "QB", "ESX", or "STANDALONE"
--Anything you dont want to show up can be left blank, except for AppId.
Config.Discord = {
AppId = "CHANGEME", -- The discord application ID.
BigAsset = 'CHANGEME', -- Name of a rich presence asset, will show up as the big image
BigText = 'CHANGEME', -- Text that will show when someone hovers over the big image
SmallAsset = 'CHANGEME',-- Small image asset name
Line1 = 'CHANGEME', -- Text that will appear on line #1
Line2 = 'CHANGEME',  -- Text that will appear on line #2
SmallText = 'CHANGEME', -- Text that will appear when hovering over small image
Button1Text = 'CHANGEME', -- Text that will appear on the first button
Button1Link = 'CHANGEME', -- Link that will open when pressing the first button
Button2Text = 'CHANGEME', -- Text that will appear on the second button
Button2Link = 'CHANGEME' -- Link that will open when pressing the second button.
}


--Also translate/add your own to this if you're using the custom preset.
Config.CustomText = {
    [0] = 'Be sure to join our discord to be whitelisted!',
    [1] = 'Over a million possibilities, choose yours!',
    [2] = 'Make sure to have fun!',
    [3] = "Don't break rules!"
}

