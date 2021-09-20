# Ramiro el Vampiro en el Bosque del Suspiro

Original version as it appeared in the [Mojon Twins Covertape #2](https://www.mojontwins.com/juegos_mojonos/mojon-twins-covertape-2/) in 2013. A revamped version was released physically and digitally later in 2016.

This game has a small custom function that's added to `msc_extern.h` which was the easiest and less intrussive way to add custom functions.

msc.bas got some revamp, such as the new flip-flop setters and checkers for flags 0-15, which go as follows:

- Conditional opcodes 0xAX mean "IF FLAG X = 0"
- Conditional opcodes 0xBX mean "IF FLAG X != 0"
- Action opcodes 0xAX mean "SET FLAG X = 0"
- Action opcodes 0xBX mean "SET FLAG X = 1"

This is not done automagically. You need to pass "flipflops" as parameter, as this will only be a benefit sometimes.
