//Icepriest of Auril additional dialogue

//Grisella dialogue

EXTEND_TOP DGRISELL 3

  IF ~Kit(LastTalkedToBy,k9Auril)~ THEN REPLY @9000 GOTO 4
  END
  
EXTEND_TOP DGRISELL 4

  IF ~Kit(LastTalkedToBy,k9Auril) CheckStatLT(LastTalkedToBy,14,WIS)~ THEN REPLY @9001 GOTO k9grissel
  IF ~Kit(LastTalkedToBy,k9Auril) CheckStatGT(LastTalkedToBy,13,WIS)~ THEN REPLY @9005 GOTO 5
  END


APPEND DGRISELL

IF ~~ THEN BEGIN k9grissel
  SAY @9002
  IF ~~ THEN REPLY @9003 GOTO 5
  IF ~CheckStatGT(LastTalkedToBy,8,INT)~ THEN REPLY @9004 GOTO 5
  END
END




//Pomab dialogue

ADD_TRANS_TRIGGER DPOMAB 0 ~False()~ DO 1
EXTEND_TOP DPOMAB 0
IF ~!Kit(LastTalkedToBy, k9Auril)~ THEN REPLY #578 /* ~I'd watch where you wag that tongue of yours, shopkeeper. All this snow hasn't put me in the best of moods.~ */ GOTO 2
END

EXTEND_BOTTOM DPOMAB 0
  IF ~Kit(LastTalkedToBy,k9Auril)~ THEN REPLY @9006 GOTO 2
END




//Everain dialogue

EXTEND_TOP DEREVAIN 3
  IF ~Kit(LastTalkedToBy,k9Auril)~ THEN REPLY @9007 GOTO k9evervain
  END
  
APPEND DEREVAIN

IF ~~ THEN BEGIN k9evervain
  SAY @9008
  IF ~~ THEN REPLY @9009 GOTO 9
  IF ~CheckStatGT(LastTalkedToBy,8,INT)~ THEN REPLY @9010 EXIT
  END
END


//Hrothgar dialogue

EXTEND_TOP DHROTH 11
  IF ~ Kit(LastTalkedToBy,k9Auril) NumInPartyGT(1)~ THEN REPLY @9013 DO ~SetGlobal("Join_Posse","GLOBAL",3)
~ GOTO 16
  IF ~  Kit(LastTalkedToBy,k9Auril)  NumInPartyLT(2)~ THEN REPLY @9014 DO ~SetGlobal("Join_Posse","GLOBAL",3)
~ GOTO 16
END

EXTEND_TOP DHROTH 34
  IF ~ Kit(LastTalkedToBy,k9Auril) CheckStatLT(LastTalkedToBy,14,WIS)~ THEN REPLY @9015 DO ~AddXP2DA("Level_1_Easy")
DisplayStringNoNameDlg(Myself,18529)
SetGlobal("Caravan_Quest","GLOBAL",4)
SetGlobal("Join_Posse","GLOBAL",3)
~ GOTO k9hroth1
  IF ~  Kit(LastTalkedToBy,k9Auril)  CheckStatGT(LastTalkedToBy,13,WIS)~ THEN REPLY @9019 DO ~AddXP2DA("Level_1_Easy")
DisplayStringNoNameDlg(Myself,18529)
SetGlobal("Caravan_Quest","GLOBAL",4)
SetGlobal("Join_Posse","GLOBAL",3)
~ GOTO k9hroth2
END

EXTEND_TOP DHROTH 36
  IF ~ Kit(LastTalkedToBy,k9Auril)~ THEN REPLY @9023 DO ~AddXP2DA("Level_1_Hard")
DisplayStringNoNameDlg(Myself,18528)
SetGlobal("Caravan_Quest","GLOBAL",4)
SetGlobal("Join_Posse","GLOBAL",3)
~ GOTO 37
END

APPEND DHROTH

IF ~~ THEN BEGIN k9hroth1
  SAY @9016
  IF ~~ THEN REPLY @9017 GOTO 37
  IF ~CheckStatLT(LastTalkedToBy,9,INT)~ THEN REPLY @9018 GOTO 37
  END


IF ~~ THEN BEGIN k9hroth2
  SAY @9020
  IF ~~ THEN REPLY @9021 GOTO 37
  IF ~CheckStatGT(LastTalkedToBy,8,INT)~ THEN REPLY @9022 GOTO 37
  END
END


//Hermit dialogue

EXTEND_TOP DHERMIT 4
  IF ~ Kit(LastTalkedToBy,k9Auril)~ THEN REPLY @9024 GOTO k9hermit1
END


APPEND DHERMIT

IF ~~ THEN BEGIN k9hermit1
  SAY @9025
  IF ~~ THEN REPLY #15023 /* ~Our expedition was bound for Kuldahar. Can you tell us which direction the town lays?~ */ GOTO 6
  IF ~~ THEN REPLY #15024 /* ~Our destination is none of your business. Farewell.~ */ GOTO 10
  END
END


//Nate Dialogue

EXTEND_BOTTOM DNATE 2
  IF ~ Kit(LastTalkedToBy,k9Auril)~ THEN REPLY @9026 GOTO k9nate
END

APPEND DNATE

IF ~~ THEN BEGIN k9nate
  SAY @9027 IF ~~ EXIT
  END
END



//Lysan dialogue


ADD_TRANS_TRIGGER DLYSANPR 9 ~!Kit(LastTalkedToBy, k9Auril)~ DO 4
ADD_TRANS_TRIGGER DLYSANPR 10 ~!Kit(LastTalkedToBy, k9Auril)~ DO 2



