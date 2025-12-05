
########################################
## CONSTANTS: REQIURED FOR GAME LOGIC ##
########################################

TRUE = 1
FALSE = 0

UP_KEY = 'w'
LEFT_KEY = 'a'
DOWN_KEY = 's'
RIGHT_KEY = 'd'

FILL_KEY = 'e'

CHEAT_KEY = 'c'
HELP_KEY = 'h'
EXIT_KEY = 'q'

COLOUR_ONE = '='
COLOUR_TWO = 'x'
COLOUR_THREE = '#'
COLOUR_FOUR = '.'
COLOUR_FIVE = '*'
COLOUR_SIX = '`'
COLOUR_SEVEN = '@'
COLOUR_EIGHT = '&'

NUM_COLOURS = 8

MIN_BOARD_WIDTH = 3
MAX_BOARD_WIDTH = 12
MIN_BOARD_HEIGHT = 3
MAX_BOARD_HEIGHT = 12

BOARD_VERTICAL_SEPERATOR = '|'
BOARD_CROSS_SEPERATOR = '+'
BOARD_HORIZONTAL_SEPERATOR = '-'
BOARD_CELL_SEPERATOR = '|'
BOARD_SPACE_SEPERATOR = ' '
BOARD_CELL_SIZE = 3

SELECTED_ARROW_VERTICAL_LENGTH = 2

GAME_STATE_PLAYING = 0
GAME_STATE_LOST = 1
GAME_STATE_WON = 2

NUM_VISIT_DELTAS = 4
VISIT_DELTA_ROW = 0
VISIT_DELTA_COL = 1

MAX_SOLUTION_STEPS = 64

NOT_VISITED = 0
VISITED = 1
ADJACENT = 2

EXTRA_STEPS = 2

#################################################
## CONSTANTS: PLEASE USE THESE FOR YOUR SANITY ##
#################################################

SIZEOF_INT = 4
SIZEOF_PTR = 4
SIZEOF_CHAR = 1

##########################################################
## struct fill_in_progress {                            ##
##     int cells_filled;                                ##
##     char visited[MAX_BOARD_WIDTH][MAX_BOARD_HEIGHT]; ##
##     char fill_with;                                  ##
##     char fill_onto;                                  ##
## };                                                   ##
##########################################################

CELLS_FILLED_OFFSET = 0
VISITED_OFFSET = CELLS_FILLED_OFFSET + SIZEOF_INT
FILL_WITH_OFFSET = VISITED_OFFSET + MAX_BOARD_WIDTH * MAX_BOARD_HEIGHT * SIZEOF_CHAR
FILL_ONTO_OFFSET = FILL_WITH_OFFSET + SIZEOF_CHAR

SIZEOF_FILL_IN_PROGRESS = FILL_ONTO_OFFSET + SIZEOF_CHAR

############################
## struct step_rating {   ##
##     int surface_area;  ##
##     int is_eliminated; ##
## };                     ##
############################

SURFACE_AREA_OFFSET = 0
IS_ELIMINATED_OFFSET = SURFACE_AREA_OFFSET + SIZEOF_INT

STEP_RATING_ALIGNMENT = 0

SIZEOF_STEP_RATING = IS_ELIMINATED_OFFSET + SIZEOF_INT + STEP_RATING_ALIGNMENT

###################################################################
## struct solver {                                               ##
##     struct step_rating step_rating_for_colour[NUM_COLOURS];   ##
##     int solution_length;                                      ##
##     char simulated_board[MAX_BOARD_WIDTH][MAX_BOARD_HEIGHT];  ##
##     char future_board[MAX_BOARD_WIDTH][MAX_BOARD_HEIGHT];     ##
##     char adjacent_to_cell[MAX_BOARD_WIDTH][MAX_BOARD_HEIGHT]; ##
##     char optimal_solution[MAX_SOLUTION_STEPS];                ##
## };                                                            ##
###################################################################

STEP_RATING_FOR_COLOUR_OFFSET = 0
SOLUTION_LENGTH_OFFSET = STEP_RATING_FOR_COLOUR_OFFSET + SIZEOF_STEP_RATING * NUM_COLOURS
SIMULATED_BOARD_OFFSET = SOLUTION_LENGTH_OFFSET + SIZEOF_INT
FUTURE_BOARD_OFFSET = SIMULATED_BOARD_OFFSET + MAX_BOARD_WIDTH * MAX_BOARD_HEIGHT * SIZEOF_CHAR
ADJACENT_TO_CELL_OFFSET = FUTURE_BOARD_OFFSET + MAX_BOARD_WIDTH * MAX_BOARD_HEIGHT * SIZEOF_CHAR
OPTIMAL_SOLUTION_OFFSET = ADJACENT_TO_CELL_OFFSET + MAX_BOARD_WIDTH * MAX_BOARD_HEIGHT * SIZEOF_CHAR

SIZEOF_SOLVER = OPTIMAL_SOLUTION_OFFSET + MAX_SOLUTION_STEPS * SIZEOF_CHAR

###################
## END CONSTANTS ##
###################

########################################
## DO NOT MODIFY THE .DATA SECTION!!! ##
## DO NOT MODIFY THE .DATA SECTION!!! ##
## DO NOT MODIFY THE .DATA SECTION!!! ##
## DO NOT MODIFY THE .DATA SECTION!!! ##
## DO NOT MODIFY THE .DATA SECTION!!! ##
## DO NOT MODIFY THE .DATA SECTION!!! ##
## DO NOT MODIFY THE .DATA SECTION!!! ##
########################################

######################
## GLOBAL VARIABLES ##
######################

	.data

###############################################
## char selected_arrow_horizontal[] = "<--"; ##
###############################################

selected_arrow_horizontal:
	.asciiz "<--"

##################################################
## char selected_arrow_vertical[] = {'^', '|'}; ##
##################################################

selected_arrow_vertical:
	.ascii "^|"

################################
## char cmd_waiting[] = "> "; ##
################################

cmd_waiting:
	.asciiz "> "

############################################################
## char colour_selector[NUM_COLOURS] = {                  ##
##    COLOUR_ONE, COLOUR_TWO, COLOUR_THREE, COLOUR_FOUR,  ##
##    COLOUR_FIVE, COLOUR_SIX, COLOUR_SEVEN, COLOUR_EIGHT ##
## };                                                     ##
############################################################

colour_selector:
	.byte COLOUR_ONE, COLOUR_TWO, COLOUR_THREE, COLOUR_FOUR
	.byte COLOUR_FIVE, COLOUR_SIX, COLOUR_SEVEN, COLOUR_EIGHT

#########################################################
## char game_board[MAX_BOARD_WIDTH][MAX_BOARD_HEIGHT]; ##
#########################################################

game_board:
	.align 2
	.space MAX_BOARD_WIDTH * MAX_BOARD_HEIGHT

##################################################################
## int visit_deltas[4][2] = {{-1, 0}, {1, 0}, {0, -1}, {0, 1}}; ##
##################################################################

visit_deltas:
	.word -1, 0
	.word 1, 0
	.word 0, -1
	.word 0, 1

#######################
## int selected_row; ##
#######################

selected_row:
	.align 2
	.space 4

##########################
## int selected_column; ##
##########################

selected_column:
	.align 2
	.space 4

######################
## int board_width; ##
######################

board_width:
	.align 2
	.space 4

#######################
## int board_height; ##
#######################

board_height:
	.align 2
	.space 4

################################################
## char optimal_solution[MAX_SOLUTION_STEPS]; ##
################################################

optimal_solution:
	.align 2
	.space MAX_SOLUTION_STEPS * SIZEOF_CHAR

########################
## int optimal_steps; ##
########################

optimal_steps:
	.align 2
	.space 4

######################
## int extra_steps; ##
######################

extra_steps:
	.align 2
	.space 4

################
## int steps; ##
################

steps:
	.align 2
	.space 4


#####################
## int game_state; ##
#####################

game_state:
	.align 2
	.space 4

###############################
## unsigned int random_seed; ##
###############################

random_seed:
	.align 2
	.space 4

######################################################
## struct fill_in_progress global_fill_in_progress; ##
######################################################

global_fill_in_progress:
	.align 2
	.space SIZEOF_FILL_IN_PROGRESS

##################################
## struct solver global_solver; ##
##################################

global_solver:
	.align 2
	.space SIZEOF_SOLVER

########################################
## DO NOT MODIFY THE .DATA SECTION!!! ##
## DO NOT MODIFY THE .DATA SECTION!!! ##
## DO NOT MODIFY THE .DATA SECTION!!! ##
## DO NOT MODIFY THE .DATA SECTION!!! ##
## DO NOT MODIFY THE .DATA SECTION!!! ##
## DO NOT MODIFY THE .DATA SECTION!!! ##
## DO NOT MODIFY THE .DATA SECTION!!! ##
########################################

##########################
## END GLOBAL VARIABLES ##
##########################

####################
## STATIC STRINGS ##
####################

########################################
## DO NOT MODIFY THE .DATA SECTION!!! ##
## DO NOT MODIFY THE .DATA SECTION!!! ##
## DO NOT MODIFY THE .DATA SECTION!!! ##
## DO NOT MODIFY THE .DATA SECTION!!! ##
## DO NOT MODIFY THE .DATA SECTION!!! ##
## DO NOT MODIFY THE .DATA SECTION!!! ##
## DO NOT MODIFY THE .DATA SECTION!!! ##
########################################

	.data

str_print_welcome_1:
	.asciiz "Welcome to flood!\n"

str_print_welcome_2:
	.asciiz "To move your cursor up/down, use "

str_print_welcome_3:
	.asciiz "To move your cursor left/right, use "

str_print_welcome_4:
	.asciiz "To see this message again, use "

str_print_welcome_5:
	.asciiz "To perform flood fill on the grid, use "

str_print_welcome_6:
	.asciiz "To cheat and see the 'optimal' solution, use "

str_print_welcome_7:
	.asciiz "To exit, use "


str_game_loop_win:
	.asciiz "You win!\n"

str_game_loop_lose:
	.asciiz "You lose :(\n"

str_initialise_game_enter_width:
	.asciiz "Enter the grid width: "

str_initialise_game_enter_height:
	.asciiz "Enter the grid height: "

str_initialise_game_invalid_width:
	.asciiz "Invalid width!\n"

str_initialise_game_invalid_height:
	.asciiz "Invalid height!\n"

str_initialise_game_enter_seed:
	.asciiz "Enter a random seed: "

str_do_fill_filled_1:
	.asciiz "Filled "

str_do_fill_filled_2:
	.asciiz " cells!\n"

str_print_board_steps:
	.asciiz " steps\n"

str_process_command_unknown:
	.asciiz "Unknown command: "

