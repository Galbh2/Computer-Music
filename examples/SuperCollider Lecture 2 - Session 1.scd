/* SuperCollider session 1:
1. Introduction to SC and the IDE
2. First sounds
3. Patterns
*/

//SC editor, lang, server

//Shortcuts:
//cmd + return - evaluate and run code (see remark below)
//cmd + '.'    - stop sound
//cmd + shift + 'p'    - clear output window
//cmd + '+'    - enlarge font
//cmd + '-'    - shrink font

/*
Remark: the evaluated code can be either:
1. selected code
2. current row, if no code is selected
3. current block (if current row is located in parenthesis)
*/

//1. CS Hello world
"Hello world".postln;

//2. SC Hello world
{SinOsc.ar(880)}.play;
{Pulse.ar(220)}.play;
{Saw.ar(440)}.play;
{LFTri.ar(440)}.play;


//use parenthesis to evaluate a block without selection
(
{SinOsc.ar(880)}.play;
{SinOsc.ar(220)}.play;
)

//3. Sine wave - frequency
{SinOsc.ar(freq: 220)}.play; // give a lable to the parameters to improve code readability

//4. Sine wave -frequency and amp (mul is used here for amp)
{SinOsc.ar(freq: 220,phase: 0,mul: 0.2)}.play; // give a lable to the parameters to improve code readability

//5. Control Sine wave with Mouse - X-axis
{SinOsc.ar(MouseX.kr(100,1000))}.play;

//6. Basic Pbind
Pbind(\freq, 440).play;
Pbind(\degree, 5).play;

//7. Pbind with degree, duration and amp
Pbind(\degree, 5, \dur, 0.1).play;
Pbind(\degree, 5, \dur, 0.2, \amp, 0.8).play;

//8. play / trace
//Use parenthesis
(
Pbind(\degree, 5,
	  \dur, 0.2,
	  \amp, 0.8
).trace.play;
)
//s semicolon is not necessary in the last line and a comma is not necessary in the last parameter

//9. Pseq
//use [] for lists (a collection of items)
//Pseq can be a collection of anything
(
Pbind(\degree, Pseq([0,1,2,3,4,5,6,7]),
	  \dur, 0.2,
	  \amp, 0.8
).trace.play;
)


//10.
//add a posivite integer as a parameter in order to play the sequence a number of times
//use 'inf' - to repeat infinitely
(
Pbind(\degree, Pseq([0,1,2b,3,4,5b,6b,7],inf),
	  \dur,Pseq([0.125,0.125,0.25,0.125,0.125,0.125,0.125,0.25],inf),
	  \amp, 0.8
).trace.play;
)

//11.
// When the is more than one sequence in a Pbind pattern, the number of times the sequences are played is the minimul value
(
Pbind(\degree, Pseq([0,1,2b,3,4,5b,6b,7],inf),
	\dur,Pseq([0.125,0.125,0.25,0.125,0.125,0.125,0.125,0.25],3),
	  \amp, 0.8
).trace.play;
)

//12.
//Pseq  - play a sequence from any point in the sequence. Here 3 indicates the third element as the first element that will be played. The sequence will be played in a cyclic manner.
(
Pbind(\degree, Pseq([0,1,2b,3,4,5b,6b,7],inf,3),
	\dur,Pseq([0.125,0.125,0.25,0.125,0.125,0.125,0.125,0.25],3),
	  \amp, 0.8
).trace.play;
)

//13.
//Prand - choose a value randomly from a collection.
(
Pbind(\degree, Prand([0,3,4,5b,6b,7],inf),
	\dur,Pseq([0.125,0.125,0.25,0.125,0.125,0.125,0.125,0.25],3),
	  \amp, 0.8
).trace.play;
)

//14.
//Pwhite - choose a value randomly from a range.
(
Pbind(\degree, Pwhite(0,7),
	\dur,Pseq([0.125,0.125,0.25,0.125,0.125,0.125,0.125,0.25],3),
	  \amp, 0.8
).trace.play;
)


//15.
//scecify probabilities for the collection values. The sum of the probablities should be 1.
Pwrand
(
Pbind(\degree,   Pwrand([0,6],[0.95,0.05],inf),
      \dur,   0.3,
	  \amp,   0.15,
).play;
)

//16.
//Pxrand(list, repeats)
//Choose randomly, but never return the same list item twice in a row


//17.
//add sound - specify a synth for the sound played in Pbind
(
SynthDef(\smooth, { |freq = 440, sustain = 1, amp = 0.5|
    var sig;
    sig = SinOsc.ar(freq, 0, amp) * EnvGen.kr(Env.linen(0.05, sustain, 0.1), doneAction: 2);
    Out.ar(0, sig ! 2)
}).add;
)

(
Pbind(
   // the name of the SynthDef to use for each note
   \instrument, \smooth,
   // MIDI note numbers -- converted automatically to Hz
   \midinote, Pseq([60, 72, 71, 67, 69, 71, 72, 60, 69, 67], 1),
   // rhythmic values
   \dur, Pseq([1, 1, 0.5, 0.25, 0.25, 0.5, 0.5, 1, 1, 1.5], 1)
).play;
)



