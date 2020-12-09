// creator  : weidu (version 23700)
// argument : DLYSANPR.DLG
// game     : .
// source   : ./DATA/DLGFILE.BIF
// dialog   : .\lang\en_us/dialog.tlk
// dialogF  : (none)

BEGIN ~DLYSANPR~
//////////////////////////////////////////////////
// WARNING: this file contains non-trivial WEIGHTs
//////////////////////////////////////////////////

IF WEIGHT #1 /* Triggers after states #: 23 even though they appear after this state */
~  NumberOfTimesTalkedTo(0)
~ THEN BEGIN 0 // from:
  SAY #1498 /* ~This is my private retreat. I will thank you to leave me to my solitude.~ */
  IF ~~ THEN REPLY #1428 /* ~Who are you?~ */ GOTO 2
  IF ~~ THEN REPLY #1500 /* ~What are you doing here?~ */ GOTO 3
  IF ~  GlobalGT("Kress_Quest","GLOBAL",0)
~ THEN REPLY #1501 /* ~I seek a priestess of Auril. Would that be you?~ */ GOTO 6
  IF ~~ THEN REPLY #1502 /* ~Very well, farewell.~ */ EXIT
END

IF WEIGHT #2 /* Triggers after states #: 23 even though they appear after this state */
~  NumTimesTalkedToGT(0)
~ THEN BEGIN 1 // from:
  SAY #1503 /* ~Why do you insist on disturbing me? Please leave me to my solitude.~ */
  IF ~~ THEN REPLY #1428 /* ~Who are you?~ */ GOTO 2
  IF ~~ THEN REPLY #1500 /* ~What are you doing here?~ */ GOTO 3
  IF ~  GlobalGT("Kress_Quest","GLOBAL",0)
~ THEN REPLY #1501 /* ~I seek a priestess of Auril. Would that be you?~ */ GOTO 6
  IF ~~ THEN REPLY #1502 /* ~Very well, farewell.~ */ EXIT
END

IF ~~ THEN BEGIN 2 // from: 1.0 0.0
  SAY #1508 /* ~Who I am is no concern of yours... but I suppose there is no harm in telling you. My name is Lysan.~ */
  IF ~~ THEN REPLY #1500 /* ~What are you doing here?~ */ GOTO 3
  IF ~  GlobalGT("Kress_Quest","GLOBAL",0)
~ THEN REPLY #1501 /* ~I seek a priestess of Auril. Would that be you?~ */ GOTO 6
  IF ~~ THEN REPLY #1502 /* ~Very well, farewell.~ */ EXIT
END

IF ~~ THEN BEGIN 3 // from: 2.0 1.1 0.1
  SAY #1513 /* ~I am a simple clergywoman who is on retreat. I came here seeking solace and a place to meditate.~ */
  IF ~~ THEN REPLY #1514 /* ~Are there not better places for a retreat than this cave?~ */ GOTO 4
  IF ~  GlobalGT("Kress_Quest","GLOBAL",0)
~ THEN REPLY #1501 /* ~I seek a priestess of Auril. Would that be you?~ */ GOTO 6
  IF ~~ THEN REPLY #1516 /* ~Very well, I shall leave. Farewell.~ */ EXIT
END

IF ~~ THEN BEGIN 4 // from: 3.0
  SAY #1517 /* ~No, not really. Many faiths teach that enlightenment can be achieved through adversity and hardship. This cave provides just such an environment.~ */
  IF ~~ THEN REPLY #1518 /* ~What faith do you follow?~ */ GOTO 5
  IF ~  GlobalGT("Kress_Quest","GLOBAL",0)
~ THEN REPLY #1501 /* ~I seek a priestess of Auril. Would that be you?~ */ GOTO 6
  IF ~~ THEN REPLY #1516 /* ~Very well, I shall leave. Farewell.~ */ EXIT
END

