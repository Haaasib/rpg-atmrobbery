## Preivew
https://youtu.be/fd5iAphvZQY

## dependency

* [QBCore Framework](https://github.com/qbcore-framework)
* [ps-ui](https://github.com/Project-Sloth/ps-ui)
* [ps-dispatch](https://github.com/Project-Sloth/ps-dispatch)

## Installation

* Download ZIP
* Remove '-main' and drag and drop to your server file
* ensure rpg-atmrobbery
* do the below steps
* Restart your server

## qb-core > shared > items.lua
```lua
	-- RPG ATM Robbery
 ['black_card']                = {['name'] = 'black_card',                  ['label'] = 'Black Card',           ['weight'] = 0,            ['type'] = 'item',         ['image'] = 'black_card.png',        ['unique'] = false,         ['useable'] = true,     ['shouldClose'] = true,       ['combinable'] = nil,   ['description'] = 'A black card... I wonder what it goes to'},
```

## ps-dispatch > client > cl_events.lua
```lua
-- ATM Robbery
local function ATMRobbery(camId)
    local currentPos = GetEntityCoords(PlayerPedId())
    local locationInfo = getStreetandZone(currentPos)
    local gender = GetPedGender()
    TriggerServerEvent("dispatch:server:notify", {
        dispatchcodename = "atmrobbery", -- has to match the codes in sv_dispatchcodes.lua so that it generates the right blip
        dispatchCode = "10-90",
        firstStreet = locationInfo,
        gender = gender,
        camId = camId,
        model = nil,
        plate = nil,
        priority = 2, -- priority
        firstColor = nil,
        automaticGunfire = false,
        origin = {
            x = currentPos.x,
            y = currentPos.y,
            z = currentPos.z
        },
        dispatchMessage = _U('atmrobbery'), -- message
        job = { "police" } -- jobs that will get the alerts
    })
end

exports('ATMRobbery', ATMRobbery)
```

## ps-dispatch > server > sv_dispatchcodes.lua
```lua
	-- ATM Robbery
	["atmrobbery"] =  {displayCode = '10-90', description = "ATM Robbery In Progress", radius = 0, recipientList = {'police'}, blipSprite = 500, blipColour = 1, blipScale = 1.5, blipLength = 2, sound = "Lose_1st", sound2 = "GTAO_FM_Events_Soundset", offset = "false", blipflash = "false"},
```

## ps-dispatch > locales > locales.lua
```lua
        -- ATM Robbery
        ['atmrobbery'] = "ATM Robbery",
```
* Join Discord : discord.gg/T7du2nJfyN