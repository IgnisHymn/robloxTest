import { World } from "@rbxts/jecs";
import { RunService } from "@rbxts/services";
import type { TransformComponents } from "shared/components/transform";
import type { PhysicsComponents } from "shared/components/physics";

type MovementComponents = Pick<TransformComponents, "Position"> &
	Pick<PhysicsComponents, "Velocity" | "Gravity">;

export function createMovementSystem(w: World, components: MovementComponents) {
	const { Position, Velocity, Gravity } = components;

	RunService.Heartbeat.Connect((dt: number) => {
		// 含重力的实体：重力影响速度，速度影响位置
		for (const [id, pos, vel, grav] of w.query(Position, Velocity, Gravity)) {
			const newVel = vel.add(new Vector3(0, -grav * dt, 0));
			w.set(id, Velocity, newVel);

			const newPos = pos.add(newVel.mul(dt));
			w.set(id, Position, newPos);
		}

		// 不含重力的实体：仅速度影响位置
		for (const [id, pos, vel] of w.query(Position, Velocity).without(Gravity)) {
			const newPos = pos.add(vel.mul(dt));
			w.set(id, Position, newPos);
		}
	});
}
