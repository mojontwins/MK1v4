// MTE MK1 v4.8
// Copyleft 2010-2013, 2020-2021 by The Mojon Twins

// ============================================================================
// I. General configuration
// ============================================================================

//#define MODE_128K_DUAL					// Uses AY Routines in RAM1 if on 128K mode.
#define MIN_FAPS_PER_FRAME			2		// Limits the max # of fps to 50/N

// Arkos support. Get the addresses from ogt/RAM1.map.txt after compiling RAM1.bin

//#define ENABLE_ARKOS
//#define ARKOS_SFX_CHANNEL 			1
//#define ARKOS_RAM 					1
//#define ARKOS_ADDRESS_ATPLAY 			0xC000 	
//#define ARKOS_ADDRESS_ATSTOP 			0xC6E1
//#define ARKOS_ADDRESS_ATSFXSTOPALL	0xC6F7
//#define ARKOS_ADDRESS_ATSFXPLAY 		0xC704
//#define ARKOS_ADDRESS_MT_LOAD_SONG	0xC7FC
//#define ARKOS_ADDRESS_MT_INIT 		0xC81C

//#define ENABLE_WYZ
//#define WYZ_RAM 						1
//#define WYZ_ADDRESS_PLAYERINIT		0xC018	// INIT_BUFFERS		EQU 0C018H
//#define WYZ_ADDRESS_PLAYERISR			0xC000	// INICIO			EQU 0C000H
//#define WYZ_ADDRESS_SFX_PLAY			0xC47E	// INICIA_EFECTO	EQU 0C46BH
//#define WYZ_ADDRESS_MT_LOAD_SONG		0xC087	// CARGA_CANCION	EQU 0C087H
//#define WYZ_ADDRESS_PLAYER_OFF		0xC062	// PLAYER_OFF		EQU 0C062H

// In this section we define map dimmensions, initial and authomatic ending conditions, etc.

#define MAP_W						8		//
#define MAP_H						8		// Map dimmensions in screens
#define TOTAL_SCREENS				64		// 
#define SCR_INICIO					16		// Initial screen
#define PLAYER_INI_X				(ini_x [level])		//
#define PLAYER_INI_Y				(ini_y [level])		// Initial tile coordinates
//#define SCR_FIN 					99		// Last screen. 99 = deactivated.
//#define PLAYER_FIN_X				99		//
//#define PLAYER_FIN_Y				99		// Player tile coordinates to finish game
#define PLAYER_NUM_OBJETOS			(hostages [level])	// Objects to get to finish game
#define PLAYER_LIFE 				10		// Max and starting life gauge.
#define PLAYER_REFILL				1		// Life recharge

#define LINEAR_ENEMY_HIT			1		// Amount of life to substract when normal enemy hits
//#define FLYING_ENEMY_HIT			1		// Amount of life to substract when flying enemy hits

#define ENABLE_CODE_HOOKS					// Hooks @ init, entering game, screen & loop @ custom.h
#define ENABLE_CUSTOM_ENEMS 				// Hooks for custom enemies @ custom.h

// ============================================================================
// II. Engine type
// ============================================================================

// This section is used to define the game engine behaviour. Many directives are related,
// and others are mutually exclusive. I think this will be pretty obvious when you look at them. 

// Right now the shooting engine is only compatible with the side-view engine.

// General directives:
// -------------------

#define DIRECT_TO_PLAY						// If defined, title screen is also the game frame.
//#define DEACTIVATE_KEYS					// If defined, keys are not present.
//#define DEACTIVATE_OBJECTS				// If defined, objects are not present.
//#define ONLY_ONE_OBJECT					// If defined, only one object can be carried at a time.
//#define DEACTIVATE_EVIL_TILE				// If defined, no killing tiles (behaviour 1) are detected.
#define EVIL_TILE_SIMPLE					// For side view, only hit from below.
#define DEACTIVATE_EVIL_ZONE				// Zones kill you after a while. Read docs or ask na_th_an
//#define EVIL_ZONE_FRAME_COUNT		8		// For countdown in an evil zone.
//#define EVIL_ZONE_BEEPS_COUNT		32		// # of counts before killing
//#define EVIL_ZONE_FREQ 			3 		// if defined to N kill every M^2 frames; N=M^2-1,  
//#define EVIL_ZONE_CONDITIONAL 			// Active if scenery_info.evil_zone_active
//#define PLAYER_BOUNCES					// If defined, collisions make player bounce
#define PLAYER_FLICKERS 			50	 	// If defined, collisions make player flicker for N frames.
//#define DEACTIVATE_REFILLS				// If defined, no refills.
//#define LEGACY_REFILLS 					// Legacy mode: refills appear in place of collected items/keys
#define MAX_FLAGS					1		// Number of flags. For scripting and stuff.
//#define PLAYER_DIZZY 						// The Hobbit
#define ENEMIES_LIFE_GAUGE			1		// Amount of shots/hits needed to kill enemies.
//#define ENEMIES_MAY_BE_PARALIZED 			// Custom paralyze enemies.
//#define PARALYZED_DONT_KILL 				// Enemies don't kill while paralyzed
//#define ENEMIES_COLLIDE 					// Check collisions for linear enemies
#define PLATFORMS_ON_FLAG 			0		// If defined, only move platforms if flag N is 1

