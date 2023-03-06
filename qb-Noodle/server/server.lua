local QBCore = exports['qb-core']:GetCoreObject()

--// Check Items For Making Normal Sushi \\--
QBCore.Functions.CreateCallback('qb-Noodles:HasItemProcessNormalSushi', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local extract = Player.Functions.GetItemByName(Config.ExtractItem)
    local rice = Player.Functions.GetItemByName(Config.RiceItem)
    local avocado = Player.Functions.GetItemByName(Config.AvocadoItem)
    local seaweed = Player.Functions.GetItemByName(Config.SeaWeedItem)
    if avocado ~= nil and rice ~= nil and extract ~= nil and seaweed ~= nil then
        cb(true)
    else
        cb(false)
	end
end)

--// Check Items For Making Fish Sushi \\--
QBCore.Functions.CreateCallback('qb-Noodles:HasItemProcessFishSushi', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local extract = Player.Functions.GetItemByName(Config.ExtractItem)
    local rice = Player.Functions.GetItemByName(Config.RiceItem)
    local avocado = Player.Functions.GetItemByName(Config.AvocadoItem)
    local salmonfish = Player.Functions.GetItemByName(Config.SalmonItem)
    local teriyakisauce = Player.Functions.GetItemByName(Config.TeriyakiItem)
    local seaweed = Player.Functions.GetItemByName(Config.SeaWeedItem)
    if avocado ~= nil and rice ~= nil and extract ~= nil and salmonfish ~= nil and teriyakisauce ~= nil and seaweed ~= nil then
        cb(true)
    else
        cb(false)
	end
end)

--// Check Items For Making Inside Out Sushi \\--
QBCore.Functions.CreateCallback('qb-Noodles:HasItemProcessInsideOutSushi', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local extract = Player.Functions.GetItemByName(Config.ExtractItem)
    local rice = Player.Functions.GetItemByName(Config.RiceItem)
    local avocado = Player.Functions.GetItemByName(Config.AvocadoItem)
    local spicymayosauce = Player.Functions.GetItemByName(Config.SpicyMayoItem)
    local seaweed = Player.Functions.GetItemByName(Config.SeaWeedItem)
    if avocado ~= nil and rice ~= nil and extract ~= nil and spicymayosauce ~= nil and seaweed ~= nil then
        cb(true)
    else
        cb(false)
	end
end)

--// Check Items For Making Sandwich Sushi \\--
QBCore.Functions.CreateCallback('qb-Noodles:HasItemProcessSandwichSushi', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local extract = Player.Functions.GetItemByName(Config.ExtractItem)
    local rice = Player.Functions.GetItemByName(Config.RiceItem)
    local avocado = Player.Functions.GetItemByName(Config.AvocadoItem)
    local seaweed = Player.Functions.GetItemByName(Config.SeaWeedItem)
    if avocado ~= nil and rice ~= nil and extract ~= nil and seaweed ~= nil then
        cb(true)
    else
        cb(false)
	end
end)

--// Check Items For Making Egg Roll \\--
QBCore.Functions.CreateCallback('qb-Noodles:HasItemProcessEggRoll', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local eggrollmeat = Player.Functions.GetItemByName(Config.EggRollMeatItem)
    local pan = Player.Functions.GetItemByName(Config.PanItem)
    local spicymayo = Player.Functions.GetItemByName(Config.SpicyMayoItem)
    if spicymayo ~= nil and pan ~= nil and eggrollmeat ~= nil then
        cb(true)
    else
        cb(false)
	end
end)

--// Check Items For Making Regular Noodles\\--
QBCore.Functions.CreateCallback('qb-Noodles:HasItemProcessRegularNoodles', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local rawnoodles = Player.Functions.GetItemByName(Config.RawNoodlesItem)
    local noodlesbowl = Player.Functions.GetItemByName(Config.BowlItem)
    local pan = Player.Functions.GetItemByName(Config.PanItem)
    if pan ~= nil and noodlesbowl ~= nil and rawnoodles ~= nil then
        cb(true)
    else
        cb(false)
	end
end)

QBCore.Functions.CreateUseableItem("regularsushi", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent("qb-Noodles:Client:NormalSushi", src)                                                              				
end)

QBCore.Functions.CreateUseableItem("fishsushi", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent("qb-Noodles:Client:FishSushi", src)                                                              				
end)

QBCore.Functions.CreateUseableItem("insideoutsushi", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent("qb-Noodles:Client:InsideOutSushi", src)                                                              				
end)

QBCore.Functions.CreateUseableItem("sandwichsushi", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent("qb-Noodles:Client:SandwichSushi", src)                                                              				
end)

QBCore.Functions.CreateUseableItem("regularnoodles", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent("qb-Noodles:Client:RegularNoodles", src)                                                              				
end)

QBCore.Functions.CreateUseableItem("ramen", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent("qb-Noodles:Client:Ramen", src)                                                              				
end)

QBCore.Functions.CreateUseableItem("egggrollsushi", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent("qb-Noodles:Client:EggRoll", src)                                                              				
end)

