# MSC 4

The idea is to generate assembly code that can be assembled to $C000 and tucked away in a RAM page, no interpreter needed. Problem is... How to call to base "printer" methods?

That's a problem I can't solve with the old z88dk but I *need* this for old v4 programs so... 

Main gripe is that the interpreter usually takes much LOW ram so putting the interpreted script code in extra RAM is a save but not as much.

Maybe have a minimal driver in low ram rather than an interpreter. Things that need to be accessed from the script code:

- The printer to read and write tiles.
- All player values (read / write).

Maybe a function pointer array in low ram with set up entry points to all needed functions / structures?

Need to thing about this DEEPLY.

On startup : Write the address of flags, player object, set tile / set map tile functions, current screen buffers, hotspot data. On entering, update a pointer to the current screen enemies.

Most of that stuff is static so maybe I could patch it in before assembling using the MAP file output by the compiler to extract the addresses.

# MSC 4 For legacy

An interpreter more suited for no extra RAM systems should also be easy to craft. The idea would be generating a z88dk assembly file.

