# Rainbow Redstone

This is a fully vanilla compatible resource pack for **any** version 1.13 and above, that makes the redstone dust rainbow (meaning you don't need *any* mods to use this!). 
This repo is mainly used for me to keep track of things and branches and file history and wtv else idk lol

---

### To be done:
- v1.1.0
    - add shapes (flat 16x16 square, 4x4 and 6x6 with shaded sides)
- presets
- other redstone components

### Random stuff to keep track of color wise:
- transparent stuff in-game gets affected by alpha customization in versions 1.21+ (didnt actually test but def not <=1.20.2)
- stained glass 2/3 dots alpha = 0.61
- stained glass outline alpha = 0.64
- redstone dust alpha = 0.99 for sodium compat. signal strengh detection works by checking for every individual red value of the texture. its not an "optimal" solution, but its the simplest as of right now

### Random stuff to keep track of version wise:
- 1.13 - 1.15:  Weird ass redstone_wire.json blockstate requirements, 1.16+ works fine with same file
- <1.17: no core shaders
- 1.17 - 1.20.1: rendertype_cutout.fsh core shaders used
- 1.20.2 - 1.21.1: rendertype_cutout.fsh used but changed with overlay due to <1.20 rpo folders being broken
- 1.21.2 - 1.21.5: terrain.fsh used instead
- 1.21.6 - 1.21.10: changes to terrain.fsh
- 1.21.11+: wtf even happened to the rendering in this version but its okay cuz I fixed it, uses **very** diff terrain.fsh. gaps between pixels may need proper fixing?

### Random stuff to keep track of rpo wise:
- respackopts <1.21 doesnt have string support, only for 1.21+ (corresponds to rpo v13). not using strings tho so idk, for future I guess?
- 1.20+: rpo color customization officially available (rpo pack v9) due to folder support not working properly <1.20
- somewhere <1.20 (?): integer in respackopts.json5 are not supported?? use number instead
- idefk whats happening with this shit <1.20 like, I'm straight up considering not supporing respackopts in those versions because its so fucked

---

**Licence:** [

    This licence applies to ONLY this repository, *not* the resource pack distributed on modrinth or curseforge.
    
    You (user, company, anyone or anything, any form of legal entity) is not allowed to do anything with this repository (ARR: All Rights Reserved) apart from the following exceptions (these are things you are **allowed** to do):
    1. View and study the files as well as the file history.
    2. Download and use any folders or files for personal use only (distribution of files without my (Ketari) approval is prohibited).

    To be extra clear, here are some (but not all) of the things you are **not** allowed to do:
    1. Distribute, share, or upload the files or folders of this repo to anyone, anything or anywhere without my (Ketari) approval.
    2. Use this repo for commercial use.
    3. Use anything in this entire repo for any form of AI training.

    Extra notes/rules/obligations:
    1. Upon forking, cloning, copying, or any other similar act of obtaining this repository, you **must** include this licence, unchanged.
    2. Upon creating a pull request or any other similar request to modify any files or parts of the repository, you give me full control over any files accepted/merged into any branch of this repo, including their liscence.
    3. I (Ketari) retain the right to deny or allow any usage of this repo in any way, shape or form by anyone or anything for any reason.
]
