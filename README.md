### v2 rewrite branch

To be merged/used instead of main in the future

Main feature: merging all textures together as compactly as possible, making use of individual pixels in the "default" texture as the texture for [x] wide models and so on. Use model files instead of textures for rpo customization, potentially with json text replacement instead of file splitting

**License: same as main branch**

stuff to keep track of:
- rpo resource expansion (json replacements) are available from 1.17.1+
- rpo presets are from 1.21.1+
- see variant ideas
- shaders 26.3 need default_colors.glsl to be in separate shaders/include/ folder - made it work with the rest of the shader files
- dot +x and +z are both NOT +0.13 due to weird texture scaling issue (fixed in 1.21.11 but kept everywehre for simplicity for now) - not 100% sure what to do abt this, we'll see ig
  - this issue is caused by FaceBakery shrinking every face's UVs slightly towards the centre of the face's UV area (lerp by 4 / atlas size) to stop atlas bleeding
  - I am unsure on why this happens specifically with <16px textures/models and only on +x/+z
- somewhere above 1.21 - pack.mcmeta wants pack/min format to be 15 instead of 4 (otherwise displays pack incompatible). technically it works regardless and this doesnt *need* to be fixed, but would be nice if it could be somehow. for now, leaving at 4 to have it working with all the other versions
- potentially have a "open pipes" option for float3d
- slight desire to change default "off-floor" value from 0.25 to ~0.05 (will need testing with isorender)
- textures done, models done: vanilla, flat, float3d, flat3d
- rpo models folder separate from vanilla, vanilla only has van & num (num to be removed most likely)
- rpo for models choosing/swapping done (including float3d blockstate)
- number types all take up a single 16x16 png, which gets swapped with rpo, and only 16 model files (1/ss)
- height customization done but differently from previous version: dustHeight *and* numHeight are local to default height per model. also float3d goes up/down fully, instead of the sideways movement of "up" like the others have
- numbers follow perfect height regardless of what model type is chosen or if the "dot" is higher or not. float3d has an option to turn off the "up" state numbers - altho this technically just moves them down where you cant see them due to size-saving optimizations lol
- may want to make numbers for floating 3d "up" state be displayed on the side when possible? - complex/hard/long implementation
- next task: create dust width customization
- 
