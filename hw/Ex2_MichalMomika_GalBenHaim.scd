(
~bpm = 100;

//SynthDef bass
(
SynthDef(\bass, { |freq = 523.23, gate = 1, amp = 0.5, slideTime = 0.17, ffreq = 1100, width = 0.15,
        detune = 1.005, preamp = 4|
    var    sig,
        env = Env.adsr(0.01, 0.3, 0.4, 0.1);
    freq = Lag.kr(freq, slideTime);
    sig = Mix(VarSaw.ar([freq, freq * detune], 0, width, preamp)).distort * amp
        * EnvGen.kr(env, gate, doneAction: 2);
    sig = LPF.ar(sig, ffreq);
    Out.ar(0, sig ! 2)
}).add;
);



//C - Am - Fm - G
~chords = [~c, ~a_, ~f, ~g];
~bass   = [-7,-9,-4,-3];

~verseChords     = ~chords; //can be changed later only for verse
~chorusChords    = ~chords; //can be changed later only for chorus
~verseBassNotes  = ~bass;
~chorusBassNotes = ~bass;

~verseChordsDur = [2, 2, 2, 2];

~verseMelNotes  =  [7,5,5,4,4,4,3,2,3,3,1];
~verseMelDur    =  [0.25,0.5,0.25,0.5,0.5,0.5,0.25,0.25, 0.25,0.25, 0.5];
~chorusMelNotes =  [4,4,4,4,4,4,4,4,4,4,4,4,4,3];


~verseMelP =  Pbind(\degree, Pseq(~verseMelNotes,4),
   	                \dur,    Pseq(~verseMelDur,inf),
);

~verseChordsP =  Pbind(\note, Pseq(~verseChords,4),
	                   \dur,  Pseq(~verseChordsDur,2),
);

~verseBassP =  Pbind(\degree, Pseq(~verseBassNotes,4),
	                  \dur,  Pseq(~verseChordsDur,2),
	                  \instrument, \bass,
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


~verseP  = Ppar([~verseMelP,  ~verseChordsP, ~verseBassP]);
~chorusP = Ppar([~chorusMelP,~chorusChordsP,~chorusBassP]);

Pseq([~verseP, ~verseP, ~chorusP, ~verseP,  ~chorusP, ~chorusP]).play;
)