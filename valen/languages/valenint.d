////////////////////////////////////////////////////////////////////////////
// Valen SoA Interjections
////////////////////////////////////////////////////////////////////////////

INTERJECT RIBALD 0 Valen_IJ0
  == "RIBALD" IF ~InParty("Valen")~ THEN @1001
  == "VALENJ" IF ~InParty("Valen")~ THEN @1002
  == "RIBALD" IF ~InParty("Valen")~ THEN @1003
  == "VALENJ" IF ~InParty("Valen")~ THEN @1004
END RIBALD 46

EXTEND_BOTTOM KAMIR 2
  IF ~InParty("Valen")~ THEN EXTERN "VALENJ" hate_kamir
END

CHAIN VALENJ hate_kamir
   @1010
== "KAMIR" @1011 = @1012
== "VALENJ" @1013
END KAMIR bless_me

APPEND KAMIR
  IF ~~ THEN BEGIN bless_me
    SAY @1014
    IF ~~ THEN DO
 ~Enemy()
  ReallyForceSpell(Myself,CLERIC_NEGATIVE_PLANE_PROTECTION)
  ReallyForceSpell(Myself,CLERIC_HOLY_POWER)
  ReallyForceSpell(Myself,CLERIC_DRAW_UPON_HOLY_MIGHT)
  ReallyForceSpell(Myself,CLERIC_TRUE_SIGHT)
  ReallyForceSpell(Myself,CLERIC_CHAOTIC_COMMANDS)
  ReallyForceSpell(Myself,CLERIC_DEATH_WARD)
  ReallyForceSpell("Valen",CLERIC_HOLY_SMITE)
  ReallyForceSpell(Myself,WIZARD_BLACK_BLADE_OF_DISASTER)
  ReallyForceSpell(Myself,WIZARD_IMPROVED_HASTE)
  ReallyForceSpell(Myself,WIZARD_TENSERS_TRANSFORMATION)
  ReallyForceSpell(Myself,WIZARD_SPELL_IMMUNITY_ABJURATION)
  ChangeAIScript("wtasight",OVERRIDE)
  Attack("Valen")~ EXIT
  END
END 

// Antenos: bodhi servant
INTERJECT ANTENOS 0 Valen_IJ1
  == "VALENJ" IF ~InParty("Valen")~ THEN @1020
  == "ANTENOS" IF ~InParty("Valen")~ THEN @1021
END ANTENOS 1

// Chore: bodhi servant
INTERJECT CHORE 0 Valen_IJ2
  == "VALENJ" IF ~InParty("Valen")~ THEN @1022
END CHORE 1

// Fetch: bodhi servant
INTERJECT FETCH 0 Valen_IJ3
  == "VALENJ" IF ~InParty("Valen")~ THEN @1023
END FETCH 1

// Food: bodhi servant
INTERJECT FOOD 0 Valen_IJ4
  == "VALENJ" IF ~InParty("Valen")~ THEN @1024
END FOOD 1

// Master Cohn: bodhi servant
INTERJECT COHNTA 1 Valen_IJ5
  == "VALENJ" IF ~InParty("Valen")~ THEN @1025
  == "COHNTA" IF ~InParty("Valen")~ THEN @1026
  == "VALENJ" IF ~InParty("Valen")~ THEN @1027
END COHNTA 4

// Meredath: bodhi servant
INTERJECT LAUNE 3 Valen_IJ6
  == "VALENJ" IF ~InParty("Valen")~ THEN @1028 = @1029
END LAUNE 2

// Logan Coprith
INTERJECT CELOGAN 11 Valen_IJ7
  == "VALENJ" IF ~InParty("Valen")~ THEN #7722
END CELOGAN 17

// Khellon 
INTERJECT TREVIL01 6 Valen_IJ8
  == "VALENJ" IF ~InParty("Valen")~ THEN #50502
END TREVIL01 10

// Pauden, druid grove
INTERJECT CEDRUID1 6 Valen_IJ9
  == "VALENJ" IF ~InParty("Valen")~ THEN #9272
END CEDRUID1 12
INTERJECT CEDRUID1 12 Valen_IJ10
  == "VALENJ" IF ~InParty("Valen")~ THEN #9319
END CEDRUID1 13