//#define PACKED_ENEMS 						// Packed XY1, XY2 format.
//#define FIXED_ENEMS_LIMITS 				// x1, x2, y1, y2 won't change.

// Coins engine
// ------------

//#define USE_COINS							// Coin engine activated
//#define COIN_TILE					13		// Coin is tile #X
//#define COIN_BEH 					16 		// Detect coin by behaviour rather than tile nº
//#define COIN_FLAG					1		// Coins are counted in flag #N
//#define COINS_REFILL 				1		// If defined, add this to player.life
//#define COIN_TILE_DEACT_SUBS		0		// Substitute with this tile if coins are OFF.
//#define COINS_DEACTIVABLE					// Coins can be hidden.
//#define COINS_SCRIPTING 					// Run script when player gets coin
//#define COINS_PERSISTENT	 				// Turns on PERSISTENCE which takes 20*MAP_W*MAP_H bytes

// Fixed screens engine
// --------------------

//#define FIXED_SCREENS						// If defined, you can't exit a screen running off an edge
//#define SHOW_LEVEL_INFO					// If defined, show "LEVEL XX" before level start, XX=n_pant
//#define SHOW_LEVEL_SUBLEVEL				// If defined, level # is XX/YY using y_map and x_map resp.
//#define RESPAWN_REENTER 					// If you die, reenter screen. (redraw)
//#define RESPAWN_SHOW_LEVEL				// Besides, show level info.
//#define RESPAWN_FLICKER					// Start level flickering.
//#define RESET_BODY_COUNT_ON_ENTER			// Reset body count when entering new screen
//#define USE_SUICIDE_KEY

// Boxes engine
// ------------

#define PLAYER_PUSH_BOXES 					// If defined, tile #14 is pushable
#define PUSH_OVER_FLOOR 					// Must be on floor to push
#define PUSH_AND_PULL 						// Use fire+LEFT/RIGHT to push/pull in side view
#define PUSH_AND_PULL_PILES 				// Can push/pull piles of stacked boxes
//#define PUSH_ON_FLOOR 					// Player MUST be on floor to push/pull
#define PLAYER_GRAB_FRAME 			2		// Use with PUSH_AND_PULL, which frame 0-3.
//#define FALLING_BOXES						// If defined, boxes can fall off ledges.
//#define FALLING_BOXES_SPEED 		4		// Boxes fall every nth frame.
//#define ENEMIES_BLOCK_BOXES				// If defined, you can't push a box if it collides an enemy
//#define BOXES_KILL_ENEMIES				// If defined, falling boxes can kill enemies.
//#define BOXES_ONLY_KILL_TYPE 		1		// If defined, only enemies type N can be killed with boxes.
//#define BOXES_KILL_PLAYER					// If defined, falling boxes can kill the player.

// Shooting behaviour (only side view!)
// ------------------------------------

//#define PLAYER_CAN_FIRE 					// If defined, shooting engine is enabled.
//#define PLAYER_BULLET_SPEED 		8		// Pixels/frame. 
//#define MAX_BULLETS 				3		// Max number of bullets on screen. Be careful!.
//#define PLAYER_BULLET_Y_OFFSET	4		// vertical offset from the player's top.
//#define PLAYER_AX_RECOIL 			128		// If defined, recoil.

//#define FIRING_DRAINS_LIFE				// If defined, firing drains life (oi!)
//#define FIRING_DRAIN_AMOUNT		2		// what to substract when firing.

// Sword
// -----

