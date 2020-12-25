////////////////////////////////////////////////////////////////////////////
// Valen ToB Interjections
////////////////////////////////////////////////////////////////////////////

INTERJECT_COPY_TRANS ILLASERA 6 Valen_TOB0
  == "VALENJ"   IF ~InParty("Valen")~ THEN @1001
  == "ILLASERA" IF ~InParty("Valen")~ THEN @1002
END 

INTERJECT_COPY_TRANS SAREV25A 14 Valen_TOB1
  == "VALENJ"   IF ~InParty("Valen")~ THEN @1010
  == "SAREV25A" IF ~InParty("Valen")~ THEN @1011 = @1012
  == "VALENJ"   IF ~InParty("Valen")~ THEN @1013
  == "SAREV25A" IF ~InParty("Valen")~ THEN @1014
  == "VALENJ"   IF ~InParty("Valen")~ THEN @1015
  == "SAREV25A" IF ~InParty("Valen")~ THEN @1016
END 

INTERJECT_COPY_TRANS SAREV25A 55 Valen_TOB2
  == "VALENJ"   IF ~InParty("Valen")~ THEN @1020
  == "SAREV25A" IF ~InParty("Valen")~ THEN @1021
  == "VALENJ"   IF ~InParty("Valen")~ THEN @1022
  == "SAREV25A" IF ~InParty("Valen")~ THEN @1023
END

INTERJECT_COPY_TRANS SARMEL01 7 Valen_TOB3
  == "VALENJ"   IF ~InParty("Valen")~ THEN @1030 = @1031
  == "SARMEL01"   IF ~InParty("Valen")~ THEN @1032
END

// Saradush Jailer
EXTEND_BOTTOM SARJAI01 3
  IF ~InParty("Valen")~ THEN EXTERN VALENJ eat_jai
END

CHAIN3 VALENJ eat_jai
  @1033
  == "SARJAI01" @1034
  == "VALENJ" @1035
END SARJAI01 eat_jai2

APPEND SARJAI01
  IF ~~ THEN BEGIN eat_jai2
    SAY @1036
    IF ~~ THEN DO ~Enemy() ActionOverride("Valen",Attack("Sarjai01"))
      Unlock("Door03")~ EXIT
  END
END

INTERJECT SARPRO01 4 Valen_TOB4
  == "VALENJ"   IF ~InParty("Valen")~ THEN @1040
END SARPRO01 5

INTERJECT SARKIS01 9 Valen_TOB5
  == "VALENJ"   IF ~InParty("Valen")~ THEN @1050
END SARKIS01 16

INTERJECT SARMAG01 1 Valen_TOB6
  == "VALENJ"   IF ~InParty("Valen")~ THEN @1060
END SARMAG01 2

INTERJECT SARTHF2 0 Valen_TOB7
  == "VALENJ"   IF ~InParty("Valen") Global("Lazarus","GLOBAL",2)
                    Global("MuddyFootprints","GLOBAL",1)~ THEN @1070
  == "SARTHF2"   IF ~InParty("Valen") Global("Lazarus","GLOBAL",2)
                    Global("MuddyFootprints","GLOBAL",1)~ THEN @1071
  == "VALENJ"   IF ~InParty("Valen") Global("Lazarus","GLOBAL",2)
                    Global("MuddyFootprints","GLOBAL",1)~ THEN @1072
END SARTHF2 6

EXTEND_BOTTOM SARVOLO 9 #1
  IF ~InParty("Valen")~ THEN REPLY @1080 GOTO valen
END

CHAIN3 SARVOLO valen
  @1081 = @1082
  == "VALENJ" @1083
END SARVOLO 9

APPEND SARTEM01
  IF WEIGHT #-1 ~InParty("Valen")~ THEN BEGIN eat_valen
    SAY @1090
    IF ~~ THEN DO
~Enemy() 
ReallyForceSpell("Valen",CLERIC_HOLY_SMITE)
ReallyForceSpell("Valen",CLERIC_HOLY_WORD)
ReallyForceSpell("Valen",CLERIC_SUMMON_DEVA)
ReallyForceSpell(Myself,CLERIC_NEGATIVE_PLANE_PROTECTION)
ReallyForceSpell(Myself,CLERIC_IRONSKIN)
ReallyForceSpell(Myself,CLERIC_FALSE_DAWN)
ReallyForceSpell(Myself,CLERIC_SUNRAY)
ReallyForceSpell(Myself,CLERIC_NATURE_BEAUTY)
ReallyForceSpell(Player1,CLERIC_IMPLOSION)
ReallyForceSpell(Player2,CLERIC_IMPLOSION)
ReallyForceSpell(Player3,CLERIC_IMPLOSION)
ReallyForceSpell(Player4,CLERIC_IMPLOSION)
ReallyForceSpell(Player5,CLERIC_IMPLOSION)
ReallyForceSpell(Player6,CLERIC_IMPLOSION)~
  EXIT END
END

INTERJECT SARVAM01 0 Valen_TOB8
  == "VALENJ"   IF ~InParty("Valen")~ THEN @1100 = @1101
END SARVAM01 2

INTERJECT_COPY_TRANS GROMNIR 7 Valen_TOB9
  == "VALENJ"   IF ~InParty("Valen")~ THEN @1110
  == "GROMNIR"  IF ~InParty("Valen")~ THEN #40665
END 
