-- Compiled with roblox-ts v3.0.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local exports = {}
exports.createTransformComponents = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "components", "transform").createTransformComponents
exports.createPhysicsComponents = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "components", "physics").createPhysicsComponents
return exports