IF ~~ THEN BEGIN 5 // from: 4.0
  SAY #1521 /* ~That is a private matter that I choose not to discuss with strangers. I do not pry into your private affairs, so I will thank you not to pry into mine. Now, if you are done with your questions, I would appreciate being left to my devotions.~ */
  IF ~  GlobalGT("Kress_Quest","GLOBAL",0)
~ THEN REPLY #1501 /* ~I seek a priestess of Auril. Would that be you?~ */ GOTO 6
  IF ~~ THEN REPLY #1516 /* ~Very well, I shall leave. Farewell.~ */ EXIT
END

IF ~~ THEN BEGIN 6 // from: 5.0 4.1 3.1 2.1 1.2 0.2
  SAY #1524 /* ~Hmm... I am somewhat familiar with Auril. The Frostmaiden is not very popular among most peoples. Many worship her out of fear rather than love or devotion. Her truly faithful are rare and secretive, to say the least. Why do you seek such a person?~ */
  IF ~~ THEN REPLY #1525 /* ~I have questions regarding the faith.~ */ GOTO 7
  IF ~~ THEN REPLY #1526 /* ~I must speak to her about a matter of some importance.~ */ GOTO 8
  IF ~  Global("Know_Lysan","GLOBAL",1)
~ THEN REPLY #1527 /* ~Let us end this game, Lysan. I recognize you as the barmaid from Kuldahar. What is a barmaid doing here unless she is more than she seems?~ */ DO ~SetGlobal("Know_Lysan","GLOBAL",2)
~ GOTO 10
  IF ~~ THEN REPLY #1528 /* ~It is of little importance. Never mind and farewell.~ */ EXIT
END

IF ~~ THEN BEGIN 7 // from: 6.0
  SAY #1529 /* ~I see... Well, I wish you well in your search. Now, please leave me to my devotions.~ */
  IF ~  Global("Know_Lysan","GLOBAL",1)
~ THEN REPLY #1527 /* ~Let us end this game, Lysan. I recognize you as the barmaid from Kuldahar. What is a barmaid doing here unless she is more than she seems?~ */ DO ~SetGlobal("Know_Lysan","GLOBAL",2)
~ GOTO 10
  IF ~~ THEN REPLY #1502 /* ~Very well, farewell.~ */ EXIT
END

IF ~~ THEN BEGIN 8 // from: 6.1
  SAY #1532 /* ~Really? Hmm... I must admit that I am bursting with curiosity. I can't imagine what is so important that you would seek out a follower of Auril... Would you care to enlighten me?~ */
  IF ~~ THEN REPLY #1533 /* ~It is a private matter that I can only discuss with the priestess.~ */ DO ~SetGlobal("Know_Lysan","GLOBAL",2)
~ GOTO 9
  IF ~  Global("Know_Lysan","GLOBAL",1)
~ THEN REPLY #1527 /* ~Let us end this game, Lysan. I recognize you as the barmaid from Kuldahar. What is a barmaid doing here unless she is more than she seems?~ */ DO ~SetGlobal("Know_Lysan","GLOBAL",2)
~ GOTO 10
  IF ~~ THEN REPLY #1535 /* ~Not at this time. Farewell.~ */ EXIT
END

IF ~~ THEN BEGIN 9 // from: 8.0
  SAY #1536 /* ~I see... Very well, let us end this charade. I am Lysan, servant of Auril. You have found your priestess. Now, state your business with me...~ */
  IF ~~ THEN REPLY #1537 /* ~I would first know the tenets of your faith.~ */ GOTO 11
  IF ~  Class(LastTalkedToBy,DRUID_ALL)
~ THEN REPLY #1538 /* ~Followers of Auril believe that all fires should be extinguished, correct?~ */ GOTO 11
  IF ~  Class(LastTalkedToBy,CLERIC_ALL)
~ THEN REPLY #1538 /* ~Followers of Auril believe that all fires should be extinguished, correct?~ */ GOTO 11
  IF ~~ THEN REPLY #1539 /* ~I have come on behalf of the spirit of the tomb here. He is worried about your intentions toward his resting place.~ */ GOTO 13
  IF ~~ THEN REPLY #1540 /* ~My business is to kill you. Prepare to die.~ */ DO ~Enemy()
