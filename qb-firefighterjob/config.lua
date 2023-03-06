Config = {}

Config.Locations = {
    ["duty"] = {
       -- [1] = vector3(1115.75, 3588.52, 33.31), -- sandy
        [2] = vector3(-653.96, -87.7, 38.79), -- FS7
    },
    ["vehicle"] = {
       -- [1] = vector4(1143.41, 3610.29, 33.3, 270.18), -- sandy
      --  [2] = vector4(-643.47, -111.69, 37.93, 111.83), -- FS7
    },
    ["helicopter"] = {
       -- [1] = vector4(1165.41, 3597.81, 35.43, 52.21), -- sandy
       -- [2] = vector4(1200.75, -1503.18, 34.69, 177.11), -- FS7
    },
    ["armory"] = {
       -- [1] = vector3(1111.96, 3597.86, 33.31), -- sandy
        [2] = vector3(-624.89, -111.13, 45.5), -- FS7
    },
    ["stash"] = {
       -- [1] = vector3(1111.68, 3602.94, 33.31), -- sandy
        [2] = vector3(-618.12, -95.12, 38.15), -- FS7
    },
    ["stations"] = {
        [2] = {label = "Fire Station 7", coords = vector4(-653.96, -87.7, 38.79, 5.72)}
    }
}

Config.AuthorizedVehicles = {
	-- Grade 0
	[0] = {
        ["usa8"] = "Ambulance",
		["usa3"] = "Fire Truck",
		["usa4"] = "Fire Truck 2",  
        ["usa5"] = "Ambulance 2", 
        ["usa7"] = "Fire Truck 3", 

        
	},
	-- Grade 1
	[1] = {
        ["usa8"] = "Ambulance",
		["usa3"] = "Fire Truck",
		["usa4"] = "Fire Truck 2",  
        ["usa5"] = "Ambulance 2", 
        ["usa7"] = "Fire Truck 3", 
	},
	-- Grade 2
	[2] = {
        ["usa8"] = "Ambulance",
		["usa3"] = "Fire Truck",
		["usa4"] = "Fire Truck 2",  
        ["usa5"] = "Ambulance 2", 
        ["usa7"] = "Fire Truck 3", 
	},
	-- Grade 3
	[3] = {
        ["usa8"] = "Ambulance",
		["usa3"] = "Fire Truck",
		["usa4"] = "Fire Truck 2",  
        ["usa5"] = "Ambulance 2", 
        ["usa7"] = "Fire Truck 3", 
	},
	-- Grade 4
	[4] = {
        ["usa8"] = "Ambulance",
		["usa3"] = "Fire Truck",
		["usa4"] = "Fire Truck 2",  
        ["usa5"] = "Ambulance 2", 
        ["usa7"] = "Fire Truck 3", 
	}
}

Config.CarItems = {
    [1] = {
        name = "weapon_fireextinguisher",
        amount = 4,
        info = {},
        type = "item",
        slot = 1,
    },
    [2] = {
        name = "diving_gear",
        amount = 2,
        info = {},
        type = "item",
        slot = 2,
    },
    [3] = {
        name = "weapon_flare",
        amount = 6,
        info = {},
        type = "item",
        slot = 3,
    },
    [4] = {
        name = "tire",
        amount = 2,
        info = {},
        type = "item",
        slot = 4,
    },
    [5] = {
        name = "radio",
        amount = 2,
        info = {},
        type = "item",
        slot = 5,
    }, 
    [6] = {
        name = "bandage",
        amount = 8,
        info = {},
        type = "item",
        slot = 6,
    },
    [7] = {
        name = "weapon_flashlight",
        amount = 1,
        info = {},
        type = "item",
        slot = 7,
    },     
}

Config.Helicopter = "polmav"

Config.Items = {
    label = "Firefighter Armory",
    slots = 30,
    items = {
        [1] = {
            name = "radio",
            price = 100,
            amount = 1,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "bandage",
            price = 10,
            amount = 50,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "firstaid",
            price = 50,
            amount = 50,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "weapon_flashlight",
            price = 300,
            amount = 1,
            info = {},
            type = "item",
            slot = 4,
        },
        [5] = {
            name = "weapon_fireextinguisher",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 5,
        },
        [6] = {
            name = "ifaks",
            price = 300,
            amount = 50,
            info = {},
            type = "item",
            slot = 7,
        },
        [7] = {
            name = "weapon_hatchet",
            price = 300,
            amount = 1,
            info = {},
            type = "item",
            slot = 8,
        },
        [8] = {
            name = "mala_roupas",
            price = 100,
            amount = 1,
            info = {},
            type = "item",
            slot = 9,
        },
    }
}

Config.VehicleSettings = {
    ["car1"] = { -- Model name
        ["extras"] = {
            ["1"] = false, -- on/off
            ["2"] = true,
            ["3"] = true,
            ["4"] = true,
            ["5"] = true,
            ["6"] = true,
            ["7"] = true,
            ["8"] = true,
            ["9"] = true,
            ["10"] = true,
            ["11"] = true,
            ["12"] = true,
        }
    },
    ["car2"] = {
        ["extras"] = {
            ["1"] = false,
            ["2"] = true,
            ["3"] = true,
            ["4"] = true,
            ["5"] = true,
            ["6"] = true,
            ["7"] = true,
            ["8"] = true,
            ["9"] = true,
            ["10"] = true,
            ["11"] = true,
            ["12"] = true,
        }
    }
}
