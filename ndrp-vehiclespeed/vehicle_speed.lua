local mphToMetersPerSecond = 0.44704  -- Conversion factor for mph to m/s

-- Define Vehicle Classes and Speeds
local classVehicles = {
    [0] = {'police', 'police'}, -- police ss class (class 0)
    [1] = {'adder', 'zentorno'}, -- police a class (class 0)
    [2] = {'banshee', 'vacca'},  -- s civ class (class 1)
    [3] = {'blista', 'issi'},    -- a class (class 2)
    [4] = {'police', 'police2'}, -- b class (class 3)
    [5] = {'flatbed', 'towtruck'}, -- c class (class 4)
    [6] = {'flatbed', 'towtruck'}, -- d class (class 4)
}

local classSpeeds = {
    [0] = 200, 
    [1] = 150, 
    [2] = 120, 
    [3] = 160, 
    [4] = 100, 
    [4] = 100, 
    [4] = 100, 
}

-- Function to set vehicle speed
local function SetVehicleSpeed(vehicle, speed)
    local speedInMetersPerSecond = speed * mphToMetersPerSecond
    SetEntityMaxSpeed(vehicle, speedInMetersPerSecond)
end

-- Main thread to monitor player's vehicle and adjust speed based on class
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500)  -- Run this check every 500ms

        local playerPed = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(playerPed, false)

        if DoesEntityExist(vehicle) and IsEntityAVehicle(vehicle) then
            local vehicleModel = GetEntityModel(vehicle)

            -- Iterate through vehicle classes and check for a match
            for class, vehicles in pairs(classVehicles) do
                for _, vehicleClass in ipairs(vehicles) do
                    -- Check if the vehicle model matches the vehicle class
                    if GetHashKey(vehicleClass) == vehicleModel then
                        -- Set the maximum speed for this vehicle class
                        local maxSpeed = classSpeeds[class]
                        SetVehicleSpeed(vehicle, maxSpeed)
                        break  -- Exit the loop once the speed is set
                    end
                end
            end
        end
    end
end)