#define ENABLE_SWORD 						// Let the player swing a sword
//#define SWORD_UP 							// Can hit upwards
#define SWORD_LINEAL_DAMAGE			1		// Damage to linear.
#define SWORD_FLYING_DAMAGE 		0		// Damage to flying.
//#define SWORD_PARALYZES			32		// If defined, paralyze for N frames
#define SWORD_HIT_FRAME 			2		// Frame to render 0-3
//#define GENITAL_HIT_FRAMES 				// Add 4 cells to the spriteset in genital
#define SWORD_STAB 					5		// Rather than swing, stab at height N

// Breakable
// ---------

//#define ENABLE_BREAKABLE 					// Enable breakable tiles (& 32)
//#define MAX_BREAKABLE_FRAMES 		8 		// N = frames to display this tile:
//#define BREAKABLE_BREAKING_TILE 	45		// display this for N frames
//#define BREAKABLE_ERASE_TILE 		0		// The substitute by this tile.
//#define BREAKABLE_SPAWN_CHANCE  	3 		// Must be a power of 2 - 1, ifdef there's a chance to spawn...
//#define BREAKABLE_SPAWN_TILE    	46 		// Throw this tile if rand() & chance == 1.
//#define BREAKABLE_PERSISTENT 				// Turns on PERSISTENCE which takes 20*MAP_W*MAP_H bytes.

// Persistence
// -----------

//#define ENABLE_PERSISTENCE				// Turned on automaticly if needed, but you can do it manually
//#define PERSIST_CLEAR_TILE 		0 		// Clear persistent bit this tile

// Frigoababol
// -----------

//#define ENABLE_FRIGOABABOL 				// Player can be frozen
//#define FRIGO_MAX_FRAMES 			32		// # of frames to be frozen. Can be decreased via ...
//#define FRIGO_UNFREEZE_TIME 				// state counter decreases automaticly.
//#define FRIGO_UNFREEZE_FIRE 				// state counter decreases pressing fire. You can activate both
//#define FRIGO_NO_FIRE 					// Can't fire nor swing your sword while frozen
//#define FRIGO_FIGHT 						// Modify vx, vy while frozen when pressing fire.
//#define FRIGO_ENEMIES_FREEZE 				// Enemies freeze the player on touch.
//#define FRIGO_FROZEN_NO_RX 				// No PLAYER_RX while frozen!

// Slippery tiles
// --------------

//#define SLIPPERY_TILES 					// Tiles with beh & 16 are slippery.

// Conveyor tiles
// --------------

//#define CONVEYOR_TILES 					// Tiles with beh & 2 are conveyors.

// Quicksand tiles (side view)
// ---------------------------

//#define QUICKSAND_TILES 					// Tiles with beh & 64 are quicksands.

// Miscellaneous fanty stuff
// -------------------------

#define PLAYER_CAN_HIDE						// If defined, tile type 2 hides player.
#define HIDDEN_CAN_MOVE 					// Originally, if you are moving you are not hidden. Override.
//#define RANDOM_RESPAWN					// If defined, automatic flying enemies spawn on killed enemies
//#define USE_TYPE_6						// If defined, type 6 enemies are enabled.
//#define USE_SIGHT_DISTANCE				// If defined, type 6 only pursue you within sight distance
//#define SIGHT_DISTANCE			120		
//#define FANTY_MAX_V 				256 	// Flying enemies max speed.
//#define FANTY_A 					16		// Flying enemies acceleration.
//#define FANTIES_LIFE_GAUGE		10		// Amount of shots needed to kill flying enemies.
//#define MAKE_TYPE_6						// Create fanties for missing enemies if scenery_info.make_type_6

// Quadrators
// ----------

//#define ENABLE_CUADRATORS					// Enable QUADRATORS, enemy type 7-10

// Patrulleros marrulleros genitales
// ---------------------------------

//#define ENABLE_MARRULLERS 				// Enable MARRULLERS, enemy type 11-14

// Scripting
// ---------

//#define ACTIVATE_SCRIPTING				// Activates msc scripting and flag related stuff.
//#define WIN_ON_SCRIPTING					// Game can only be won using WIN GAME in the script
//#define SCRIPTING_DOWN					// Use DOWN as the action key.
//#define COUNT_KILLABLE_ON			2		// Count killable enemies on flag #N (per screen basis)
//#define SCRIPTING_KEY_M					// Use M as the action key instead.
//#define OBJECTS_ON_VAR			2		// If defined, only show objects if var # is set.
//#define OBJECT_COUNT				3		// Defines which FLAG will be used to store the object count.
//#define REENTER_ON_ALL_OBJECTS			// If set, re-enter screen when all objects are got, instead of ending

