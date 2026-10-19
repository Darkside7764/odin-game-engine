package core

// Odin Game Engine - Core System
// Main engine initialization and game loop

import "core:fmt"
import "core:os"
import "core:time"

// Engine configuration
Engine_Config :: struct {
    window_title:  string,
    window_width:  i32,
    window_height: i32,
    target_fps:    i32,
    vsync:         bool,
}

// Engine state
Engine :: struct {
    config:      Engine_Config,
    running:     bool,
    delta_time:  f64,
    last_time:   f64,
    frame_count: u64,
}

// Initialize the engine
init :: proc(config: Engine_Config) -> Engine {
    engine := Engine{
        config:     config,
        running:    true,
        delta_time: 0,
        last_time:  os.time_ns(),
    }
    
    fmt.printf("Odin Game Engine v0.1.0\n")
    fmt.printf("Initializing: %s (%dx%d)\n", config.window_title, config.window_width, config.window_height)
    
    return engine
}

// Main game loop
run :: proc(engine: ^Engine, update: proc(engine: ^Engine, dt: f64), render: proc(engine: ^Engine)) {
    for engine.running {
        current_time := os.time_ns()
        engine.delta_time = (current_time - engine.last_time) / 1_000_000_000.0
        engine.last_time = current_time
        engine.frame_count += 1
        
        // Cap frame rate
        if engine.config.target_fps > 0 {
            target_frame_time := 1.0 / f64(engine.config.target_fps)
            if engine.delta_time < target_frame_time {
                sleep_time := (target_frame_time - engine.delta_time) * 1_000_000_000
                os.sleep_ns(u64(sleep_time))
                current_time = os.time_ns()
                engine.delta_time = (current_time - engine.last_time) / 1_000_000_000.0
                engine.last_time = current_time
            }
        }
        
        update(engine, engine.delta_time)
        render(engine)
    }
}

// Shutdown the engine
shutdown :: proc(engine: ^Engine) {
    engine.running = false
    fmt.printf("Engine shutdown. Total frames: %d\n", engine.frame_count)
}