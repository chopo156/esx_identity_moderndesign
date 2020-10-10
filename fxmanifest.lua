fx_version 'adamant'
game 'gta5'

version '1.0.2'

client_script('client.lua')

server_script "@mysql-async/lib/MySQL.lua"
server_script "server.lua"

ui_page('html/index.html')

files({
  'html/index.html',
  'html/script.js',
  'html/style.css',
  'html/img/cursor.png',
  'html/new/js/jquery-3.3.1.js',
})

exports {
  'openRegistry'
}
