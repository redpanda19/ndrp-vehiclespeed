local classVehicles = {
    SS = {'tr_pdmstang', 'police'},
    S = {'le7b', 'sc1', 'zentorno', 'virtue', 'champion', 'banshee2', 'cheetah', 'furia', 'thrax', 'torero', 'turismo2', 'turismor', 'prototipo', 'viseris', 's80', 'sultanrs', 'coquette4', 'locust', 'neo', 'emerus', 'visione', 'swinger', 'xa21', 'autarch', 'fmj', 'zentorno', 'zentorno', 'zentorno', 'zentorno', 'zentorno', 'zentorno', 'zentorno', 'zentorno', 'zentorno', 'zentorno', 'zentorno', 'zentorno', 'zentorno', 'zentorno', 'zentorno', 'zentorno', 'zentorno', 'zentorno', 'zentorno', 'zentorno', 'zentorno', 'zentorno', 'zentorno', 'zentorno', 'zentorno', 'zentorno', 'zentorno', 'zentorno', 'zentorno', 'zentorno', 'zentorno', 'zentorno', 'zentorno', 'zentorno'},
    A = {'banshee', 'vacca'},
    B = {'blista', 'issi'},
    C = {'police3', 'police4'},
    D = {'flatbed', 'tornado4'},
}

local classSpeeds = {
    SS = 200,
    O = 160,
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
