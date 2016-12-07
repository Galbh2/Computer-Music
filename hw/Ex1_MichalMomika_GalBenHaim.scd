
// Question 1 - a
// Start = 0 (a0), Step = 2 (d), length = 8(n)
(
Pbind(
\degree, Pseries(0, 2, 8),
\dur, 0.5,
\amp, 0.5,
).trace.play;
)

// Question 1 - b
// Repeats = [0,1,2,3,4,5,6,7], Repeats = infinity.
(
Pbind(
\degree, Prand([0,1,2,3,4,5,6,7], inf),
\dur, 0.5,
\amp, 0.5,
).trace.play;
)

// Repeats = [0,1,2,3,4,5,6,7], Repeats = infinity.
(
Pbind(
\degree, Pshuf([0,1,2,3,4,5,6,7], inf),
\dur, 0.5,
\amp, 0.5,
).trace.play;
)

// Question 1 - c
// List = [0.25, 0.5, 0.75, 1, 1.25, 1.5, 1.75], Repeats = infinity, Offset = 0.
Pbind(
\degree, Prand([0,1,2,3,4,5,6,7], inf),
\dur, Pseq([0.25, 0.5, 0.75, 1, 1.25, 1.5, 1.75], inf, 0),
\amp, 0.5,
).trace.play;
)

// Question 1 - d
(
Pbind(
\degree, Pwrand([0, 1, 2, 3, 4, 5, 6], [0.25, 0.125, 0.125, 0.125, 0.25, 0.125, 0.125], inf),
\dur, 0.5,
\amp, 0.5,
).trace.play;
)

// Question 1 - e
(
Pbind(
	\degree, Pseq([0, 4, 2, 2, 4, 2, 0], inf, 0),
	\dur, 0.6,
	\amp, 0.4,
).trace.play;
)

// Question 1 - f
(
Pbind(
	\degree, Pseries(3, 7, 8),
	\dur, 2,
	\amp, 0.4,
).trace.play;
)

//----------------------------------------------------------------------------------------------

// Question 2 - a
-3, 0, 4, 9, 11, 4, 0, 11, 12, 4, 0, 12, 6, 2,-3, 6, 4, 0, -3, 4, 0
-3, 4, 0, -4, -3,-3
(
Pbind(
	\note, Pseq([-3, 0, 4, 9, 11, 4, 0, 11, 12, 4, 0, 12, 6, 2,-3, 6, 4, 0, -3, 4, 0], inf, 0),
\dur, 0.5,
\amp, 0.4,
).trace.play;
)

// Question 2 - b
(
Pbind(
	\note, Pseq([-3, 0, 4, 9, 11, 4, 0, 11, 12, 4, 0, 12, 6, 2,-3, 6, 4, 0, -3, 4, 0], inf, 0),
\dur, Prand([0.6, 0.5, 0.4], inf),
\amp, 0.4,
).trace.play;
)

// Question 2 - c
(
Pbind(
	\note, Pseq([-3, 0, 4, 9, 11, 4, 0, 11, 12, 4, 0, 12, 6, 2,-3, 6, 4, 0, -3, 4, 0], inf, 0),
	\dur, Pshuf([0.6, 0.5, 0.4], inf),
\amp, 0.4,
).trace.play;
)

// Question 2 - d
// Start = -3 (a0), Step = 0.1 (d), length = 21 (n)
(
Pbind(
\note, Pseries(-3, 0.1, 21),
\dur, 0.55,
\amp, 0.4,
).trace.play;
)

// Question 2 - e
// Start = -3 (a0), Grow = 2 (q), length = 20 (n)
(
Pbind(
\note, Pgeom(-3, 2, 21),
\dur, 0.55,
\amp, 0.4,
).trace.play;
)

//----------------------------------------------------------------------------------------------

// Question 3 - a
(
Pbind(
\degree, Pseq([0,0,4,4,5,5,4,3,3,2,2,1,1,0]),
\dur, Pseq([0.5,0.5,0.5,0.5,0.5,0.5,1,0.5,0.5,0.5,0.5,0.5,0.5,1]),
\amp, 0.5,
).trace.play;
)

// Question 3 - b - 1
// The differences compared to the melody presented in a are:
// 1) The second note is re instead of do
// 2) The notes differ in their duration. The duration is selected randomly and is equal to either 0.25 or 0.5.
(
Pbind(
\degree, Pseq([0,1,4,4,5,5,4,3,3,2,2,1,1,0]),
\dur, Prand([0.25,0.5],inf),
\amp, 0.5,
).trace.play;
)


// Question 3 - b - 2
// The differences compared to the melody presented in a are:
// 1) The second note is re instead of do
// 2) The notes differ in their duration. The duration of each 7 notes is selected randomly and is equal to either
// the sequence 0.5,0.5,0.5,0.5,0.25,0.25,1 or 0.25,0.25,0.5,0.5,0.5,0.5,1. Meaning each note among a sequence of 7 notes gets its duration from the chosen sequence respectively (according to its index in the set).
(
Pbind(
\degree, Pseq([0,1,4,4,5,5,4,3,3,2,2,1,1,0]),
\dur, Prand([Pseq([0.5,0.5,0.5,0.5,0.25,0.25,1]),Pseq([0.25,0.25,0.5,0.5,0.5,0.5,1])],inf),
\amp, 0.5,
).trace.play;
)

