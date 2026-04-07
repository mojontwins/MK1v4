// MTE MK1 v3.2
// Copyleft 2011, 2025 by The Mojon Twins

// config.h 

#define MIN_FAPS_PER_FRAME 			2		// 50 / N fps if possible
#define BLACK_PEN		 			1		// For CPC, which pen is black?
#define AUTO_SPLIT 							// For CPC, but hud must be 32 raster on top and MODE 1
//#define ALWAYS_SPLIT 						// Useful for DIRECT_TO_PLAY
//#define NO_PAL_MAP 						// For CPC, with AUTO_SPLIT, only one pal (my_inks)

// ============================================================================
// I. General configuration
// ============================================================================

// In this section we define map dimmensions, initial and authomatic ending conditions, etc.

#define MAP_W						20		//
#define MAP_H						3		// Map dimmensions in screens
#define SCR_INICIO					0		// Initial screen
#define PLAYER_INI_X				2		//
#define PLAYER_INI_Y				2		// Initial tile coordinates
//#define SCR_FIN 					99		// Last screen. 99 = deactivated.
//#define PLAYER_FIN_X				99		//
//#define PLAYER_FIN_Y				99		// Player tile coordinates to finish game
#define PLAYER_NUM_OBJETOS			24		// Objects to get to finish game
#define PLAYER_LIFE 				10		// Max and starting life gauge.
#define PLAYER_REFILL				1		// Life recharge

// ============================================================================
// II. Engine type
// ============================================================================

// This section is used to define the game engine behaviour. Many directives are related,
// and others are mutually exclusive. I think this will be pretty obvious when you look at them. 

// Right now the shooting engine is only compatible with the side-view engine.

// General directives:
// -------------------

//#define PLAYER_PUSH_BOXES 				// If defined, tile #14 is pushable
//#define DIRECT_TO_PLAY					// If defined, title screen is also the game frame.
//#define DEACTIVATE_KEYS					// If defined, keys are not present.
//#define DEACTIVATE_OBJECTS				// If defined, objects are not present.
//#define ONLY_ONE_OBJECT					// If defined, only one object can be carried at a time.
//#define OBJECT_COUNT				1		// Defines which FLAG will be used to store the object count.
//#define DEACTIVATE_EVIL_TILE				// If defined, no killing tiles (behaviour 1) are detected.
//#define PLAYER_BOUNCES					// If defined, collisions make player bounce
#define PLAYER_FLICKERS 				 	// If defined, collisions make player flicker instead.
//#define ENABLE_BOTIBOINS					// If defined, enable botiboins on beh 2.

// Shooting behaviour (only side view!)
// ------------------------------------
//#define PLAYER_CAN_FIRE 					// If defined, shooting engine is enabled.
//#define PLAYER_BULLET_SPEED 		8		// Pixels/frame. 
//#define MAX_BULLETS 				3		// Max number of bullets on screen. Be careful!.
//#define PLAYER_BULLET_Y_OFFSET	4		// vertical offset from the player's top.
//#define ENEMS_LIFE_GAUGE			5		// Amount of shots needed to kill enemies.
//#define PLAYER_AX_RECOIL 			128		// Push player back a bit when firing

// Random Respawn Fanties
// ----------------------
//#define RANDOM_RESPAWN					// If defined, automatic flying enemies spawn on killed enemies
//#define FANTY_MAX_V 				256 	// Flying enemies max speed.
//#define FANTY_A 					12		// Flying enemies acceleration.
//#define FANTIES_LIFE_GAUGE		10		// Amount of shots needed to kill flying enemies.

// Make your own!
// --------------
#define ENABLE_CUSTOM_ENEMS					// Create your custom enemies in `custom.h`

// Scripting
// ---------

//#define ACTIVATE_SCRIPTING				// Activates msc scripting and flag related stuff.
//#define SCRIPTING_DOWN					// Use DOWN as the action key.
//#define SCRIPTING_KEY_M					// Use M as the action key instead.
											// If none are selected, FIRE is used.
//#define NO_INDEXED_SCRIPTING 				// You aren't using * SCREEN * sections.
//#define ENABLE_ENCODED_TEXT 				// Add support for TEXT BOX

// Top view:
// ---------

//#define PLAYER_MOGGY_STYLE				// Enable top view.
//#define FAKE_SIDE_VIEW 					// For gravity 0 games! Needs PLAYER_MOGGY_STYLE enabled.

// Side view:
// ----------

#define PLAYER_HAS_JUMP 					// If defined, player is able to jump.
//#define PLAYER_HAS_JETPAC 				// If defined, player can thrust a vertical jetpac
//#define PLAYER_KILLS_ENEMIES		  		// If defined, stepping on enemies kills them
//#define PLAYER_MIN_KILLABLE 	3			// Only kill enemies with id >= PLAYER_MIN_KILLABLE
#define SIMPLE_PLATFORMS 					// No type 4 tiles or no type 8s over type 4s.
//#define AVOID_PLATFORM_HOP 				// Only works if SIMPLE_PLATFORMS is DISABLED!
#define JUMP_DOWN_PLATFORM 					// Use down on type 4s to jump down.

// Custom:
// -------

