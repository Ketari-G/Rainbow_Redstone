# Rainbow Redstone

This is a fully vanilla compatible resource pack for **any** version 1.13 and above, that makes the redstone dust rainbow (meaning you don't need *any* mods to use this!). 
This repo is mainly used for me to keep track of things and branches and file history and wtv else idk lol

---

### To be done:
- v2.0.1 - fix numbers being higher than dust and causing missing model textures
- sodium color customization
- shaded toggle
- presets
- other redstone components

### Random stuff to keep track of color wise:
- transparent stuff in-game gets affected by alpha customization in versions 1.21+ (didnt actually test but def not <=1.20.2)
- stained glass 2/3 dots alpha = 0.61
- stained glass outline alpha = 0.64
- redstone dust alpha = 0.99 for sodium compat. signal strengh detection works by checking for every individual red value of the texture. its not an "optimal" solution, but its the simplest as of right now
- numbers alpha = 0.98 same reason, but havnt found a good way to separate it further

### Random stuff to keep track of version wise:
- 1.13 - 1.15: redstone_wire.json blockstate needs to declare "line" redstone for any side to use the respective line model for both opposite cardinal directions *(n-s/w-e)*, otherwise dust displays wrong *(cut in half)* due to "illegal" states being legal back then *(single dir line)*. 1.16+ works fine with same file, with a caveat that illegal states are no longer visually displayed as illegal *(which vanilla does do)*. has been rewritten properly and no longer needs changing
- <1.17: no core shaders
- 1.17 - 1.20.1: rendertype_cutout.fsh core shaders used
- 1.20.1: rpo'd functional shader file
- 1.20.2 - 1.21.1: rendertype_cutout.fsh used but changed with overlay due to <1.20 rpo folders being broken
- 1.21.2 - 1.21.5: terrain.fsh used instead
- 1.21.6 - 1.21.10: changes to terrain.fsh
- 1.21.9+ - pack.mcmeta wants pack/min format to be 15 instead of 4 (otherwise displays pack incompatible), which is exactly what I let it have. versions <1.20 now display "made for newer version of mc" but I'd rather have that lol
- 1.21.11+: wtf even happened to the rendering in this version but its okay cuz I fixed it, uses **very** diff terrain.fsh. gaps between pixels may need proper fixing?
- 26.3: also needs diff shader file AND requires default_colors.glsl to be in include/ - works with an update to the rest

### Random stuff to keep track of rpo wise:
- respackopts <1.21 doesnt have string support, only for 1.21+ (corresponds to rpo v13). not using strings tho so idk, for future I guess?
- 1.20+: rpo color customization officially available (rpo pack v9) due to folder support not working properly <1.20
- somewhere <1.20 (?): integer in respackopts.json5 are not supported?? use number instead
- idefk whats happening with this shit <1.20 like, rpo support is only 1.20.1+ (rpo v12)
- v12 doesnt have support for outside muscripts, using in-line `lineOf(x, y)[packId.entry + 0]`
- rpo presets are from 1.21.1+

---

<details>
  <summary>Resource pack structure (v2.0.0)</summary>
  
```
└── Rainbow_Redstone/
    ├── 1_20_2/ - rpo files here disable the shader if sodium is present
    │   ├── rendertype_cutout.fsh
    │   └── rendertype_cutout.fsh.rpo
    ├── 1_21_2/
    │   ├── terrain.fsh
    │   └── terrain.fsh.rpo
    ├── 1_21_6/
    │   ├── terrain.fsh
    │   └── terrain.fsh.rpo
    ├── 1_21_11/
    │   ├── terrain.fsh
    │   └── terrain.fsh.rpo
    ├── 26_3/
    │   ├── terrain.fsh
    │   └── terrain.fsh.rpo
    ├── assets/
    │   └── minecraft/
    │       ├── blockstates/
    │       │   ├── redstone_wire.json
    │       │   ├── redstone_wire.json.rpo
    │       │   └── rpo_alts/
    │       │       ├── redwire_float3d.json - only used specifically for Floating 3D due to different "up"
    │       │       └── redwire_float3d.json.rpo
    │       ├── lang/
    │       │   └── en_us.json
    │       ├── models/
    │       │   ├── .rpo - if rpo is present, use rpo_models/ instead of this folder
    │       │   └── block/
    │       │       └── redstone_dust/
    │       │           ├── van/ - none of the other variants required here thankfully
    │       │           │   ├── dot/
    │       │           │   ├── e/
    │       │           │   ├── n/
    │       │           │   ├── up/
    │       │           │   ├── w/
    │       │           │   └── s/
    │       │           └── num/ - everything required here due to them being directly in the blockstate file, which cant point to anything outside of models/
    │       │               ├── default/
    │       │               ├── up/
    │       │               └── raised/
    │       ├── rpo_models/
    │       │   └── block/
    │       │       └── redstone_dust/
    │       │           ├── van/ - includes both jsons and their rpo files
    │       │           │   ├── dot/
    │       │           │   ├── e/
    │       │           │   ├── n/
    │       │           │   ├── s/
    │       │           │   ├── up/
    │       │           │   └── w/
    │       │           ├── flat/ - includes both jsons and their rpo files
    │       │           │   ├── dot/
    │       │           │   ├── e/
    │       │           │   ├── n/
    │       │           │   ├── s/
    │       │           │   ├── up/
    │       │           │   └── w/
    │       │           ├── float3d/ - includes both jsons and their rpo files
    │       │           │   ├── dot/
    │       │           │   ├── e/
    │       │           │   ├── n/
    │       │           │   ├── s/
    │       │           │   ├── up/
    │       │           │   └── w/
    │       │           ├── flat3d/ - includes both jsons and their rpo files
    │       │           │   ├── dot/
    │       │           │   ├── e/
    │       │           │   ├── n/
    │       │           │   ├── s/
    │       │           │   ├── up/
    │       │           │   └── w/
    │       │           └── num/ - includes both jsons and their rpo files
    │       │               ├── default/
    │       │               ├── raised/
    │       │               └── up/
    │       ├── shaders/
    │       │   ├── core/
    │       │   │   ├── rendertype_cutout.fsh
    │       │   │   ├── rendertype_cutout.fsh.rpo
    │       │   │   └── rpo_shaders/ - rpo's used here for 1.20.1 color customization, since overlays are only 1.20.2+
    │       │   │       ├── 1_20_2_cutout.fsh
    │       │   │       └── 1_20_2_cutout.fsh.rpo
    │       │   └── include/ - moved to here for 26.3 compat
    │       │       └── default_colors.glsl
    │       └── textures/
    │           ├── item/
    │           │   ├── redstone.png
    │           │   ├── redstone.png.rpo
    │           │   └── rpo_alts/ - simple switch from rr dust item to vanilla in case anyone wants that?? also opens the route for other alts
    │           │       ├── vanilla_redstone.png
    │           │       └── vanilla_redstone.png.rpo
    │           └── block/
    │               └── redstone_dust/
    │                   ├── particle.png - particle used for all dust models
    │                   ├── dot/ - merged 4 textures into one png
    │                   │   ├── 0123.png
    │                   │   ├── 4567.png
    │                   │   ├── 8901.png
    │                   │   └── 2345.png
    │                   ├── ns/ - merged 4 textures into one png
    │                   │   ├── 0123.png
    │                   │   ├── 4567.png
    │                   │   ├── 8901.png
    │                   │   └── 2345.png
    │                   ├── numbers/ - unlike dust type model switching, which is done at model level, nums are switched here thanks to only needing a single png per type
    │                   │   ├── nonum.png    └─ every number is 4x7 pixels exactly, 6 = 9,  and 8 is cut in half lol. 10+ is made up of the others combined
    │                   │   ├── nonum.png.rpo
    │                   │   ├── num1.png
    │                   │   ├── num1.png.rpo
    │                   │   ├── num2.png
    │                   │   ├── num2.png.rpo
    │                   │   ├── num3.png
    │                   │   └── num3.png.rpo
    │                   └── we/ - merged 4 textures into one png
    │                       ├── 0123.png
    │                       ├── 4567.png
    │                       ├── 8901.png
    │                       └── 2345.png
    ├── pack.mcmeta
    ├── pack.png
    └── respackopts.json5 - only a single rpo settings file here cuz v12 now, other one is not needed
```

</details>

---

**License:** [

    This license applies to ONLY this repository and all files within, *not* the resource pack distributed on modrinth or curseforge.
    
    You (user, company, anyone or anything, any form of legal entity) is not allowed to do anything with this repository (ARR: All Rights Reserved) apart from the following exceptions (these are things you are **allowed** to do):
    1. View and study the files as well as the file and commit history.
    2. Download and use any folders or files for personal use only (distribution of files without my (Ketari) approval is prohibited).

    To be extra clear, here are some (but not all) of the things you are **not** allowed to do:
    1. Distribute, share, or upload the files or folders of this repo to anyone, anything or anywhere without my (Ketari) approval.
    2. Use this repo for commercial use.
    3. Use anything in this entire repo for any form of AI training.

    Extra notes/rules/obligations:
    1. Upon forking, cloning, copying, or any other similar act of obtaining this repository, you **must** include this licence, unchanged.
    2. Upon creating a pull request or any other similar request to modify any files or parts of the repository, you give me full control over any files accepted/merged into any branch of this repo, including their license.
    3. I (Ketari) retain the right to deny or allow any usage of this repo in any way, shape or form by anyone or anything for any reason.
]
