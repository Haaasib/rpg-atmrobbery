fx_version 'cerulean'
game 'gta5'

description 'ATM Robbery By RPG'
author 'Hasib'
version '1.0'

shared_scripts {
    'config.lua',
}

client_scripts {
	'client/cl_main.lua',
	'client/cl_menu.lua'
}

server_scripts {
    'server/*.lua',
    '@oxmysql/lib/MySQL.lua',
}