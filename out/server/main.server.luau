-- Compiled with roblox-ts v3.0.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local world = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "jecs", "src", "jecs").world
local RunService = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService
-- 创建 ECS World 实例（使用工厂函数 world()，而非 new World()）
local ecsWorld = world()
local Position = ecsWorld:component()
local Velocity = ecsWorld:component()
local player = ecsWorld:entity()
ecsWorld:set(player, Position, Vector3.new(0, 0, 0))
ecsWorld:set(player, Velocity, Vector3.new(1, 0, 0))
RunService.Heartbeat:Connect(function(dt)
	for id, pos, vel in ecsWorld:query(Position, Velocity) do
		local _dt = dt
		local _arg0 = vel * _dt
		local newPos = pos + _arg0
		ecsWorld:set(id, Position, newPos)
		print(`Player moved to: {newPos.X}, {newPos.Y}, {newPos.Z}`)
	end
end)