AddJournalEntry(1349,QUEST)
~ EXIT
  IF ~~ THEN REPLY #1541 /* ~I will discuss it with you another time. Farewell.~ */ EXIT
END

IF ~~ THEN BEGIN 10 // from: 8.1 7.0 6.2
  SAY #1542 /* ~I see... I wondered if you would recognize me since our meeting was so brief. Very well, let us drop the charade. I am Lysan, servant of Auril. You have found your priestess. Now state your business with me...~ */
  IF ~~ THEN REPLY #1537 /* ~I would first know the tenets of your faith.~ */ GOTO 11
  IF ~~ THEN REPLY #1539 /* ~I have come on behalf of the spirit of the tomb here. He is worried about your intentions toward his resting place.~ */ GOTO 13
  IF ~~ THEN REPLY #1540 /* ~My business is to kill you. Prepare to die.~ */ DO ~Enemy()
AddJournalEntry(1349,QUEST)
~ EXIT
  IF ~~ THEN REPLY #1541 /* ~I will discuss it with you another time. Farewell.~ */ EXIT
END

IF ~~ THEN BEGIN 11 // from: 23.0 10.0 9.2 9.1 9.0
  SAY #1547 /* ~Auril is the Frostmaiden, the cold breath of the north. She asks that her followers extinguish all flames, open structures to the cold, and to embrace winter... Those are the basic precepts of the faith. I will reveal nothing more to a non-believer. So tell me, why do you ask?~ */
  IF ~~ THEN REPLY #1548 /* ~Another told me of your faith. I needed to be sure he was not trying to deceive me.~ */ GOTO 12
  IF ~~ THEN REPLY #1539 /* ~I have come on behalf of the spirit of the tomb here. He is worried about your intentions toward his resting place.~ */ GOTO 13
  IF ~~ THEN REPLY #1550 /* ~I just wanted to be sure I was killing you for the right reason. Prepare to die!~ */ DO ~Enemy()

AddJournalEntry(1349,QUEST)
~ EXIT
END

IF ~~ THEN BEGIN 12 // from: 11.0
  SAY #1551 /* ~Oh? Who dares to speak of Auril? I would know who this person is!~ */
  IF ~~ THEN REPLY #1552 /* ~Kresselack, the spirit of the tomb here. He is worried about your intentions toward his resting place.~ */ GOTO 13
  IF ~~ THEN REPLY #1553 /* ~That is of no consequence. What matters is that you sound like the threat he says you are. Prepare to die!~ */ DO ~Enemy()
AddJournalEntry(1349,QUEST)
~ EXIT
  IF ~Kit(LastTalkedToBy, k9Auril)~ THEN REPLY @222 /* ~Icepriest of Auril dialogue~ */ GOTO 13
  IF ~~ THEN REPLY #1554 /* ~Never mind, we will speak of this at another time. Farewell.~ */ GOTO 21
END

IF ~~ THEN BEGIN 13 // from: 23.1 12.0 11.1 10.1 9.3
  SAY #1555 /* ~Hmm. I know nothing of any spirit, but I am familiar with the tomb you speak of. It is an abomination in the eyes of the goddess. I intend to make it more... pleasing to Her tastes.~ */
  IF ~!Kit(LastTalkedToBy, k9Auril)~ THEN REPLY #1556 /* ~There is a spirit bound to that tomb. He does not wish to spend eternity in the cold and dark.~ */ GOTO 14
  IF ~Kit(LastTalkedToBy, k9Auril)~ THEN REPLY @223 /* ~Icepriest of Auril dialogue~ */ GOTO 14
  IF ~~ THEN REPLY #1557 /* ~And what of Kuldahar? How do you view it?~ */ GOTO 18
  IF ~~ THEN REPLY #1558 /* ~Enough of this, I am leaving. Farewell.~ */ GOTO 22
END

