Config = Config or {}

Config.ActivePayments = {}

Config.Job = 'noodle'

Config.Vehicle = 'speedo'

Config.UseBlips = true

Config.PolyZone = false

Config.ExtractItem = 'sushimaking'

Config.RiceItem = 'sushirice'

Config.PanItem = 'noodlespan'

Config.AvocadoItem = 'avocado'

Config.NormalSushiItem = 'regularsushi'

Config.ChopSticksItem = 'chopsticks'

Config.SalmonItem = 'salmonfish'

Config.FishSushiItem = 'fishsushi'

Config.TeriyakiItem = 'teriyakisauce'

Config.DirtyPanItem = 'dirtypan'

Config.InsideOutSushiItem = 'insideoutsushi'

Config.SpicyMayoItem = 'spicymayo'

Config.SandwichSushiItem = 'sandwichsushi'

Config.SeaWeedItem = 'sushiseaweed'

Config.RawNoodlesItem = 'rawnoodles'

Config.BowlItem = 'noodlesbowl'

Config.NoodlesItem = 'regularnoodles'

Config.RamenItem = 'ramen'

Config.EggRollItem = 'egggrollsushi'

Config.EggRollMeatItem = 'eggrollmeat'

Config.Phone = 'qb-phone'

Config.UseSounds = true -- Want To Use Sounds When Eating?

Config.TreyLocations = {
    [1] = {
        ['coords'] = vector3(-1237.84, -271.5895, 37.771167),
        ['heading'] = 25.571182,
        ['minZ'] = 36.771167,
        ['maxZ'] = 38.771167,
        ['poly1'] = 0.4,
        ['poly2'] = 0.6,
    }, 
    [2] = {
        ['coords'] = vector3(-1236.089, -270.6866, 38.380416),
        ['heading'] = 214.02615,
        ['minZ'] = 37.380416,
        ['maxZ'] = 39.380416,
        ['poly1'] = 0.4,
        ['poly2'] = 0.6,
    }, 
    [3] = {
        ['coords'] = vector3(-1233.471, -280.5245, 37.771106),
        ['heading'] = 205.72457,
        ['minZ'] = 36.771106,
        ['maxZ'] = 38.771106,
        ['poly1'] = 1.0,
        ['poly2'] = 1.5,
    }, 
    [4] = {
        ['coords'] = vector3(-1234.752, -278.2642, 37.771335),
        ['heading'] = 206.07133,
        ['minZ'] = 36.771335,
        ['maxZ'] = 38.771335,
        ['poly1'] = 1.0,
        ['poly2'] = 1.5,
    }, 
    [5] = {
        ['coords'] = vector3(-1229.997, -278.4391, 37.771251),
        ['heading'] = 27.825201,
        ['minZ'] = 36.771251,
        ['maxZ'] = 38.771251,
        ['poly1'] = 1.0,
        ['poly2'] = 1.5,
    }, 
    [6] = {
        ['coords'] = vector3(-1231.217, -276.4673, 37.80447),
        ['heading'] = 25.425865,
        ['minZ'] = 36.80447,
        ['maxZ'] = 38.80447,
        ['poly1'] = 1.0,
        ['poly2'] = 1.5,
    }, 
}

Config.BlipLocation = {
    {title="Noodle", colour=2, id=628, x = -1234.131, y = -275.5355, z = 37.771045},  -- Noodle
}

--// Shop Items You Can Add As Many As You Like \\--=
Config.Items = {
    label = "Noodle Shop",
    slots = 5,
    items = {
        [1] = {
            name = "avocado",
            price = 5,
            amount = 100,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "ramen",
            price = 5,
            amount = 100,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "spicymayo",
            price = 5,
            amount = 100,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "sushimaking",
            price = 5,
            amount = 100,
            info = {},
            type = "item",
            slot = 4,
        },
        [5] = {
            name = "sushirice",
            price = 5,
            amount = 100,
            info = {},
            type = "item",
            slot = 5,
        },
        [6] = {
            name = "teriyakisauce",
            price = 5,
            amount = 100,
            info = {},
            type = "item",
            slot = 6,
        },
        [7] = {
            name = "chopsticks",
            price = 5,
            amount = 100,
            info = {},
            type = "item",
            slot = 7,
        },
        [8] = {
            name = "salmonfish",
            price = 5,
            amount = 100,
            info = {},
            type = "item",
            slot = 8,
        },
        [9] = {
            name = "sushiseaweed",
            price = 5,
            amount = 100,
            info = {},
            type = "item",
            slot = 9,
        },
        [10] = {
            name = "noodlesbowl",
            price = 5,
            amount = 100,
            info = {},
            type = "item",
            slot = 10,
        },
        [11] = {
            name = "rawnoodles",
            price = 5,
            amount = 100,
            info = {},
            type = "item",
            slot = 11,
        },
        [12] = {
            name = "eggrollmeat",
            price = 5,
            amount = 100,
            info = {},
            type = "item",
            slot = 12,
        },
        [13] = {
            name = "noodlespan",
            price = 5,
            amount = 100,
            info = {},
            type = "item",
            slot = 13,
        },
        [14] = {
            name = "kurkakola",
            price = 5,
            amount = 100,
            info = {},
            type = "item",
            slot = 14,
        },
    }
}





--[[ Cleaned: 2023/03/02 16:12 ]]--
