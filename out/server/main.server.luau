-- Compiled with roblox-ts v3.0.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local world = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "jecs", "src", "jecs").world
local createTransformComponents = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "components", "transform").createTransformComponents
local createPhysicsComponents = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "components", "physics").createPhysicsComponents
local createMovementSystem = TS.import(script, game:GetService("ServerScriptService"), "TS", "systems", "movement").createMovementSystem
local createSpawnerSystem = TS.import(script, game:GetService("ServerScriptService"), "TS", "systems", "spawner").createSpawnerSystem
-- 1. 创建 ECS 世界
local ecsWorld = world()
-- 2. 注册组件
local transform = createTransformComponents(ecsWorld)
local physics = createPhysicsComponents(ecsWorld)
-- 3. 注册系统
local _object = table.clone(transform)
setmetatable(_object, nil)
for _k, _v in physics do
	_object[_k] = _v
end
createMovementSystem(ecsWorld, _object)
local _object_1 = table.clone(transform)
setmetatable(_object_1, nil)
for _k, _v in physics do
	_object_1[_k] = _v
end
createSpawnerSystem(ecsWorld, _object_1)
print("ECS framework initialized!")
