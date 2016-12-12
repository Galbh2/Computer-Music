//SuperCollider session No. 2
/*
1. 4 ways to play notes
2. rest
3. flat, sharp
4. mtranspose
5. tempo
6. scale
7. Pshuf and Pslide
8. recording
9. series
10. variables
11. Ppar, Ptpar (in separate files)
*/

//1. 4 ways to play notes in SuperCollider
Pbind(\degree, 0).play;      // Degree in scale. Middle A = 5. Middle C = 0.
Pbind(\note, 9).play;        // difference on half tone = 1. Middle A = 5. Middle C = 0.
Pbind(\midinote, 69).play;   // Middle A = 69. Middle C = 60.
Pbind(\freq, 440).play;      // Middle A = 440. Middle C = 261...


//2. rest (use \rest or Rest(0.3))
(
Pbind(
	\degree, Pseq([0,1,1s,3,\rest,4s,5s,7]),
	\dur, 0.25).play;
)
//or:
(
Pbind(
	\degree, Pseq([0,1,1s,3,4,4s,5s,7]),
	\dur, Pseq([0.4,0.4,0.4,0.4,Rest(1),0.4,0.4,0.4]),
).play;
)

//3. flat and sharp (use 'b' and 's' accordingly)
//minor scale
//flat
(
Pbind(
	\degree, Pseq([0,1,2b,3,4,5b,6b,7]),
	\dur, 0.25
).play;
)
//sharp
(
Pbind(
	\degree, Pseq([0,1,1s,3,4,4s,5s,7]),
	\dur, 0.25
).play;
)

//chromatic scale using sharp
(
Pbind(
	\degree, Pseq([0,0s,1,1s,2,3,3s,4,4s,5,5s,6,7]),
	\dur, 0.25
).play;
)

//chromatic scale using flat
(
Pbind(
	\degree, Pseq([0,1b,1,2b,2,3,4b,4,5b,5,6b,6,7]),
	\dur, 0.25
).play;
)

//chromatic scale using note
(
Pbind(
	\note, Pseq([0,1,2,3,4,5,6,7,8,9,10,11,12]),
	\dur, 0.25
).play;
)

//chromatic scale using midinote
(
Pbind(
	\midinote, Pseq([60,61,62,63,64,65,66,67,68,69,70,71,72]),
	\dur, 0.25
).play;
)


//4. mtranspose
(
Pbind(
	\degree, Pseq([0,1,2,3,4,5,6,7],inf),
    \dur, 0.25,
	\mtranspose, 2,
	\scale, Scale.minor,
).play;
)

//5. Tempo using constant
(
Pbind(
	\degree, Pseq([0,1,2,3,4,5,6,7],inf),
    \dur, 0.25,
	\tempo,  1, // 1 = 60 BPM
).play;
)

//tempo using an environment variable (- use ~ as first character)

~mTempo = 80;

(
Pbind(
	\degree, Pseq([0,1,2,3,4,5,6,7],inf),
    \dur, 0.25,
	\mtranspose, 2,
	\tempo,  Pfunc({~mTempo})/60,
).play;
)


//6. Scale
//minor scale
(
Pbind(
	\degree, Pseq([0,1,2,3,4,5,6,7],inf),
    \dur, 0.25,
	\mtranspose, 2,
	\scale, Scale.minor,
).play;
)


///7. Pshuf and Pslide
(
//Pshuf(list, repeats)
Pbind(\freq,Pshuf([440,345,1320,657],3),
	  \dur,   0.3,
	  \amp,   0.15,
).play;
)

(
//Pslide(list, repeats)
Pbind(\note,Pslide([0,1,2,3,4,5,6],8,2),
	  \dur,   0.3,
	  \amp,   0.15,
	  \tempo, 2,
).play;
)

//8. record audio output to wav file
s.record;
s.stopRecording;


//9. series
Pseries (start: 0, step: 1, length: inf)
Pgeom (start: 0, step: 1, length: inf)


// sound examples
(
SynthDef(\help_sinegrain,
    { arg out=0, freq=440, sustain=0.05;
        var env;
        env = EnvGen.kr(Env.perc(0.01, sustain, 0.2), doneAction:2);
        Out.ar(out, SinOsc.ar(freq, 0, env))
    }).add;
)
Synth(\help_sinegrain);
(
var a;
a = Pseries(300, 20, 70).asStream;
{
    a.do { |val|
        Synth(\help_sinegrain, [\freq, val]);
        0.1.wait;
    }
}.fork;
)
(
Pbind(
    \dur, 0.01,
    \instrument, \help_sinegrain,
    \freq, Pseries(800.0, Pbrown(-1.0, 3.0, 0.1, inf), inf)
).play;
)

//10. variables:

local variables -
var rec, open,close;

//one letter variables - s is saved for the SuperCollider server
a=1;
a.postln;
b=2;
c=a+b;

//environment variables - use ~ as first character
(
~melody = Pbind(
	  \degree,[0,2,4],
	  \dur,   0.3,
	  \amp,   0.15,
	  \tempo,  Pfunc({~mTempo})/60,
).play;
)

~melody.play;
