IF ~~ THEN BEGIN 14 // from: 13.0
  SAY #1559 /* ~I couldn't care less what this spirit wants. He is dead, is he not? What do the dead care for light or dark, cold or warmth? They are beyond such mortal concerns.~ */
  IF ~~ THEN REPLY #1560 /* ~Be that as it may, this spirit cares. He has asked me to speak with you on his behalf.~ */ GOTO 15
  IF ~!Kit(LastTalkedToBy, k9Auril)~ THEN REPLY #1561 /* ~What about the people of Kuldahar? They are not dead, nor are they beyond mortal concerns. Would you deny them the warmth and protection of the great tree?~ */ GOTO 18
  IF ~!Kit(LastTalkedToBy, k9Auril)~ THEN REPLY #1562 /* ~Enough of this useless chatter. You seem unwilling to listen to reason. Prepare to die!~ */ DO ~Enemy()
AddJournalEntry(1349,QUEST)
~ EXIT
  IF ~~ THEN REPLY #1558 /* ~Enough of this, I am leaving. Farewell.~ */ GOTO 22
END

IF ~~ THEN BEGIN 15 // from: 14.0
  SAY #1564 /* ~I care not for this spirit or his desires! I have worked for months to rid that tomb of the undead within it so that I can perform the will of the goddess. I am not about to forsake the task now!~ */
  IF ~~ THEN REPLY #1565 /* ~What have you done, Lysan?~ */ GOTO 16
  IF ~!Kit(LastTalkedToBy, k9Auril)~ THEN REPLY #1566 /* ~Then I shall have to kill you. Prepare to die!~ */ DO ~Enemy()
AddJournalEntry(1349,QUEST)
~ EXIT
  IF ~~ THEN REPLY #1558 /* ~Enough of this, I am leaving. Farewell.~ */ GOTO 22
END

IF ~~ THEN BEGIN 16 // from: 15.0
  SAY #1568 /* ~First, I cursed the Vale and the spirits of the dead within it. I bid them to rise and haunt the land. Next, I insinuated myself into Kuldahar society and became a barmaid at the local tavern. From there, I began to spread rumors of the evil brewing within the Vale and the danger it posed to all. It was only a matter of time until someone was sent to deal with the situation. It happened to be you.~ */
  IF ~~ THEN REPLY #1569 /* ~You cursed the entire Vale? You hardly seem powerful enough for that.~ */ GOTO 17
  IF ~!Kit(LastTalkedToBy, k9Auril)~ THEN REPLY #1570 /* ~All that manipulating of people's lives just so you can destroy a tomb? That is sick.~ */ GOTO 17
  IF ~!Kit(LastTalkedToBy, k9Auril)~ THEN REPLY #1571 /* ~I think I have heard enough. Prepare to die!~ */ DO ~Enemy()
AddJournalEntry(1349,QUEST)
~ EXIT
  IF ~~ THEN REPLY #1558 /* ~Enough of this, I am leaving. Farewell.~ */ GOTO 22
END

IF ~~ THEN BEGIN 17 // from: 16.1 16.0
  SAY #1573 /* ~Hold your insults, fool! You have no concept of whom you are dealing with. When I cast my curse I felt a calling, a force that I had never felt before. It engulfed me, fueled my desire, and brought it into being! It had to be the will of the goddess herself made manifest in me. I was chosen to perform this great work!~ */
  IF ~!Kit(LastTalkedToBy, k9Auril)~ THEN REPLY #1574 /* ~And what of Kuldahar, Lysan?~ */ GOTO 18
  IF ~~ THEN REPLY #1575 /* ~A calling? Sounds like the raving of a diseased mind to me.~ */ GOTO 20
  IF ~!Kit(LastTalkedToBy, k9Auril)~ THEN REPLY #1576 /* ~I have heard enough. Prepare to die!~ */ DO ~Enemy()