// Samia
INTERJECT SAMIA 26 Valen_IJ11
  == "VALENJ"     IF ~InParty("Valen")~ THEN @1030
  == "SAMIA"     IF ~InParty("Valen")~ THEN @1031
  == "VALENJ"     IF ~InParty("Valen")~ THEN @1032
  == "SAMIA"     IF ~InParty("Valen")~ THEN @1033
  == "VALENJ"     IF ~InParty("Valen")~ THEN @1034
END SAMIA 18

// Grancor
INTERJECT FIRWLF01 0 Valen_IJ12
  == "VALENJ"     IF ~InParty("Valen")~ THEN @1040
  == "FIRWLF01"     IF ~InParty("Valen")~ THEN @1041
  == "VALENJ"     IF ~InParty("Valen")~ THEN @1042 = @1043
END FIRWLF01 7

// Firkraag
INTERJECT FIRKRA02 15 Valen_IJ13
  == "VALENJ"     IF ~InParty("Valen")~ THEN #49290
END FIRKRA02 28

// Daleson
EXTEND_BOTTOM DALESON 9 10 11
  IF ~InParty("Valen")~ THEN EXTERN VALENJ eat_dale
END

EXTEND_BOTTOM DELCIA 10 16 30 31 32 33
  IF ~InParty("Valen")~ THEN EXTERN VALENJ eat_del
END

APPEND VALENJ
  IF ~~ THEN BEGIN eat_dale
    SAY @1044
    IF ~~ THEN DO ~ActionOverride("Daleson",Enemy())
                   DisplayString("Daleson",19778)
                   Attack("Daleson")~ EXIT
  END
  IF ~~ THEN BEGIN eat_del
    SAY @1045 = @1046
    IF ~~ THEN DO ~ActionOverride("Delcia",Enemy())
                   DisplayString("Delcia",19751)
                   ActionOverride("kpsold01",SetNumTimesTalkedTo(1))
                   ActionOverride("kpsold01",Enemy())
                   Attack("Delcia")~ EXIT
  END
END

// Amnish Guards!
INTERJECT VVAMN3 0 Valen_IJ14
  == "VVAMN3"     IF ~InParty("Valen")~ THEN @1050
  == "VVAMN1"     IF ~InParty("Valen")~ THEN @1051
  == "VALENJ"     IF ~InParty("Valen")~ THEN @1052
  == "VVAMN3"     IF ~InParty("Valen")~ THEN @1053
END VVAMN1 fight_guards

APPEND VVAMN1
  IF ~~ THEN BEGIN fight_guards
    SAY @1053
    IF ~~ THEN DO 
~ActionOverride("vvamn2",Enemy())
 ActionOverride("vvamn2",Attack("Valen"))
 ActionOverride("vvamn3",Enemy())
 ActionOverride("vvamn3",Attack("Valen"))
 ActionOverride("Valen",ReallyForceSpell("Valen",4152))
 ActionOverride("Valen",Attack("vvamn1"))
 Enemy()
 Attack("Valen")~ EXIT
  END
END

// Delon
EXTEND_BOTTOM DELON 1 5 9 15 16 
  IF ~InParty("Valen")~ THEN EXTERN VALENJ eat_delon1
END

CHAIN VALENJ eat_delon1
  @1060 = @1061
== "DELON" @1062
END VALENJ eat_delon2

APPEND VALENJ
  IF ~~ THEN BEGIN eat_delon2
    SAY @1063
    IF ~~ THEN DO ~ActionOverride("Delon",Enemy())
                   DisplayString("Delon",19778)
                   Attack("Delon")~ EXIT
  END
END

// Chief inspector Brega
EXTEND_BOTTOM HABREGA 1
  IF ~InParty("Valen")~ THEN EXTERN HABREGA eat_brega1
END

CHAIN HABREGA eat_brega1
   @1070 
== "VALENJ" @1071
== "HABREGA" @1072
== "VALENJ" @1073
== "HABREGA" @1074
== "VALENJ" @1075
END HABREGA eat_brega2

APPEND HABREGA
  IF ~~ THEN BEGIN eat_brega2
    SAY @1076
    IF ~~ THEN DO ~ActionOverride("Valen",Attack("habrega"))
                   Shout(99)
                   Enemy() 
                   Attack("Valen")~ EXIT
  END
