--[[[
@module Deathknight
@description
Deathknight Spells and Environment Functions.
]]--

kps.spells.deathknight = {}

kps.spells.deathknight.pathOfFrost = kps.Spell.fromId(3714)
kps.spells.deathknight.armyOfTheDead = kps.Spell.fromId(42650)
kps.spells.deathknight.deathAndDecay = kps.Spell.fromId(43265)
kps.spells.deathknight.plagueStrike = kps.Spell.fromId(45462)
kps.spells.deathknight.icyTouch = kps.Spell.fromId(45477)
kps.spells.deathknight.chainsOfIce = kps.Spell.fromId(45524)
kps.spells.deathknight.bloodTap = kps.Spell.fromId(45529)
kps.spells.deathknight.raiseDead = kps.Spell.fromId(46584)
kps.spells.deathknight.strangulate = kps.Spell.fromId(47476)
kps.spells.deathknight.mindFreeze = kps.Spell.fromId(47528)
kps.spells.deathknight.deathCoil = kps.Spell.fromId(47541)
kps.spells.deathknight.empowerRuneWeapon = kps.Spell.fromId(47568)
kps.spells.deathknight.bloodPresence = kps.Spell.fromId(48263)
kps.spells.deathknight.unholyPresence = kps.Spell.fromId(48265)
kps.spells.deathknight.frostPresence = kps.Spell.fromId(48266)
kps.spells.deathknight.antimagicShell = kps.Spell.fromId(48707)
kps.spells.deathknight.deathPact = kps.Spell.fromId(48743)
kps.spells.deathknight.iceboundFortitude = kps.Spell.fromId(48792)
kps.spells.deathknight.runeTap = kps.Spell.fromId(48982)
kps.spells.deathknight.obliterate = kps.Spell.fromId(49020)
kps.spells.deathknight.dancingRuneWeapon = kps.Spell.fromId(49028)
kps.spells.deathknight.lichborne = kps.Spell.fromId(49039)
kps.spells.deathknight.frostStrike = kps.Spell.fromId(49143)
kps.spells.deathknight.howlingBlast = kps.Spell.fromId(49184)
kps.spells.deathknight.summonGargoyle = kps.Spell.fromId(49206)
kps.spells.deathknight.boneShield = kps.Spell.fromId(49222)
kps.spells.deathknight.scentOfBlood = kps.Spell.fromId(49509)
kps.spells.deathknight.suddenDoom = kps.Spell.fromId(49530)
kps.spells.deathknight.shadowInfusion = kps.Spell.fromId(49572)
kps.spells.deathknight.deathGrip = kps.Spell.fromId(49576)
kps.spells.deathknight.deathStrike = kps.Spell.fromId(49998)
kps.spells.deathknight.veteranOfTheThirdWar = kps.Spell.fromId(50029)
kps.spells.deathknight.bloodRites = kps.Spell.fromId(50034)
kps.spells.deathknight.chilblains = kps.Spell.fromId(50041)
kps.spells.deathknight.improvedBloodPresence = kps.Spell.fromId(50371)
kps.spells.deathknight.improvedFrostPresence = kps.Spell.fromId(50385)
kps.spells.deathknight.improvedUnholyPresence = kps.Spell.fromId(50392)
kps.spells.deathknight.bloodBoil = kps.Spell.fromId(50842)
kps.spells.deathknight.icyTalons = kps.Spell.fromId(50887)
kps.spells.deathknight.deathGate = kps.Spell.fromId(50977)
kps.spells.deathknight.antimagicZone = kps.Spell.fromId(51052)
kps.spells.deathknight.killingMachine = kps.Spell.fromId(51128)
kps.spells.deathknight.ebonPlaguebringer = kps.Spell.fromId(51160)
kps.spells.deathknight.pillarOfFrost = kps.Spell.fromId(51271)
kps.spells.deathknight.runicCorruption = kps.Spell.fromId(51462)
kps.spells.deathknight.onAPaleHorse = kps.Spell.fromId(51986)
kps.spells.deathknight.runeOfLichbane = kps.Spell.fromId(53331)
kps.spells.deathknight.runeOfSpellshattering = kps.Spell.fromId(53342)
kps.spells.deathknight.runeOfRazorice = kps.Spell.fromId(53343)
kps.spells.deathknight.runeOfTheFallenCrusader = kps.Spell.fromId(53344)
kps.spells.deathknight.runeforging = kps.Spell.fromId(53428)
kps.spells.deathknight.runeOfSpellbreaking = kps.Spell.fromId(54447)
kps.spells.deathknight.bloodOfTheNorth = kps.Spell.fromId(54637)
kps.spells.deathknight.bloodPlague = kps.Spell.fromId(55078)
kps.spells.deathknight.scourgeStrike = kps.Spell.fromId(55090)
kps.spells.deathknight.frostFever = kps.Spell.fromId(55095)
kps.spells.deathknight.vampiricBlood = kps.Spell.fromId(55233)
kps.spells.deathknight.unholyAura = kps.Spell.fromId(55610)
kps.spells.deathknight.darkCommand = kps.Spell.fromId(56222)
kps.spells.deathknight.reaping = kps.Spell.fromId(56835)
kps.spells.deathknight.hornOfWinter = kps.Spell.fromId(57330)
kps.spells.deathknight.rime = kps.Spell.fromId(59057)
kps.spells.deathknight.raiseAlly = kps.Spell.fromId(61999)
kps.spells.deathknight.runeOfTheStoneskinGargoyle = kps.Spell.fromId(62158)
kps.spells.deathknight.darkTransformation = kps.Spell.fromId(63560)
kps.spells.deathknight.threatOfThassarian = kps.Spell.fromId(66192)
kps.spells.deathknight.masteryBloodShield = kps.Spell.fromId(77513)
kps.spells.deathknight.masteryFrozenHeart = kps.Spell.fromId(77514)
kps.spells.deathknight.masteryDreadblade = kps.Spell.fromId(77515)
kps.spells.deathknight.outbreak = kps.Spell.fromId(77575)
kps.spells.deathknight.darkSimulacrum = kps.Spell.fromId(77606)
kps.spells.deathknight.sanguineFortitude = kps.Spell.fromId(81127)
kps.spells.deathknight.crimsonScourge = kps.Spell.fromId(81136)
kps.spells.deathknight.willOfTheNecropolis = kps.Spell.fromId(81164)
kps.spells.deathknight.runicEmpowerment = kps.Spell.fromId(81229)
kps.spells.deathknight.mightOfTheFrozenWastes = kps.Spell.fromId(81333)
kps.spells.deathknight.festeringStrike = kps.Spell.fromId(85948)
kps.spells.deathknight.unholyMight = kps.Spell.fromId(91107)
kps.spells.deathknight.deathsAdvance = kps.Spell.fromId(96268)
kps.spells.deathknight.asphyxiate = kps.Spell.fromId(108194)
kps.spells.deathknight.deathSiphon = kps.Spell.fromId(108196)
kps.spells.deathknight.gorefiendsGrasp = kps.Spell.fromId(108199)
kps.spells.deathknight.remorselessWinter = kps.Spell.fromId(108200)
kps.spells.deathknight.desecratedGround = kps.Spell.fromId(108201)
kps.spells.deathknight.controlUndead = kps.Spell.fromId(111673)
kps.spells.deathknight.purgatory = kps.Spell.fromId(114556)
kps.spells.deathknight.soulReaper = kps.Spell.fromId(114866)
kps.spells.deathknight.unholyBlight = kps.Spell.fromId(115989)
kps.spells.deathknight.conversion = kps.Spell.fromId(119975)
kps.spells.deathknight.plagueLeech = kps.Spell.fromId(123693)
kps.spells.deathknight.soulReaper = kps.Spell.fromId(130735)
kps.spells.deathknight.soulReaper = kps.Spell.fromId(130736)
kps.spells.deathknight.breathOfSindragosa = kps.Spell.fromId(152279)
kps.spells.deathknight.defile = kps.Spell.fromId(152280)
kps.spells.deathknight.necroticPlague = kps.Spell.fromId(152281)
kps.spells.deathknight.powerOfTheGrave = kps.Spell.fromId(155522)
kps.spells.deathknight.resolve = kps.Spell.fromId(158298)
kps.spells.deathknight.plaguebearer = kps.Spell.fromId(161497)
kps.spells.deathknight.bladedArmor = kps.Spell.fromId(161608)
kps.spells.deathknight.riposte = kps.Spell.fromId(161797)
kps.spells.deathknight.runicStrikes = kps.Spell.fromId(165394)
kps.spells.deathknight.necrosis = kps.Spell.fromId(165395)
kps.spells.deathknight.darkSuccor = kps.Spell.fromId(178819)


kps.spells.deathknight.bloodCharge = kps.Spell.fromId(114851)



kps.env.deathknight = {}

function kps.env.deathknight.diseaseMinRemains(unit)
    minTimeLeft = min(unit.myDebuffDuration(kps.spells.deathknight.bloodPlague),
                      unit.myDebuffDuration(kps.spells.deathknight.frostFever))
    if player.hasTalent(7, 1) then -- Necrotic Plague Talent
        return min(minTimeLeft, unit.myDebuffDuration(kps.spells.deathknight.necroticPlague))
    else
        return minTimeLeft
    end
end

function kps.env.deathknight.diseaseMaxRemains(unit)
    maxTimeLeft = max(unit.myDebuffDuration(kps.spells.deathknight.bloodPlague),
                      unit.myDebuffDuration(kps.spells.deathknight.frostFever))
    if player.hasTalent(7, 1) then -- Necrotic Plague Talent
        return max(maxTimeLeft, unit.myDebuffDuration(kps.spells.deathknight.necroticPlague))
    else
        return maxTimeLeft
    end
end

function kps.env.deathknight.diseaseTicking(unit)
    return kps.env.deathknight.diseaseMinRemains(unit) > 0
end

function kps.env.deathknight.diseaseMaxTicking(unit)
    return kps.env.deathknight.diseaseMaxRemains(unit) > 0
end


