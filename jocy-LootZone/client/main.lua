local PlayerInZone = false

lib.registerContext({
    id = 'loot_menu',
    title = 'Lootin Menu',
    options = {
        {
            title = 'Loot',
            onSelect = function()
                exports.ox_inventory:openNearbyInventory()
            end,
            icon = 'hand',
            description = 'Loot another player if dead',
        },
    }
})

for k, v in ipairs(Config.LootZones) do
    local sphere = lib.zones.sphere({
        coords = v.zoneCoords,
        radius = v.radius,
        debug = v.EnableDebug,
        onEnter = function()
            PlayerInZone = true
            if Config.LootZones[k].EnableJoinNotify then
                lib.notify({
                    position = Config.LootZones[k].AllNotifyPosition,
                    title = 'You entered ' .. Config.LootZones[k].blipName .. '!',
                    type = 'warning'
                })
            end
        end,
        onExit = function()
            PlayerInZone = false
            if Config.LootZones[k].EnableLeaveNotify then
                lib.notify({
                    position = Config.LootZones[k].AllNotifyPosition,
                    title = 'You leaved ' .. Config.LootZones[k].blipName .. '!',
                    type = 'success'
                })
            end
        end
    })
    if Config.LootZones[k].EnableBlip then
        local blip1 = AddBlipForCoord(Config.LootZones[k].zoneCoords)

        SetBlipSprite(blip1, Config.LootZones[k].blipSprite)
        SetBlipColour(blip1, Config.LootZones[k].blipColor)
        SetBlipScale(blip1, 0.85)
        SetBlipAsShortRange(blip1, true)

        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(Config.LootZones[k].blipName)
        EndTextCommandSetBlipName(blip1)

        local blip3 = AddBlipForRadius(Config.LootZones[k].zoneCoords, Config.LootZones[k].radius)
        SetBlipColour(blip3, Config.LootZones[k].blipCircleColor)
        SetBlipAlpha(blip3, 150)
    end

    CreateThread(function()
        while true do
            if IsControlJustPressed(0, 167) then
                if PlayerInZone then
                    lib.showContext('loot_menu')
                else
                    lib.notify({
                        position = Config.LootZones[k].AllNotifyPosition,
                        title = 'You have no right to use this here!',
                        type = 'error'
                    })
                end
            end
            Wait(0)
        end
    end)
end