AddJournalEntry(1349,QUEST)
~ EXIT
  IF ~Kit(LastTalkedToBy, k9Auril)~ THEN REPLY @220 /* ~Icepriest of Auril dialogue~ */ GOTO 20
  IF ~Kit(LastTalkedToBy, k9Auril)~ THEN REPLY @221 /* ~Icepriest of Auril dialogue~ */ GOTO 20
  IF ~~ THEN REPLY #1558 /* ~Enough of this, I am leaving. Farewell.~ */ GOTO 22
END

IF ~~ THEN BEGIN 18 // from: 17.0 14.1 13.1
  SAY #1578 /* ~Kuldahar, the great tree, and the circle of warmth are an abomination in the eyes of Auril. Kuldahar shall embrace the winter in Her name or perish in the cold wastes! The will of Auril shall be done.~ */
  IF ~~ THEN REPLY #1579 /* ~I cannot allow that to happen, Lysan.~ */ GOTO 19
  IF ~~ THEN REPLY #1558 /* ~Enough of this, I am leaving. Farewell.~ */ GOTO 22
END

IF ~~ THEN BEGIN 19 // from: 18.0
  SAY #1581 /* ~Oh really? How sad. I shall have to kill you then. Prepare to meet your fate, fool!~ */
  IF ~~ THEN REPLY #1582 /* ~So be it!~ */ DO ~Enemy()
AddJournalEntry(1415,QUEST)
~ EXIT
END

IF ~~ THEN BEGIN 20 // from: 17.1
  SAY #1583 /* ~How dare you! I am the chosen of Auril and you shall feel Her wrath. Die, fool!~ */
  IF ~!Kit(LastTalkedToBy, k9Auril)~ THEN REPLY #1582 /* ~So be it!~ */ DO ~Enemy()
AddJournalEntry(1415,QUEST)
~ EXIT
  IF ~Kit(LastTalkedToBy, k9Auril)~ THEN REPLY @224 /* ~Icepriest of Auril dialogue~ */ DO ~Enemy()
AddJournalEntry(1415,QUEST)
~ EXIT
END

IF ~~ THEN BEGIN 21 // from: 12.2
  SAY #1587 /* ~No, I think not. I have revealed myself to you and cannot allow you to leave this cave alive. Prepare to meet your fate, fool!~ */
  IF ~!Kit(LastTalkedToBy, k9Auril)~ THEN REPLY #1582 /* ~So be it!~ */ DO ~Enemy()
AddJournalEntry(1415,QUEST)
~ EXIT
  IF ~Kit(LastTalkedToBy, k9Auril)~ THEN REPLY @224 /* ~Icepriest of Auril dialogue~ */ DO ~Enemy()
AddJournalEntry(1415,QUEST)
~ EXIT
END

IF ~~ THEN BEGIN 22 // from: 18.1 17.3 16.3 15.2 14.3 13.2
  SAY #1589 /* ~Farewell? I think not. I have revealed too much to you to allow you to leave this cave alive. Prepare to meet your fate!~ */
  IF ~!Kit(LastTalkedToBy, k9Auril)~ THEN REPLY #1582 /* ~So be it!~ */ DO ~Enemy()
AddJournalEntry(1415,QUEST)
~ EXIT
  IF ~Kit(LastTalkedToBy, k9Auril)~ THEN REPLY  @224 /* ~Icepriest of Auril dialogue~ */ DO ~Enemy()
AddJournalEntry(1415,QUEST)
~ EXIT
END

IF WEIGHT #0 ~  Global("Know_Lysan","GLOBAL",2)
~ THEN BEGIN 23 // from:
  SAY #1591 /* ~So, you have returned. Will you state your business with me now?~ */
  IF ~~ THEN REPLY #1537 /* ~I would first know the tenets of your faith.~ */ GOTO 11
  IF ~~ THEN REPLY #1539 /* ~I have come on behalf of the spirit of the tomb here. He is worried about your intentions toward his resting place.~ */ GOTO 13
  IF ~~ THEN REPLY #1540 /* ~My business is to kill you. Prepare to die.~ */ DO ~Enemy()
AddJournalEntry(1349,QUEST)
~ EXIT
END


//Edits

