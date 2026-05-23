import { World } from "@rbxts/jecs";
import { Players } from "@rbxts/services";
import type { TransformComponents } from "shared/components/transform";
import type { PhysicsComponents } from "shared/components/physics";

type SpawnComponents = TransformComponents & PhysicsComponents;

export function createSpawnerSystem(w: World, components: SpawnComponents) {
	const { Position, Rotation, Scale, Velocity, Gravity, IsPlayer } = components;

	// 生成一个测试玩家实体
	function spawnPlayer() {
		const player = w.entity();
		w.set(player, Position, new Vector3(0, 10, 0));
		w.set(player, Rotation, CFrame.identity);
		w.set(player, Scale, new Vector3(1, 1, 1));
		w.set(player, Velocity, new Vector3(0, 0, 0));
		w.set(player, Gravity, 9.81);
		w.add(player, IsPlayer);
		return player;
	}

	// 生成一批静态方块
	function spawnCubes(count: number) {
		for (let i = 0; i < count; i++) {
			const cube = w.entity();
			w.set(cube, Position, new Vector3(math.random(-20, 20), 1, math.random(-20, 20)));
			w.set(cube, Rotation, CFrame.identity);
			w.set(cube, Scale, new Vector3(1, 1, 1));
		}
	}

	// 监听玩家加入
	Players.PlayerAdded.Connect(() => {
		const p = spawnPlayer();
		print(`Player entity created: ${p}`);
	});

	// 启动时生成测试场景
	spawnPlayer();
	spawnCubes(10);
}
