import { World } from "@rbxts/jecs";

export function createTransformComponents(w: World) {
	const Position = w.component<Vector3>();
	const Rotation = w.component<CFrame>();
	const Scale = w.component<Vector3>();
	return { Position, Rotation, Scale };
}

export type TransformComponents = ReturnType<typeof createTransformComponents>;
