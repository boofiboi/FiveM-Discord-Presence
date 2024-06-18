Config = {} 

-- DON'T TOUCH ANYTHING ABOVE THIS TEXT, YOU WILL BREAK IT!


Config.Delay = 5000 -- Delay between presence updates, in ms.


--[[ Change this to whatever you like, previews are available on Github: 
healthdisplay // QB, ESX and STANDALONE - Shows the player health as coloured squares, if using QB shows a hospital emoji when knocked down. And when dead shows a skull on either.
location // QB and ESX, STANDALONE - Shows the street the player is on.
nameandid // QB, ESX - Shows the player's character name and the player ID.
custom // QB, ESX, STANDALONE - Shows custom text, if more than one option is present in the Config.CustomText array, will randomly cycle through them.
--]] 

Config.Line1 = 'nameandid'
Config.Line2 = 'location'
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
