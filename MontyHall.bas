1 REM fast
10 GO SUB 210
20 LET car=1+(INT (RND*3))
30 LET playerdoor=1+(INT (RND*3))
40 LET monty=1+(INT (RND*3))
50 IF monty=playerdoor THEN GO TO 40
60 IF monty=car THEN GO TO 40
70 LET sticker=playerdoor
80 IF monty=1 AND sticker=2 THEN LET switcher=3: GO TO 140
90 IF monty=1 AND sticker=3 THEN LET switcher=2: GO TO 140
100 IF monty=2 AND sticker=1 THEN LET switcher=3: GO TO 140
110 IF monty=2 AND sticker=3 THEN LET switcher=1: GO TO 140
120 IF monty=3 AND sticker=1 THEN LET switcher=2: GO TO 140
130 IF monty=3 AND sticker=2 THEN LET switcher=1
140 IF sticker=car THEN LET stick=stick+1
150 IF switcher=car THEN LET switch=switch+1
160 LET rounds=rounds+1
170 LET tp=FN p(stick,rounds)
180 LET wp=100-tp
190 PRINT AT 0,17;car;AT 1,17;monty;AT 2,17;sticker;AT 3,17;Switcher;AT 5,17;rounds;AT 7,17;stick;AT 8,16;"(";tp;"%) ";AT 9,17;switch;AT 10,16;"(";wp;"%) "
200 GO TO 20
210 REM The Spectrum uses floating point only (it has no INTEGER types - in fact, it's best to think of it's numerical variables as REAL's. So it's INT function always rounds up, so the percentage calculation is not always (ahem) 100% correct! So line 180 is a little bit of a hack to make 100%. It evens out over the iterations in the simulation.
220 REM Sinclair BASIC has many quirks regarding performance. One is that for each line in the program, the interpreter has to skate past all the lines (in RAM) to it's current one. So, all non essesntial code is placed LAST in the listing.
230 REM Lines 80 through 130 are not what I consider an elegant solution, but I am drunk as I write this, so MEH!
240 BORDER 7: PAPER 7: INK 0: OVER 0: INVERSE 0: FLASH 0: BRIGHT 0: CLS 
250 DEF FN p(s,r)=INT (100/INT (r)*INT s)
260 LET stick=0
270 LET switch=0
280 LET rounds=0
290 RANDOMIZE 
300 PRINT AT 0,0;"Car is behind:   ": PRINT AT 1,0;"Monty opened:    ": PRINT AT 2,0;"Sticker opened:  ": PRINT AT 3,0;"Switcher opened: ": PRINT AT 5,0;"Games played:    ": PRINT AT 7,0;"Sticker Score:   ": PRINT AT 9,0;"Switcher Score:  "
310 RETURN 
320 REM Prep for z80 Snapshot
330 CLEAR 
340 RANDOMIZE 
350 PAUSE 100
360 GO SUB 210
370 RUN 
