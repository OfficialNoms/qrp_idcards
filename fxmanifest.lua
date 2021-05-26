fx_version 'adamant'

game 'gta5'

ui_page 'html/index.html'

author 'Noms'
description 'A basic resource to generate an ID card with a mugshot and use it in an ID card'

server_script {
	'server/*.lua'
}

client_script {
	'client/*.lua'
}

files {
	'html/index.html',
	'html/assets/css/*.css',
	'html/assets/js/*.js',
	'html/assets/fonts/roboto/*.woff',
	'html/assets/fonts/roboto/*.woff2',
	'html/assets/fonts/justsignature/JustSignature.woff',
	'html/assets/images/*.png'
}
