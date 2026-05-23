-- Compiled with roblox-ts v3.0.0
local function createPhysicsComponents(w)
	local Velocity = w:component()
	local Gravity = w:component()
	local IsPlayer = w:component()
	return {
		Velocity = Velocity,
		Gravity = Gravity,
		IsPlayer = IsPlayer,
	}
end
return {
	createPhysicsComponents = createPhysicsComponents,
}