--// Check Items For Eating Normal Sushi \\--
QBCore.Functions.CreateCallback('qb-Noodles:HasItemEatNormalSushi', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local normalsushi = Player.Functions.GetItemByName(Config.NormalSushiItem)
    local chopsticks = Player.Functions.GetItemByName(Config.ChopSticksItem)
    if normalsushi ~= nil and chopsticks ~= nil then
        cb(true)
    else
        cb(false)
	end
end)

--// Check Items For Eating Fish Sushi \\--
QBCore.Functions.CreateCallback('qb-Noodles:HasItemEatFishSushi', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local fishsushi = Player.Functions.GetItemByName(Config.FishSushiItem)
    local chopsticks = Player.Functions.GetItemByName(Config.ChopSticksItem)
    if fishsushi ~= nil and chopsticks ~= nil then
        cb(true)
    else
        cb(false)
	end
end)

--// Check Items For Eating Inside Out Sushi \\--
QBCore.Functions.CreateCallback('qb-Noodles:HasItemEatInsideOutSushi', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local insideoutsushi = Player.Functions.GetItemByName(Config.InsideOutSushiItem)
    local chopsticks = Player.Functions.GetItemByName(Config.ChopSticksItem)
    if insideoutsushi ~= nil and chopsticks ~= nil then
        cb(true)
    else
        cb(false)
	end
end)

--// Check Items For Eating Sandwich Sushi \\--
QBCore.Functions.CreateCallback('qb-Noodles:HasItemEatSandwichSushi', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local sandwichsushi = Player.Functions.GetItemByName(Config.SandwichSushiItem)
    local chopsticks = Player.Functions.GetItemByName(Config.ChopSticksItem)
    if sandwichsushi ~= nil and chopsticks ~= nil then
        cb(true)
    else
        cb(false)
	end
end)

--// Check Items For Eating Regular Noodles \\--
QBCore.Functions.CreateCallback('qb-Noodles:HasItemEatRegularNoodles', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local regularnoodles = Player.Functions.GetItemByName(Config.NoodlesItem)
    local chopsticks = Player.Functions.GetItemByName(Config.ChopSticksItem)
    if regularnoodles ~= nil and chopsticks ~= nil then
        cb(true)
    else
        cb(false)
	end
end)

--// Check Items For Eating Egg Roll \\--
QBCore.Functions.CreateCallback('qb-Noodles:HasItemEatEggRoll', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local eggroll = Player.Functions.GetItemByName(Config.EggRollItem)
    local chopsticks = Player.Functions.GetItemByName(Config.ChopSticksItem)
    if eggroll ~= nil and chopsticks ~= nil then
        cb(true)
    else
        cb(false)
	end
end)

--// Check Items For Washing Dirty Pan \\--
QBCore.Functions.CreateCallback('qb-Noodles:HasItemWashDirtyPan', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local dirtypan = Player.Functions.GetItemByName(Config.DirtyPanItem)
    if dirtypan ~= nil then
        cb(true)
    else
        cb(false)
	end
end)

--// Add Item Normal Sushi \\--
RegisterServerEvent('qb-Noodles:AddNormalSushi')
AddEventHandler('qb-Noodles:AddNormalSushi', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	Player.Functions.AddItem(Config.NormalSushiItem, math.random(1,2))
	TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Config.NormalSushiItem], "add")
	TriggerClientEvent('QBCore:Notify', src, 'Regular Sushi Successfully Made !', "success")                                                                         				
end)

--// Add Item Egg Roll \\--
RegisterServerEvent('qb-Noodles:AddEggRoll')
AddEventHandler('qb-Noodles:AddEggRoll', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	Player.Functions.AddItem(Config.EggRollItem, math.random(1,2))
    Player.Functions.AddItem(Config.DirtyPanItem, 1)
    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Config.DirtyPanItem], "add")
	TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Config.EggRollItem], "add")
	TriggerClientEvent('QBCore:Notify', src, 'Egg Roll Successfully Made !', "success")                                                                         				
end)

--// Add Item Sandwich Sushi \\--
RegisterServerEvent('qb-Noodles:AddSandwichSushi')
AddEventHandler('qb-Noodles:AddSandwichSushi', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	Player.Functions.AddItem(Config.SandwichSushiItem, math.random(1,2))
	TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Config.SandwichSushiItem], "add")
	TriggerClientEvent('QBCore:Notify', src, 'Sandwich Sushi Successfully Made !', "success")                                                                         				
end)

--// Add Item Inside Out Sushi \\--
RegisterServerEvent('qb-Noodles:AddInsideOutSushi')
AddEventHandler('qb-Noodles:AddInsideOutSushi', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	Player.Functions.AddItem(Config.InsideOutSushiItem, math.random(1,2))
	TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Config.InsideOutSushiItem], "add")
	TriggerClientEvent('QBCore:Notify', src, 'Inside Out Sushi Successfully Made !', "success")                                                                         				
end)

