-- Compiled with roblox-ts v3.0.0
local function createTransformComponents(w)
	local Position = w:component()
	local Rotation = w:component()
	local Scale = w:component()
	return {
		Position = Position,
		Rotation = Rotation,
		Scale = Scale,
	}
end
return {
	createTransformComponents = createTransformComponents,
}
