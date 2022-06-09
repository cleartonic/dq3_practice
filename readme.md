# Dragon Quest III Practice Hack
This is a modification to Dragon Quest III for speedrunning purposes. The hack makes use of the debug menu and implements custom functions to set up the player's party for efficient speedrun practice. 

# Demonstration video
Control-click the below for a YouTube video demonstrating this hack:

[![2](http://img.youtube.com/vi/AOuNvMnZfaE/0.jpg)](http://www.youtube.com/watch?v=AOuNvMnZfaE "1")

## Usage
Navigate to `/releases` to download the latest `.ips` file and use [Lunar IPS](https://fusoya.eludevisibility.org/lips/) to apply to a Dragon Quest III (J) ROM. 

If you'd like to compile yourself using asar (the compiler program), navigate to the `patches/` directory and execute the `.sh` scripts. You are expected to have a `dq3_j.smc` file here. Open the `.sh` files in a notepad editor to check how the code executes. 

## Controls
L Button - Access the Debug menu outside of battle with control of the player

## Methodology
The available "presets" described below are essentially warp points to various parts in the speedrun route. Each preset sets the party, location, and all other internal flags as if they player was there during the run. For example, the "BARAMOS" preset places the player at the Baramos arena right before the fight, with the full party loadout. 

Every RTA yields different results for character growths. In the first version of this hack, party stats based on level and personality are retrieved based on a methodology of averages, according to research by [Maru](https://twitter.com/Maru0137), available [here](https://docs.google.com/spreadsheets/d/1s794r-Zev1MbAsMdOLvGVkGcUeIXyiHprOWygZf8Q1k/edit#gid=562543515). Therefore, each preset will set the party to what the player could reasonably expect to happen in the run. Future versions of this hack may include a way to apply randomization to these averages for additional situation handling.

As this hack is early in its release, there may be modifications to how player customization evolves. Every player has their own inventorying methods and strategies. Still, the equipment and inventory choices for these presets are fairly common among runners' choices. 

## Presets
After accessing the debug menu via the L button, the top entry of the second page is "PRESETS". Below is a list of presets available to the player, via the first two pages:

 - 1) POST PYRA - Warp to Isis town after the Pyramid & Isis vault/Queen's room at night
 - 2) POST K1 - Warp to Champagne Tower after the Kandar 1 battle
 - 3) POST K2 - Warp to Kandar's Hideout after the Kandar 2 battle
 - 4) SIOUX 2 - Warp to Sioux for the second visit after collecting the Red Orb and visiting Jipang & Dharma
 - 5) POST GRIND - Warp to Garuna Tower after Mage has learned Bikill at Lv21
 - 6) SAMANOSA - Warp to Samanosa after reaching there for the first time
 - 7) POST TROLL - Warp to Samanosa King's bedroom after defeating Boss Troll
 - 8) SILV ORB - Warp to Silver Orb Shrine immediately after the Necrogond
 - 9) RAMIA - Warp to Ramia Shrine after unlocking Ramia via the six Orbs
 - 10) POST BARA - Warp to Aliahan throne room after defeating Baramos 
 - 11) BARAMOS - Warp to Baramos Castle in the throne room arena 
 - 12) ALTAR KS CUT - Warp to Zoma's Castle Altar without the King Sword
 - 13) ALTAR KS CUT - Warp to Zoma's Castle Altar with the King Sword

## Debug menu

The debug menu's options has been translated as part of this hack. It offers many tools for the player to explore. Although most sub-menus are not translated, players should be able to navigate with some precursory understanding of Japanese. The functions are described briefly here:

- WARP - Warp to an arbitrary location
- OUTSIDE - Casts the Outside (Riremito) spell 
- NIGHT - Changes Day/Night
- KEY - Short for Key Access, it provides a number of NPC menu options including shops, inns, Ruida's tavern, save points, ec. 
- LEVEL - Set a character level. This will reroll the character's level according to its current personality. 
- NULL - Unused. Original design was for the class change menu, but was not implemented 
- TYPE - Change a character's personality
- GIL - Set the party's gold amount
- PRESETS - Explained above as the main function of this hack. This was previously just a "FLAGS" menu that allowed the player to set custom flags. Many of the early flags, such as "Has the player talked to the King at the beginning of the game", were overwritten for this hack. The later entries past page 2 are still present. The very last entry in this menu sets the party's stats to completely max. 
- STATUS - Allows setting of status conditions poison, paralysis and death
- FILBAG - Fill the bag with one of every item
- SETENEMY - Allows for choosing 4 enemies to battle arbitrarily. The 5th input is the background. 
- GOFIGHT - Draws a random fight from the selected area. For example, "24" draws a random battle from outside of Dharma Castle. 
- VIEWENEM - A detailed enemy animation viewer
- HEAL - Heal the party
- PROGSTART - Restarts the debug program
- SONG - Set the current song
- COLLIDE - Allows for disabling collision. Answering No to the prompt enables walking through walls with the Select button
- NO ENKAS - Allows for disabling random encounters. Answering No to the prompt disable encounters. 
- FLOOR SETUP - Unknown
- COORD R - Allows for viewing coordinates by pressing the R button
- SPRITE - Toggle for disabling sprites
- ROM DATA - Views ROM data
- CREDIT - Begins the credits sequence
- XSTAFF - Sets the flag for using the Change Rod. Does not reflect visually on the party's sprites


## Credits
[@cleartonic](https://twitter.com/cleartonic)

