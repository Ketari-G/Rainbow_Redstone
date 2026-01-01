# Rainbow Redstone

This is a fully vanilla compatible resource pack for **any** version 1.13 and above, that makes the redstone dust rainbow (meaning you don't need *any* mods to use this!). 
This repo is mainly used for me to keep track of things and branches and file history and wtv else idk lol


To be done:
- v1.0.0
- split between sodium/vanilla game versions with rpo to make sure core shaders work
- license file for resource pack itself
- rpo tooltips are f\*ed, basically need all version testing
- presets



Random stuff to keep track of version wise:
- 1.13 - 1.15:  Weird ass redstone_wire.json blockstate requirements, 1.16+ works fine with same file
- <1.17: no core shaders - uses standard colored textures
- 1.17 - 1.20.1: rendertype_cutout.fsh core shaders used with colored textures otherwise no 1.13 - 1.16 compat, due to overlays being strictly 1.20.2+. only downside is SS 0 color changing being a bit fucked up
- 1.20+: rpo color customization officially available (rpo pack v9)
- 1.20.2 - 1.21.1: rendertype_cutout.fsh used but replaced with "normal one" with no colored textures support - all textures have to be black & white
- 1.21.2+: terrain.fsh used instead
- 1.21.6+: a lot of changes to terrain.fsh 
- 1.21.11: terrain.fsh has been BORKED WTF, needs adapting :despair: - idk how lol (I tried)
- 
- respackopts <1.21 doesnt have string support, only for 1.21+ (corresponds to rpo v13). not using strings tho so idk, for future I guess?
-



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
