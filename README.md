# Weimer's Valen Mod Port for Enhanced Edition

By Hellmouse <hellmouse@outlook.fr>

## About

This mod is a port of the Weimer's Valen Mod (https://weidu.org/valen.html) for enhanced edition.
I did'nt touch the original content, only made it compatible enhanced edition and added an option to the installation for better EE and external mod compatibility(see compatiblity section below).
This version is only available on EE version, if you are using the Vanilla game, you would rather use the original mod https://weidu.org/valen.html

## Installation

An self extracting exe may be available later but for know, you need to manually copy & paste the file at the correct place

### Windows
- Download this repository from git and unzip the content
- Locate your game directory. It should be something like C:\Program Files\Beadmog\Baldur's Gate II Enhanced Edition or *path to your steam library*\SteamLibrary\steamapps\Baldur's Gate II Enhanced Edition
- Copy the "valen" folder of the archive into your game directory
- Copy the Setup-Valen.exe file into your game directory (not inside the valen folder !!!) your game directory should contain both the valen folder and the  Setup-Valen.exe file
- Run (click on) the  Setup-Valen.exe file
- Follow the instructions

### Mac & Linux

You only need to have your OS equivalent of the exe file. The exec file is actually the Weidu generic installer simply renamed for the mod name.

- Do the Windows steps until the copy of the Setup-Valen.exe one.
- Download the latest Weidu version for your OS on this website https://weidu.org/
- Copy the weidu file into your game directory and rename it Setup-Valen (left the extension unchanged)
- Run (click on) Setup-Valen the file 

## Compatibility


Most of the mod content has been tested and shoud run without issue. Non english translations, however have not been tested.

One of the original script made all the non evil and may cause incompatibility issues. In short, this component makes all the non evil priests hostile to the party if they see Valen. This can break the game (or at least a quest) if a non evil priest interaction with the party is required. I know there is at least one in Dorn quest, there may be many other in the EE content and / or other mods.

To avoid these conflicts, I made this component optional. You can choose:
- to include it and play the mod as Weimer intended to
- to remove it if it breaks your game (specially if you are using ohter mods that add quests/ NPC)

It would be possible to make this component less systematic and thus compatible with other mod, but this would be a modification of the *content* of the mod which is not the goal of this repository.

