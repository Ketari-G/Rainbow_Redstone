### v2 rewrite branch

To be merged/used instead of main in the future

Main feature: merging all textures together as compactly as possible, making use of individual pixels in the "default" texture as the texture for [x] wide models and so on. Use model files instead of textures for rpo customization, potentially with json text replacement instead of file splitting

**License: same as main branch**

stuff to keep track of:
- rpo resource expansion (json replacements) are available from 1.17.1+
- rpo presets are from 1.21.1+
- see variant ideas - everything except shadows done (shadows probably later future update, they're complicated)
- shaders 26.3 need default_colors.glsl to be in separate shaders/include/ folder - made it work with the rest of the shader files
- dot +x and +z are both NOT +0.13 due to weird texture scaling issue (fixed in 1.21.11 but kept everywehre for simplicity for now) - not 100% sure what to do abt this, we'll see ig
  - this issue is caused by FaceBakery shrinking every face's UVs slightly towards the centre of the face's UV area (lerp by 4 / atlas size) to stop atlas bleeding
  - I am unsure on why this happens specifically with <16px textures/models and only on +x/+z
- 1.21.9+ - pack.mcmeta wants pack/min format to be 15 instead of 4 (otherwise displays pack incompatible). technically it works regardless and this doesnt *need* to be fixed, but would be nice if it was. made rpo choose a diff pack.mcmeta file when mc >=1.21.9, vanilla "supported_versions = 15" workaround does not seem to give any good results due to mismatch in min_format
- potentially have a "open pipes" option for float3d - potentially not rly viable rn?
- off-floor default height is 0.02 - untested with isorender
- textures done, models done: vanilla, flat, float3d, flat3d
- rpo models folder separate from vanilla, vanilla only has van & num (num cannot be removed)
- rpo for models choosing/swapping done (including float3d blockstate)
- number types all take up a single 16x16 png, which gets swapped with rpo, and only 16 model files (1/ss)
- height customization done but differently from previous version: dustHeight *and* numHeight are local to default height per model. also float3d goes up/down fully, instead of the sideways movement of "up" like the others have. numbers follow perfect height regardless of what model type is chosen, any height modifications, or if the "dot" is higher or not. float3d has an option to turn off the "up" state numbers
- may want to make numbers for floating 3d "up" state be displayed on the side when possible? - complex/hard/long implementation
- dust width/size customization done, potential idea to make numbers size customizeable as well but I dont think its worth it
- 1.20.1 now properly works with color customization thanks to rpo *(make sure that the fallback can always be identified - otherwise the whole thing breaks)*
- pretty sure RR 2.0.0 is now fully finished and tested but I need to go over it tmr again just in case before publishing
- 