Crafting = {
	Tools = {
		{ ['mechanic_tools'] = { ['iron'] = 60, } },
		{ ['toolbox'] = { ['iron'] = 60, } },
		{ ['ducttape'] = { ['plastic'] = 60, } },
		{ ['paintcan'] = { ['aluminum'] = 60, } },
		{ ['tint_supplies'] = { ['iron'] = 60, } },
		{ ['underglow_controller'] = { ['iron'] = 60, } },
		{ ['cleaningkit'] = { ['rubber'] = 3, } },

				-- Example : Delete me --
		-- Support for multiple items in recipes --
		-- Support for multiple resulting items --
		-- Support to limit items to certain job roles --
		{ ['cleaningkit'] = { ['rubber'] = 4, ["engine2"] = 1, ['plastic'] = 60 },
				["amount"] = 2, ["job"] = { ["mechanic"] = 4, ["tuner"] = 4, } },
				-- Example : Delete me --

	},
	Perform = {
		{ ['turbo'] = { ['steel'] = 250, } },
		{ ['car_armor'] = { ['plastic'] = 250, } },
		{ ['engine1'] = { ['steel'] = 150, } },
		{ ['engine2'] = { ['steel'] = 220, } },
		{ ['engine3'] = { ['steel'] = 280, } },
		{ ['engine4'] = { ['steel'] = 310, } },
		{ ['transmission1'] = { ['steel'] = 150, } },
		{ ['transmission2'] = { ['steel'] = 220, } },
		{ ['transmission3'] = { ['steel'] = 310, } },
		{ ['brakes1'] = { ['steel'] = 150, } },
		{ ['brakes2'] = { ['steel'] = 220, } },
		{ ['brakes3'] = { ['steel'] = 310, } },
		{ ['suspension1'] = { ['steel'] = 150, } },
		{ ['suspension2'] = { ['steel'] = 220, } },
		{ ['suspension3'] = { ['steel'] = 280, } },
		{ ['suspension4'] = { ['steel'] = 310, } },
		{ ['bprooftires'] = { ['rubber'] = 5, } },
		{ ['drifttires'] = { ['rubber'] = 5, } },
		{ ['nos'] = { ['noscan'] = 1, } },
		{ ['noscan'] = { ['steel'] = 210, } },
	},
	Cosmetic = {
		{ ['hood'] = { ['plastic'] = 110, } },
		{ ['roof'] = { ['plastic'] = 110, } },
		{ ['spoiler'] = { ['plastic'] = 200, } },
		{ ['bumper'] = { ['plastic'] = 200, } },
		{ ['skirts'] = { ['plastic'] = 110, } },
		{ ['exhaust'] = { ['iron'] = 110, } },
		{ ['seat'] = { ['plastic'] = 110, } },
		{ ['livery'] = { ['plastic'] = 110, }, },
		{ ['tires'] = { ['rubber'] = 110, } },
		{ ['horn'] = { ['plastic'] = 200, } },
		{ ['internals'] = { ['plastic'] = 150, } },
		{ ['externals'] = { ['plastic'] = 150, } },
		{ ['customplate'] = { ['steel'] = 150, } },
		{ ['headlights'] = { ['plastic'] = 150, } },
		{ ['rims'] = { ['iron'] = 200, } },
		{ ['rollcage'] = { ['steel'] = 110, } },
		{ ['noscolour'] = { ['plastic'] = 110, } },
	},
}

