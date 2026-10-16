### v2 rewrite branch

To be merged/used instead of main in the future

Main feature: merging all textures together as compactly as possible, making use of individual pixels in the "default" texture as the texture for [x] wide models and so on. Use model files instead of textures for rpo customization, potentially with json text replacement instead of file splitting

**License: same as main branch**

stuff to keep track of:
- rpo resource expansion (json replacements) are available from 1.17.1+
- rpo presets are from 1.21.1+
- see variant ideas
- flat single models done, all textures done
- blockstate file matches them, BUT needs proper updating for new system to handle sin/mult/wtv
- shaders 26.3 need #include fix (change from #moj_import to #include)
- dot +x and +z are both +0.13 due to weird texture scaling issue (fixed in 1.21.11 but kept everywehre for simplicity for now)
  - this issue is caused by FaceBakery shrinking every face's UVs slightly towards the centre of the face's UV area (lerp by 4 / atlas size) to stop atlas bleeding
  - I am unsure on why this happens specifically with <16px textures/models and only on +x/+z
- 