########################################
## DO NOT MODIFY THE .DATA SECTION!!! ##
## DO NOT MODIFY THE .DATA SECTION!!! ##
## DO NOT MODIFY THE .DATA SECTION!!! ##
## DO NOT MODIFY THE .DATA SECTION!!! ##
## DO NOT MODIFY THE .DATA SECTION!!! ##
## DO NOT MODIFY THE .DATA SECTION!!! ##
## DO NOT MODIFY THE .DATA SECTION!!! ##
########################################

########################
## END STATIC STRINGS ##
########################


############################################################
####                                                    ####
####   Your journey begins here, intrepid adventurer!   ####
####                                                    ####
############################################################

##############
## SUBSET 0 ##
##############

#####################
## int main(void); ##
#####################

################################################################################
# .TEXT <main>
	.text
main:
        # Subset:   0
        #
        # Frame:    8($sp)
        # Uses:     $sp, $fp, $ra
        # Clobbers: $ra, $fp, $a0–$a3, $v0, $t0–$t9
        #
        # Locals:
        #   0($sp): saved $fp
        #   4($sp): saved $ra
        #
        # Structure:
        #   main
        #   -> [prologue]
        #       -> body (calls: print_welcome, initialise_game, game_loop)
        #   -> [epilogue]
main__prologue:
	push	$ra			# Save return address to stack    

main__body:
	jal	print_welcome	 	# Call function to print welcome message

	jal	initialise_game		# Save return address to stack

	jal	game_loop		# Call main game loop function

main__epilogue:
	pop 	$ra			# Restore return address from stack
	li	$v0, 0			# Set return value to 0 (success)
	jr	$ra			# Return to caller

###########################
## void print_welcome(); ##
###########################

################################################################################
# .TEXT <print_welcome>
	.text
print_welcome:
        # Subset:   0
        #
        # Frame:    0($sp)
        # Uses:     $v0, $a0
        # Clobbers: $v0, $a0
        #
        # Locals:   None
        #
        # Structure:
        #   print_welcome
        #   -> body (prints static strings using syscall 4)
print_welcome__prologue:

print_welcome__body:
	# Print welcome line 1
	la	$a0, str_print_welcome_1
	li	$v0, 4
	syscall

	# Print welcome line 2
	la	$a0, str_print_welcome_2
	li	$v0, 4
	syscall

	# Print UP/DOWN keys
	la	$a0, UP_KEY
	li	$v0, 11
	syscall

	la	$a0, '/'
	li	$v0, 11
	syscall

	la	$a0, DOWN_KEY
	li	$v0, 11
	syscall

	la	$a0, '\n'
	li	$v0, 11
	syscall

	# Print line 3
	la	$a0, str_print_welcome_3
	li	$v0, 4
	syscall

	# Print LEFT/RIGHT keys
	la	$a0, LEFT_KEY
	li	$v0, 11
	syscall

	la	$a0, '/'
	li	$v0, 11
	syscall

	la	$a0, RIGHT_KEY
	li	$v0, 11
	syscall

	la	$a0, '\n'
	li	$v0, 11
	syscall

	# HELP key
	la	$a0, str_print_welcome_4
	li	$v0, 4
	syscall

	la	$a0, HELP_KEY
	li	$v0, 11
	syscall

	la	$a0, '\n'
	li	$v0, 11
	syscall

	# FILL key
	la	$a0, str_print_welcome_5
	li	$v0, 4
	syscall

	la	$a0, FILL_KEY
	li	$v0, 11
	syscall

	la	$a0, '\n'
	li	$v0, 11
	syscall

	# CHEAT key
	la	$a0, str_print_welcome_6
	li	$v0, 4
	syscall

	la	$a0, CHEAT_KEY
	li	$v0, 11
	syscall

	la	$a0, '\n'
	li	$v0, 11
	syscall

	# EXIT key
	la	$a0, str_print_welcome_7
	li	$v0, 4
	syscall

	la	$a0, EXIT_KEY
	li	$v0, 11
	syscall

	la	$a0, '\n'
	li	$v0, 11
	syscall

print_welcome__epilogue:
	jr	$ra

##############
## SUBSET 1 ##
##############

#########################################################
## int in_bounds(int value, int minimum, int maximum); ##
#########################################################

################################################################################
# .TEXT <in_bounds>
	.text
in_bounds:
        # Subset:   1
        #
        # Frame:    0($sp)
        # Uses:     $a0, $a1, $a2, $v0
        # Clobbers: $v0
        #
        # Locals:   None
        #
        # Structure:
        #   in_bounds(value, min, max)
        #   -> returns 1 if value in range, else 0
in_bounds__prologue:

in_bounds__body:
	blt	$a0, $a1, return_0	# If value < min, return 0

	bgt	$a0, $a2, return_0	# If value > max, return 0

	li	$v0, 1			# Value is in bounds, return 1

in_bounds__epilogue:
	jr	$ra

return_0:
	li	$v0, 0			# Set return to 0 (false)

	b	in_bounds__epilogue	# Return

#######################
## void game_loop(); ##
#######################

################################################################################
# .TEXT <game_loop>
	.text
game_loop:
        # Subset:   1
        #
        # Frame:    8($sp)
        # Uses:     $ra
        # Clobbers: $ra, $v0, $a0–$a1, $t0–$t9
        #
        # Locals:
        #   0($sp): saved $fp
        #   4($sp): saved $ra
        #
        # Structure:
        #   game_loop
        #   -> [prologue]
        #       -> loop: call process_command repeatedly
        #       -> end: print result
        #   -> [epilogue]
game_loop__prologue:
	push	$ra			# Save return address

game_loop__body:
	la 	$a0, game_board		# Load board address

	jal 	print_board		# Print board

check_game_state:
        lw	$t0, game_state		# Load current game state

        beq	$t0, GAME_STATE_PLAYING, process_command_loop

	beq	$t0, GAME_STATE_WON, print_you_win

	beq	$t0, GAME_STATE_LOST, print_you_lose

game_loop__epilogue:
	pop 	$ra			# Restore return address
	jr	$ra			# Return

process_command_loop:
	jal	process_command 	# Handle user input

	b	check_game_state 	# Re-check state

print_you_win:
	la	$a0, str_game_loop_win
	li	$v0, 4
	syscall

	b	game_loop__epilogue

print_you_lose:
	la	$a0, str_game_loop_lose
	li	$v0, 4
	syscall

	b	game_loop__epilogue

#############################
## void initialise_game(); ##
#############################

################################################################################
# .TEXT <initialise_game>
	.text
initialise_game:
        # Subset:   1
        #
        # Frame:    16($sp)
        # Uses:     $ra, $v0, $a0–$a1, $t0–$t1
        # Clobbers: $ra, $v0, $a0–$a1, $t0–$t1
        #
        # Locals:
        #   0($sp): saved $fp
        #   4($sp): saved $ra
        #   8($sp): user_width
        #   12($sp): user_height
        #
        # Structure:
        #   initialise_game
        #   -> loop for valid dimensions
        #   -> set globals
        #   -> calls: initialise_board, find_optimal_solution
initialise_game__prologue:
	li	$t0, 0			# Temp register for input
	push	$ra			# Save return address

initialise_game__body:

initialise_game__width:
	la 	$a0, str_initialise_game_enter_width
	li	$v0, 4
	syscall				# Print prompt for width

	li	$v0, 5
	syscall				# Read user input

	move 	$t0, $v0
	sw	$t0, board_width	# Save width to global var

	# Check if width is in bounds
	move	$a0, $t0
	li	$a1, MIN_BOARD_WIDTH
	li	$a2, MAX_BOARD_WIDTH

	jal	in_bounds

	beqz	$v0, print_width_error	# If invalid, print error and retry

initialise_game__height:
	la 	$a0, str_initialise_game_enter_height
	li	$v0, 4
	syscall				# Prompt for height

	li	$v0, 5
	syscall				# Read input

	move 	$t0, $v0
	sw	$t0, board_height	# Save height
	move	$a0, $t0
	li	$a1, MIN_BOARD_HEIGHT
	li	$a2, MAX_BOARD_HEIGHT

	jal	in_bounds

	beqz	$v0, print_height_error	# Retry if height is invalid

	# Prompt and set seed
	la	$a0, str_initialise_game_enter_seed
	li	$v0, 4
	syscall

	li	$v0, 5
	syscall

	move 	$t0, $v0
	sw	$t0, random_seed

	# Initialize other global game state
	sw	$zero, selected_row
	sw	$zero, selected_column
	sw	$zero, steps
	li	$t0, EXTRA_STEPS
	sw	$t0, extra_steps
	li	$t0, GAME_STATE_PLAYING
	sw	$t0, game_state

	# Call functions
	jal	initialise_board
	
	jal	find_optimal_solution

initialise_game__epilogue:
        pop     $ra
	jr	$ra

print_width_error:
	la 	$a0, str_initialise_game_invalid_width
	li	$v0, 4
	syscall

	b 	initialise_game__width	# Loop back to width prompt

print_height_error:
	la 	$a0, str_initialise_game_invalid_height
	li	$v0, 4
	syscall

	b 	initialise_game__width	# Loop back to width prompt

#######################################################################
## int game_finished(char board[MAX_BOARD_WIDTH][MAX_BOARD_HEIGHT]); ##
#######################################################################

################################################################################
# .TEXT <game_finished>
	.text
game_finished:
        # Subset:   1
        #
        # Frame:    0($sp)
        # Uses:     $a0, $t0–$t3, $v0
        # Clobbers: $t0–$t3, $v0
        #
        # Locals:   None
        #
        # Structure:
        #   game_finished(board)
        #   -> nested loops over board
        #   -> returns 1 if all cells match top-left colour
        #   -> returns 0 if mismatch found
game_finished__prologue:
        lw      $t3, board_height         # Load board height
        lw      $t4, board_width          # Load board width
        lb      $t0, 0($a0)               # Load colour of first cell
        li      $t1, 0                    # Row index
        li      $t7, 12                   # Row size (MAX_BOARD_WIDTH)

game_finished__outer_loop:
	# Branch exit if all rows checked
        bge     $t1, $t3, game_finished__success

        li      $t2, 0                    # Column index

game_finished__inner_loop:
       # Branch exit if all cols in row checked
	bge     $t2, $t4, game_finished__next_row

        mul     $t5, $t1, $t7             # Compute offset = row * row_size
        add     $t5, $t5, $t2             # Add column offset
        add     $t5, $a0, $t5             # Add base address of board
        lb      $t6, 0($t5)               # Load cell colour

        bne     $t6, $t0, game_finished__fail # If different, return 0

        addi    $t2, $t2, 1               # Move to next column
        j       game_finished__inner_loop

game_finished__next_row:
        addi    $t1, $t1, 1               # Move to next row
        j       game_finished__outer_loop

game_finished__success:
        li      $v0, 1                    # All cells same colour
        j       game_finished__epilogue

game_finished__fail:
        li      $v0, 0                    # Found mismatch

