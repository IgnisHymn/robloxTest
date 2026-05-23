-- Compiled with roblox-ts v3.0.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local RunService = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService
local function createMovementSystem(w, components)
	local _binding = components
	local Position = _binding.Position
	local Velocity = _binding.Velocity
	local Gravity = _binding.Gravity
	RunService.Heartbeat:Connect(function(dt)
		-- 含重力的实体：重力影响速度，速度影响位置
		for id, pos, vel, grav in w:query(Position, Velocity, Gravity) do
			local _vector3 = Vector3.new(0, -grav * dt, 0)
			local newVel = vel + _vector3
			w:set(id, Velocity, newVel)
			local _dt = dt
			local _arg0 = newVel * _dt
			local newPos = pos + _arg0
			w:set(id, Position, newPos)
		end
		-- 不含重力的实体：仅速度影响位置
		for id, pos, vel in w:query(Position, Velocity):without(Gravity) do
			local _dt = dt
			local _arg0 = vel * _dt
			local newPos = pos + _arg0
			w:set(id, Position, newPos)
		end
	end)
end
return {
	createMovementSystem = createMovementSystem,
}