Stores = {
	ToolItems = {
		label = Loc[Config.Lan]["stores"].tools,
		items = {
			{ name = "mechanic_tools", price = 5000, amount = 10, info = {}, type = "item", },
			{ name = "toolbox", price = 5000, amount = 10, info = {}, type = "item", },
			{ name = "ducttape", price = 5000, amount = 100, info = {}, type = "item", },
			{ name = "paintcan", price = 20000, amount = 50, info = {}, type = "item", },
			{ name = "tint_supplies", price = 15000, amount = 50, info = {}, type = "item", },
			{ name = "underglow_controller", price = 15000, amount = 50, info = {}, type = "item", },
			{ name = "cleaningkit", price = 5000, amount = 100, info = {}, type = "item", },
		},
	},
	PerformItems = {
		label = Loc[Config.Lan]["stores"].perform,
		items = {
			{ name = "turbo", price = 30000, amount = 50, info = {}, type = "item", },
			{ name = "engine1", price = 10000, amount = 50, info = {}, type = "item", },
			{ name = "engine2", price = 20000, amount = 50, info = {}, type = "item", },
			{ name = "engine3", price = 30000, amount = 50, info = {}, type = "item", },
			{ name = "engine4", price = 40000, amount = 50, info = {}, type = "item", },
			{ name = "transmission1", price = 10000, amount = 50, info = {}, type = "item", },
			{ name = "transmission2", price = 20000, amount = 50, info = {}, type = "item", },
			{ name = "transmission3", price = 40000, amount = 50, info = {}, type = "item", },
			{ name = "brakes1", price = 20000, amount = 50, info = {}, type = "item", },
			{ name = "brakes2", price = 40000, amount = 50, info = {}, type = "item", },
			{ name = "brakes3", price = 50000, amount = 50, info = {}, type = "item", },
			{ name = "car_armor", price = 55000, amount = 50, info = {}, type = "item", },
			{ name = "suspension1", price = 10000, amount = 50, info = {}, type = "item", },
			{ name = "suspension2", price = 20000, amount = 50, info = {}, type = "item", },
			{ name = "suspension3", price = 30000, amount = 50, info = {}, type = "item", },
			{ name = "suspension4", price = 40000, amount = 50, info = {}, type = "item", },
			{ name = "bprooftires", price = 18000, amount = 50, info = {}, type = "item", },
			{ name = "drifttires", price = 20000, amount = 50, info = {}, type = "item", },
			{ name = "nos", price = 2500, amount = 50, info = {}, type = "item", },
		},
	},
	StoreItems = {
		label = Loc[Config.Lan]["stores"].cosmetic,
		items = {
			{ name = "hood", price = 20000, amount = 50, info = {}, type = "item", },
			{ name = "roof", price = 20000, amount = 50, info = {}, type = "item", },
			{ name = "spoiler", price = 20000, amount = 50, info = {}, type = "item", },
			{ name = "bumper", price = 20000, amount = 50, info = {}, type = "item", },
			{ name = "skirts", price = 20000, amount = 50, info = {}, type = "item", },
			{ name = "exhaust", price = 20000, amount = 50, info = {}, type = "item", },
			{ name = "seat", price = 20000, amount = 50, info = {}, type = "item", },
			{ name = "livery", price = 20000, amount = 50, info = {}, type = "item", },
			{ name = "tires", price = 15000, amount = 50, info = {}, type = "item", },
			{ name = "horn", price = 15000, amount = 50, info = {}, type = "item", },
			{ name = "internals", price = 9000, amount = 50, info = {}, type = "item", },
			{ name = "externals", price = 9000, amount = 50, info = {}, type = "item", },
			{ name = "customplate", price = 9000, amount = 50, info = {}, type = "item", },
			{ name = "headlights", price = 15000, amount = 50, info = {}, type = "item", },
			{ name = "rims", price = 18000, amount = 100, info = {}, type = "item", },
			{ name = "rollcage", price = 5000, amount = 50, info = {}, type = "item", },
			{ name = "noscolour", price = 7000, amount = 50, info = {}, type = "item", },
		},
	},
}

-- No Touch
	-- This is corrective code to help simplify the stores for people removing the slot info
	-- Jim shops doesn't use it but other inventories do
	-- Most people don't even edit the slots, these lines generate the slot info autoamtically
Stores.StoreItems.slots = #Stores.StoreItems.items
for k in pairs(Stores.StoreItems.items) do Stores.StoreItems.items[k].slot = k end
Stores.PerformItems.slots = #Stores.PerformItems.items
for k in pairs(Stores.PerformItems.items) do Stores.PerformItems.items[k].slot = k end
Stores.ToolItems.slots = #Stores.ToolItems.items
for k in pairs(Stores.ToolItems.items) do Stores.ToolItems.items[k].slot = k end