game_finished__epilogue:
        jr	$ra    

#####################
## void do_fill(); ##
#####################

################################################################################
# .TEXT <do_fill>
	.text
do_fill:
        # Subset:   1
        #
        # Frame:    0($sp)
        # Uses:     $ra, $a0–$a2
        # Clobbers: $ra, $v0, $a0–$a2, $t0–$t9
        #
        # Locals:   None
        #
        # Structure:
        #   do_fill
        #   -> gets selected cell colour and top-left colour
        #   -> calls: initialise_fill_in_progress, fill
        #   -> prints number of filled cells
        #   -> increments step count
        #   -> checks game completion and updates game_state

do_fill__prologue:
	la	$a0, global_fill_in_progress
	push	$ra                      # Save return address

do_fill__body:
	lw	$t0, selected_row        # Get selected row
	lw 	$t1, selected_column     # Get selected column
	mul	$t2, $t0, MAX_BOARD_WIDTH
	add	$t2, $t2, $t1
	la	$t3, game_board
	add	$t2, $t2, $t3
	lb 	$a1, 0($t2)              # $a1 = colour at selected cell
	lb 	$a2, 0($t3)              # $a2 = colour at top-left

	jal	initialise_fill_in_progress

	# Fill the board from (0, 0)
	la	$a0, global_fill_in_progress
	la	$a1, game_board
	li	$a2, 0
	li	$a3, 0
	jal	fill

	# Print how many cells were filled
	la	$a0, str_do_fill_filled_1
	li	$v0, 4
	syscall

	la  	$t0, global_fill_in_progress
	lw  	$a0, 0($t0)              
	li  	$v0, 1                   
	syscall

	la	$a0, str_do_fill_filled_2
	li	$v0, 4
	syscall

	# Increment step count
	lb	$t3, steps
	addi	$t3, $t3, 1
	sw	$t3, steps

	# Check if player has won
	la  	$a0, game_board
	jal 	game_finished
	beqz 	$v0, do_fill_check_loss

	li  	$t4, GAME_STATE_WON
	sw  	$t4, game_state

do_fill_check_loss:
	lw  $t5, steps
	lw  $t6, optimal_steps
	lw  $t7, extra_steps
	add $t6, $t6, $t7

	ble $t5, $t6, do_fill__epilogue # If within allowed steps, skip loss

	li  $t4, GAME_STATE_LOST
	sw  $t4, game_state             # Otherwise, mark as lost

do_fill__epilogue:
	pop	$ra
	jr	$ra                    	# Return

##############
## SUBSET 2 ##
##############

########################################################################
## void initialise_fill_in_progress(struct fill_in_progress *init_me, ## 
##     char fill_with, char fill_onto);                               ##
########################################################################

################################################################################
# .TEXT <initialise_fill_in_progress>
	.text
initialise_fill_in_progress:
        # Subset:   2
        #
        # Frame:    0($sp)
        # Uses:     $a0–$a2, $t0–$t4
        # Clobbers: $t0–$t4
        #
        # Locals:   None
        #
        # Structure:
        #   initialise_fill_in_progress(ptr, fill_with, fill_onto)
        #   -> sets struct fields and clears visited matrix

initialise_fill_in_progress_prologue:
	sb	$a1, FILL_WITH_OFFSET($a0)       # Set fill_with field
	sb	$a2, FILL_ONTO_OFFSET($a0)       # Set fill_onto field
	sw	$zero, CELLS_FILLED_OFFSET($a0)  # Initialise cells_filled to 0

initialise_fill_in_progress__body:
	lw	$t0, board_height                # Load board height
	lw	$t1, board_width                 # Load board width
	li	$t2, 0                           # Row index

row_loop:
	bge	$t2, $t0, initialise_fill_in_progress__epilogue # Exit loop if all rows done

	li	$t3, 0                           # Column index

col_loop:
	bge	$t3, $t1, end_col_loop           # Exit inner loop if all columns done

	mul	$t4, $t2, MAX_BOARD_WIDTH        # Offset = row * width
	add	$t4, $t4, $t3                    # Add column offset
	add	$t4, $t4, VISITED_OFFSET         # Offset into visited matrix
	add	$t4, $a0, $t4                    # Base pointer + offset
	sb	$zero, 0($t4)                    # Clear visited flag

	addi	$t3, $t3, 1                      # Next column
	j	col_loop

end_col_loop:
	addi	$t2, $t2, 1                      # Next row
	j	row_loop

initialise_fill_in_progress__epilogue:
	jr	$ra                              # Return

##############################
## void initialise_board(); ##
##############################

################################################################################
# .TEXT <initialise_board>
	.text
initialise_board:
        # Subset:   2
        #
        # Frame:    0($sp)
        # Uses:     $t0–$t5
        # Clobbers: $t0–$t5
        #
        # Locals:   None
        #
        # Structure:
        #   initialise_board
        #   -> nested loops iterating over rows and columns of the board
        #   -> calls random_in_range to select a random colour index
        #   -> assigns random colour from colour_selector to each cell on game_board
initialise_board__prologue:
	push    $ra                        	# Save return address
	push    $s0                          	# Save loop var (row)
	push    $s1                          	# Save loop var (col)
	push    $s2                          	# Save base address of game_board
	push    $s3                          	# Save base address of colour_selector

initialise_board_body:
	la      $s2, game_board              	# Load address of board
	la      $s3, colour_selector         	# Load address of colour array
	li      $s0, 0                       	# Row index = 0

initialise_board_row_loop:
	li      $t0, MAX_BOARD_HEIGHT
	bge     $s0, $t0, initialise_board__epilogue  # Exit if all rows filled

	li      $s1, 0                      	# Column index = 0

initialise_board_col_loop:
	li      $t0, MAX_BOARD_WIDTH
	bge     $s1, $t0, initialise_board_end_col_loop # Exit if all columns filled

	li      $a0, 0
	li      $a1, NUM_COLOURS - 1
	jal     random_in_range             	# Pick a random colour index

	add     $t0, $s3, $v0                	# Get address of chosen colour
	lb      $t1, 0($t0)                  	# Load selected colour

	mul     $t0, $s0, MAX_BOARD_WIDTH    	# Calculate offset (row * width)
	add     $t0, $t0, $s1                	# Add column offset
	add     $t0, $s2, $t0                	# Compute final board address

	sb      $t1, 0($t0)                  	# Store colour in board
	addi    $s1, $s1, 1                  	# Next column

	j       initialise_board_col_loop

initialise_board_end_col_loop:
	addi    $s0, $s0, 1                  	# Next row
	j       initialise_board_row_loop

initialise_board__epilogue:
	pop     $s3                          	# Restore saved registers
	pop     $s2
	pop     $s1
	pop     $s0
	pop     $ra
	jr      $ra                          	# Return

###################################
## void find_optimal_solution(); ##
###################################

################################################################################
# .TEXT <find_optimal_solution>
	.text
find_optimal_solution:
        # Subset:   2
        #
        # Frame:    0($sp)
        # Uses:     $ra
        # Clobbers: $ra
        #
        # Locals:   None
        #
        # Structure:
        #   find_optimal_solution
        #   -> calls initialise_solver to reset solver state
        #   -> loops calling solve_next_step until game_finished returns true
        #   -> copies recorded optimal solution steps to global buffer
        #   -> null-terminates solution string
        #   -> stores number of optimal steps found

find_optimal_solution__prologue:
	push	$ra                            	# Save return address

find_optimal_solution__body:
	la	$a0, global_solver
	jal	initialise_solver               # Reset the solver

find_optimal_solution_while_loop:
	la	$t0, global_solver
	addi	$a0, $t0, 68                    # Simulated board inside solver

	jal	game_finished                   # Check if board is solved
	bnez	$v0, find_optimal_solution_while_loop_exit

	la	$a0, global_solver
	jal	solve_next_step                 # Add one more step

	b	find_optimal_solution_while_loop

find_optimal_solution_while_loop_exit:
	# Copy optimal solution from solver to global array
	la	$t0, global_solver
	addi	$a0, $t0, 500                  	# Start of recorded steps
	la	$a1, optimal_solution
	lw   	$a2, 64($t0)                    # Number of steps taken
	move	$t1, $a1
	jal	copy_mem

	# Null-terminate the string
	la   	$t0, optimal_solution
	la  	$t1, global_solver
	lw   	$t2, 64($t1)                    # Length of string
	add  	$t3, $t0, $t2                   # Get address of null byte
	li   	$t4, '\0'
	sb   	$t4, 0($t3)

	# Store optimal_steps = step count
	la  	$t0, global_solver
	lw  	$t1, 64($t0)
	la  	$t2, optimal_steps
	sw  	$t1, 0($t2)

find_optimal_solution__epilogue:
	pop	$ra
	jr	$ra                             # Return

################################################################
## int invalid_step(struct solver *solver, int colour_index); ##
################################################################

################################################################################
# .TEXT <invalid_step>
	.text
invalid_step:
        # Subset:   2
        #
        # Frame:    0($sp)
        # Uses:     $a0, $t0–$t4, $v0
        # Clobbers: $t0–$t4, $v0
        #
        # Locals:   None
        #
        # Structure:
        #   invalid_step(solver, colour_index)
        #   -> checks if selected colour is same as current colour at (0,0)
        #   -> initialises adjacency info
        #   -> scans board cells to see if new colour is adjacent to current flooded region
        #   -> returns 1 if invalid (not adjacent or same as current)
        #   -> returns 0 if valid (adjacent)

invalid_step__prologue:
	push    $ra                  		# Save return address
	push    $s0                  		# Save s0 (target colour)
	push    $a0                  		# Save solver pointer
	push    $a1                  		# Save colour index
	
	move    $t1, $a0             		# Copy solver to t1
	move    $t2, $a1            		# Copy colour_index to t2

invalid_step__body:
	la      $t3, colour_selector
	add     $t3, $t3, $t2        		# Get address of colour_selector[colour_index]
	lb      $s0, 0($t3)          		# Load target colour

	la      $t4, global_solver
	addi    $t4, $t4, 68         		# Get simulated board start
	lb      $t4, 0($t4)          		# Load colour at (0, 0)

	beq     $t4, $s0, invalid_step_return_true  # Return true if colour is same as current

	la      $a0, global_solver
	jal     initialise_solver_adjacent_cells    # Prepare adjacent cell info

	la      $a0, global_solver
	li      $a1, 0
	li      $a2, 0
	jal     find_adjacent_cells           	# Find adjacent cells of (0, 0)

	lw      $t5, board_height               # Load board height
	lw      $t6, board_width                # Load board width
	li      $t7, 0                          # row index = 0

invalid_step_row_loop:
	bge     $t7, $t5, invalid_step_row_loop_exit  # Exit if row >= height
	
	li      $t8, 0                          # column index = 0

