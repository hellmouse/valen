EXTEND_BOTTOM BOANASTE 0
  IF ~Global("WhoAreYou","LOCALS",0)~ THEN REPLY @1 
    DO ~SetGlobal("WhoAreYou","LOCALS",1)~ GOTO whoareyou
  IF ~Global("YouArePale","LOCALS",0)
      CheckStatGT(Player1,15,INT)~ THEN REPLY @9 
    DO ~SetGlobal("YouArePale","LOCALS",1)~ GOTO youarepale
END

EXTEND_BOTTOM BOANASTE 5
  IF ~CheckStatGT(Player1,15,INT)~ THEN REPLY @4 
    GOTO vampire
END

APPEND BOANASTE
  IF ~~ THEN BEGIN whoareyou
    SAY @2
    COPY_TRANS BOANASTE 0
  END
  IF ~~ THEN BEGIN youarepale
    SAY @3
    COPY_TRANS BOANASTE 0
  END
  IF ~~ THEN BEGIN vampire
    SAY @5 = @6 = @7 = @8
    IF ~~ THEN GOTO 8 
  END
END

/////////////////////////////////////////////////////////////////////
REPLACE BODHI 
  IF ~~ THEN BEGIN 122
    SAY #49062 
    IF ~~ THEN DO ~CreateCreatureObject("valen",Myself,1,1,1)~ GOTO bodhi_valen
  END

  IF ~Global("BodhiAppear","GLOBAL",1)
      !Global("WorkingForAran","GLOBAL",1)
      Global("BodhiMove","LOCALS",0)
      PartyGoldGT(14999)~ 
      // removed: !Class(Player1,THIEF)
  THEN BEGIN 0 
    SAY #21339 
    IF ~~ THEN REPLY #21478 GOTO 1
    IF ~~ THEN REPLY #21479 GOTO 1
    IF ~~ THEN REPLY #21480 GOTO 1
    IF ~~ THEN REPLY #21508 GOTO 1
  END
END

APPEND BODHI
  IF ~~ THEN BEGIN bodhi_valen
    SAY @20 = @21 = @22 = @23 = @24
    COPY_TRANS BODHI 122
  END
END

EXTEND_BOTTOM PPBODHI4 15
  IF     ~InParty("Valen")
          Global("DoValenPPOnce","LOCALS",0)~ THEN 
   DO ~SetGlobal("DoValenPPOnce","LOCALS",1)~ EXTERN VALENJ ppbodhi
END

EXTEND_BOTTOM C6BODHI 22
  IF ~InParty("Valen")~ THEN EXTERN VALENJ c6bodhi
END


EXTEND_BOTTOM PLAYER1 33 // tree of life gut check 
  IF ~InParty("Valen")~ 
    THEN EXTERN PLAYER1 tree_of_life
END

APPEND PLAYER1 
  IF ~~ THEN BEGIN tree_of_life
    SAY @400
    IF ~~ THEN REPLY @401 EXTERN VALENJ tol_1
    IF ~~ THEN REPLY @402 EXTERN VALENJ tol_2
  END
END


/////////////////////////////////////////////////////////////////////

BEGIN VALEN

IF ~True()~ THEN BEGIN first
  SAY @100
  IF ~Global("Who","LOCALS",0)~ THEN 
    DO ~SetGlobal("Who","LOCALS",1)~ REPLY @101 GOTO who
  IF ~Global("What","LOCALS",0)~ THEN 
    DO ~SetGlobal("What","LOCALS",1)~ REPLY @121 GOTO what
  IF ~~ THEN REPLY @131 EXIT
  IF ~~ THEN REPLY @141 GOTO join
END


IF ~~ THEN BEGIN who
  SAY @102 = @103 = @104 = @105 = @106 = @107 = @108 = @109 = @110 =
      @111 = @112 = @113 = @114
  IF ~~ THEN GOTO first
END

IF ~~ THEN BEGIN what
  SAY @122 = @123 = @124 = @125 = @126 = @127
  IF ~~ THEN GOTO first
END

IF ~~ THEN BEGIN join
  SAY @142 
  IF ~~ THEN DO ~JoinParty()~ EXIT
END

// kicked-out dialogue

BEGIN VALENP

IF ~True()~ THEN BEGIN first
  SAY @200
  IF ~~ THEN REPLY @201 DO ~JoinParty()~ EXIT
  IF ~~ THEN REPLY @202 EXIT
END

// join dialogue

BEGIN VALENJ

IF ~InParty("Aerie")~ THEN BEGIN bad1
  SAY @301 IF ~~ THEN DO ~SetLeavePartyDialogFile() LeaveParty()~ EXIT
END

