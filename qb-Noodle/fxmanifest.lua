fx_version 'adamant'

game 'gta5'
lua54 'yes'
author "Nevo#0652"
description "QB-noodle"

ui_page {'html/index.html'}

client_scripts {
    '@PolyZone/client.lua',
    'client/client.lua',
    'config.lua',
}

files {
    'html/index.html',
    'html/css/menu.css',
    'html/js/js.js',
}

server_scripts {
    'server/server.lua',
    'config.lua',
}

dependencies {
    'PolyZone',
    'qb-target'
} --[[ Cleaned: 2023/03/02 16:12 ]]--
