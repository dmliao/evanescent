# Evanescent

A flash AS3 game I made in 2012, open sourced in 2014.

[Play it here](http://www.kongregate.com/games/BeastAmorphous/evanescent?acomplete=evanescent)

> A whimsical, flash-based bullet hell shooter that takes you through 2 parallel worlds in a child’s dream.

![](http://beastamorphous.com/wp-content/uploads/2013/03/evshot5.jpg)

![](http://beastamorphous.com/wp-content/uploads/2013/03/evshot4.jpg)

## Building from Source

I used FlashDevelop. However, I wrote this game back several versions of FlashDevelop, so in its base form, will not build on FlashDevelop 4 (the latest version at the time of writing.)

Since FlashDevelop's settings can vary from computer to computer, you'll need to create a new AS3 project (not Flex or AIR, unless you know what you're doing) in the root folder for the repository.

**Make sure that FlashDevelop's templates do not overwrite the Main.as or Preloader.as files in the repository!**

## Libraries

This game uses [Flashpunk](http://useflashpunk.net/), [Gamepad](https://github.com/iainlobb/Gamepad), an [AS3 Fluid Solver](https://code.google.com/p/in-spirit/wiki/FluidSolver) and an [AS3 Fluid Fire Library](https://github.com/dmliao/as3-2d-fire), in packages within the code.

All original game code can be found in `src/DryErase` and `src/Worlds`. (The working title of this game was Dry Erase before it became Evanescent, hence the legacy folder title.)

## License

See the included `LICENSE` file for licensing details. Please note that since this game was built without package managers, different parts of the code may have different licenses.