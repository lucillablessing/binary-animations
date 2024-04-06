# binary-animations

a repository for source code of the program used to make animations for the video essay *the best way to count* and its OST music video.

## File format

*binary animations* loads animation files; those are just zip files with any name which have a lua file with the same name (apart from the extension changing from `.zip` to `.lua`) within their **root** directory. for example, a zip file named `binary.zip` containing within its root directory a file named `binary.lua` is a valid animation file. any other files within the zip are assets, and are free to be organized in whatever way.

this lua file will be `require`'d upon loading the program, and should `return` a lua table with the following keys:

* `init`: a function called when the program is first loaded;
* `start`: a function called when you press space while the animation is not active;
* `advance`: a function called when you press space while the animation is active (optional);
* `update`: a function called every frame while the animation is active (conventionally, this function also calls another function called `stop` when the animation should finish, but no such key is mandatory);
* `draw`: a function called every frame to draw things to the screen;
* `done`: a function called when you press escape while the animation is active. pressing escape a second time will quit the program.

## Links

* [watch *the best way to count*](https://youtu.be/rDDaEVcwIJM)
* [watch the music video](https://youtu.be/MI4xSjRBa_o)
* [read the script, footnotes, and other goodies](https://github.com/lucillablessing/thebestwaytocount)
* [listen to the OST](https://lucilla.bandcamp.com/album/the-best-way-to-count-ost)
* [download *binary animations*](https://lucillablessing.itch.io/binary-animations)

## Credits

*binary animations* was made in [LÖVE 11](https://love2d.org/). follow [this page](https://love2d.org/wiki/Game_Distribution) to build it directly from its source code.

the source code of *binary animations* is released under the [Unlicense](https://choosealicense.com/licenses/unlicense/).