END

// Rose
APPEND MURDGIRL
  IF WEIGHT #-1 ~Name("Valen",LastTalkedToBy)
                 Global("ValenRose","LOCALS",0)~ THEN BEGIN rose1
    SAY @1080
    IF ~~ THEN DO ~SetGlobal("ValenRose","LOCALS",1)~ EXTERN VALENJ rose2
  END
  IF ~~ THEN BEGIN rose3
    SAY @1084
    IF ~~ THEN EXIT
  END
END

CHAIN VALENJ rose2
  @1081
== "MURDGIRL" @1082
== "VALENJ" @1083
END MURDGIRL rose3

// Valygar
INTERJECT VALYGAR 20 Valen_IJ15
  == "VALENJ"     IF ~InParty("Valen")~ THEN @1090
  == "VALYGAR"     IF ~InParty("Valen")~ THEN @1091
  == "VALENJ"     IF ~InParty("Valen")~ THEN @1092
  == "VALYGAR"     IF ~InParty("Valen")~ THEN @1093
  == "VALENJ"     IF ~InParty("Valen")~ THEN @1094
END VALYGAR 27

// Anath
INTERJECT RNGWLF01 11 Valen_IJ16
  == "VALENJ"     IF ~InParty("Valen")~ THEN @1100
  == "RNGWLF01"     IF ~InParty("Valen")~ THEN @1101
  == "VALENJ"     IF ~InParty("Valen")~ THEN @1102
END RNGWLF01 7

// Roger
APPEND ROGER
  IF WEIGHT #-1 ~InParty("Valen")
      Global("ValenRoger","GLOBAL",0)~ THEN BEGIN vr0
    SAY @1110
    IF ~~ THEN DO ~SetGlobal("ValenRoger","GLOBAL",1)~ EXTERN VALENJ valen_rog
  END
  CHAIN2 VALENJ valen_rog
    @1111
  == @1112
  == @1113
  == @1114
  == @1115
  == @1116
  == @1117
  == @1118
  == @1119
  END ROGER valen_bye
  IF ~~ THEN BEGIN valen_bye
    SAY @1120
    IF ~~ THEN EXIT
  END
END

INTERJECT ARAN02 0 Valen_IJ17
  == "VALENJ"     IF ~InParty("Valen")~ THEN @1130
  == "ARAN02"     IF ~InParty("Valen")~ THEN @1131
  == "VALENJ"     IF ~InParty("Valen")~ THEN @1132
END ARAN02 aran_bye

APPEND ARAN02
  IF ~~ THEN BEGIN aran_bye
    SAY #61774
    IF ~~ THEN DO 
      ~Enemy()
       ReallyForceSpell(Myself,CLERIC_FALSE_DAWN)
       ReallyForceSpell(Myself,CLERIC_SUNRAY)~ EXIT
  END
END

INTERJECT PPIMOEN 0 Valen_IJ18
  == "VALENJ"     IF ~InParty("Valen")~ THEN @1140
  == "PPIMOEN"     IF ~InParty("Valen")~ THEN @1141
  == "VALENJ"     IF ~InParty("Valen")~ THEN @1142
END PPIMOEN 1

// Lonk
INTERJECT PPWORKER 17 Valen_IJ19
  == "VALENJ"     IF ~InParty("Valen")~ THEN @1150
  == "PPWORKER"   IF ~InParty("Valen")~ THEN @1151
  == "VALENJ"     IF ~InParty("Valen")~ THEN @1152
END PPWORKER 21

// Dace
INTERJECT PPJOYE 0 Valen_IJ20
  == "VALENJ"     IF ~InParty("Valen")~ THEN @1160
  == "PPJOYE"     IF ~InParty("Valen")~ THEN @1161
  == "VALENJ"     IF ~InParty("Valen")~ THEN @1162
  == "PPJOYE"     IF ~InParty("Valen")~ THEN @1163
  == "VALENJ"     IF ~InParty("Valen")~ THEN @1164
  == "PPJOYE"     IF ~InParty("Valen")~ THEN @1165 = @1166 = @1167
  == "VALENJ"     IF ~InParty("Valen")~ THEN @1168
  == "PPJOYE"     IF ~InParty("Valen")~ THEN @1169 
  == "VALENJ"     IF ~InParty("Valen")~ THEN @1170