invalid_step_col_loop:
	bge     $t8, $t6, invalid_step_col_loop_exit  # Exit if col >= width

	mul     $t9, $t7, MAX_BOARD_WIDTH
	add     $t9, $t9, $t8                  	# linear index = row * width + col

	la      $t0, global_solver
	addi    $t0, $t0, 68                    # Simulated board
	add     $t1, $t0, $t9                   # Get address of cell
	lb      $t1, 0($t1)                     # Load cell value

	bne     $t1, $s0, invalid_step_next_col # If not target colour, skip

	la      $t2, global_solver
	li      $t4, 356                        # Offset for adjacent_to_cell[]
	add     $t2, $t2, $t4
	add     $t2, $t2, $t9                   # Get address in adjacent_to_cell
	lb      $t2, 0($t2)                     # Load value
	li      $t0, 2                          # Compare with 2 (adjacent marker)

	beq     $t2, $t0, invalid_step_set_false    # If adjacent and match, return false

invalid_step_next_col:
	addi    $t8, $t8, 1                     # Next column
	j       invalid_step_col_loop

invalid_step_col_loop_exit:
	addi    $t7, $t7, 1                     # Next row
	j       invalid_step_row_loop

invalid_step_row_loop_exit:
	j       invalid_step_return_true        # No valid new cell found -> return true

invalid_step_set_false:
	li      $v0, 0                          # Return false (valid step)
	j       invalid_step__epilogue

invalid_step_return_true:
	li      $v0, 1                          # Return true (invalid step)

invalid_step__epilogue:
	pop     $a1                             # Restore registers
	pop     $a0
	pop     $s0
	pop     $ra
	jr      $ra                             # Return

####################################
## void print_optimal_solution(); ##
####################################

################################################################################
# .TEXT <print_optimal_solution>
	.text
print_optimal_solution:
        # Subset:   2
        #
        # Frame:    0($sp)
        # Uses:     $t0–$t3, $a0, $v0
        # Clobbers: $t0–$t3, $v0
        #
        # Locals:   None
        #
        # Structure:
        #   print_optimal_solution
        #   -> [prologue]
        #   -> [body]
        #       -> print characters of optimal_solution separated by commas
        #       -> if steps used > optimal steps, print caret (^) under current step
        #   -> [epilogue]

print_optimal_solution__prologue:
	push	$ra                     	# Save return address
	push	$s0                     	# Save $s0–$s6 for loop variables and pointers
	push	$s1
	push	$s2
	push	$s3
	push	$s4
	push	$s5
	push	$s6

print_optimal_solution__body:
	la	$s0, optimal_solution    	# Load pointer to solution string
	lb	$s1, 0($s0)               	# Load first character

	beqz	$s1, check_steps_and_return  	# If string is empty, skip printing

	move	$s2, $s0                 	# Set string traversal pointer

loop_print_chars:
	lb	$s3, 0($s2)               	# Load char
	beqz	$s3, print_newline       	# Stop at null terminator

	li	$v0, 11
	move	$a0, $s3
	syscall                        		# Print character

	addiu	$s2, $s2, 1              	# Advance pointer
	lb	$s4, 0($s2)               	# Peek next char

	beqz	$s4, print_newline       	# Don’t print comma after last char

	li	$v0, 11
	li	$a0, 44                  	# Print comma
	syscall

	li	$v0, 11
	li	$a0, 32                   	# Print space
	syscall

	j	loop_print_chars

print_newline:
	li	$v0, 11
	li	$a0, 10                   	# Print newline
	syscall

check_steps_and_return:
	la	$s5, steps
	lw	$s5, 0($s5)               	# Load steps used
	la	$s6, optimal_steps
	lw	$s6, 0($s6)               	# Load optimal steps
	
	bgt	$s5, $s6, continue_pointer_line # If suboptimal, print pointer
	beqz	$s1, print_optimal_solution__epilogue  # If string was empty, done

continue_pointer_line:
	move	$s2, $s0                 	# Reset pointer to start of string
	li	$s3, 0                    	# Index counter

loop_pointer_line:
	lb	$s4, 0($s2)               	# Get character
	beqz	$s4, pointer_newline     	# End of string
	beq	$s3, $s5, print_caret     	# Print caret at current step

	li	$v0, 11
	li	$a0, 32
	syscall                       		# Print 3 spaces
	li	$v0, 11
	li	$a0, 32
	syscall
	li	$v0, 11
	li	$a0, 32
	syscall

	j	skip_caret

print_caret:
	li	$v0, 11
	li	$a0, 94                   	# Print ^
	syscall
	li	$v0, 11
	li	$a0, 32                   	# Follow with 2 spaces
	syscall
	li	$v0, 11
	li	$a0, 32
	syscall

skip_caret:
	addiu	$s2, $s2, 1              	# Advance string
	addiu	$s3, $s3, 1              	# Increment index
	j	loop_pointer_line

pointer_newline:
	li	$v0, 11
	li	$a0, 10                   	# Print newline
	syscall

print_optimal_solution__epilogue:
	pop	$s6                      	# Restore registers
	pop	$s5
	pop	$s4
	pop	$s3
	pop	$s2
	pop	$s1
	pop	$s0
	pop	$ra
	jr	$ra                       	# Return

##############
## SUBSET 3 ##
##############

################################################################
## void rate_choice(struct solver *solver, int colour_index); ##
################################################################

################################################################################
# .TEXT <rate_choice>
	.text
rate_choice:
        # Subset:   3
        #
        # Frame:    0($sp)
        # Uses:     $a0, $t0–$t4
        # Clobbers: $t0–$t4
        #
        # Locals:   None
        #
        # Structure:
        #   rate_choice(solver, colour_index)
        #   -> scans board and updates surface_area, is_eliminated
        #THIS IS THE HARDEST FUNCTION
rate_choice_prologue:
	push    $ra
	push    $s0
	push    $s1
	push    $s2
	push    $s3
	push    $s4

rate_choice_body:
	move    $s0, $a0
	move    $s1, $a1
	li      $s2, 0
	move    $t6, $s0
	li      $t7, STEP_RATING_FOR_COLOUR_OFFSET
	mul     $t8, $s1, SIZEOF_STEP_RATING
	add     $t6, $t6, $t7
	add     $t6, $t6, $t8
	sw      $zero, SURFACE_AREA_OFFSET($t6)
	sw      $zero, IS_ELIMINATED_OFFSET($t6)
	li      $s3, 0

rate_choice_row_loop:
	lw      $t0, board_height

	bge     $s3, $t0, rate_choice_row_end
    
	li      $s4, 0

rate_choice_col_loop:
	lw      $t0, board_width
	
	bge     $s4, $t0, rate_choice_col_end
    
	mul     $t1, $s3, MAX_BOARD_WIDTH
	add     $t1, $t1, $s4
	move    $t2, $s0
	li      $t3, SIMULATED_BOARD_OFFSET
	add     $t2, $t2, $t3
	add     $t2, $t2, $t1
	lb      $t2, 0($t2)
	la      $t4, colour_selector
	add     $t4, $t4, $s1
	lb      $t4, 0($t4)

	bne     $t2, $t4, rate_choice_next_col

	li      $s2, 1
	move    $t5, $s0
	li      $t7, ADJACENT_TO_CELL_OFFSET
	add     $t5, $t5, $t7
	add     $t5, $t5, $t1
	lb      $t5, 0($t5)

	beqz    $t5, rate_choice_next_col

	lw      $t9, SURFACE_AREA_OFFSET($t6)
	addi    $t9, $t9, 1
	sw      $t9, SURFACE_AREA_OFFSET($t6)

rate_choice_next_col:
	addi    $s4, $s4, 1
	
	j       rate_choice_col_loop

rate_choice_col_end:
    	addi    $s3, $s3, 1
    
	j       rate_choice_row_loop

rate_choice_row_end:
    	beqz    $s2, rate_choice_epilogue
    
	lw      $t0, SURFACE_AREA_OFFSET($t6)
    
	bnez    $t0, rate_choice_epilogue
    
	li      $t1, 1
    	sw      $t1, IS_ELIMINATED_OFFSET($t6)

rate_choice_epilogue:
    pop     $s4
    pop     $s3
    pop     $s2
    pop     $s1
    pop     $s0
    pop     $ra
    jr      $ra

########################################################################
## void find_adjacent_cells(struct solver *solver, int row, int col); ##
########################################################################

################################################################################
# .TEXT <find_adjacent_cells>
	.text
find_adjacent_cells:
	# Subset:   3
	#
	# Frame:    32($sp)
	# Uses:     $a0–$a2, $v0
	# Clobbers: $a0–$a2, $v0, $t0–$t9
	#
	# Locals:
	#   - $s0 = solver (struct pointer)
	#   - $s1 = row
	#   - $s2 = col
	#   - $s3 = board_width
	#   - $s4 = board_height
	#   - $s5 = fill_region_colour
	#
	# Structure:
	#   find_adjacent_cells
	#   -> [prologue]
	#       -> body
	#           -> base case checks
	#           -> mark cell as visited or adjacent
	#           -> for-loop over visit_deltas
	#               -> bounds check
	#               -> recursive call
	#       -> [epilogue]

find_adjacent_cells__prologue:
	addiu	$sp, $sp, -32
	sw	$ra, 28($sp)
	sw	$s0, 24($sp)
	sw	$s1, 20($sp)
	sw	$s2, 16($sp)
	sw	$s3, 12($sp)
	sw	$s4, 8($sp)
	sw	$s5, 4($sp)

	move	$s0, $a0		# $s0 = solver
	move	$s1, $a1		# $s1 = row
	move	$s2, $a2		# $s2 = col

	# Load board_width and board_height
	lw	$s3, board_width
	lw	$s4, board_height

	# fill_region_colour = solver->simulated_board[0][0]
	add	$t0, $s0, SIMULATED_BOARD_OFFSET
	lb	$s5, 0($t0)		# $s5 = fill_region_colour

	# Calculate &adjacent_to_cell[row][col]
	# base = solver + ADJACENT_TO_CELL_OFFSET
	add	$t1, $s0, ADJACENT_TO_CELL_OFFSET
	mul	$t2, $s1, $s3		# row * board_width
	add	$t2, $t2, $s2		# + col
	add	$t3, $t1, $t2		# &adjacent_to_cell[row][col]
	lb	$t4, 0($t3)

	li	$t5, NOT_VISITED
	bne	$t4, $t5, find_adjacent_cells__epilogue	# if not NOT_VISITED, return

	# Check simulated_board[row][col] != fill_region_colour
	add	$t6, $s0, SIMULATED_BOARD_OFFSET
	mul	$t7, $s1, $s3
	add	$t7, $t7, $s2
	add	$t8, $t6, $t7
	lb	$t9, 0($t8)

	bne	$t9, $s5, find_adjacent_cells_set_adjacent

	# Else: set adjacent_to_cell[row][col] = VISITED
	li	$t0, VISITED
	sb	$t0, 0($t3)
	j	find_adjacent_cells_loop_init