// Top view:
// ---------

//#define PLAYER_MOGGY_STYLE				// Enable top view.
//#define LOOK_AT_THE_CAMERA				// Use "walk down" cell if player is idle
//#define PLAYER_NO_INERTIA					// Disable inertia
//#define PLAYER_CONST_V			256		// Constant speed

// Side view:
// ----------

#define PLAYER_HAS_JUMP 					// If defined, player is able to jump.
#define SHORT_PLAYER 						// Bounding box 12x16
#define BETTER_VERTICAL_CONNECTIONS			// Better vertical connections in side view, but heavier
//#define FIRE_TO_JUMP 						// Jump using the fire button, only if no PLAYER_CAN_FIRE
//#define BOTH_KEYS_JUMP					// Jump using UP *or* FIRE, beware, deact if PLAYER_CAN_FIRE!
//#define RAMIRO_HOP 						// press jump when reaching a type 4 platform to jump again 
//#define RAMIRO_HOVER 						// press down to hover
//#define HOVER_WITH_JUMP_ALSO 				// use jump to hover as well
//#define PLAYER_HAS_JETPAC 				// If defined, player can thrust a vertical jetpac
//#define JETPAC_DRAINS_LIFE				// If defined, flying drains life.
//#define JETPAC_DRAIN_RATIO		3		// Drain 1 each X frames.
//#define JETPAC_DRAIN_OFFSET		8		// Drain after X frames.
//#define PLAYER_KILLS_ENEMIES			  	// If defined, stepping on enemies kills them
#define PLAYER_MIN_KILLABLE 		3		// Only kill enemies with id >= PLAYER_MIN_KILLABLE
//#define PLAYER_MAX_KILLABLE 		6 		// Only kill enemies if id <= PLAYER_MAX_KILLABLE

// Very special things which you may find useful
// ---------------------------------------------

//#define MASTER_OF_KEYS 					// If master_of_keys == 1, no keys are needed to open bolts
											// and keys = refills.
//#define PARALYZED_DONT_KILL_ON_VAR 		// If paralyzed_dont_kill == 1, paralyzed enemies don't kill
//#define RAMIRO_HOVER_ON_VAR 				// If ramiro_hover == 1 player can hover.
//#define DISABLE_SLIPPERY_ON_VAR 			// If disable_slippery == 1, slippery tiles are disabled

// ============================================================================
// III. Screen configuration
// ============================================================================

// This sections defines how stuff is rendered, where to show counters, etcetera

#define VIEWPORT_X					1		//
#define VIEWPORT_Y					0		// Viewport character coordinates

#define LIFE_X						13		//
#define LIFE_Y						22		// Life gauge counter character coordinates
//#define DRAW_HI_DIGIT	
//#define LIFE_H_X 					1
//#define LIFE_H_Y					8

#define OBJECTS_X					20		//
#define OBJECTS_Y					22		// Objects counter character coordinates
//#define OBJECTS_ICON_X			2		// 
//#define OBJECTS_ICON_Y			21		// Objects icon character coordinates (use with ONLY_ONE_OBJECT)
#define REVERSE_OBJECT_COUNT 				// Count from PLAYER_NUM_OBJETOS to 0

#define KEYS_X						27		//
#define KEYS_Y						22		// Keys counter character coordinates

//#define SHOW_KILLED
//#define SHOW_TOTAL
//#define KILLED_X					20		//
//#define KILLED_Y					21		// Kills counter character coordinates

// Use this to show tile = ITEM_FIRST_TILE + flags [ITEM_IN_FLAG] - 1 at coordinates
// ITEM_SHOW_X, ITEM_SHOW_Y.

//#define PLAYER_SHOW_ITEM					// If defined, current item is shown (scripting needed)
//#define ITEM_IN_FLAG				4		// Which flag is used to store current item.
//#define ITEM_FIRST_TILE			17		// First tile in tileset representing an object
//#define ITEM_SHOW_X				2		//
//#define ITEM_SHOW_Y				21		// Position

//#define COINS_X 					12 		// Coins coint character coordinates
//#define COINS_Y					23

//#define EVIL_GAUGE_X				21		// For evil zone counters
//#define EVIL_GAUGE_Y				23

// Line of text

//#define LINE_OF_TEXT				23
//#define LINE_OF_TEXT_X			1
//#define LINE_OF_TEXT_SUBSTR		2
//#define LINE_OF_TEXT_ATTR 		7		

