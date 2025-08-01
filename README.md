# SciFi-Survival-FPS

A sci¬fi survival FPS built in the [Godot Engine](https://godotengine.org/). This project is an educational prototype showcasing basic first‑person shooter mechanics, including movement, weapons, enemy AI, environment, HUD, and wave‑based game logic.

## Features

- **First‑person movement** – walk, run, jump and crouch using a CharacterBody3D.
- **Weapons** – modular weapon system with two sci‑fi weapons (laser rifle and plasma pistol), each with its own damage, fire rate, magazine size and reload time.
- **Enemy AI** – a simple enemy that tracks and moves towards the player, dealing damage on contact and handling death.
- **Arena environment** – a small test level with placeholder geometry and obstacles.
- **HUD** – health, ammo, and score indicators using Godot UI nodes.
- **Wave management** – a GameManager that spawns waves of enemies and determines win/lose conditions.

## Getting Started

1. **Install Godot Engine** – download Godot 4.x from the [official site](https://godotengine.org/download).
2. **Clone the repository**:

   ```bash
   git clone https://github.com/Markusmj2256/SciFi-Survival-FPS.git
   ```
3. **Open the project** – launch Godot, choose *Import Project*, and select the `project.godot` file from this repository.
4. **Run** – press the ▶ button in the editor to run the game.

## Controls

| Action | Key / Mouse |
|-------|-------------|
| Move | WASD |
| Run | Shift |
| Jump | Space |
| Crouch | Ctrl |
| Fire | Left Mouse |
| Reload | R |
| Switch weapon | 1 / 2 keys |

## Project Structure

```
/project.godot     – Godot project configuration
/scripts/          – GDScript files (player, weapons, enemies, game manager, HUD)
/scenes/           – Scene files (.tscn) for player, enemies, and levels (to be added)
/assets/           – 3D models, textures, audio (placeholders)
```

## Contributing

Contributions are welcome! See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines. Please make pull requests from feature branches and include clear commit messages.

## License

This project is licensed under the MIT License. See [LICENSE](LICENSE) for details.