find_adjacent_cells_set_adjacent:
	li	$t0, ADJACENT
	sb	$t0, 0($t3)
	j	find_adjacent_cells__epilogue

# for (int i = 0; i < NUM_VISIT_DELTAS; i++)
find_adjacent_cells_loop_init:
	li	$t1, 0		# i = 0

find_adjacent_cells_loop_cond:
	li	$t2, NUM_VISIT_DELTAS
	bge	$t1, $t2, find_adjacent_cells__epilogue

	# Load visit_deltas[i][VISIT_DELTA_ROW]
	la	$t3, visit_deltas
	mul	$t4, $t1, 8		# 2 ints per row, 4 bytes each = 8 bytes per row
	add	$t5, $t3, $t4
	lw	$t6, 0($t5)		# row_delta
	lw	$t7, 4($t5)		# col_delta

	# Compute new_row = row + row_delta
	add	$t8, $s1, $t6
	# Compute new_col = col + col_delta
	add	$t9, $s2, $t7

	move	$a0, $t8        # new_row
	li	$a1, 0
	addi	$a2, $s4, -1    # board_height - 1
	jal	in_bounds
	beqz	$v0, find_adjacent_cells_loop_next   # if not in bounds, continue

	move	$a0, $t9        # new_col
	li	$a1, 0
	addi	$a2, $s3, -1    # board_width - 1
	jal	in_bounds
	beqz	$v0, find_adjacent_cells_loop_next   # if not in bounds, continue

	# Recursive call: find_adjacent_cells(solver, new_row, new_col)
	move	$a0, $s0
	move	$a1, $t8
	move	$a2, $t9
	jal	find_adjacent_cells

find_adjacent_cells_loop_next:
	addi	$t1, $t1, 1
	j	find_adjacent_cells_loop_cond

find_adjacent_cells__epilogue:
	# Epilogue: restore $ra, $s0-$s5
	lw	$ra, 28($sp)
	lw	$s0, 24($sp)
	lw	$s1, 20($sp)
	lw	$s2, 16($sp)
	lw	$s3, 12($sp)
	lw	$s4, 8($sp)
	lw	$s5, 4($sp)
	addiu	$sp, $sp, 32
	jr	$ra

##########################################################################
## void fill(struct fill_in_progress *fill_in_progress,                 ##
##    char board[MAX_BOARD_WIDTH][MAX_BOARD_HEIGHT], int row, int col); ##
##########################################################################

################################################################################
# .TEXT <fill>
	.text
fill:
	# Subset:   3
	#
	# Frame:    32($sp)
	# Uses:     $a0–$a3, $v0
	# Clobbers: $a0–$a3, $v0, $t0–$t9
	#
	# Locals:
	#   - $s0 = fill_in_progress (struct pointer)
	#   - $s1 = board (2D array)
	#   - $s2 = row
	#   - $s3 = col
	#   - $s4 = board_width
	#   - $s5 = board_height
	#   - $s6 = fill_onto
	#   - $s7 = fill_with
	#
	# Structure:
	#   fill
	#   -> [prologue]
	#       -> body
	#           -> base case: return if already visited
	#           -> mark as visited
	#           -> check if board[row][col] matches fill_onto
	#               -> return if not
	#           -> increment cells_filled if fill_with is different
	#           -> assign fill_with to board[row][col]
	#           -> for each delta in visit_deltas:
	#               -> check row + delta and col + delta in bounds
	#               -> recursively call fill on adjacent cell
	#   -> [epilogue]
addiu	$sp, $sp, -32
	sw	$ra, 28($sp)
	sw	$s0, 24($sp)
	sw	$s1, 20($sp)
	sw	$s2, 16($sp)
	sw	$s3, 12($sp)
	sw	$s4, 8($sp)
	sw	$s5, 4($sp)

	move	$s0, $a0		# fill_in_progress
	move	$s1, $a1		# board
	move	$s2, $a2		# row
	move	$s3, $a3		# col

	lw	$s4, board_width
	lw	$s5, board_height

	# Load fill_onto and fill_with
	lb	$s6, FILL_ONTO_OFFSET($s0)
        lb	$s7, FILL_WITH_OFFSET($s0)

	mul	$t2, $s2, $s4
	add	$t2, $t2, $s3
	add	$t3, $s0, VISITED_OFFSET
	add	$t4, $t3, $t2
	lb	$t5, 0($t4)
	li	$t6, VISITED
	beq	$t5, $t6, fill__epilogue

	# visited[row][col] = VISITED
	sb	$t6, 0($t4)

	# if (board[row][col] != fill_onto) return;
	mul	$t7, $s2, $s4
	add	$t7, $t7, $s3
	add	$t8, $s1, $t7
	lb	$t9, 0($t8)
	bne	$t9, $s6, fill__epilogue

	# if (board[row][col] != fill_with) cells_filled++
	bne	$t9, $s7, fill__increment_cells_filled
	j	fill__write_colour

fill__increment_cells_filled:
	lw	$t0, CELLS_FILLED_OFFSET($s0)
	addiu	$t0, $t0, 1
	sw	$t0, CELLS_FILLED_OFFSET($s0)

fill__write_colour:
	# board[row][col] = fill_with
	sb	$s7, 0($t8)

	# i = 0
	li	$t1, 0

fill__loop_cond:
	li	$t2, NUM_VISIT_DELTAS
	bge	$t1, $t2, fill__epilogue

	# visit_deltas[i][0] = row_delta, visit_deltas[i][1] = col_delta
	la	$t3, visit_deltas
	mul	$t4, $t1, 8		# each row is 8 bytes (2 * 4)
	add	$t5, $t3, $t4
	lw	$t6, 0($t5)		# row_delta
	lw	$t7, 4($t5)		# col_delta

	# new_row = row + row_delta
	add	$t8, $s2, $t6
	# new_col = col + col_delta
	add	$t9, $s3, $t7

	# check if new_row in bounds
	move	$a0, $t8
	li	$a1, 0
	addi	$a2, $s5, -1
	jal	in_bounds
	beqz	$v0, fill__loop_next

	# check if new_col in bounds
	move	$a0, $t9
	li	$a1, 0
	addi	$a2, $s4, -1
	jal	in_bounds
	beqz	$v0, fill__loop_next

	# recursive call: fill(fill_in_progress, board, new_row, new_col)
	move	$a0, $s0
	move	$a1, $s1
	move	$a2, $t8
	move	$a3, $t9
	jal	fill

fill__loop_next:
	addi	$t1, $t1, 1
	j	fill__loop_cond

fill__epilogue:
	lw	$ra, 28($sp)
	lw	$s0, 24($sp)
	lw	$s1, 20($sp)
	lw	$s2, 16($sp)
	lw	$s3, 12($sp)
	lw	$s4, 8($sp)
	lw	$s5, 4($sp)
	addiu	$sp, $sp, 32
	jr	$ra

##################################################
## void solve_next_step(struct solver *solver); ##
##################################################

################################################################################
# .TEXT <solve_next_step>
	.text
solve_next_step:
	# Subset:   3
	#
	# Frame:    16($sp)
	# Uses:     $a0
	# Clobbers: $a0–$a3, $v0, $t0–$t9
	#
	# Locals:
	#   - $s0 = solver pointer
	#   - $s1 = loop index for steps (colours)
	#
	# Structure:
	#   solve_next_step
	#   -> [prologue]
	#       -> copy_mem to reset future_board from simulated_board
	#       -> loop over all possible steps:
	#           -> call invalid_step to check step validity
	#           -> if valid:
	#               -> simulate_step
	#               -> initialise_solver_adjacent_cells
	#               -> find_adjacent_cells(0,0)
	#               -> rate_choice
	#           -> if invalid:
	#               -> set surface_area to -1 and is_eliminated to 0 for that step
	#   -> [epilogue]

        # I GIVE UP THIS IS HARDER THAT RATE_CHOICE

solve_next_step__prologue:
	addiu	$sp, $sp, -16
	sw	$ra, 12($sp)
	sw	$s0, 8($sp)
	sw	$s1, 4($sp)

	move	$s0, $a0	# $s0 = solver

	add	$a0, $s0, SIMULATED_BOARD_OFFSET
	add	$a1, $s0, FUTURE_BOARD_OFFSET
	li	$a2, 144	# MAX_BOARD_WIDTH * MAX_BOARD_HEIGHT
	jal	copy_mem

	li	$s1, 0		

solve_next_step_loop:
	li	$t0, NUM_COLOURS
	bge	$s1, $t0, solve_next_step__epilogue

        # Load pointer to simulated_board
        la   $a0, global_solver
        addi $a0, $a0, SIMULATED_BOARD_OFFSET

        # Load pointer to future_board
        la   $a1, global_solver
        addi $a1, $a1, FUTURE_BOARD_OFFSET

        # Set size to 144 (12x12)
        li   $a2, 144

        # Call copy_mem(simulated_board, future_board, 144)
        jal  copy_mem

	# if (invalid_step(solver, i))
	move	$a0, $s0
	move	$a1, $s1
	jal	invalid_step
	bnez	$v0, solve_next_step_invalid

solve_next_step_valid_step:
	# simulate_step(solver, i)
	move	$a0, $s0
	move	$a1, $s1
	jal	simulate_step

	# initialise_solver_adjacent_cells(solver)
	move	$a0, $s0
	jal	initialise_solver_adjacent_cells

	# find_adjacent_cells(solver, 0, 0)
	move	$a0, $s0
	li	$a1, 0
	li	$a2, 0
	jal	find_adjacent_cells

	move	$a0, $s0
	move	$a1, $s1
	jal	rate_choice

	j	solve_next_step__loop_next

solve_next_step_invalid:
	li	$t1, SIZEOF_STEP_RATING        # 8
	mul	$t2, $s1, $t1                  # offset = i * SIZEOF_STEP_RATING
	add	$t3, $s0, $t2                  # &solver + offset
	add	$t3, $t3, STEP_RATING_FOR_COLOUR_OFFSET

	# surface_area = -1 (this is not working idk what im doing wrong)
	li	$t4, -1
	sw	$t4, SURFACE_AREA_OFFSET($t3)

	# is_eliminated = FALSE (0)
	sw	$zero, IS_ELIMINATED_OFFSET($t3)

solve_next_step__loop_next:
	addi	$s1, $s1, 1
	j	solve_next_step_loop

solve_next_step__epilogue:
	lw	$ra, 12($sp)
	lw	$s0, 8($sp)
	lw	$s1, 4($sp)
	addiu	$sp, $sp, 16
	jr	$ra

#########################################################
## void copy_mem(void *src, void *dst, int num_bytes); ##
#########################################################

################################################################################
# .TEXT <copy_mem>
	.text
