# Odin Game Engine

A modern game engine built with the [Odin](https://odin-lang.org/) programming language.

## Features

- **Performance-first**: Leverages Odin's data-oriented design and manual memory management
- **Cross-platform**: Targets Windows, Linux, macOS, and Web (via WASM)
- **Modular architecture**: Plugin-based system for rendering, physics, audio, and input
- **Hot-reload**: Live code reloading for rapid iteration
- **ECS**: Entity-Component-System architecture

## Quick Start

```bash
# Clone the repository
git clone https://github.com/Darkside7764/odin-game-engine.git
cd odin-game-engine

# Build the engine
./build.sh

# Run the example
./bin/example
```

## Project Structure

```
odin-game-engine/
├── src/              # Engine source code
│   ├── core/         # Core engine systems
│   ├── renderer/     # Rendering abstraction
│   ├── physics/      # Physics integration
│   ├── audio/        # Audio system
│   ├── input/        # Input handling
│   └── ecs/          # Entity-Component-System
├── examples/         # Example projects
├── third_party/      # Dependencies
├── build.sh          # Build script
└── odin.json         # Odin package configuration
```

## Building

Requires:
- [Odin compiler](https://odin-lang.org/download/) (dev-2024-08 or later)
- C compiler (clang/gcc/msvc)
- Platform-specific dependencies (SDL2, Vulkan, etc.)

```bash
# Development build
odin build src -out:bin/engine -debug

# Release build
odin build src -out:bin/engine -o:speed
```

## License

MIT License - see [LICENSE](LICENSE) for details.

## Contributing

Contributions welcome! Please read [CONTRIBUTING.md](CONTRIBUTING.md) first.