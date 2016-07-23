# KPS
[![Build Status](https://travis-ci.org/kirk24788/KPS.svg?branch=master)](https://travis-ci.org/kirk24788/KPS)


_JUST ANOTHER PLUA ADDON FOR WORLD OF WARCRAFT_

This addon in combination with enabled protected LUA will help you get the most
out of your WoW experience. This addon is based on JPS with a lot of refactoring
to clean up the codebase which has grown a lot in the last 4 years.

The main goal is to have a clean and fast codebase to allow further development.

*Huge thanks to htordeux and pcmd for their contributions to KPS!*

*Thanks to jp-ganis, htordeux, nishikazuhiro, hax mcgee, pcmd
and many more for all their contributions to the original JPS!*

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.

Copyright (C) 2015 Mario Mancino


## Commands

 * `/kps` - Show enabled status.
 * `/kps enable/disable/toggle` - Enable/Disable the addon.
 * `/kps cooldowns/cds` - Toggle use of cooldowns.
 * `/kps pew` - Spammable macro to do your best moves, if for some reason you don't want it fully automated.
 * `/kps interrupt/int` - Toggle interrupting.
 * `/kps multitarget/multi/aoe` - Toggle manual MultiTarget mode.
 * `/kps defensive/def` - Toggle use of defensive cooldowns.
 * `/kps help` - Show this help text.




## Builds and Classes

All healing specs except for druid restoration are currently without a rotation. All DPS Specs have at least one rotation automatically generated
from SimCraft - those might not be fully functional, but aren't tested.

**Fully Supported in 7.0.3:**

* Warlock: Destruction

**Outdated Rotations:**

* Deathknight: Frost (6.2.2)
* Druid: Balance (6.2.2)
* Paladin: Retribution (6.2.2)
* Priest: Shadow (6.2.2)
* Warlock: Affliction (6.2.2)

**Automatically Generated Rotations:**
_(Might not be fully functional)_

* Deathknight: Unholy (6.2.2)
* Druid: Feral (6.2.2), Guardian (6.2.2)
* Hunter: Beastmaster (6.2.2), Marksmanship (6.2.2), Survival (6.2.2)
* Mage: Arcane (6.2.2), Fire (6.2.2), Frost (6.2.2)
* Monk: Brewmaster (6.2.2), Windwalker (6.2.2)
* Paladin: Protection (6.2.2)
* Priest: Discipline (6.2.2), Holy (6.2.2)
* Rogue: Assassination (6.2.2), Combat (6.2.2), Subtlety (6.2.2)
* Shaman: Elemental (6.2.2), Enhancement (6.2.2)
* Warlock: Demonology (6.2.2)
* Warrior: Arms (6.2.2), Fury (6.2.2), Protection (6.2.2)



##  Development
If you want to help developing this AddOn, you are welcome, but there a few rules to make sure KPS is maintable.

### Prerequisites
If you don't have it yet please install Brew (http://brew.sh) and run `brew install coreutils` in a terminal to
make sure you have gtimeout (required for automated testing).
You also have to install the Command Line Utils to for `make` and of course you need to have LUA installed (also available via brew!).

If you don't have a Mac, you somehow have to provide these tools:

* gtimeout (gnu timeout)
* python (at least 2.6)
* make

### Pull Requests
1. [Fork it!](https://github.com/kirk24788/KPS/fork)

2. Create a branch for your changes

        $ git checkout -b my_new_feature

3. Make any changes and run a `make test` in your KPS directory - only create the pull request if *ALL* tests
are OK!

4. Run `make readme` to update the current issues in the `README.md`.

4. Commit and Push your changes

        $ git commit -am "My new feature"
        $ git push origin my_new_feature

5. Open a [Pull Request](http://github.com/kirk24788/KPS/pulls)

### Code Guidelines
* Use 4 spaces for indentation - *NO TABS!*
* All variables must be _lower_ camel case
* All classes must be _upper_ camel case

### Project Structure
* `core`: Core functionality, please think twice before adding anything here, this should only contain backend stuff which isn't used in rotations.
* `gui`: All GUI-related stuff should be consolidated here.
* `libs`: External Libraries.
* `media`: Custom image and sound files.
* `modules`: Wrapper modules for blizzard functions which are used in the rotations.
* `rotations`: Class spells and rotation files. Spell Files are generated by `printClassSpells.py` don't edit these manually, your changes will be overwritten.
* `simc`: SimCraft rotation files used for rotation conversions.
* `utils`: Utility scripts for generating various files for this addon

### Automatic Code Generation
Some files are created automatically by the `makefile`. Please restrain from editing these files, as your changes will not be permanent.
Instead edit the apropriate files in the `utils` directory.

* `kps.toc`: Generated from `_test.lua` - if you need to change the order or add files, please add an additional `require(...)` statement there.
* `README.me`: Generated from `utils/generateREADME.py` - if you want to change the documentation, see the template at `utils/templates/README.md`.
* `modules/spell/spells.lua`: Generated by `utils/printGlobalSpells.py`
* `rotations/<classname>.lua`: Generated by `utils/printClassSpells.py` - if you need additional spells or functions, please add them there.
* `rotations/<classname>_<specname>.lua`: Generated by `utils/convertSimC.py` if not explicitly commented out in the `makefile` - if you want to write a custom rotation comment out the line in the makefile to prevent your rotation from being overwritten.

### Rotation Modules
#### Incoming Damage
Provides access to historical data on the incoming damage. This module is aimed
at tank rotations, but might be useful for other classes too.

Members:

 * `keys.incomingDamage(<TIME>)` - Returns the amount of damage which was done to the player over the last <TIME> seconds.


#### Keys
Simple Module for checking if special keys are being pressed.

Members:

 * `keys.shift` - SHIFT Key
 * `keys.alt` - ALT Key
 * `keys.ctrl` - CTRL Key


#### Player Class
Provides access to specific player information. Since `player` extends the Unit Class all members of
`UNIT` are also members of `player`.

Members:

 * `player.isMounted` - returns true if the player is mounted (exception: Nagrand Mounts do not count as mounted since you can cast while riding)
 * `player.isFalling` - returns true if the player is currently falling.
 * `player.timeInCombat` - returns number of seconds in combat
 * `player.hasTalent(<ROW>,<TALENT>)` - returns true if the player has the selected talent (row: 1-7, talent: 1-3).
 * `player.hasGlyph(<GLYPH>)` - returns true if the player has the given gylph - glyphs can be accessed via the spells (e.g.: `player.hasGlyph(spells.glyphOfDeathGrip)`).
 * `player.eclipseDirLunar` - returns true if the balance bar is currently going towards Lunar
 * `player.eclipseDirSolar` - returns true if the balance bar is currently going towards Solar
 * `player.eclipsePower` - returns current eclipse power - ranges from 100(solar) to -100(lunar)
 * `player.eclipsePhase` - returns the current eclipse phase:
    * 1: Lunar Up-cycle – going towards peak Lunar Eclipse. (8 sec, plus 2 sec of “peak”)
    * 2: Lunar Down-cycle – going towards Solar Eclipse.
    * 3: Solar Up-cycle – going towards peak Solar Eclipse. (2 sec of “peak, plus 8 sec.)
    * 4: Solar Down-cycle – going towards Lunar Eclipse
 * `player.eclipseSolar` - returns true if we're currently in solar phase
 * `player.eclipseLunar` - returns true if we're currently in lunar phase
 * `player.eclipsePhaseDuration` - returns the duration of each eclipse phase
 * `player.eclipseMax` - time until the next solar or lunar max
 * `player.eclipseLunarMax` - time until the next lunar max is reached
 * `player.eclipseSolarMax` - time until the next solar max is reached
 * `player.eclipseChange` - time until the eclipse energy hits 0
 * `player.rage` - Rage
 * `player.rageMax` - Max Rage
 * `player.focus` - Focus
 * `player.focusMax` - Max Focus
 * `player.focusRegen` - Focus Regeneration per Second
 * `player.focusTimeToMax` - Time until focus has completely regenerated
 * `player.energy` - Energy
 * `player.energyMax` - Max Energy
 * `player.energyRegen` - Energy Regeneration per Second
 * `player.energyTimeToMax` - Time until energy has completely regenerated
 * `player.comboPoints` - Combo Points
 * `player.runicPower` - Runic Power
 * `player.soulShards` - Soul Shards
 * `player.holyPower` - Holy Power
 * `player.chi` - Chi
 * `player.chiMax` - Chi Max
 * `player.shadowOrbs` - Shadow Orbs
 * `player.burningEmbers` - Burning Embers (0-4)
 * `player.emberShards` - Ember Shards (0-40)
 * `player.demonicFury` - Demonic Fury
 * `player.hasProc` - returns true if the player has a proc (either mastery, crit, haste, int, strength or agility)
 * `player.hasMasteryProc` - returns true if the player has a mastery proc
 * `player.hasCritProc` - returns true if the player has a crit proc
 * `player.hasHasteProc` - returns true if the player has a haste proc
 * `player.hasIntProc` - returns true if the player has a int proc
 * `player.hasStrProc` - returns true if the player has a strength proc
 * `player.hasAgiProc` - returns true if the player has a agility proc
 * `player.gcd` - returns the current global cooldown
 * `player.bloodlust` - returns true if th player has bloodlus (or heroism, time warp...)
 * `player.timeToNextHolyPower` - returns the time until the next holy power (including the gcd or cast time of the next power generating spell)
 * `player.bloodRunes` - returns the number of blood runes (including blood death runes!)
 * `player.frostRunes` - returns the number of frost runes (including frost death runes!)
 * `player.unholyRunes` - returns the number of unholy runes (including unholy death runes!)
 * `player.allRunes` - returns the total number of active runes
 * `player.bloodDeathRunes` - returns the number of blood runes which currently are converted to death runes
 * `player.frostDeathRunes` - returns the number of frost runes which currently are converted to death runes
 * `player.unholyDeathRunes` - returns the number of unholy runes which currently are converted to death runes
 * `player.bloodFraction` - returns the fraction of blood runes: 0.0 (no runes) to 2.0 (two runes)
 * `player.frostFraction` - returns the fraction of frost runes: 0.0 (no runes) to 2.0 (two runes)
 * `player.unholyFraction` - returns the fraction of unholy runes: 0.0 (no runes) to 2.0 (two runes)
 * `player.bloodOrDeathRunes` - returns the number of blood or death runes
 * `player.frostOrDeathRunes` - returns the number of frost or death runes
 * `player.unholyOrDeathRunes` - returns the number of unholy or death runes
 * `player.deathRunes` - returns the number of death runes
 * `player.hasSealOfTruth` - returns if the player has the seal of truth
 * `player.hasSealOfRighteousness` - returns if the player has the seal of righteousness
 * `player.hasSealOfJustice` - returns if the player has the seal of justice
 * `player.hasSealOfInsight` - returns if the player has the seal of insight
 * `player.stagger` - returns the stagger left on the player
 * `player.staggerTick` - returns the stagger damager per tick
 * `player.staggerPercent` - returns the percentage of stagger to the current player health
 * `player.staggerPercentTotal` - returns the percentage of stagger to the player max health
 * `player.isBehind` - returns true if the player is behind the last target. Also returns true if the player never received an error - if you want to check if the player is in front *DON'T* use this function!
 * `player.isInFront` - returns true if the player is in front of the last target. Also returns true if the player never received an error - if you want to check if the player is behind *DON'T* use this function!


#### Heal/Raid Status
Helper functions for Raiders in Groups or Raids mainly aimed for healing rotations, but might be useful
for some DPS Rotations too. 

Members:

 * `heal.count` - return the size of the current group
 * `heal.type` - return the group type - either 'group' or 'raid'
 * `heal.lowestTankInRaid` - Returns the lowest tank in the raid (based on _incoming_ HP!) - if none is found the player is returned.
 * `heal.defaultTarget` - Returns the default healing target based on these rules:

    * `player` if the player is below 20% hp incoming
    * `focus` if the focus is below 50% hp incoming (if the focus is not healable, `focustarget` is checked instead)
    * `target` if the target is below 50% hp incoming (if the target is not healable, `targettarget` is checked instead)
    * lowest tank in raid which is below 50% hp incoming
    * lowest raid member

 * `heal.defaultTank` - Returns the default tank based on these rules:

    * `player` if the player is below 20% hp incoming
    * `focus` if the focus is below 50% hp incoming (if the focus is not healable, `focustarget` is checked instead)
    * `target` if the target is below 50% hp incoming (if the target is not healable, `targettarget` is checked instead)
    * lowest tank in raid

 * `heal.averageHpIncoming` - Returns the average hp incoming for all raid members


#### Spell Class
Provides access to specific spell information and provide an localization-independant access to WoW spells.

Members:

 * `<SPELL>.spellbookType` - returns the spellbook type - either 'spell' for a player spell or 'pet' for a pet spell
 * `<SPELL>.spellbookIndex` - returns the index of this spell in the spellbook
 * `<SPELL>.isKnown` - returns true if this spell is known to the player
 * `<SPELL>.hasRange` - returns true if this spell has a range
 * `<SPELL>.inRange(<UNIT-STRING>)` - returns true if this spell is in range of the given unit (e.g.: `spells.immolate.inRange("target")`).
 * `<SPELL>.charges` - returns the current charges left of this spell if it has charges or 0 if this spell has no charges
 * `<SPELL>.castTime` - returns the total cast time of this spell
 * `<SPELL>.cooldown` - returns the current cooldown of this spell 
 * `<SPELL>.cooldownTotal` - returns the cooldown in seconds the spell has if casted - this is NOT the current cooldown of the spell! 
 * `<SPELL>.isRecastAt(<UNIT-STRING>)` - returns true if this was last casted spell and the last targetted unit was the given unit (e.g.: `spell.immolate.isRecastAt("target")`). 
 * `<SPELL>.needsSelect` - returns true this is an AoE spell which needs to be targetted on the ground.
 * `<SPELL>.isBattleRez` - returns true if this spell is one of the batlle rez spells.
 * `<SPELL>.isPrioritySpell` - returns true if this is one of the user-casted spells which should be ignored for the spell queue. (internal use only!)
 * `<SPELL>.canBeCastAt(<UNIT-STRING>)` - returns true if the spell can be cast at the given unit (e.g.: `spell.immolate.canBeCastAt("focus")`). A spell can be cast if the target unit exists, the player has enough resources, the spell is not on cooldown and the target is in range.
 * `<SPELL>.lastCasted(<DURATION>)` - returns true if the spell was last casted within the given duration (e.g.: `spell.immolate.lastCasted(2)`).
 * `<SPELL>.tickTime` - returns the tick interval time of this spell - only useful for DoT's


#### Totem Class
Access to Totem data.
<TOTEM> may be one of:
 * `totem.fire`
 * `totem.earth`
 * `totem.water`
 * `totem.air`

Members:

 * `<TOTEM>.isActive` - returns true if the given totem is active
 * `<TOTEM>.duration` - returns the duration left on the given totem
 * `<TOTEM>.name` - returns the totem name


#### Unit Class
Provides access to specific unit information. <UNIT> may be one of:
 * `player`
 * `target`
 * `targettarget`
 * `pet`
 * `focus`
 * `focustarget`
 * `mouseover`

Members:

 * `<UNIT>.exists` - returns true if this unit exists
 * `<UNIT>.hasBuff(<SPELL>)` - return true if the unit has the given buff (i.e. `target.hasBuff(spells.renew)`)
 * `<UNIT>.hasDebuff(<SPELL>)` - returns true if the unit has the given debuff (i.e. `target.hasDebuff(spells.immolate)`)
 * `<UNIT>.hasMyDebuff(<SPELL>)` - returns true if the unit has the given debuff _AND_ the debuff was cast by the player (i.e. `target.hasMyDebuff(spells.immolate)`)
 * `<UNIT>.myBuffDuration(<SPELL>)` - returns the remaining duration of the buff on the given unit if the buff was cast by the player 
 * `<UNIT>.myDebuffDuration(<SPELL>)` - returns the remaining duration of the debuff on the given unit if the debuff was cast by the player 
 * `<UNIT>.myDebuffDurationMax(<SPELL>)` - returns the total duration of the given debuff if it was cast by the player
 * `<UNIT>.buffDuration(<SPELL>)` - returns the remaining duration of the given buff
 * `<UNIT>.debuffDuration(<SPELL>)` - returns the remaining duration of the given debuff
 * `<UNIT>.debuffStacks(<SPELL>)` - returns the debuff stacks on for the given <SPELL> on this unit
 * `<UNIT>.dbuffStacks(<SPELL>)` - returns the buff stacks on for the given <SPELL> on this unit
 * `<UNIT>.castTimeLeft` - returns the casting time left for this unit or 0 if it is not casting
 * `<UNIT>.channelTimeLeft` - returns the channeling time left for this unit or 0 if it is not channeling
 * `<UNIT>.isCasting` - returns true if the unit is casting (or channeling) a spell
 * `<UNIT>.isCastingSpell(<SPELL>)` - returns true if the unit is casting (or channeling) the given <SPELL> (i.e. `target.isCastingSpell(spells.immolate)`)
 * `<UNIT>.isInterruptable` - returns true if the unit is currently casting (or channeling) a spell which can be interrupted.
 * `<UNIT>.name` - returns the unit name
 * `<UNIT>.name` - returns the unit guid
 * `<UNIT>.npcId` - returns the unit id (as seen on wowhead)
 * `<UNIT>.level` - returns the unit level
 * `<UNIT>.isRaidBoss` - returns true if the unit is a raid boss
 * `<UNIT>.hp` - returns the unit hp (in a range between 0.0 and 1.0).
 * `<UNIT>.hpTotal` - returns the current hp as an absolute value.
 * `<UNIT>.hpMax` - returns the maximum hp as an absolute value
 * `<UNIT>.hpIncoming` - returns the unit hp with incoming heals (in a range between 0.0 and 1.0).
 * `<UNIT>.mana` - returns the unit mana (in a range between 0.0 and 1.0).
 * `<UNIT>.manaTotal` - returns the current unit mana as an absolute value.
 * `<UNIT>.manaMax` - returns the maximum unit mana as an ansolute value.
 * `<UNIT>.comboPoints` - returns the number of combo points _from_ the player _on_ this unit.
 * `<UNIT>.distance` - returns the approximated distance to the given unit (same as `<UNIT.distanceMax`).
 * `<UNIT>.distanceMin` - returns the min. approximated distance to the given unit.
 * `<UNIT>.distanceMax` - returns the max. approximated distance to the given unit.
 * `<UNIT>.isAttackable` - returns true if the given unit can be attacked by the player.
 * `<UNIT>.isMoving` - returns true if the given unit is currently moving.
 * `<UNIT>.isDead` - returns true if the unit is dead.
 * `<UNIT>.isDrinking` - returns true if the given unit is currently eating/drinking.
 * `<UNIT>.inVehicle` - returns true if the given unit is inside a vehicle.
 * `<UNIT>.isHealable` - returns true if the give unit is healable by the player.
 * `<UNIT>.hasPet` - returns true if the given unit has a pet.


### Open Issues
 * `core/kps.lua:22` - Return a FUNCTION which uses Item!
 * `core/logger.lua:33` - Check if DEFAULT_CHAT_FRAME:AddMessage() has any significant advantages
 * `core/parser.lua:132` - syntax error in
 * `core/parser.lua:139` - Error Handling!
 * `env.lua:28` - Clean UP!!! This code is a mess...
 * `gui/toggle.lua:73` - Right-Click Action
 * `libs/LibRangeCheck-2.0/LibRangeCheck-2.0.lua:31` - check if unit is valid, etc
 * `modules/incoming_damage.lua:28` - Load on demand!
 * `modules/unit/unit_auras.lua:46` - Taken from JPS, verify that we can be sure that 'select(8,UnitDebuff(unit,spell.name))=="player"' works - what if there are 2 debuffs?
 * `modules/unit/unit_casting.lua:62` - Blacklisted spells?
 * `modules/unit/unit_casting.lua:69` - Reimplement JPS Code
 * `modules/unit/unit_powers.lua:47` - TimeToDie
 * `modules/unit/unit_state.lua:13` - PvP
 * `modules/unit/unit_state.lua:26` - if jps.PlayerIsBlacklisted(self.unit) then return false end -- WARNING Blacklist is updated only when UNITH HEALTH occurs
 * `modules/unit/unit_state.lua:27` - Refactor!!!
 * `rotations/mage.lua:254` - Implement pyroChain sequence




