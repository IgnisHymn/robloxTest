-- Compiled with roblox-ts v3.0.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Players = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local function createSpawnerSystem(w, components)
	local _binding = components
	local Position = _binding.Position
	local Rotation = _binding.Rotation
	local Scale = _binding.Scale
	local Velocity = _binding.Velocity
	local Gravity = _binding.Gravity
	local IsPlayer = _binding.IsPlayer
	-- 生成一个测试玩家实体
	local function spawnPlayer()
		local player = w:entity()
		w:set(player, Position, Vector3.new(0, 10, 0))
		w:set(player, Rotation, CFrame.identity)
		w:set(player, Scale, Vector3.new(1, 1, 1))
		w:set(player, Velocity, Vector3.new(0, 0, 0))
		w:set(player, Gravity, 9.81)
		w:add(player, IsPlayer)
		return player
	end
	-- 生成一批静态方块
	local function spawnCubes(count)
		do
			local i = 0
			local _shouldIncrement = false
			while true do
				if _shouldIncrement then
					i += 1
				else
					_shouldIncrement = true
				end
				if not (i < count) then
					break
				end
				local cube = w:entity()
				w:set(cube, Position, Vector3.new(math.random(-20, 20), 1, math.random(-20, 20)))
				w:set(cube, Rotation, CFrame.identity)
				w:set(cube, Scale, Vector3.new(1, 1, 1))
			end
		end
	end
	-- 监听玩家加入
	Players.PlayerAdded:Connect(function()
		local p = spawnPlayer()
		print(`Player entity created: {p}`)
	end)
	-- 启动时生成测试场景
	spawnPlayer()
	spawnCubes(10)
end
return {
	createSpawnerSystem = createSpawnerSystem,
}
