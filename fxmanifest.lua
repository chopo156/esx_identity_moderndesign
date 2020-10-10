fx_version 'cerulean'

games {'gta5'}



client_script('client.lua')

server_script "@mysql-async/lib/MySQL.lua"
server_script "server.lua"

ui_page('html/index.html')

files {
  'html/index.html',
  'html/script.js',
  'html/style.css',
  'html/img/cursor.png',
  'html/new/js/jquery-3.3.1.js',
}

exports {
  'openRegistry'
}