IF ~InParty("Anomen")
    OR(2)
     Alignment("Anomen",LAWFUL_GOOD)
     Alignment("Anomen",LAWFUL_NEUTRAL)~ THEN BEGIN bad2
  SAY @302 IF ~~ THEN DO ~SetLeavePartyDialogFile() LeaveParty()~ EXIT
END

IF ~InParty("Keldorn")~ THEN BEGIN bad3
  SAY @300 IF ~~ THEN DO ~SetLeavePartyDialogFile() LeaveParty()~ EXIT
END

IF ~InParty("Mazzy")~ THEN BEGIN bad4
  SAY @303 IF ~~ THEN DO ~SetLeavePartyDialogFile() LeaveParty()~ EXIT
END

IF ~!InParty(Myself)~ THEN BEGIN not_here
  SAY @200
  IF ~~ THEN REPLY @201 DO ~JoinParty()~ EXIT
  IF ~~ THEN REPLY @202 DO ~SetLeavePartyDialogFile()~ EXIT
END

IF ~True()~ THEN BEGIN chat
  SAY @600
  IF ~Global("ValenNoHide","LOCALS",0)~ THEN REPLY @601 
    DO ~SetGlobal("ValenNoHide","LOCALS",1)~ GOTO very_well
  IF ~Global("ValenNoHide","LOCALS",1)~ THEN REPLY @602
    DO ~SetGlobal("ValenNoHide","LOCALS",0)~ GOTO very_well
  IF ~Global("ValenNoCharm","LOCALS",0)~ THEN REPLY @607 
    DO ~SetGlobal("ValenNoCharm","LOCALS",1)~ GOTO very_well
  IF ~Global("ValenNoAttack","LOCALS",0)~ THEN REPLY @603
    DO ~SetGlobal("ValenNoAttack","LOCALS",1)~ GOTO dont_like
  IF ~Global("ValenNoAttack","LOCALS",1)~ THEN REPLY @604
    DO ~SetGlobal("ValenNoAttack","LOCALS",0)~ GOTO oh_yes
  IF ~Global("ValenNoCharm","LOCALS",1)~ THEN REPLY @608 
    DO ~SetGlobal("ValenNoCharm","LOCALS",0)~ GOTO very_well
  IF ~Global("ValenNoDetect","LOCALS",0)~ THEN REPLY @609
    DO ~SetGlobal("ValenNoDetect","LOCALS",1)~ GOTO very_well
  IF ~Global("ValenNoDetect","LOCALS",1)~ THEN REPLY @610
    DO ~SetGlobal("ValenNoDetect","LOCALS",0)~ GOTO very_well
  IF ~~ THEN REPLY @605 
    DO ~SetGlobal("ValenFixUp","LOCALS",1)~ GOTO very_well
  IF ~~ THEN REPLY @606 GOTO very_well
END

IF ~~ THEN BEGIN very_well SAY @699 IF ~~ THEN EXIT END
IF ~~ THEN BEGIN dont_like SAY @698 IF ~~ THEN EXIT END
IF ~~ THEN BEGIN oh_yes SAY @697 IF ~~ THEN EXIT END

IF ~~ THEN BEGIN tol_1
  SAY @403 = @404
  COPY_TRANS PLAYER1 33
END
IF ~~ THEN BEGIN tol_2
  SAY @405 = @406 = @407 
  COPY_TRANS PLAYER1 33
END

IF ~~ THEN BEGIN ppbodhi
  SAY @310
  IF ~~ THEN EXTERN PPBODHI4 valen0
END

CHAIN2 PPBODHI4 valen0
   @311 = @312 = @313 
== @314 
== @315 
== @316 
== @317 = @318 
== @319
== @320 
== @321 END PPBODHI4 valen1

APPENDI PPBODHI4
  IF ~~ THEN BEGIN valen1
    SAY @322
    COPY_TRANS PPBODHI4 15
  END
END

IF ~~ THEN BEGIN c6bodhi
  SAY @330
  IF ~~ THEN EXTERN C6BODHI valen2
END

CHAIN2 C6BODHI valen2
   @331 = @332
== @333
== @334 = @335
== @336
END C6BODHI valen3

APPENDI C6BODHI
  IF ~~ THEN BEGIN valen3
    SAY @337
    COPY_TRANS C6BODHI 22
  END
END

// salvanas

APPEND SALVANAS

IF WEIGHT #-1 ~!InPartySlot(LastTalkedToBy,0)
               Name("Valen",LastTalkedToBy)~ THEN BEGIN s0 
  SAY @500
  IF ~~ THEN EXTERN VALENJ s1
END

CHAIN2 VALENJ s1
   @501 
== @502
== @503
END SALVANAS s2

IF ~~ THEN BEGIN s2
  SAY @504
  IF ~~ THEN DO ~EscapeArea()~ EXIT
END

END
