# Rainbow Redstone

This is a fully vanilla compatible resource pack for **any** version 1.13 and above, that makes the redstone dust rainbow (meaning you don't need *any* mods to use this!).

**License:** [

    This licence applies to ONLY this repository, *not* the resource pack distributed on modrinth or curseforge.
    
    You (user, company, anyone or anything, any form of legal entity) is not allowed to do anything with this repository (ARR: All Rights Reserved) apart from the following exceptions:
    1. View and study the files as well as the file history
    2. Download and use any folders or files for personal use (distribution of files without major changes is prohibited)

    To be extra clear, here are some (but not all) of the things you are not allowed to do:
    1. Distribute, share, or upload the files or folders of this repo to anyone, anything or anywhere without major changes or my (Ketari) approval.
    2. Use this repo for commercial use.
]

To be done:
- indorporate v0.5.0 rpo files and stuff into main
- rpo support entirely + re-integration
- rpo color customization
- split between sodium/vanilla game versions to make sure core shaders work
- terrain.fsh to be done for later game versions cuz no rendertype_cutout
- license file for resource pack itself (?)
- 



Random stuff to keep track of version wise:
- 1.13 - 1.15:  Weird ass redstone_wire.json blockstate requirements, 1.16+ works fine with same file
- <1.17 no core shaders - needs custom base version for vanilla
- 1.17 - 1.21.1: rendertype_cutout.fsh core shaders used - needs testing in 1.17
- 1.21.2 - 1.21.10: terrain.fsh used instead, same file basically
- 1.21.11: terrain.fsh has been changed, needs adapting

test change for base branch