copy_mem:
	# Subset:   3
	#
	# Frame:    0($sp)
	# Uses:     $a0, $a1, $a2
	# Clobbers: $t0–$t5, $v0
	#
	# Locals:
	#   - $t0 = i (loop counter)
	#   - $t1 = num_words = num_bytes / 4
	#   - $t2 = num_remainder = num_bytes % 4
	#   - $t3 = current src pointer (int/char)
	#   - $t4 = current dst pointer (int/char)
	#   - $t5 = temp value loaded from src
	#
	# Structure:
	#   copy_mem
	#   -> [prologue]
	#       -> set up loop bounds
	#   -> [body]
	#       -> copy word loop (4-byte chunks)
	#       -> copy byte loop (remaining bytes)
	#   -> [epilogue]
	#       -> return

copy_mem__prologue:
	# Calculate number of words: num_bytes / 4
	li      $t6, 4
	div     $a2, $t6
	mflo    $t1                # $t1 = num_words
	mfhi    $t2                # $t2 = num_remainder

	# Set pointers
	move    $t3, $a0           # src_int_ptr
	move    $t4, $a1           # dst_int_ptr

	li      $t0, 0             # i = 0

copy_mem_loop:
	bge     $t0, $t1, copy_mem_loop_exit

	lw      $t5, 0($t3)        # load word from src
	sw      $t5, 0($t4)        # store word to dst

	addiu   $t3, $t3, 4        # src++
	addiu   $t4, $t4, 4        # dst++
	addiu   $t0, $t0, 1        # i++

	j       copy_mem_loop

copy_mem_loop_exit:
	# $t3 and $t4 now point to next src/dst location for bytes
	li      $t0, 0             # i = 0

copy_mem__byte_loop:
	bge     $t0, $t2, copy_mem__epilogue

	lbu     $t5, 0($t3)        # load byte from src
	sb      $t5, 0($t4)        # store byte to dst

	addiu   $t3, $t3, 1        # src++
	addiu   $t4, $t4, 1        # dst++
	addiu   $t0, $t0, 1        # i++

	j       copy_mem__byte_loop

copy_mem__epilogue:
	jr      $ra                # return

##############
## PROVIDED ##
##############

#######################################################################
## unsigned int random_in_range(unsigned int min, unsigned int max); ##
#######################################################################

################################################################################
# .TEXT <random_in_range>
	.text
random_in_range:
	# Subset:   provided
	#
	# Frame:    []
	# Uses:     [$t0, $t1, $t2, $v0]
	# Clobbers: [$t0, $t1, $t2, $v0]
	#
	# Locals:
	#   - $t0: int a;
	#   - $t1: int m;
	#   - $t2: (a * random_seed) % m
	#   - $v0: min + random_seed % (max - min + 1);
	#
	# Structure:
	#   initialise_solver
	#   -> [prologue]
	#       -> body
	#   -> [epilogue]
random_in_range__prologue:
random_in_range__body:
	li	$t0, 16807		# int a = 16807;
	li	$t1, 2147483647		# int m = 2147483647;
	lw	$t2, random_seed	# ... random_seed
	
	mul	$t2, $t2, $t0		# ... a * random_seed

	remu	$t2, $t2, $t1		# ... (a * random_seed) % m

	sw	$t2, random_seed	# random_seed = (a * random_seed) % m;

	move	$v0, $a1		# ... max
	sub	$v0, $v0, $a0		# ... max - min
	add	$v0, $v0, 1		# ... max - min + 1

	rem	$v0, $t2, $v0		# ... random_seed % (max - min + 1)
	add	$v0, $v0, $a0		# return min + random_seed % (max - min + 1);
random_in_range__epilogue:
	jr	$ra

####################################################
## void initialise_solver(struct solver *solver); ##
####################################################

################################################################################
# .TEXT <initialise_solver>
	.text
initialise_solver:
	# Subset:   provided
	#
	# Frame:    []
	# Uses:     [$a0, $a1, $a2]
	# Clobbers: [$a0, $a1, $a2]
	#
	# Locals:
	#   - $a0: game_board
	#   - $a1: solver->simulated_board
	#   - $a2: MAX_BOARD_WIDTH * MAX_BOARD_HEIGHT
	#
	# Structure:
	#   initialise_solver
	#   -> [prologue]
	#       -> body
	#   -> [epilogue]

initialise_solver__prologue:
	push	$ra
initialise_solver__body:
	sw	$zero, SOLUTION_LENGTH_OFFSET($a0)	# solver->solution_length = 0;

	la	$a1, SIMULATED_BOARD_OFFSET($a0)	# copy_mem(game_board, solver->simulated_board, MAX_BOARD_WIDTH * MAX_BOARD_HEIGHT);
	la	$a0, game_board				#
	li	$a2, MAX_BOARD_WIDTH			#
	mul	$a2, $a2, MAX_BOARD_HEIGHT		#
	jal	copy_mem				#

initialise_solver__epilogue:
	pop	$ra
	jr	$ra					# return;

##################################################################
## void simulate_step(struct solver *solver, int colour_index); ##
##################################################################

################################################################################
# .TEXT <simulate_step>
	.text
simulate_step:
	# Subset:   provided
	#
	# Frame:    [$s0]
	# Uses:     [$s0, $a0, $a1, $a2, $a3]
	# Clobbers: [$a0, $a1, $a2, $a3]
	#
	# Locals:
	#   - $s0: save argument struct solver *solver
	#   - $a0: &global_fill_in_progress
	#   - $a1: argument 2
	#   - $a2: 0
	#   - $a3: 0
	#
	# Structure:
	#   simulate_step
	#   -> [prologue]
	#       -> body
	#   -> [epilogue]

simulate_step__prologue:
	push	$ra
	push	$s0
simulate_step__body:
	move	$s0, $a0

	lb	$a2, SIMULATED_BOARD_OFFSET($a0)#
	la	$a0, global_fill_in_progress	# initialise_fill_in_progress(&global_fill_in_progress, 
	lb	$a1, colour_selector($a1)	#     colour_selector[colour_index], solver->simulated_board[0][0]);
	jal	initialise_fill_in_progress	#

	la	$a0, global_fill_in_progress	# fill(&global_fill_in_progress, solver->simulated_board, 0, 0);
	la	$a1, SIMULATED_BOARD_OFFSET($s0)#
	li	$a2, 0				#
	li	$a3, 0				#
	jal	fill				#
simulate_step__epilogue:
	pop	$s0
	pop	$ra
	jr	$ra				# return;

###################################################################
## void initialise_solver_adjacent_cells(struct solver *solver); ##
###################################################################

################################################################################
# .TEXT <initialise_solver_adjacent_cells>
	.text
initialise_solver_adjacent_cells:
	# Subset:   provided
	#
	# Frame:    []
	# Uses:     [$t0, $t1, $t2, $t3]
	# Clobbers: []
	#
	# Locals:
	#   - $t0: int row;
	#   - $t1: int col;
	#   - $t2: address calculation & reading globals
	#   - $t3: value storage for sw
	#
	# Structure:
	#   initialise_solver_adjacent_cells
	#   -> [prologue]
	#       -> body
	#       -> row
	#           -> row_init
	#           -> row_cond
	#           -> row_body
	#           -> column
	#               -> column_init
	#               -> column_cond
	#               -> column_body
	#               -> column_step
	#               -> column_end
	#           -> row_step
	#           -> row_end
	#   -> [epilogue]

initialise_solver_adjacent_cells__prologue:
initialise_solver_adjacent_cells__body:
initialise_solver_adjacent_cells__row_init:
	li	$t0, 0				# int row = 0;
initialise_solver_adjacent_cells__row_cond:
	lw	$t2, board_height		# while (row < board_height) {
	bge	$t0, $t2, initialise_solver_adjacent_cells__row_end
						#
initialise_solver_adjacent_cells__row_body:
initialise_solver_adjacent_cells__column_init:
	li	$t1, 0				#     int col = 0;
initialise_solver_adjacent_cells__column_cond:
	lw	$t2, board_width		#     while (col < board_width) {
	bge	$t1, $t2, initialise_solver_adjacent_cells__column_end
						#
initialise_solver_adjacent_cells__column_body:
	mul	$t2, $t0, MAX_BOARD_WIDTH	#         ... &[row]
	add	$t2, $t2, $t1			#         ... &[row][col]
	add	$t2, $t2, $a0			#         ... &solver[row][col]
	li	$t3, NOT_VISITED		#
	sb	$t3, ADJACENT_TO_CELL_OFFSET($t2)
						#         solver->adjacent_to_cell[row][col] = NOT_VISITED;
initialise_solver_adjacent_cells__column_step:
	add	$t1, $t1, 1			#         col++;
	b	initialise_solver_adjacent_cells__column_cond
						#     }
initialise_solver_adjacent_cells__column_end:
initialise_solver_adjacent_cells__row_step:
	add	$t0, $t0, 1			#     row++;
	b	initialise_solver_adjacent_cells__row_cond
						# }
initialise_solver_adjacent_cells__row_end:

initialise_solver_adjacent_cells__epilogue:
	jr	$ra				# return;
######################################################################
## void print_board(char board[MAX_BOARD_WIDTH][MAX_BOARD_HEIGHT]); ##
######################################################################

################################################################################
# .TEXT <print_board>
	.text
print_board:
	# Subset:   provided
	#
	# Frame:    [$ra, $s0, $s1]
	# Uses:     [$s0, $s1, $t0, $a0, $v0]
	# Clobbers: [$t0, $a0, $v0]
	#
	# Locals:
	#   - $s0: char board[MAX_BOARD_WIDTH][MAX_BOARD_HEIGHT]
	#   - $s1: int i;
	#   - $t0: loading globals
	#   - $a0: syscall argument
	#   - $v0: syscall number
	#
	# Structure:
	#   print_board
	#   -> [prologue]
	#       -> body
	#       -> row
	#           -> row_init
	#           -> row_cond
	#           -> row_body
	#           -> row_step
	#           -> row_end
	#   -> [epilogue]

print_board__prologue:
	push	$ra
	push	$s0
	push	$s1
print_board__body:
	move	$s0, $a0
print_board__print_row_init:
	li	$s1, 0				# int i = 0;
print_board__print_row_cond:
	lw	$t0, board_height		# while (i < board_height) {
	bge	$s1, $t0, print_board__print_row_end
						#
print_board__print_row_body:
	move	$a0, $s0			#     print_board_row(board, i);
	move	$a1, $s1			#
	jal	print_board_row			#
print_board__print_row_step:
	add	$s1, $s1, 1			#     i++;
	b	print_board__print_row_cond	# }
