import { world } from "@rbxts/jecs";
import { createTransformComponents } from "shared/components/transform";
import { createPhysicsComponents } from "shared/components/physics";
import { createMovementSystem } from "server/systems/movement";
import { createSpawnerSystem } from "server/systems/spawner";

// 1. 创建 ECS 世界
const ecsWorld = world();

// 2. 注册组件
const transform = createTransformComponents(ecsWorld);
const physics = createPhysicsComponents(ecsWorld);

// 3. 注册系统
createMovementSystem(ecsWorld, { ...transform, ...physics });
createSpawnerSystem(ecsWorld, { ...transform, ...physics });

print("ECS framework initialized!");
