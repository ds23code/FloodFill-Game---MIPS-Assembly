# FloodFill Game - MIPS Assembly Implementation

A strategic puzzle game implemented in MIPS assembly language where players flood-fill a grid to match all cells to a single color within an optimal number of steps.

## Project Overview

This is a complete implementation of a flood-fill puzzle game written in MIPS assembly.

**Author:** Dhruv Sharma

## Game Features

- **Interactive Grid-Based Gameplay**: Navigate a customizable grid (3x3 to 12x12) using keyboard controls
- **Flood Fill Mechanics**: Select cells and flood-fill connected regions with their color
- **AI Solver**: Built-in solver calculates and displays optimal solution paths
- **Win/Loss Conditions**: Complete the puzzle within the optimal steps + 2 extra moves
- **Visual Interface**: ASCII-based board with cursor indicators and step tracking

## Controls

| Key | Action |
|-----|--------|
| `w` | Move cursor up |
| `s` | Move cursor down |
| `a` | Move cursor left |
| `d` | Move cursor right |
| `e` | Perform flood fill on selected cell |
| `c` | Show optimal solution (cheat mode) |
| `h` | Display help message |
| `q` | Quit game |

## Game Rules

1. The goal is to make all cells on the board the same color
2. You start at position (0,0) in the top-left corner
3. Flood-filling spreads the selected color to all connected cells of the same color
4. You must complete the puzzle within `optimal_steps + 2` moves
5. The AI calculates the optimal solution using a greedy surface-area algorithm

## Implementation Details

### Architecture
- **Subset 0**: Basic game initialization and welcome screen
- **Subset 1**: Core game loop, board validation, and fill mechanics
- **Subset 2**: Board initialization, optimal solution finder, and memory management
- **Subset 3**: Advanced AI solver with surface area calculation and adjacency detection

### Key Data Structures

```c
struct fill_in_progress {
    int cells_filled;
    char visited[MAX_BOARD_WIDTH][MAX_BOARD_HEIGHT];
    char fill_with;
    char fill_onto;
};

struct solver {
    struct step_rating step_rating_for_colour[NUM_COLOURS];
    int solution_length;
    char simulated_board[MAX_BOARD_WIDTH][MAX_BOARD_HEIGHT];
    char future_board[MAX_BOARD_WIDTH][MAX_BOARD_HEIGHT];
    char adjacent_to_cell[MAX_BOARD_WIDTH][MAX_BOARD_HEIGHT];
    char optimal_solution[MAX_SOLUTION_STEPS];
};
```

### Algorithm

The solver uses a **greedy approach** based on:
1. **Color Elimination Priority**: Prefers moves that completely eliminate a color from the board
2. **Surface Area Maximization**: Otherwise selects the move that maximizes adjacent cells
3. **Recursive Flood Fill**: Uses depth-first search for efficient region filling

## Building and Running

### Requirements
- MIPS simulator (SPIM, MARS, or QtSPIM)
- Text editor configured with tab-width of 8

### Running the Game

1. Load `flood.s` into your MIPS simulator
2. Run the program
3. Enter board dimensions (3-12 for both width and height)
4. Enter a random seed for board generation
5. Play using the keyboard controls

### Example Session

```
Welcome to flood!
Enter the grid width: 5
Enter the grid height: 5
Enter a random seed: 42

|-----|-----|-----|-----|-----|
| === | xxx | ### | ... | *** |
|-----|-----|-----|-----|-----| <--
| === | ### | ... | xxx | *** |
|-----|-----|-----|-----|-----|
...
> e
Filled 3 cells!
```

## Files

- `flood.s` - Main MIPS assembly implementation (~2000+ lines)
- `flood.c` - Reference C implementation for comparison
- Header comments include detailed documentation of functions, registers, and memory layout

## Technical Highlights

- **Manual Memory Management**: Direct struct manipulation using calculated offsets
- **Recursive Algorithms**: Stack-based recursion for flood fill and adjacency detection
- **Optimization**: Word-aligned memory copying for performance
- **State Management**: Complex game state tracking across multiple data structures

## Known Limitations

- `solve_next_step` and `rate_choice` functions have incomplete edge case handling
- Surface area calculation may not handle all board configurations optimally
- Some comments indicate debugging was in progress ("I GIVE UP THIS IS HARDER THAT RATE_CHOICE")

## Learning Outcomes

This project demonstrates:
- Low-level memory manipulation in assembly
- Implementation of recursive algorithms without high-level abstractions
- Translation of C code to MIPS assembly
- Game state management and AI algorithm implementation
- Struct layout and pointer arithmetic at the assembly level
