Config = {}

-- Heist Config / Setup --
Config.HeistCooldown = (60000 * 1) -- 60 seconds * minutes
Config.RequiredPolice = 1 -- Required Police on duty

Config.ATMRequiredItem = 'black_card' -- Required item 
Config.Time = 10
Config.Block = 4
Config.ProgressBarInteger = 25000 -- Amount of time for all progress bars to complete

-- ATM Config / Rewards --
Config.ATMModels = {
    "prop_atm_01",
    "prop_atm_02",
    "prop_atm_03",
    "prop_fleeca_atm"
}
Config.ATMIcon = 'fas fa-microchip' -- Icon Target for the ATM's
Config.ATMLabel = 'Use Black Card' -- Label Target for the ATM's
Config.ATMLabelItem = 'black_card' -- Required item for the Label to show on-thrid eye

Config.RewardMoney = math.random(2000, 8000) -- Amount of cash you receive from the ATM

Config.LuckyItem = 'gold' -- Lucky Item Spawncode
Config.LuckyItemPossibility = math.random(1, 3) -- Lucky Item Possibility
Config.LuckyItemVariation = math.random(1, 3) -- Luck Item Variation

--- dont touch if youre using defult qb-core
Config.core = 'qb-core'
Config.target = 'qb-target'

-- atm locations
Config.atm1 = vector3(-1205.0, -326.26, 37.84)
Config.atm2 = vector3(147.85, -1035.77, 29.34)
Config.atm3 = vector3(145.97, -1035.09, 29.34)
Config.atm4 = vector3(237.42, 217.81, 106.29)
Config.atm5 = vector3(1171.69, 2702.51, 38.18)
Config.atm6 = vector3(1172.48, 2702.51, 38.17)
Config.atm7 = vector3(-1205.76, -324.64, 37.86)
