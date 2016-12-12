(
~bpm = 100;

          //C - Am - F - G
~chords = [~c+12, ~a_, ~f, ~g];
~bass   = [-7,-9,-11,-10]-12;

~verseChords     = ~chords; //can be changed later only for verse
~chorusChords    = ~chords; //can be changed later only for chorus
~verseBassNotes  = ~bass;
~chorusBassNotes = ~bass;

~verseMelNotes  =  [7,5,6,4,5,3,4,2,3,1,0];
~verseMelDur    =  [0.25,0.5];
~chorusMelNotes =  [5,5,5,5,5,5,5,5,5,5,5,5,5,4];

~verseMelP =  Pbind(\degree, Pseq(~verseMelNotes,4),
   	                \dur,    Pseq(~verseMelDur,inf),
);

~verseChordsP =  Pbind(\note, Pseq(~verseChords,4),
);

~verseBassP =  Pbind(\degree, Pseq(~verseBassNotes,4),
);

~chorusMelP = Pbind(\degree, Pseq(~chorusMelNotes,4),
	                \dur,    Pseq(~verseMelDur,inf),
);

~chorusChordsP = Pbind(\note, Pseq(~chorusChords,4),
	                   \dur,    1,
);

~chorusBassP = Pbind(\degree, Pseq(~chorusBassNotes,4),
 	                 \dur,    1,
);

~verseP  = Ppar([~verseMelP, ~verseChordsP, ~verseBassP]);
~chorusP = Ppar([~chorusMelP,~chorusChordsP,~chorusBassP]);

Pseq([~verseP, ~verseP, ~chorusP, ~verseP,  ~chorusP, ~chorusP]).play;
)