#define GAME_OVER_ATTR				15

// Graphic FX, uncomment which applies...

//#define USE_AUTO_SHADOWS					// Automatic shadows made of darker attributes
//#define USE_AUTO_TILE_SHADOWS				// Automatic shadows using specially defined tiles 32-47.
//#define UNPACKED_MAP						// Full, uncompressed maps. Shadows settings are ignored.
//#define COLUMN_MAP 						// Do not check horizontal screen flicks
//#define ROW_MAP 							// Do not check vertical screen flicks
//#define NO_ALT_BG							// No alternative tile 19 for bg = 0
#define NO_MAX_ENEMS						// Less than 3 enems in some screens
//#define PLAYER_ALTERNATE_ANIMATION		// If defined, animation is 1,2,3,1,2,3... 
//#define TWO_SETS							// If defined, two sets of tiles. Second set is activated if
#define TWO_SETS_REAL 						// Tiles have their real value in map_buff
#define TWO_SETS_CONDITION	((map_behaviours [n_pant] & 1) ? 32 : 0)	// Must return 32 if second tileset is active, 0 otherwise.
//#define MAPPED_TILESETS 					// Like packed but tiles are mapped with array tileset_mappings
//#define RLE_MAP 					62 		// Use RLE compression (values 44, 54, 62; see docs)

// Stupid animated tiles
#define ENABLE_ANIMATED_TILES 				// Enables them
#define ANIMATED_TILE 				11 		// Which tile. Alternates with N + 16
#define MAX_ANIMATED_TILES 			16 		// Must be a power of two

// ============================================================================
// IV. Player movement configuration
// ============================================================================

// This section is used to define which constants are used in the gravity/acceleration engine.
// If a side-view engine is configured, we have to define vertical and horizontal constants
// separately. If a top-view engine is configured instead, the horizontal values are also
// applied to the vertical component, vertical values are ignored.

// IV.1. Vertical movement. Only for side-view.

#define PLAYER_MAX_VY_CAYENDO		512 	// Max falling speed (512/64 = 8 pixels/frame)
#define PLAYER_G					32		// Gravity acceleration (32/64 = 0.5 píxeles/frame^2)

#define PLAYER_MAX_VY_CAYENDO_H 	256		// For RAMIRO_HOVER
#define PLAYER_G_HOVER 				4

#define PLAYER_VY_INICIAL_SALTO		64		// Initial junp velocity (64/64 = 1 píxel/frame)
#define PLAYER_MAX_VY_SALTANDO		256 	// Max jump velocity (320/64 = 5 píxels/frame)
#define PLAYER_INCR_SALTO			32		// acceleration while JUMP is pressed (48/64 = 0.75 píxeles/frame^2)

#define PLAYER_INCR_JETPAC			48		// Vertical jetpac gauge
#define PLAYER_MAX_VY_JETPAC		384 	// Max vertical jetpac speed

// IV.2. Horizontal (side view) or general (top view) movement.

#define PLAYER_MAX_VX				192 	// Max velocity (192/64 = 3 píxels/frame)
#define PLAYER_AX					24		// Acceleration (24/64 = 0,375 píxels/frame^2)
#define PLAYER_RX					32		// Friction (32/64 = 0,5 píxels/frame^2)

#define PLAYER_AX_SLIPPERY 			8
#define PLAYER_RX_SLIPPERY 			8

#define PLAYER_VX_CONVEYORS 		128

#define PLAYER_AX_QUICKSANDS 		8
#define PLAYER_RX_QUICKSANDS 		64
#define PLAYER_MAX_VX_QUICKSANDS 	64
#define PLAYER_VY_SINKING 			4

// ============================================================================
// V. Tile behaviour
// ============================================================================

// Defines the behaviour for each tile. Remember that if keys are activated, tile #15 is a bolt
// and, therefore, it should be made a full obstacle!

// 0 = Walkable (no action)
// 1 = Walkable and kills.
// 2 = Walkable and hides/conveyor
// 4 = Platform (only stops player if falling on it)
// 8 = Full obstacle (blocks player from all directions)
// 16 = Slippery
// 32 = Breakable
// 64 = Quicksands

unsigned char comportamiento_tiles [] = {
	2, 8, 8, 8, 8, 0, 0, 0, 4, 6, 2, 1, 0, 4, 8, 8,
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 8,
	0, 0, 0, 0, 4, 4, 4, 4, 0, 4, 0, 0, 0, 8, 8, 2,
};