print_board__print_row_end:
	jal	print_board_seperator_line	# print_board_seperator_line();
	jal	print_board_bottom		# print_board_bottom();

	lw	$a0, steps			# printf("%d", steps);
	li	$v0, 1				#
	syscall					#

	li	$a0, '/'			# putchar('/');
	li	$v0, 11				#
	syscall					#

	lw	$a0, optimal_steps		# printf("%d", optimal_steps + EXTRA_STEPS);
	add	$a0, $a0, EXTRA_STEPS		#
	li	$v0, 1				#
	syscall					#

	la	$a0, str_print_board_steps	# printf(" steps\n);
	li	$v0, 4				#
	syscall					#
print_board__epilogue:
	pop	$s1
	pop	$s0
	pop	$ra
	jr	$ra				# return;

################################
## void print_board_bottom(); ##
################################

################################################################################
# .TEXT <print_board_bottom>
	.text
print_board_bottom:
	# Subset:   provided
	#
	# Frame:    []
	# Uses:     [$t0, $t1, $t2, $t3, $a0, $v0]
	# Clobbers: [$t0, $t1, $t2, $t3, $a0, $v0]
	#
	# Locals:
	#   - $t0: int i;
	#   - $t1: int j;
	#   - $t2: int k;
	#   - $t3: arithmetic & loading globals
	#   - $a0: syscall argument
	#   - $v0: syscall number
	#
	# Structure:
	#   print_board_bottom
	#   -> [prologue]
	#       -> body
	#       -> down
	#           -> down_init
	#           -> down_cond
	#           -> down_body
	#           -> down_step
	#           -> down_end
	#           -> across
	#               -> across_init
	#               -> across_cond
	#               -> across_body
	#               -> not_selected
	#                   -> not_selected_init
	#                   -> not_selected_cond
	#                   -> not_selected_body
	#                   -> not_selected_step
	#                   -> not_selected_end
	#               -> selected
	#                   -> selected1
	#                       -> selected1_init
	#                       -> selected1_cond
	#                       -> selected1_body
	#                       -> selected1_step
	#                       -> selected1_end
	#                   -> i
	#                       -> i_nonzero
	#                       -> i_end
	#                   -> selected2
	#                       -> selected2_init
	#                       -> selected2_cond
	#                       -> selected2_body
	#                       -> selected2_step
	#                       -> selected2_end
	#               -> across_step
	#               -> across_end
	#   -> [epilogue]

print_board_bottom__prologue:
print_board_bottom__body:
print_board_bottom__down_init:
	li	$t0, 0				# int i = 0;
print_board_bottom__down_cond:
	bge	$t0, SELECTED_ARROW_VERTICAL_LENGTH + 1, print_board_bottom__down_end
						# while (i < SELECTED_ARROW_VERTICAL_LENGTH + 1) {
print_board_bottom__down_body:
	li	$v0, 11				#     putchar(BOARD_SPACE_SEPERATOR);
	li	$a0, BOARD_SPACE_SEPERATOR	#
	syscall					#
print_board_bottom__across_init:
	li	$t1, 0				#     int j = 0;
print_board_bottom__across_cond:
	lw	$t3, board_width		#     while (j < board_width) {
	bge	$t1, $t3, print_board_bottom__across_end
						#
print_board_bottom__across_body:

	lw	$t3, selected_column		#         if (j != selected_column) {
	beq	$t1, $t3, print_board_bottom__across_selected
						#

print_board_bottom__not_selected_init:
	li	$t2, 0				#             int k = 0;
print_board_bottom__not_selected_cond:
	bge	$t2, BOARD_CELL_SIZE + 3, print_board_bottom__not_selected_end
						#             while (k < BOARD_CELL_SIZE + 3) {
print_board_bottom__not_selected_body:
	li	$a0, BOARD_SPACE_SEPERATOR	#                 putchar(BOARD_SPACE_SEPERATOR);
	li	$v0, 11				#
	syscall					#
print_board_bottom__not_selected_step:
	add	$t2, $t2, 1			#                 k++;
	b	print_board_bottom__not_selected_cond
						#             }
print_board_bottom__not_selected_end:
	b	print_board_bottom__across_step	#         } else {
print_board_bottom__across_selected:
print_board_bottom__across_selected1_init:
	li	$t2, 0				#             int k = 0;
print_board_bottom__across_selected1_cond:
	li	$t3, BOARD_CELL_SIZE + 1	#             while (k < (BOARD_CELL_SIZE + 1) / 2) {
	div	$t3, $t3, 2			#
	bge	$t2, $t3, print_board_bottom__across_selected1_end
						#
print_board_bottom__across_selected1_body:
	li	$a0, BOARD_SPACE_SEPERATOR	#                 putchar(BOARD_SPACE_SEPERATOR);
	li	$v0, 11				#
	syscall					#
print_board_bottom__across_selected1_step:
	add	$t2, $t2, 1			#                 k++;
	b	print_board_bottom__across_selected1_cond
						#             }
print_board_bottom__across_selected1_end:

	bnez	$t0, print_board_bottom__across_i_nonzero
						#             if (i == 0) {

	li	$a0, BOARD_SPACE_SEPERATOR	#                 putchar(BOARD_SPACE_SEPERATOR);
	li	$v0, 11				#
	syscall					#

	b	print_board_bottom__across_i_end
						#             } else {
print_board_bottom__across_i_nonzero:

	sub	$a0, $t0, 1			#                 putchar(selected_arrow_vertical[i - 1]);
	lb	$a0, selected_arrow_vertical($a0)
						#
	li	$v0, 11				#
	syscall					#

print_board_bottom__across_i_end:		#             }

print_board_bottom__across_selected2_init:
	li	$t2, 0				#             k = 0;
print_board_bottom__across_selected2_cond:
	li	$t3, BOARD_CELL_SIZE + 1	#             while (k < ((BOARD_CELL_SIZE + 1) / 2)) {
	div	$t3, $t3, 2			#
	bge	$t2, $t3, print_board_bottom__across_selected2_end
						#
print_board_bottom__across_selected2_body:
	li	$a0, BOARD_SPACE_SEPERATOR	#                 putchar(BOARD_SPACE_SEPERATOR);
	li	$v0, 11				#
	syscall					#

print_board_bottom__across_selected2_step:
	add	$t2, $t2, 1			#                 k++;
	b	print_board_bottom__across_selected2_cond
						#             }
print_board_bottom__across_selected2_end:

print_board_bottom__across_step:
	add	$t1, $t1, 1			#         j++;
	b	print_board_bottom__across_cond	#     }
print_board_bottom__across_end:

	li	$a0, BOARD_SPACE_SEPERATOR	#     putchar(BOARD_SPACE_SEPERATOR);
	li	$v0, 11				#
	syscall					#

	li	$a0, '\n'			#     putchar('\n');
	syscall					#

print_board_bottom__down_step:
	add	$t0, $t0, 1			#     i++;
	b	print_board_bottom__down_cond	# }
print_board_bottom__down_end:
print_board_bottom__epilogue:
	jr	$ra				# return;

#########################################################################
## void print_board_row(char board[MAX_BOARD_WIDTH][MAX_BOARD_HEIGHT], ##
##     int row);                                                       ##
#########################################################################

################################################################################
# .TEXT <print_board_row>
	.text
print_board_row:
	# Subset:   provided
	#
	# Frame:    [$ra, $s0, $s1, $s2]
	# Uses:     [$s0, $s1, $s2, $t0, $t1, $a0, $a1, $a2]
	# Clobbers: [$t0, $t1, $a0, $a1, $a2]
	#
	# Locals:
	#   - $s0: char board[MAX_BOARD_WIDTH][MAX_BOARD_HEIGHT]
	#   - $s1: int row
	#   - $s2: int i
	#   - $t0: i == BOARD_CELL_SIZE / 2
	#   - $t1: row == selected_row
	#   - $a0: char board[MAX_BOARD_WIDTH][MAX_BOARD_HEIGHT]
	#   - $a1: int row
	#   - $a2: i == BOARD_CELL_SIZE / 2 && row == selected_row
	#
	# Structure:
	#   print_board_row
	#   -> [prologue]
	#       -> body
	#       -> each_row
	#           -> each_row_init
	#           -> each_row_cond
	#           -> each_row_body
	#           -> each_row_step
	#           -> each_row_end
	#   -> [epilogue]

print_board_row__prologue:
	push	$ra
	push	$s0
	push	$s1
	push	$s2
print_board_row__body:
	move	$s0, $a0
	move	$s1, $a1

	jal	print_board_seperator_line	# print_board_seperator_line();

print_board_row__each_row_init:
	li	$s2, 0				# int i = 0;
print_board_row__each_row_cond:
	bge	$s2, BOARD_CELL_SIZE, print_board_row__each_row_end
						# while (i < BOARD_CELL_SIZE) {
print_board_row__each_row_body:
	move	$a0, $s0			#
	move	$a1, $s1			#

	li	$t0, BOARD_CELL_SIZE		#
	div	$t0, $t0, 2			#
	seq	$t0, $t0, $s2			# ... i == BOARD_CELL_SIZE / 2

	lw	$t1, selected_row		#
	seq	$t1, $s1, $t1			# ... row == selected_row
	and 	$a2, $t0, $t1			# ... i == BOARD_CELL_SIZE / 2 && row == selected_row

	jal	print_board_inner_line		# print_board_inner_line(board, row, i == BOARD_CELL_SIZE / 2 && row == selected_row);
print_board_row__each_row_step:
	add	$s2, $s2, 1			#     i++;
	b	print_board_row__each_row_cond	# }
print_board_row__each_row_end:

print_board_row__epilogue:
	pop	$s2
	pop	$s1
	pop	$s0
	pop	$ra
	jr	$ra				# return;

################################################################################
## void print_board_inner_line(char board[MAX_BOARD_WIDTH][MAX_BOARD_HEIGHT], ##
##     int row, int row_is_selected);                                         ##
################################################################################

################################################################################
# .TEXT <print_board_inner_line>
	.text
print_board_inner_line:
	# Subset:   provided
	#
	# Frame:    []
	# Uses:     [$t0, $t1, $t2, $t3, $a0, $v0]
	# Clobbers: [$t0, $t1, $t2, $t3, $a0, $v0]
	#
	# Locals:
	#   - $t0: char board[MAX_BOARD_WIDTH][MAX_BOARD_HEIGHT]
	#   - $t1: int i;
	#   - $t2: int j;
	#   - $t3: loading globals
	#   - $a0: syscall argument
	#   - $v0: syscall number
	#
	# Structure:
	#   print_board_inner_line
	#   -> [prologue]
	#       -> body
	#       -> cells
	#           -> cells_init
	#           -> cells_cond
	#           -> cells_body
	#           -> inner_cell
	#               -> inner_cell_init
	#               -> inner_cell_cond
	#               -> inner_cell_body
	#               -> inner_cell_step
	#               -> inner_cell_end
	#           -> cells_step
	#           -> cells_end
	#   -> [epilogue]

