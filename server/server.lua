if Config.Framework == 'standalone' and Config.Animation == 'nameandid'  or nil then
    error("\n \x1b[101;1;97m[ERROR]\x1b[0m : \x1b[91;4m The 'nameandid' animation is not intended to be used without a framework. \x1b[0m\n\x1b[94m Please consider using a diffirent animation or using a framework.")
end
if Config.Framework == 'standalone' then
    print('^3 [DEBUG]: \x1b[97m Please consider using a framework. Doing that unlocks the full potential of this script. \x1b[0m')
end
if Config.Framework == '' then
    error('\n \x1b[101;1;97m[ERROR]\x1b[0m : \x1b[91;4m  Your framework is not set in the config file. Without it being set, this script wont work. \x1b[0m')
end