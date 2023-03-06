Config = {}

Config.DebugWeedPoly = false  --true for testing/false for live server

Config.JimShops = false --set true if using jimshops

Config.WeedGaragePedLocation = vector4(372.18, -827.04, 29.29, 90.12) --ped location
Config.WeedGaragePedModel = "g_m_importexport_01"  --ped model
Config.SpawnWeedVehicle = vector4(173.86, -260.86, 49.54, 251.25) --location car spawns
Config.WeedVehicleModel = 'pony2'  --model of vehicle for easy swapping

Config.WSDrawText = "enabled"   --enabled or disabled
Config.JobName = "weedshop"
Config.WeedshopLocations = {
    ["weedshop-duty"] = {
        [1] = vector3(179.3, -251.33, 54.07),
    },
    ["weed-tray1"] = {
        [1] = vector3(198.98, -246.22, 54.07),
    },
    ["weedshop-dryer"] = {
        [1] = vector3(165.15, -233.44, 50.06),
    },
    ["weedshop-grind"] = {
        [1] = vector3(170.97, -240.52, 50.07),
    },
    ["weedshop-menu"] = {
        [1] = vector3(182.08, -251.48, 54.07),
    },
    ["weedshop-storage"] = {
        [1] = vector3(183.88, -245.02, 54.07),
    },
    ["weedshop-craft"] = {
        [1] = vector3(165.73, -235.01, 50.06),
    },
    ["weedshop-register"] = {
        [1] = vector3(187.48, -243.36, 54.07),
    },
    ["weedshop-garage"] = {
        [1] = vector3(186.08, -253.0, 49.54),
    },
    ["wetbud-pickup"] = {
        [1] = vector3(3688.24, 4563.43, 25.18),
    },
}

Config.CraftingTime = 5 --in seconds (5 = 5 seconds)

----/////NEW BREAKAGE SYSTEM/////----
Config.GrinderCanBreak = true --whether or not grinder can break after grinding
Config.GrinderBreakChance = 5 -- in % (5 = 5% chance of a break)
Config.InfusionCanBreak = true --whether or not infusion kit can break after drying something
Config.InfusionBreakChance = 5 --in % (5 = 5% chance of a break)

----/////Item Amounts//////----
Config.BrownieMixAmount = 1 --amount of weed brownies to get from 1 mix
Config.WeedDrinkAmount = 1 --amount of weed drinks to get from 1 crafting
Config.GrindingAmount = 1 --amount of ground weed to get from grinding 1
Config.DryingAmount = 1 --amount of dried weed to get back when drying 1

----////DELIVERIES////----
Config.DeliveryWait = 10 --now in seconds
Config.DeliveryPayment = math.random(1500, 2000)
Config.WetWeedCost = math.random(20000, 40000)   -- amount you pay for a pickup of wet weed
Config.WetWeedAmount = math.random(90,120)   --amount of wet weed you get from a pickup
Config.WetWeedLocation = vector3(3688.24, 4563.43, 25.18)   -- location to pick up wet weed with target when on a pickup

--delivery locations -- you can now have s many locations as you want
Config.DropOffPoints = {
    vector3(-297.74, 379.84, 112.1),
    vector3(119.37, 564.19, 183.96),
    vector3(808.72, -163.69, 75.88),
    vector3(1060.41, -378.3, 68.23),
    vector3(850.27, -532.63, 57.93),
    vector3(281.96, -1694.96, 29.65),
    vector3(39.02, -1911.58, 21.95),
    vector3(256.43, -2023.4, 19.27),
    vector3(512.51, -1790.77, 28.92),
    vector3(1193.52, -1622.37, 45.22)
}



Config.Items = {
label = "weedshop",
    slots = 10,
    items = {
        [1] = {
            name = "lighter",
            price = 10,
            amount = 50,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "empty_weed_bag",
            price = 3,
            amount = 50,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "rolling_paper",
            price = 2,
            amount = 50,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "weed_nutrition",
            price = 40,
            amount = 50,
            info = {},
            type = "item",
            slot = 4,
        },
        [5] = {
            name = "gift-box",
            price = 45,
            amount = 50,
            info = {},
            type = "item",
            slot = 5,
        },
        [6] = {
            name = "brownie-mix",
            price = 8,
            amount = 50,
            info = {},
            type = "item",
            slot = 6,
        },
        [7] = {
            name = "aluminumcan",
            price = 1,
            amount = 50,
            info = {},
            type = "item",
            slot = 7,
        },
        [8] = {
            name = "drink-mix",
            price = 15,
            amount = 50,
            info = {},
            type = "item",
            slot = 8,
        },
        [9] = {
            name = "weed-grinder",
            price = 30,
            amount = 20,
            info = {},
            type = "item",
            slot = 9,
        },
        [10] = {
            name = "infusion-kit",  
            price = 50,
            amount = 50,
            info = {},
            type = "item",
            slot = 10,
        },
    }
}

