import { World } from "@rbxts/jecs";

export function createPhysicsComponents(w: World) {
	const Velocity = w.component<Vector3>();
	const Gravity = w.component<number>();
	const IsPlayer = w.component(); // 无数据的 Tag 型组件
	return { Velocity, Gravity, IsPlayer };
}

export type PhysicsComponents = ReturnType<typeof createPhysicsComponents>;
