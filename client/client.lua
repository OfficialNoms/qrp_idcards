local open = false
ESX = nil
-- Key events
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)


RegisterNetEvent('qrp_idcards:showIDCard')
AddEventHandler('qrp_idcards:showIDCard', function(item, wait, cb)
    local metadata = ESX.GetPlayerData().inventory[item.slot].metadata
    TriggerServerEvent('qrp_idcards:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId(-1)), metadata) -- look at your own
    local player, distance = ESX.Game.GetClosestPlayer()
    
    if distance ~= -1 and distance <= 3.0 then
        TriggerServerEvent('qrp_idcards:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(player), metadata)
    else
        ESX.ShowNotification('No players nearby')
    end
end)

RegisterNetEvent('qrp_idcards:open')
AddEventHandler('qrp_idcards:open', function( data, metadata, type )
	open = true
    SendNUIMessage({
        action = "open",
        array  = data,
        metadata = metadata,
        type   = type,
        mugshot = metadata.mugshoturl,
    })
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if IsControlJustReleased(0, 322) and open or IsControlJustReleased(0, 177) and open then
			SendNUIMessage({
				action = "close"
			})
			open = false
		end
	end
end)

-- Example of how to issue an ID card - you must do it with the mugshot export on the client, and send it to the server.
RegisterCommand('issueidcard', function(source, args, rawCommand)
    exports['mugshot']:getMugshotUrl(PlayerPedId(), function(url)
        TriggerServerEvent('qrp_issueidcard',source,url)
    end)
    
end, false)