--// Add Item Fish Sushi \\--
RegisterServerEvent('qb-Noodles:AddFishSushi')
AddEventHandler('qb-Noodles:AddFishSushi', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	Player.Functions.AddItem(Config.FishSushiItem, math.random(1,2))
	TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Config.FishSushiItem], "add")
	TriggerClientEvent('QBCore:Notify', src, 'Fish Sushi Successfully Made !', "success")                                                                         				
end)

--// Add Item Regular Noodles \\--
RegisterServerEvent('qb-Noodles:AddRegularNoodles')
AddEventHandler('qb-Noodles:AddRegularNoodles', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	Player.Functions.AddItem(Config.NoodlesItem, math.random(1,2))
    Player.Functions.AddItem(Config.DirtyPanItem, 1)
    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Config.DirtyPanItem], "add")
	TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Config.NoodlesItem], "add")
	TriggerClientEvent('QBCore:Notify', src, 'Noodles Successfully Made !', "success")                                                                         				
end)

--// Remove Item Normal Sushi \\--
RegisterServerEvent('qb-Noodles:RemoveNormalSushi')
AddEventHandler('qb-Noodles:RemoveNormalSushi', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	Player.Functions.RemoveItem(Config.AvocadoItem, 1)
    Player.Functions.RemoveItem(Config.ExtractItem, 1)
    Player.Functions.RemoveItem(Config.RiceItem, 1)
    Player.Functions.RemoveItem(Config.SeaWeedItem, 1)
	TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Config.AvocadoItem], "remove")
    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Config.ExtractItem], "remove")
    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Config.RiceItem], "remove")
    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Config.SeaWeedItem], "remove")
end)

--// Remove Item Fish Sushi \\--
RegisterServerEvent('qb-Noodles:RemoveFishSushi')
AddEventHandler('qb-Noodles:RemoveFishSushi', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	Player.Functions.RemoveItem(Config.AvocadoItem, 1)
    Player.Functions.RemoveItem(Config.ExtractItem, 1)
    Player.Functions.RemoveItem(Config.RiceItem, 1)
    Player.Functions.RemoveItem(Config.SalmonItem, 1)
    Player.Functions.RemoveItem(Config.TeriyakiItem, 1)
    Player.Functions.RemoveItem(Config.SeaWeedItem, 1)
    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Config.SeaWeedItem], "remove")
    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Config.TeriyakiItem], "remove")
    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Config.SalmonItem], "remove")
	TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Config.AvocadoItem], "remove")
    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Config.ExtractItem], "remove")
    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Config.RiceItem], "remove")
end)

--// Remove Item Sandwich Sushi \\--
RegisterServerEvent('qb-Noodles:RemoveSandwichSushi')
AddEventHandler('qb-Noodles:RemoveSandwichSushi', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	Player.Functions.RemoveItem(Config.AvocadoItem, 1)
    Player.Functions.RemoveItem(Config.ExtractItem, 1)
    Player.Functions.RemoveItem(Config.RiceItem, 1)
    Player.Functions.RemoveItem(Config.SeaWeedItem, 1)
    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Config.SeaWeedItem], "remove")
	TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Config.AvocadoItem], "remove")
    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Config.ExtractItem], "remove")
    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Config.RiceItem], "remove")
end)

--// Remove Item Inside Out Sushi \\--
RegisterServerEvent('qb-Noodles:RemoveInsideOutSushi')
AddEventHandler('qb-Noodles:RemoveInsideOutSushi', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	Player.Functions.RemoveItem(Config.AvocadoItem, 1)
    Player.Functions.RemoveItem(Config.ExtractItem, 1)
    Player.Functions.RemoveItem(Config.RiceItem, 1)
    Player.Functions.RemoveItem(Config.SalmonItem, 1)
    Player.Functions.RemoveItem(Config.SpicyMayoItem, 1)
    Player.Functions.RemoveItem(Config.SeaWeedItem, 1)
    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Config.SeaWeedItem], "remove")
    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Config.SpicyMayoItem], "remove")
    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Config.SalmonItem], "remove")
	TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Config.AvocadoItem], "remove")
    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Config.ExtractItem], "remove")
    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Config.RiceItem], "remove")
end)

--// Remove Item Regular Noodles \\--
RegisterServerEvent('qb-Noodles:RemoveRegularNoodles')
AddEventHandler('qb-Noodles:RemoveRegularNoodles', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem(Config.BowlItem, 1)
    Player.Functions.RemoveItem(Config.RawNoodlesItem, 1)
    Player.Functions.RemoveItem(Config.PanItem, 1)
	TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Config.BowlItem], "remove")
    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Config.PanItem], "remove")
    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Config.RawNoodlesItem], "remove")
end)

--// Remove Item Egg Roll \\--
RegisterServerEvent('qb-Noodles:RemoveEggRoll')
AddEventHandler('qb-Noodles:RemoveEggRoll', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem(Config.EggRollMeatItem, 1)
    Player.Functions.RemoveItem(Config.SpicyMayoItem, 1)
    Player.Functions.RemoveItem(Config.PanItem, 1)
	TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Config.EggRollMeatItem], "remove")
    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Config.PanItem], "remove")
    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Config.SpicyMayoItem], "remove")
end)

--[[ Cleaned: 2023/03/02 16:12 ]]--