EXTEND_TOP DLYSANPR 12
  IF ~Kit(LastTalkedToBy, k9Auril)~ THEN REPLY @222 /* ~Icepriest of Auril dialogue~ */ GOTO 13
  END


ADD_TRANS_TRIGGER DLYSANPR 13 ~False()~ DO 0
EXTEND_TOP DLYSANPR 13
IF ~!Kit(LastTalkedToBy, k9Auril)~ THEN REPLY #1556 /* ~There is a spirit bound to that tomb. He does not wish to spend eternity in the cold and dark.~ */ GOTO 14
IF ~Kit(LastTalkedToBy, k9Auril)~ THEN REPLY @223 /* ~Icepriest of Auril dialogue~ */ GOTO 14
END

ADD_TRANS_TRIGGER DLYSANPR 14 ~False()~ DO 1 2
EXTEND_TOP DLYSANPR 14
 IF ~!Kit(LastTalkedToBy, k9Auril)~ THEN REPLY #1561 /* ~What about the people of Kuldahar? They are not dead, nor are they beyond mortal concerns. Would you deny them the warmth and protection of the great tree?~ */ GOTO 18
END

EXTEND_TOP DLYSANPR 14
  IF ~!Kit(LastTalkedToBy, k9Auril)~ THEN REPLY #1562 /* ~Enough of this useless chatter. You seem unwilling to listen to reason. Prepare to die!~ */ DO ~Enemy()
AddJournalEntry(1349,QUEST)
~ EXIT
END

ADD_TRANS_TRIGGER DLYSANPR 15 ~False()~ DO 1
EXTEND_TOP DLYSANPR 15
  IF ~!Kit(LastTalkedToBy, k9Auril)~ THEN REPLY #1566 /* ~Then I shall have to kill you. Prepare to die!~ */ DO ~Enemy() AddJournalEntry(1349,QUEST)~ EXIT
END

ADD_TRANS_TRIGGER DLYSANPR 16 ~False()~ DO 1 2
EXTEND_TOP DLYSANPR 16
IF ~!Kit(LastTalkedToBy, k9Auril)~ THEN REPLY #1570 /* ~All that manipulating of people's lives just so you can destroy a tomb? That is sick.~ */ GOTO 17
END


EXTEND_TOP DLYSANPR 16
IF ~!Kit(LastTalkedToBy, k9Auril)~ THEN REPLY #1571 /* ~I think I have heard enough. Prepare to die!~ */ DO ~Enemy()
AddJournalEntry(1349,QUEST)
~ EXIT
END


ADD_TRANS_TRIGGER DLYSANPR 17 ~False()~ DO 0 1 2
EXTEND_TOP DLYSANPR 17
  IF ~Kit(LastTalkedToBy,k9Auril)~ THEN REPLY @220 GOTO 20
  IF ~Kit(LastTalkedToBy,k9Auril)~ THEN REPLY @221 GOTO 20
  IF ~!Kit(LastTalkedToBy, k9Auril)~ THEN REPLY #1574 /* ~And what of Kuldahar, Lysan?~ */ GOTO 18
  IF ~!Kit(LastTalkedToBy, k9Auril)~ THEN REPLY #1575 /* ~A calling? Sounds like the raving of a diseased mind to me.~ */ GOTO 20
  IF ~!Kit(LastTalkedToBy, k9Auril)~ THEN REPLY #1576 /* ~I have heard enough. Prepare to die!~ */ DO ~Enemy()
AddJournalEntry(1349,QUEST)~ EXIT
END



ADD_TRANS_TRIGGER DLYSANPR 20 ~False()~ DO 0
EXTEND_TOP DLYSANPR 20
  IF ~!Kit(LastTalkedToBy, k9Auril)~ THEN REPLY #1582 /* ~So be it!~ */ DO ~Enemy()
AddJournalEntry(1415,QUEST)
~ EXIT
END

EXTEND_TOP DLYSANPR 20
  IF ~Kit(LastTalkedToBy, k9Auril)~ THEN REPLY @224 /* ~Icepriest of Auril dialogue~ */ DO ~Enemy()
AddJournalEntry(1415,QUEST)
~ EXIT
END

ADD_TRANS_TRIGGER DLYSANPR 21 ~False()~ DO 0
EXTEND_TOP DLYSANPR 21
  IF ~!Kit(LastTalkedToBy, k9Auril)~ THEN REPLY #1582 /* ~So be it!~ */ DO ~Enemy()
AddJournalEntry(1415,QUEST)
~ EXIT
END

EXTEND_TOP DLYSANPR 21
  IF ~Kit(LastTalkedToBy, k9Auril)~ THEN REPLY @224 /* ~Icepriest of Auril dialogue~ */ DO ~Enemy()
AddJournalEntry(1415,QUEST)
~ EXIT
END

ADD_TRANS_TRIGGER DLYSANPR 22 ~False()~ DO 0
EXTEND_TOP DLYSANPR 22
  IF ~!Kit(LastTalkedToBy, k9Auril)~ THEN REPLY #1582 /* ~So be it!~ */ DO ~Enemy()
AddJournalEntry(1415,QUEST)
~ EXIT
END

EXTEND_TOP DLYSANPR 22
  IF ~Kit(LastTalkedToBy, k9Auril)~ THEN REPLY  @224 /* ~Icepriest of Auril dialogue~ */ DO ~Enemy()
AddJournalEntry(1415,QUEST)
~ EXIT
END

