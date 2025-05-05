fx_version 'cerulean'
game 'gta5'
description 'Speed Limiter with Custom Vanilla Handling'
version '1.0.0'
lua54 'yes'

client_script 'vehicle_speed.lua'

files {
    'car-classes/D-Class.meta',
    'car-classes/C-Class.meta',
    'car-classes/B-Class.meta',
    'car-classes/A-Class.meta',
    'car-classes/S-Class.meta',
    'car-classes/I-Class.meta',
    'car-classes/LF-Class.meta',
    'car-classes/U-Class.meta',
    'car-classes/M-Class.meta',
    'car-classes/O-Class.meta',
    'car-classes/P-Class.meta',
    'car-classes/DR-Class.meta',
}

data_file 'HANDLING_FILE' 'car-classes/D-Class.meta'
data_file 'HANDLING_FILE' 'car-classes/C-Class.meta'
data_file 'HANDLING_FILE' 'car-classes/B-Class.meta'
data_file 'HANDLING_FILE' 'car-classes/A-Class.meta'
data_file 'HANDLING_FILE' 'car-classes/S-Class.meta'
data_file 'HANDLING_FILE' 'car-classes/I-Class.meta'
data_file 'HANDLING_FILE' 'car-classes/LF-Class.meta'
data_file 'HANDLING_FILE' 'car-classes/U-Class.meta'
data_file 'HANDLING_FILE' 'car-classes/M-Class.meta'
data_file 'HANDLING_FILE' 'car-classes/O-Class.meta'
data_file 'HANDLING_FILE' 'car-classes/P-Class.meta'
data_file 'HANDLING_FILE' 'car-classes/DR-Class.meta'

resource_type 'handling'
dependency '/assetpacks'
