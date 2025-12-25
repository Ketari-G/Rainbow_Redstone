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
- v0.6.0
- rpo color customization
- split between sodium/vanilla game versions to make sure core shaders work
- license file for resource pack itself
- tooltips need fixing*



Random stuff to keep track of version wise:
- 1.13 - 1.15:  Weird ass redstone_wire.json blockstate requirements, 1.16+ works fine with same file
- <1.17 no core shaders - needs custom base version for vanilla
- 1.17 - 1.21.1: rendertype_cutout.fsh core shaders used - needs testing in 1.17
- 1.21.2+: terrain.fsh used instead
- 1.21.6+: a lot of changes to terrain.fsh 
- 1.21.11: terrain.fsh has been BORKED WTF, needs adapting :despair: - idk how lol (I tried)
- 
- respackopts <1.21 doesnt have string support, only for 1.21+ (corresponds to rpo v13)
- respackopts <1.20 doesn't have categories inside category support I think? so color customization with rpo will be 1.20.1+ (corresponds to rpo v9)

