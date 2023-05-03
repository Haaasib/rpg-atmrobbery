local QBCore = exports[Config.core]:GetCoreObject()


RegisterNetEvent('rpg-atmrobbery:server:AddMoney', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    local Possibility = Config.LuckyItemPossibility
    local Variation = Config.LuckyItemVariation

    if Possibility == Variation then
        Player.Functions.AddItem(Config.LuckyItem, 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.LuckyItem], 'add', 1)
        Player.Functions.AddMoney('cash', Config.RewardMoney, 'ATM withdrawl')
    else
        Player.Functions.AddMoney('cash', Config.RewardMoney, 'ATM withdrawl')
    end
end)

QBCore.Functions.CreateCallback('rpg-atmrobbery:server:RemoveCard', function(source, cb, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local DisruptorScan = Player.Functions.GetItemByName(item)
    if DisruptorScan then
        cb(true)
        Player.Functions.RemoveItem(Config.ATMRequiredItem, 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.ATMRequiredItem], 'remove', 1)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('rpg-atmrobbery:server:PolAlertReq', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayers(src)
    local PolAlertReq = 0

    for i = 1, #Player do
        local xPlayer = QBCore.Functions.GetPlayer(Player[i])
        if (xPlayer.PlayerData.job.name == 'police' and xPlayer.PlayerData.job.onduty) then
            PolAlertReq = PolAlertReq + 1
        end
    end

    if PolAlertReq >= Config.RequiredPolice then
        cb(true)
    else
        cb(false)
        TriggerClientEvent('QBCore:Notify', src, ('Not enough police'), 'error')
    end
end)

Citizen.CreateThread(function()
    print("\n^1----------------------------------------------------------------------------------^7")
    print("RPG ATM ROBBERY")
    print("^1----------------------------------------------------------------------------------^7")
end)