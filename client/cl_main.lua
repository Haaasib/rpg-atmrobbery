local QBCore = exports[Config.core]:GetCoreObject()
local RecentRobbery = 0, 0, 0

RegisterNetEvent('rpg-atmrobbery:UseBlackCard', function()
    if RecentRobbery == 0 or GetGameTimer() > RecentRobbery then
        QBCore.Functions.TriggerCallback('rpg-atmrobbery:server:PolAlertReq', function(ReturnStatus)
            if ReturnStatus then
                QBCore.Functions.TriggerCallback('rpg-atmrobbery:server:RemoveCard', function(ItemChecks)
                    if ItemChecks then
                        QBCore.Functions.Progressbar('inserting_card', 'Inserting Black Card', Config.ProgressBarInteger, false, true, {
                            disableMovement = true,
                            disableCarMovement = true,
                            disableMouse = false,
                            disableCombat = true,
                        }, {
                        animDict = 'anim@gangops@facility@servers@',
                            anim = 'hotwire',
                            flags = 49,
                        }, {}, {}, function()
                            ClearPedTasks(PlayerPedId())
                            Dispatch()
                            RecentRobbery = GetGameTimer() + Config.HeistCooldown
                            exports['ps-ui']:VarHack(function(success)
                                if success then
                                    QBCore.Functions.Progressbar('atm_grabing_cash', 'Grabing dispensed cash', Config.ProgressBarInteger, false, true, {
                                        disableMovement = true,
                                        disableCarMovement = true,
                                        disableMouse = false,
                                        disableCombat = true,
                                    }, {
                                    animDict = 'oddjobs@shop_robbery@rob_till',
                                        anim = 'loop',
                                        flags = 17,
                                    }, {}, {}, function()
                                        ClearPedTasks(PlayerPedId())
                                        TriggerServerEvent('rpg-atmrobbery:server:AddMoney')
                                    end)
                                else
                                    QBCore.Functions.Notify('Pin incorrect', 'error' , 5000)
                                end
                            end, Config.Block, Config.Time) -- Number of Blocks, Time (seconds) 
                        end)
                    end
                end, Config.ATMRequiredItem)
            end
        end)
    else
        QBCore.Functions.Notify('Card use detected, come back later', 'error' , 5000)
    end
end)


-- ATM Robbery Disptach Notification (ps-dispatch) --
function Dispatch()
    exports['ps-dispatch']:ATMRobbery()
end