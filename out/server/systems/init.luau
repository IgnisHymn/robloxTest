-- Compiled with roblox-ts v3.0.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local exports = {}
exports.createMovementSystem = TS.import(script, game:GetService("ServerScriptService"), "TS", "systems", "movement").createMovementSystem
exports.createSpawnerSystem = TS.import(script, game:GetService("ServerScriptService"), "TS", "systems", "spawner").createSpawnerSystem
return exports
