(
// Declare variables for the Pbind patterns
var p1,p2,p3,p4;

p1 = Pbind( \dur, Pseq([Pgeom(0.05,1.1,24),Pgeom(0.5,0.909,24)],2),
            \db, -20,
            \pan, -0.9,
            \midinote, Pseq([53, 53-4], inf)
);


p2 = Pbind( \dur, Pseq([Pgeom(0.05,1.1,24),Pgeom(0.5,0.909,24)],2),
            \db, -23,
            \pan, -0.3,
            \midinote, Pseq([60, 60-4], inf)
);


p3 = Pbind( \dur, Pseq([Pgeom(0.05,1.1,24),Pgeom(0.5,0.909,24)],2),
            \db, -26,
            \pan, 0.3,
            \midinote, Pseq([67, 67-4], inf)
);


p4 = Pbind( \dur, Pseq([Pgeom(0.05,1.1,24),Pgeom(0.5,0.909,24)],2),
            \db, -29,
            \pan, 0.9,
            \midinote, Pseq([74, 74-4], inf)
);


Ptpar([
	0.0, p1,
	2.0, p2,
	4.0, p3,
	6.0, p4,
], inf).play;
)