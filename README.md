<p align="center">
  <img src="https://user-images.githubusercontent.com/38049304/200951525-9c7025a3-3d62-4fce-8643-e65639a539bc.png">
</p>

# Welcome to VidUI!

---

[![Earth's Roblox Profile](https://user-images.githubusercontent.com/38049304/185816395-296cc028-f944-490d-8889-33a83d5922f5.svg)](https://www.roblox.com/users/32573334/profile)
[![Contact Us](https://user-images.githubusercontent.com/38049304/187346520-b67caa7c-ccfe-460b-bf88-ac99903f73ed.svg)](mailto:ebgui.staff@gmail.com)
[![EBGui Discord](https://user-images.githubusercontent.com/38049304/185876260-95e670cf-c037-4082-b03d-b758bc4a492b.svg)](https://discord.gg/z3QZzFJBvj)

---

## About

VidUI is the premier GUI for the video creators of Gamer Robot's Elemental Battleground on Roblox! It's the exploit that's not an exploit, and will let you view the action without hassle!

## Disclaimer

**EarthToAccess and VidUI's contributors take no responsibility for the misuse or VidUI or it's features.** Using any user interface such as this in any unintended or malicious manner may result in your account being banned from Elemental Battlegrounds or Roblox.

**Looking for something more useful?** If you're looking for the all-in-one UI to enhance your gameplay in Elemental Battlegrounds, check out VidUI's sister project [EBGui](https://github.com/EarthToAccess/EBGui) instead!

## Terms and Conditions

You can view the Terms and Conditions for using VidUI [at this link.](https://docs.google.com/document/d/15qLJqaVDGmreg5xAgqxvFeVPghS-YcuUUu355M5BJkM/edit?usp=sharing) Please note that, in using the script, you will be bound by these terms.

## Loading

To use VidUI, you're going to need an executor, such as [Synapse](https://x.synapse.to) or [Script-Ware](https://script-ware.com), which are paid, or [Krnl](https://krnl.vip/), which is free. Once you have that, there are two versions you can use.

To use the Stable version, utilize the loadstring below;

  ```lua
  loadstring(game:HttpGet('https://raw.githubusercontent.com/EarthToAccess/VidUI/main/stable.lua'))()
  ```

To use the less-stable, yet more consistently updated Canary version, use this loadstring;

  ```lua
  loadstring(game:HttpGet('https://raw.githubusercontent.com/EarthToAccess/VidUI/main/canary.lua'))()
  ```

Canary will have early access to new features, but may break sometimes. Use it at your own risk!

## Features

Features of VidUI include, but absolutely are not limited to;

- Camera switching between provided competitors
- Ease-to-use enhanced ESP to see everyone's status
- A safe place for your character to stay while viewing

This list is not comprehensive; there is so much more in store for you to find!

## Contributions and Rights



It's recommended you [open an issue](https://github.com/EarthToAccess/VidUI/issues), as problems may be fixed, features may be planned, and so on and so forth behind the scenes. Opening an issue also makes issues, features, and so on easier to track. Pull requests will be ignored; however, if you open an issue and your bug gets fixed/feature gets added, you'll be added to the UI's internal credits.

## Changelog

The changelog here has some special denotations for its additions/removals/and so on. Additions will be marked with "+"; removals, "-"; notes, "~"; changes/fixes, ">".

### Stable 

#### Latest - v1.4

\~ The ESP got a makeover!  
\> ESP now has brighter and more legible dynamic changing text, letting you know exactly how close until someone is dead!  
\> It also now has some better formatting! No more looking the same across the board.  
\> Minor performance enhancements to bring your game to the next level without sacrificing your CPU.

#### Previous

**Version v1.3**

\> Changed some colors with the ESP. Now, those that fall below 75% will be marked with a gold color, and falling below 33% will begin to change red until death.  
\+ Added a beacon to ping your last position. This way, you know where you'll end up when you stop viewing people!  
\> Changed the "off" text of the view change button to not have a "list of players" (showing "Viewing nobody") when it's disabled.  

### Canary

#### Latest - 2211.13a

\> The text to the ESP now has RichText enabled, allowing for some better formatting. Still experimenting with color./  
\> Set the ESP NameTag's MaxDistance to 750 to improve performance.

#### Previous

**Version 2211.12b** 

\> Fixed a problem with last position ping where not enabling view change first would break it. Now, it will simply ping your current location.  
\> Fixed a problem with the `;plr` command where it just didn't work, at all. It will now work as intended, and provide an error via the command box output if it cannot find the player you're asking for.

**Version 2211.12a**

\> Changed the version numbering for Canary builds from matching Stable to being their own string of numbers. Specifically, the string's meaning is;
  - The first two digits are the year of release.
  - The second two digits are the month of release.
  - The final two, after the decimal, are the day of release.
  - The letter indicates if multiple updates were pushed in one day.  

\> Fixed a problem with the viewing plate teleport function where it would anchor immediately after calling MoveTo, causing your character to still be in the same place server-side. Now, VidUI will wait 3/4ths of a second after calling the view change function before anchoring your character, preventing it from appearing.

**Version v1.2**

\> Actually made the "Enhanced ESP" an enhanced ESP  
\+ ESP is now color coded between full, not-full, and dead.  
\> Fixed a problem with the ESP not turning on with first button click.  
\> Removed a lot of filler debug code for the viewing plate portion of the ESP.  
\> The viewing plate is no longer visible to the user.  

**Version v1.1**

\+ Added `;plr` command to remove individual players from the Player List.  
\> Fixed a problem with the version number where it showed "Version Version" in the top bar.

**Version v1.0**

\+ Welcome to VidUI!  