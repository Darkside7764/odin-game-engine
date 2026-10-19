package main

// Example - Basic Engine Usage

import "core:fmt"
import "core:os"

import "core" // Engine core package

// Game state
Game_State :: struct {
    x: f32,
    y: f32,
    speed: f32,
}

// Update function - called each frame
update :: proc(engine: ^core.Engine, dt: f64) {
    // Handle input, update game logic
    // For now just print frame info occasionally
    if engine.frame_count % 60 == 0 {
        fmt.printf("Frame: %d, Delta: %.4f\n", engine.frame_count, engine.delta_time)
    }
}

// Render function - called each frame
render :: proc(engine: ^core.Engine) {
    // Render frame
    // For now just print occasionally
    if engine.frame_count % 120 == 0 {
        fmt.printf("Rendering frame %d\n", engine.frame_count)
    }
}

// Entry point
main :: proc() {
    config := core.Engine_Config{
        window_title:  "Odin Game Engine - Example",
        window_width:  1280,
        window_height: 720,
        target_fps:    60,
        vsync:         true,
    }
    
    engine := core.init(config)
    
    // Run for 5 seconds demo
    start_time := os.time_ns()
    demo_duration_ns := 5 * 1_000_000_000
    
    for engine.running {
        current_time := os.time_ns()
        if current_time - start_time > demo_duration_ns {
            core.shutdown(&engine)
            break
        }
        
        core.run(&engine, update, render)
    }
    
    fmt.printf("Example completed successfully!\n")
}