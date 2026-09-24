# 🔥 PROJECT LAVACORE — POTATO ASCENSION v5.2 🥔📈

LAVA-CORE is a client-side Roblox visual/performance optimization script designed to reduce the amount of expensive visual effects your device has to render.

## WHAT IT DOES: 📊

- 📊 **Live FPS counter** — displays your current FPS on-screen.
- 🖼️ **Texture distance culling** — hides far-away decals/textures and restores them when you're close.
- 💥 **VFX culling** — disables particles, trails, beams, smoke, fire, sparkles, highlights, and similar effects.
- 💡 **Lighting optimization** — disables dynamic lights and global shadows.
- 🌫️ **Atmosphere/post-processing reduction** — reduces visual effects such as atmosphere, clouds, and post effects.
- 🌊 **Terrain/water optimization** — reduces water effects and terrain decoration.
- 🎯 **Named VFX culling** — targets effects such as auras, explosions, magic, rifts, quest effects, and reward effects.
- 🖥️ **GUI/camera VFX culling** — removes certain cosmetic visual effects from UI and camera containers.
- 🔄 **Batched processing** — spreads optimization work across frames instead of processing everything at once.
- 🥔 **Progressive visual processing** — queues visual objects and processes them gradually to reduce sudden processing spikes when large amounts of visual content appear.
- 👀 **Continuous enforcement** — detects newly-created effects and keeps the optimization active during gameplay.

## 🧩 SOFT CHUNK / PROGRESSIVE PROCESSING

LAVA-CORE v5.2 introduces a progressive visual-processing system.

Instead of immediately processing a huge number of newly-created visual objects at once, LAVA-CORE places them into a queue and handles them in smaller batches.

This can help reduce sudden client-side processing spikes when a game creates large amounts of cosmetic VFX or other visual objects at the same time.

LAVA-CORE does **not** control Roblox's internal world streaming system and does not change the game's actual map loading or normal render distance.

## WHAT IT DOESN'T DO: ⚠️

LAVA-CORE does NOT magically create extra hardware performance.

It reduces visual workload so weaker devices may have more rendering headroom.

Actual FPS improvements depend on the game, device, graphics settings, and what is causing the slowdown.

LAVA-CORE also does not guarantee that every game will become faster.

## ⚠️ COMPATIBILITY

Because LAVA-CORE changes client-side visual properties, some games may look different or may not benefit much from it.

Some games may also recreate effects, so LAVA-CORE continuously checks for them.

The progressive processing system is designed to spread visual processing across time, but it cannot control Roblox's own internal rendering or streaming behavior.

## 🚀 USAGE

```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/Noodlesdoodlescuddles/LAVA-CORE/main/loader.lua"))()


📦 PROJECT INFO
PROJECT: LAVA-CORE
VERSION: v5.2
CREATOR: Noodlesdoodlescuddles
GOAL
Less visual workload → more rendering headroom → smoother gameplay where the device/game allows it.
LAVA-CORE is a client-side optimization project. Results are not guaranteed and vary by game and device.
⚠️ Credits
LavaCore was created by Noodlesdoodlescuddles.
Do not claim LavaCore as your own, remove the original credits, or reupload it without proper credit.
Unauthorized reposts or stolen copies may be reported and requested to be removed.
If you share LavaCore, keep the original creator credit and link to this repository.