END PPJOYE die_now

APPEND PPJOYE
  IF ~~ THEN BEGIN die_now
    SAY @1171
    IF ~~ THEN DO ~Enemy()
      ReallyForceSpell(Myself,WIZARD_PROTECTION_FROM_MAGIC_WEAPONS)
      ReallyForceSpell(Myself,WIZARD_IMPROVED_HASTE)~ 
      JOURNAL #22934 EXIT
  END
END

INTERJECT PPSAEM2 21 Valen_IJ21
  == "VALENJ"     IF ~InParty("Valen")~ THEN @1180
  == "PPSAEM2"     IF ~InParty("Valen")~ THEN @1181
  == "VALENJ"     IF ~InParty("Valen")~ THEN @1182
  == "PPSAEM2"     IF ~InParty("Valen")~ THEN @1183
  == "VALENJ"     IF ~InParty("Valen")~ THEN @1184
  == "PPSAEM2"     IF ~InParty("Valen")~ THEN @1185
  == "VALENJ"     IF ~InParty("Valen")~ THEN @1186
  == "PPSAEM2"     IF ~InParty("Valen")~ THEN @1187
  == "VALENJ"     IF ~InParty("Valen")~ THEN @1188
  == "PPSAEM2"     IF ~InParty("Valen")~ THEN @1189
END PPSAEM2 20

// Svirfneblin
INTERJECT UDSVIR08 3 Valen_IJ22
  == "VALENJ"     IF ~InParty("Valen")~ THEN #51564
END UDSVIR08 1

// Demon Lord
INTERJECT UDDEMON 20 Valen_IJ23
  == "VALENJ"     IF ~InParty("Valen")
                      Dead("Phaere")
                      PartyHasItem("MISC9t")~ THEN @1190
END UDDEMON valen_trade

APPEND UDDEMON
  IF ~~ THEN BEGIN valen_trade
    SAY @1191
    IF ~~ THEN DO  ~TakePartyItem("MISC9t")
SetGlobal("EggsDie","GLOBAL",1)
GiveItemCreate("HALB06","Valen",1,1,1)
GiveItemCreate("RING07","Valen",1,1,1)
AddXPObject("Valen",500000)~ GOTO 11
// normally 150000 is distributed to the party
  END
END


INTERJECT UDSIMYAZ 36 Valen_IJ24
  == "VALENJ"     IF ~InParty("Valen")~ THEN @1200
  == "UDSIMYAZ"     IF ~InParty("Valen")~ THEN #52229
  == "VALENJ"     IF ~InParty("Valen")~ THEN @1201
  == "UDSIMYAZ"     IF ~InParty("Valen")~ THEN @1202
END VALENJ eat_sim

APPEND VALENJ
  IF ~~ THEN BEGIN eat_sim
    SAY @1203
    IF ~~ THEN DO ~EraseJournalEntry(57863)
  SetGlobal("AttackedGith","GLOBAL",1)
  ActionOverride("UDSIMYAZ",Enemy())~ EXIT
  END
END

EXTEND_BOTTOM c6drizz1 25 29 30 34 36 54
  IF ~InParty("Valen")~ THEN EXTERN VALENJ eat_driz
END

CHAIN VALENJ eat_driz
  @1210
== "c6drizz1" @1211
== "valenj" @1212
== "c6drizz1" @1213
== "valenj" @1214
END c6drizz1 eat_driz2

APPEND c6drizz1
  IF ~~ THEN BEGIN eat_driz2
    SAY @1215
    IF ~~ THEN DO ~Shout(89)
                   Enemy()
                   CreateCreatureObjectEffect("C6GUEN","SPANISUM",Myself)~ EXIT
  END
END

// Elhan
INTERJECT c6elhan2 67 Valen_IJ25
  == "VALENJ"     IF ~InParty("Valen")~ THEN @1220
END c6elhan2 68

// Demin
INTERJECT sudemin 26 Valen_IJ26
  == "VALENJ"     IF ~InParty("Valen")~ THEN @1230
END sudemin 27

// Wraith Sarevok
INTERJECT hellsare 25 Valen_IJ27
  == "VALENJ"     IF ~InParty("Valen")~ THEN @1240
END hellsare 26
