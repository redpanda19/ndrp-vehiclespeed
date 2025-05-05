local classVehicles = {
    SS = {'tr_pdmstang', 'police'},
    o = {'tr_pdmstang', 'police'},
    S = {  "le7b", "sc1", "virtue", "champion", "banshee2", "cheetah", "furia", "thrax", "torero", 
    "turismo2", "turismor", "prototipo", "viseris", "s80", "sultanrs", "coquette4", "locust", 
    "visione", "emerus", "neo", "penetrator", "swinger", "xa21", "autarch", "fmj", "italigto", 
    "italirsx", "monroe", "osiris", "reaper", "tempesta", "tezeract", "torero2", "vacca", "zentorno", 
    "pfister811", "neon", "taipan", "deveste", "entity3", "sheava", "entityxf", "entity2", "gp1", 
    "italigtb2", "italigtb", "omnisegt", "t20", "tyrus", "schlagen", "adder", "nero2", "nero", 
    "vagner", "tigon", "ztype", "bullet", "deity", "ignus", "krieger", "tyrant", "zorrusso", "lm87", 
    "zeno", "raiden"},
    A = {  "btype2", "btype", "btype3", "elegy2", "elegy", "euros", "r300", "feltzer2", "schafter3", 
    "schwarzer", "sm722", "feltzer3", "surano", "buffalo4", "gauntlet4", "voltic", "vigero2", 
    "mamba", "massacro2", "massacro", "seven70", "specter", "specter2", "jester", "jester2", 
    "jester3", "jester4", "sugoi", "superd", "paragon", "verlierer2", "windsor2", "windsor", 
    "bestiagts", "carbonizzare", "cheetah2", "gt500", "pariah", "stingergt", "stinger", "ruston", 
    "coquette", "calico", "everon2", "kuruma", "sultan3", "sultan2", "sultan", "casco", "cinquemila", 
    "corsita", "komoda", "tropos", "omnis", "drafter", "ninef", "ninef2", "tenf", "tenf2", "jugular", 
    "imorgon", "infernus", "infernus2", "comet2", "comet3", "comet5", "comet6", "comet7", "growler", 
    "panthere", "cypher", "revolter", "rhinehart", "sentinel4", "zion", "zion2", "dominator", 
    "dominator2", "dominator3", "dominator7", "dominator8", "gb200", "issi7"},
    B = {    "broadway", "lurcher", "primo", "primo2", "stratum", "virgo", "virgo2", "washington", 
    "glendale", "glendale2", "prairie", "buffalo", "buffalo2", "faction3", "gauntlet5", 
    "gauntlet3", "vigero", "tulip2", "fugitive", "picador", "surge", "impaler", "premier", 
    "sabregt", "sabregt2", "stalion", "stalion2", "tampa", "tulip", "vamos", "blista", 
    "blista2", "blista3", "kanjosj", "postlude", "dukes", "dukes3", "phoenix", "ruiner", 
    "futo", "intruder", "michelli", "pigalle", "penumbra", "tailgater", "cheburek", "eudora", 
    "iwagen", "blade", "chino", "chino2", "peyote2", "peyote3", "stanier", "fagaloa", 
    "nebula", "warrener", "warrener2", "issi2", "issi8"},
    C = {     "broadway", "lurcher", "primo", "primo2", "stratum", "virgo", "virgo2", "virgo3", "washington", "glendale",
    "glendale2", "prairie", "buffalo", "buffalo2", "faction3", "gauntlet5", "gauntlet3", "vigero", "tulip2", 
    "fugitive", "picador", "surge", "impaler", "premier", "sabregt", "sabregt2", "stalion", "stalion2", "tampa", 
    "tulip", "vamos", "blista", "blista2", "blista3", "kanjosj", "postlude", "dukes", "dukes3", "phoenix", "ruiner",
    "futo", "intruder", "michelli", "pigalle", "penumbra", "tailgater", "cheburek", "eudora", "iwagen", "blade", 
    "chino", "chino2", "peyote2", "peyote3", "stanier", "fagaloa", "nebula", "warrener", "warrener2", "issi2", "issi8"},
    D = {'flatbed', 'tornado4',"dynasty", "emperor", "manana", "manana2", "regina", "panto", "surfer", "surfer2", 
    "surfer3", "weevil", "club", "asea", "tornado", "tornado2", "tornado3", "tornado4", 
    "tornado5", "tornado6", "voodoo", "brioso2", "brioso3", "rhapsody", "asterope", 
    "dilettante", "dilettante2", "caddy", "caddy2", "ingot", "peyote", "issi3", "asbo"},
}

local classSpeeds = {
    SS = 200,
    O = 165,
    S = 160,
    A = 150,
    B = 135,
    C = 120,
    D = 100,
}


local mphToMetersPerSecond = 0.44704

local function SetVehicleSpeed(vehicle, speed)
    local speedInMetersPerSecond = speed * mphToMetersPerSecond
    SetEntityMaxSpeed(vehicle, speedInMetersPerSecond)
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500)

        local playerPed = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(playerPed, false)

        if DoesEntityExist(vehicle) and IsEntityAVehicle(vehicle) then
            local vehicleModel = GetEntityModel(vehicle)

            for class, vehicles in pairs(classVehicles) do
                for _, vehicleClass in ipairs(vehicles) do
                    if GetHashKey(vehicleClass) == vehicleModel then
                        local maxSpeed = classSpeeds[class]
                        SetVehicleSpeed(vehicle, maxSpeed)
                        break
                    end
                end
            end
        end
    end
end)
