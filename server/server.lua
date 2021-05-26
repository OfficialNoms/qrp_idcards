local ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('qrp_idcards:open')
AddEventHandler('qrp_idcards:open', function(ID, targetID, metadata, type)
	local identifier = ESX.GetPlayerFromId(ID).identifier
	local _source 	 = ESX.GetPlayerFromId(targetID).source
	local array 	 = {} 
	TriggerClientEvent('qrp_idcards:open', _source, array, metadata, type)
end)

RegisterServerEvent('qrp_issueidcard')
AddEventHandler('qrp_issueidcard', function(src,url)
	local xPlayer = ESX.GetPlayerFromId(source)
	local metadata = {}
	metadata.type = xPlayer.getName()
	metadata.citizenid = 'XXX-XXX' --Use this if you want to generate a random CitizenID number for your player
	metadata.firstName = xPlayer.get('firstName')
	metadata.lastName = xPlayer.get('lastName')
	metadata.dateofbirth = xPlayer.get('dateofbirth')
	metadata.sex = xPlayer.get('sex')
	metadata.height = xPlayer.get('height')
	metadata.mugshoturl = url
	exports['linden_inventory']:addInventoryItem(xPlayer, 'identification', 1, metadata)
end)
