### v2 rewrite branch

To be merged/used instead of main in the future

Main feature: merging all textures together as compactly as possible, making use of individual pixels in the "default" texture as the texture for [x] wide models and so on. Use model files instead of textures for rpo customization, potentially with json text replacement instead of file splitting

**License: same as main branch**

stuff to keep track of:
- rpo resource expansion (json replacements) are available from 1.17.1+
- rpo presets are from 1.21.1+
- see variant ideas
- shaders 26.3 need default_colors.glsl to be in separate shaders/include/ folder - made it work with the rest of the shader files
- dot +x and +z are both +0.13 due to weird texture scaling issue (fixed in 1.21.11 but kept everywehre for simplicity for now)
  - this issue is caused by FaceBakery shrinking every face's UVs slightly towards the centre of the face's UV area (lerp by 4 / atlas size) to stop atlas bleeding
  - I am unsure on why this happens specifically with <16px textures/models and only on +x/+z
- somewhere above 1.21 - pack.mcmeta wants pack/min format to be 15 instead of 4 (otherwise displays pack incompatible). technically it works regardless and this doesnt *need* to be fixed, but would be nice if it could be somehow. for now, leaving at 4 to have it working with all the other versions
- slight desire to change default "off-floor" value from 0.25 to ~0.05 (will need testing with isorender)
- textures done, models done: vanilla, flat, 3d_float (w/out up)
- blockstate file done - most likely needs adapting for 3d_float
- rpo models folder *not done* - to do after all models finished only
- 