// Question 3 - b - 3
// The differences compared to the melody presented in a are:
// 1) Instead of '...,4, 4,...' a sequence of size 4 is played. This sequence is chosen randomly and can be equal to either '5,7,5,4' or '1,2,3,4'.
// 2) The notes differ in their duration. The duration of each note is determined according to the sequence 0.5,0.5,0.25,0.25,0.25,0.25,0.5,0.5,1,0.5,0.5,0.5,0.5,0.5,0.5,1
(
Pbind(
\degree, Pseq([0,0,Prand([Pseq([5,7,5,4]),Pseq([1,2,3,4])]),5,5,4,3,3,2,2,1,1,0]),
\dur, Pseq([0.5,0.5,0.25,0.25,0.25,0.25,0.5,0.5,1,0.5,0.5,0.5,0.5,0.5,0.5,1]),
\amp, 0.5,
).trace.play;
)

// Question 3 - b - 4
// The difference compared to the melody presented in a is:
// 1) Not all notes have same amplitude. The amplitude of each of the 14 notes is determined accoeding to a geometric progression. This geometric progression starts at 0.05, has quotient of 1.2 and size of 14 elements (as the number of notes in the melody). Using the geometric progression we get a melody in which each note in the sequence gets a higher amplitude as the melody progresses.
(
Pbind(
\degree, Pseq([0,0,4,4,5,5,4,3,3,2,2,1,1,0]),
\dur, Pseq([0.5,0.5,0.5,0.5,0.5,0.5,1,0.5,0.5,0.5,0.5,0.5,0.5,1]),
\amp, Pgeom(0.05,1.2,14),
).trace.play;
)

// Question 3 - b - 5
// The differences compared to the melody presented in a are:
// 1) There's a rest after the first 7 notes.
// 2) Not all notes have same amplitude. The amplitude of each of the 14 notes is determined accoeding to a geometric progression. This geometric progression starts at 0.05, has quotient of 1.2 and size of 14 elements (as the number of notes in the melody). Using the geometric progression we get a melody in which each note in the sequence gets a higher amplitude as the melody progresses (same as question 3 - b - 4).
(
Pbind(
\degree, Pseq([0,0,4,4,5,5,4, \rest,3,3,2,2,1,1,0]),
\dur, Pseries(0.5,0.05,15),
\amp, Pgeom(0.05,1.2,15),
).trace.play;
)

// Question 3 - b - 6
// The difference compared to the melody presented in a is:
// 1) Not all notes have same amplitude. The amplitude of each of the 14 notes is determined accoeding to an arithmetic progression. This arithmetic progression starts at 0.1, the common difference of successive members is determined randomly from the list [0.15,-0.15], and has size of 14 elements (as the number of notes in the melody). The random selection of the difference of successive members results with an arithmetic progression which is not typical since the difference may vary between each 2 successive members, and thus we might not get a trend of consistent increasement or consistent decreasement.
(
￼Pbind(
\degree, Pseq([0,0,4,4,5,5,4,3,3,2,2,1,1,0]),
\dur, Pseq([0.5,0.5,0.5,0.5,0.5,0.5,1,0.5,0.5,0.5,0.5,0.5,0.5,1]),
\amp, Pseries(0.1,Prand([0.15,-0.15],inf),14),
).trace.play;
)


// Question 3 - c
(
Pbind(
\degree, Pseq([0,4,2,2,3,4,4,5,5,4,3,5,2,3,3,2,1,0]),
\dur, Pseq([0.25,0.25,0.25,0.25,0.5,0.5,0.5,0.5,1,0.25,0.25,0.25,0.25,0.5,0.5,0.5,0.5,1]),
\amp, 0.5,
).trace.play;
)

// Question 3 - d/*
// variation of the duration of the note
(
Pbind(
\degree, Pseq([0,4,2,2,3,4,4,5,5,4,3,5,2,3,3,2,1,0]),
	\dur, Pseq([Prand([0.25,0.5], inf)]),
\amp, 0.5,
).trace.play;
)

// Question 3 - d/*
// variation of the pitch of the note
(
Pbind(
	\degree, Pseq([0,Prand([4, 1], 1),2,2,3,4,Prand([3, 1], 1),5,5,4,3,5,2,3,Prand([2, 1], 1),2,1,0]),
\dur, Pseq([0.25,0.25,0.25,0.25,0.5,0.5,0.5,0.5,1,0.25,0.25,0.25,0.25,0.5,0.5,0.5,0.5,1]),
\amp, 0.5,
).trace.play;
)

// Question 3 - d/*
// The variation we liked
(
s.record;
Pbind(
	\degree, Pseq([0,1,2,2,3,4,3,5,5,4,3,5,2,3,1,2,1,0]),
\dur, Pseq([0.25,0.25,0.25,0.25,0.5,0.5,0.5,0.5,1,0.25,0.25,0.25,0.25,0.5,0.5,0.5,0.5,1]),
\amp, 0.5,
).trace.play;
s.stopRecording;
)