#define PLAYER_CUSTOM_VENG 					// Replace Vertical axis for your own 
//#define PLAYER_CUSTOM_HENG 				// Replace Horizontal axis for your own
#define PLAYER_CUSTOM_FRAME 				// Replace frame number selection for your own
//#define PLAYER_CUSTOM_BG_HIT 				// Implement your own bounce.

#define CUSTOM_SPRITE_CELLS 				// Use your own sprite cell luts from custom_sprite_cells.h
#define ENEMS_CELL_OFFSET 			16 		// If the above is defined, this is the 1st cell for the enemies.

// ============================================================================
// III. Screen configuration
// ============================================================================

// This sections defines how stuff is rendered, where to show counters, etcetera
// It's good practice to comment what you are not using!

#define VIEWPORT_X					1		//
#define VIEWPORT_Y					2		// Viewport character coordinates
#define LIFE_X						7		//
#define LIFE_Y						1		// Life gauge counter character coordinates
#define OBJECTS_X					18		//
#define OBJECTS_Y					1		// Objects counter character coordinates
//#define OBJECTS_ICON_X			9		// 
//#define OBJECTS_ICON_Y			21		// Objects icon character coordinates (use with ONLY_ONE_OBJECT)
#define KEYS_X						28		//
#define KEYS_Y						1		// Keys counter character coordinates
//#define KILLED_X					20		//
//#define KILLED_Y					21		// Kills counter character coordinates
//#define ITEM_X 					7		// 
//#define ITEM_Y 					0 		//
//#define ITEM_FLAG 				0 		// Show item @ flag
//#define TEXT_X 					4		//
//#define TEXT_Y					3		// To use TEXT from the script
//#define TEXT_A 					71      // (Speccy only) text atribute.

// Graphic FX, uncomment which applies...

//#define USE_AUTO_SHADOWS				// Automatic shadows made of darker attributes
//#define USE_AUTO_TILE_SHADOWS			// Automatic shadows using specially defined tiles 32-47.
//#define UNPACKED_MAP					// Full, uncompressed maps. Shadows settings are ignored.
//#define RLE_MAP 					53 	// Use RLE compression (values 44, 54, 62; see docs)
//#define NO_MASKS		sp_OR_SPRITE 	// Sprites are rendered using OR instead of masks.
//#define PLAYER_ALTERNATE_ANIMATION	// If defined, animation is 1,2,3,1,2,3... 
#define NO_ALT_BG 						// No subs 0 for 19 at random
//#define HOTSPOTS_FIRST_TILE		32 	// Override default value of 16
#define REVERSE_OBJECT_COUNT 			// Count objects left rather than objects got
//#define ENABLE_ANIMATED_TILES 	46  // Must be EVEN
//#define TILANIM_PERIOD 			16  // Must be power of two

// ============================================================================
// IV. Player movement configuration
// ============================================================================

// This section is used to define which constants are used in the gravity/acceleration engine.
// If a side-view engine is configured, we have to define vertical and horizontal constants
// separately. If a top-view engine is configured instead, the horizontal values are also
// applied to the vertical component, vertical values are ignored.

// IV.1. Vertical movement. Only for side-view.

#define PLAYER_MAX_VY_CAYENDO	512 	// Max falling speed (512/64 = 8 pixels/frame)
#define PLAYER_G				32		// Gravity acceleration (32/64 = 0.5 píxeles/frame^2)

#define PLAYER_VY_INICIAL_SALTO 64		// Initial junp velocity (64/64 = 1 píxel/frame)
#define PLAYER_MAX_VY_SALTANDO	320 	// Max jump velocity (320/64 = 5 píxels/frame)
#define PLAYER_INCR_SALTO		48		// acceleration while JUMP is pressed (48/64 = 0.75 píxeles/frame^2)

#define PLAYER_INCR_JETPAC		32		// Vertical jetpac gauge
#define PLAYER_MAX_VY_JETPAC	256 	// Max vertical jetpac speed

// IV.2. Horizontal (side view) or general (top view) movement.

#define PLAYER_MAX_VX			192 	// Max velocity (192/64 = 3 píxels/frame)
#define PLAYER_AX				24		// Acceleration (24/64 = 0,375 píxels/frame^2)
#define PLAYER_RX				32		// Friction (32/64 = 0,5 píxels/frame^2)

// ============================================================================
// V. Tile behaviour
// ============================================================================

// Defines the behaviour for each tile. Remember that if keys are activated, tile #15 is a bolt
// and, therefore, it should be made a full obstacle!

// 0 = Walkable (no action)
// 1 = Walkable and kills.
// 2 = Walkable and hides.
// 4 = Platform (only stops player if falling on it)
// 8 = Full obstacle (blocks player from all directions)

// 128|N = Special tile (scripting)

unsigned char comportamiento_tiles [] = {
	0, 8, 8, 8, 0, 0, 0, 0, 0, 0, 0, 8, 8, 1, 8, 8,
	8, 0, 8, 1, 0, 8, 8, 8, 8, 8, 0, 8, 8, 8, 8, 8,
	0, 0, 0, 0, 0
};

// On CPC, using MODE_1 and AUTO_SPLIT, add here your custom palete includes
// Then change cpc/palmap.h
#if defined CPC && defined MODE_1 && defined AUTO_SPLIT

	#include "cpc/pal0.h"
	#include "cpc/pal1.h"
	#include "cpc/pal2.h"

#endif