print_board_inner_line__prologue:
print_board_inner_line__body:
	move	$t0, $a0

	li	$a0, BOARD_VERTICAL_SEPERATOR	# putchar(BOARD_VERTICAL_SEPERATOR);
	li	$v0, 11				#
	syscall					#

print_board_inner_line__cells_init:
	li	$t1, 0				# int i = 0;
print_board_inner_line__cells_cond:
	lw	$t3, board_width		# while (i < board_width) {
	bge	$t1, $t3, print_board_inner_line__cells_end
						#
print_board_inner_line__cells_body:
	li	$a0, BOARD_SPACE_SEPERATOR	#     putchar(BOARD_SPACE_SEPERATOR);
	li	$v0, 11				#
	syscall					#

print_board_inner_line__inner_cell_init:
	li	$t2, 0				#     int j = 0;
print_board_inner_line__inner_cell_cond:
	bge	$t2, BOARD_CELL_SIZE, print_board_inner_line__inner_cell_end
						#     while (j < BOARD_CELL_SIZE) {
print_board_inner_line__inner_cell_body:
	mul	$a0, $a1, MAX_BOARD_WIDTH	#         ... &[row]
	add	$a0, $a0, $t0			#         ... &board[row]
	add	$a0, $a0, $t1			#         ... &board[row][col]
	lb	$a0, ($a0)			#         putchar(board[row][i]);
	li	$v0, 11				#
	syscall
print_board_inner_line__inner_cell_step:
	add	$t2, $t2, 1			#         j++;
	b	print_board_inner_line__inner_cell_cond
						#     }
print_board_inner_line__inner_cell_end:

	li	$a0, BOARD_SPACE_SEPERATOR	#     putchar(BOARD_SPACE_SEPERATOR);
	li	$v0, 11				#
	syscall					#

	lw	$t3, board_width		#     if (i != board_width - 1) {
	sub	$t3, $t3, 1			#
	beq	$t1, $t3, print_board_inner_line__cells_step
						#

	li	$a0, BOARD_CELL_SEPERATOR	#         putchar(BOARD_CELL_SEPERATOR);
	li	$v0, 11				#
	syscall					#

print_board_inner_line__cells_step:		#     }
	add	$t1, $t1, 1			#     i++;
	b	print_board_inner_line__cells_cond
						# }
print_board_inner_line__cells_end:

	li	$a0, BOARD_VERTICAL_SEPERATOR	# putchar(BOARD_VERTICAL_SEPERATOR);
	li	$v0, 11				#
	syscall					#

	beqz	$a2, print_board_inner_line__last_newline
						# if (row_is_selected) {

	li	$a0, BOARD_SPACE_SEPERATOR	#     putchar(BOARD_SPACE_SEPERATOR);
	li	$v0, 11				#
	syscall					#

	la	$a0, selected_arrow_horizontal	#     printf("%s", selected_arrow_horizontal);
	li	$v0, 4				#
	syscall					#

print_board_inner_line__last_newline:		# }
	li	$a0, '\n'			#
	li	$v0, 11				#
	syscall					#
print_board_inner_line__epilogue:
	jr	$ra				# return;

########################################
## void print_board_seperator_line(); ##
########################################

################################################################################
# .TEXT <print_board_seperator_line>
	.text
print_board_seperator_line:
	# Subset:   provided
	#
	# Frame:    []
	# Uses:     [$t0, $t1, $t2, $a0, $v0]
	# Clobbers: [$t0, $t1, $t2, $a0, $v0]
	#
	# Locals:
	#   - $t0: int i;
	#   - $t1: int j;
	#   - $t2: globals
	#   - $a0: syscall argument 
	#   - $v0: syscall number
	#
	# Structure:
	#   print_board_seperator_line
	#   -> [prologue]
	#       -> body
	#       -> line
	#           -> line_init
	#           -> line_cond
	#           -> line_body
	#           -> line_step
	#           -> line_end
	#           -> inner_line
	#               -> inner_line_init
	#               -> inner_line_cond
	#               -> inner_line_body
	#               -> inner_line_step
	#               -> inner_line_end
	#   -> [epilogue]

print_board_seperator_line__prologue:
print_board_seperator_line__body:
	li	$a0, BOARD_VERTICAL_SEPERATOR	# putchar(BOARD_VERTICAL_SEPERATOR);
	li	$v0, 11				#
	syscall					#

print_board_seperator_line__line_init:
	li	$t0, 0				# int i = 0;
print_board_seperator_line__line_cond:
	lw	$t2, board_width		#
	bge	$t0, $t2, print_board_seperator_line__line_end
						# while (i < board_width) {
print_board_seperator_line__line_body:

print_board_seperator_line__inner_line_init:
	li	$t1, 0				#     int j = 0;
print_board_seperator_line__inner_line_cond:
	bge	$t1, BOARD_CELL_SIZE + 2, print_board_seperator_line__inner_line_end
						#     while (j < BOARD_CELL_SIZE + 2) {
print_board_seperator_line__inner_line_body:
	li	$a0, BOARD_HORIZONTAL_SEPERATOR	#         putchar(BOARD_HORIZONTAL_SEPERATOR);
	li	$v0, 11				#
	syscall					#
print_board_seperator_line__inner_line_step:
	add	$t1, $t1, 1			#         j++;
	b	print_board_seperator_line__inner_line_cond
						#     }
print_board_seperator_line__inner_line_end:
	lw	$t2, board_width		#     if (i != board_width - 1) {
	sub	$t2, $t2, 1			#
	beq	$t2, $t0, print_board_seperator_line__line_step
						#

	li	$a0, BOARD_CROSS_SEPERATOR	#         putchar(BOARD_CROSS_SEPERATOR);
	li	$v0, 11				#
	syscall					#

print_board_seperator_line__line_step:		#     }
	add	$t0, $t0, 1			#     i++;
	b	print_board_seperator_line__line_cond
						# }
print_board_seperator_line__line_end:

	li	$a0, BOARD_VERTICAL_SEPERATOR	# putchar(BOARD_VERTICAL_SEPERATOR);
	li	$v0, 11				#
	syscall					#

	li	$a0, '\n'			# putchar('\n');
	syscall					#

print_board_seperator_line__epilogue:
	jr	$ra				# return;

#############################
## void process_command(); ##
#############################

################################################################################
# .TEXT <process_command>
	.text
process_command:
	# Subset:   provided
	#
	# Frame:    [$ra]
	# Uses:     [$t0, $t1, $a0, $v0]
	# Clobbers: [$t0, $t1, $a0, $v0]
	#
	# Locals:
	#   - $t0: char command;
	#   - $t1: globals
	#   - $a0: syscall argument
	#   - $v0: syscall number
	#
	# Structure:
	#   process_command
	#   -> [prologue]
	#       -> body
	#       -> good_parsing
	#           -> good_parsing_cond
	#           -> good_parsing_end
	#       -> up
	#           -> up
	#           -> up_in_bounds
	#       -> down
	#           -> down
	#           -> down_in_bounds
	#       -> right
	#           -> right
	#           -> right_in_bounds
	#       -> left
	#           -> left
	#           -> left_in_bounds
	#       -> quit
	#       -> fill
	#       -> help
	#       -> cheat
	#       -> unknown
	#       -> end_switch
	#   -> [epilogue]

process_command__prologue:
	push	$ra
process_command__body:
	la	$a0, cmd_waiting
	li	$v0, 4
	syscall

	li	$v0, 12
	syscall
	move	$t0, $v0
process_command__good_parsing_cond:
	bne	$t0, '\n', process_command__good_parsing_end
	li	$v0, 12
	syscall
	move	$t0, $v0
	b	process_command__good_parsing_cond
process_command__good_parsing_end:
	beq	$t0, 'w', process_command__up		# switch (command) {
	beq	$t0, 's', process_command__down		#
	beq	$t0, 'd', process_command__right	#
	beq	$t0, 'a', process_command__left		#
	beq	$t0, 'q', process_command__quit		#
	beq	$t0, 'e', process_command__fill		#
	beq	$t0, 'h', process_command__help		#
	beq	$t0, 'c', process_command__cheat	#
	b	process_command__unknown		#
process_command__up:					#     case 'w':
	lw	$t0, selected_row			#         selected_row = MAX(selected_row - 1, 0);
	sub	$t0, $t0, 1				#
	bge	$t0, 0, process_command__up_in_bounds	#
	li	$t0, 0					#
process_command__up_in_bounds:
	sw	$t0, selected_row			#
	b	process_command__end_switch		#         break;
process_command__down:					#     case 's':
	lw	$t0, selected_row			#         selected_row = MIN(selected_row + 1, board_height - 1);
	add	$t0, $t0, 1				#
	lw	$t1, board_height			#
	sub	$t1, $t1, 1				#
	ble	$t0, $t1, process_command__down_in_bounds
							#
	move	$t0, $t1				#
process_command__down_in_bounds:			#
	sw	$t0, selected_row			#
	b	process_command__end_switch		#         break;
process_command__right:					#     case 'd':
	lw	$t0, selected_column			#         selected_column = MIN(selected_column + 1, board_width - 1)
	add	$t0, $t0, 1				#
	lw	$t1, board_width			#
	sub	$t1, $t1, 1				#
	ble	$t0, $t1, process_command__right_in_bounds
							#
	move	$t0, $t1				#
process_command__right_in_bounds:			#
	sw	$t0, selected_column			#
	b	process_command__end_switch		#         break;
process_command__left:					#     case 'a':
	lw	$t0, selected_column			#         selected_column = MAX(selected_column - 1, 0);
	sub	$t0, $t0, 1				#
	bge	$t0, 0, process_command__left_in_bounds	#
	li	$t0, 0					#
process_command__left_in_bounds:			#
	sw	$t0, selected_column			#
	b	process_command__end_switch		#         break;
process_command__quit:					#     case 'q':
	li	$v0, 10					#         exit(0);
	syscall						#
process_command__fill:					#     case 'e':
	jal	do_fill					#         do_fill();
	b	process_command__end_switch		#         break;
process_command__help:					#     case 'h':
	jal	print_welcome				#         print_welcome();
	b	process_command__epilogue		#         return;
process_command__cheat:					#     case 'c':
	jal	print_optimal_solution			#         print_optimal_solution();
	b	process_command__epilogue		#         return;
process_command__unknown:				#     default:
	la	$a0, str_process_command_unknown	#         printf("Unknown command: ");
	li	$v0, 4					#
	syscall						#

	move	$a0, $t0				#         putchar(command);
	li	$v0, 11					#
	syscall						#

	li	$a0, '\n'				#         putchar('\n')
	syscall						#
	b	process_command__epilogue		#         return;
process_command__end_switch:				# }

	la	$a0, game_board
	jal	print_board				# print_board(game_board);

process_command__epilogue:
	pop	$ra
	jr	$ra					# return;
