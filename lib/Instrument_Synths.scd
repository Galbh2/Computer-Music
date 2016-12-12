(
SynthDef(\peep,{|freq=100|
	var snd = SinOsc.ar(freq);
	snd = snd * EnvGen.ar(Env.perc(0.001,0.25), doneAction:2);
	Out.ar(0, snd ! 2);
}).add;
)

//SynthDef cfstring1
(
SynthDef(\cfstring1, { arg i_out, freq = 1567.98, gate = 1, pan, amp=0.9;
	var out, eg, fc, osc, a, b, w;
	fc = LinExp.kr(LFNoise1.kr(Rand(1,0.01)), -1,1,500,2000);
	osc = Mix.fill(3, {LFSaw.ar(freq * [Rand(0.999999999,1.01),Rand(0.99,0.99999)], 2, amp) }).distort * 0.225;
	eg = EnvGen.kr(Env.asr(1,1,1), gate, doneAction:2);
	out = eg * RLPF.ar(osc, fc, 0.099999999999);
	#a, b = out;
	Out.ar(i_out, Mix.ar(PanAz.ar(2, [a, b], [pan, pan+0.6])));
}).store;
);

//SynthDef cfstring2
(
SynthDef(\cfstring2, { arg i_out, freq = 4186.01, gate = 1, pan, amp=0.9;
	var out, eg, fc, osc, a, b, w;
	fc = LinExp.kr(LFNoise1.kr(Rand(1,0.01)), -1,1,500,2000);
	osc = Mix.fill(3, {LFSaw.ar(freq * [Rand(0.999999999,1.01),Rand(0.9999999999,0.99999)], 1.775, amp) }).distort * 0.095;
	eg = EnvGen.kr(Env.asr(1,1,1), gate, doneAction:2);
	out = eg * RLPF.ar(osc, fc, 0.099999999999);
	#a, b = out;
	Out.ar(i_out, Mix.ar(PanAz.ar(2, [a, b], [pan, pan+0.2])));
}).store;
);

//Synthdef berlinb
(
SynthDef(\berlinb, { arg out=0, freq = 65.41, amp = 0.01, pan=0, gate=1;
	var synth, env;
	env = Decay2.kr(gate, 0.05, 8, 0.0003);
	synth = RLPF.ar(
		LFPulse.ar(freq, 0, SinOsc.kr(0.12,[0,0.5pi],0.48,0.5)),
		freq * SinOsc.kr(0.21,0,18,20),
		0.07
	);
	#a, b = synth*env;
	DetectSilence.ar(a, 0.1, doneAction: 2);
	Out.ar(out, Mix.ar(PanAz.ar(4, [a,b], [pan, pan+1])));
}).store;
);


(
// SynthDef violin
SynthDef("violin", {arg out=0, freq=523.25, amp=1, lpf = 1537, gate=1, pan=0.3;

	var source, num_osc = 20;
	source = Mix.new( Array.fill(num_osc, { Saw.ar(freq + 2.0573.rand, 1/num_osc) *SinOsc.ar(1+0.1357.rand,pi,0.1,0.9) })) ;

	source = LPF.ar(source, lpf);
	source = source * EnvGen.ar(Env.adsr(0.3,0.357,0.8,1.0,1,-1),gate, doneAction: 2) ;

	Out.ar(out, Pan2.ar(source*amp*2, pan));

}).store;
);



// SynthDef cello
(
SynthDef("cello", {arg out=0, freq=261.63, amp=1, lpf = 1057, gate=1, pan=0.7;

	var source, num_osc = 7.7;
	source = Mix.new( Array.fill(num_osc, { Saw.ar(freq + 0.0573.rand, 1/num_osc) *SinOsc.ar(1+0.0357.rand,pi,0.1,0.9) })) ;

	source = LPF.ar(source, lpf);
	source = source * EnvGen.ar(Env.adsr(4,0.375,0.57,1.0,1,-1),gate, doneAction: 2) ;

	Out.ar(out, Pan2.ar(source*amp*4, pan));

}).store;
);



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

(
SynthDef("plucking", {arg amp = 0.1, freq = 440, decay = 5, coef = 0.1;

var env, snd;
env = EnvGen.kr(Env.linen(0, decay, 0), doneAction: 2);
snd = Pluck.ar(
        in: WhiteNoise.ar(amp),
        trig: Impulse.kr(0),

        maxdelaytime: 0.1,
        delaytime: freq.reciprocal,
        decaytime: decay,
        coef: coef);
    Out.ar(0, [snd, snd]);
}).add;
)

(
SynthDef("plucking2", {arg amp = 0.1, freq = 440, decay = 5, coef = 0.2;

var env, snd;
env = EnvGen.kr(Env.linen(0, decay, 0), doneAction: 2);
snd = Pluck.ar(
        in: WhiteNoise.ar(amp),
        trig: Impulse.kr(0),

        maxdelaytime: 0.2,
        delaytime: freq.reciprocal,
        decaytime: decay,
        coef: coef);
    Out.ar(0, [snd, snd]);
}).add;
)

// Mouseover Scale Function
(
~r = {
	var scale = Scale.majorPentatonic;
	SinOsc.ar(
		(
			DegreeToKey.kr(
				scale.as(LocalBuf),
				MouseX.kr(0,15), // mouse indexes into scale
				scale.stepsPerOctave,
				1, // mul = 1
				60 // offset by 60 notes
			)
			+ LFNoise1.kr([3,3], 0.02) // add some low freq stereo detuning
		).midicps, // convert midi notes to hertz
		261.63,
		0.10
	)
};
);

(
SynthDef("another", { |out, sustain=1, freq=500, pan=0.5, mul=0.5|
	var snd, env, mod;
	env = EnvGen.ar(Env.perc(0.01, sustain, 1, -4), doneAction:2);
	mod = SinOsc.ar(freq, mul: 500, add: 0);
	snd = Saw.ar(mod*sustain/4);
	snd = Pan2.ar(snd, FSinOsc.kr(0.5));
	Out.ar(out, snd * env);
}).add;
);



(
SynthDef("Clavi", { arg out, sustain=5, freq=240, mul=0.5, pan=0.5;
	var snd, env;
	env = EnvGen.ar(Env.perc(0.01, sustain, 1, -4), doneAction:2);
	snd = SinOsc.ar(freq, 0, mul);
	snd = Pan2.ar(snd, SinOsc.kr(0.5));
	Out.ar(out, snd * env);
}).add;
);


(
SynthDef(\kick, {|out=0|
	var env0, env1, env1m, sig;

	env0 =  EnvGen.ar(
		Env([0.5, 1, 0.5, 0], [0.005, 0.06, 0.26], [-4, -2, -4]), doneAction:2
	);
	env1 = EnvGen.ar(Env([110, 59, 29], [0.005, 0.29], [-4, -5]));
	env1m = env1.midicps;

	sig = LFPulse.ar(env1m, 0, 0.5, 1, -0.5);
	sig = sig + WhiteNoise.ar(1);
	sig = LPF.ar(sig, env1m * 1.5, env0);
	sig = sig + SinOsc.ar(env1m, 0.5, env0);

	sig = sig * 1.2;
	sig = sig.clip2(1);

	Out.ar(out, sig.dup);
}).add;

SynthDef(\snare, {|out=0, amp=0.8|
	var env0, env1, env2, env1m, oscs, noise, sig;

	env0 = EnvGen.ar(Env([0.5, 1, 0.5, 0], [0.005, 0.03, 0.10], [-4, -2, -4]));
	env1 = EnvGen.ar(Env([110, 60, 49], [0.005, 0.1], [-4, -5]));
	env1m = env1.midicps;
	env2 = EnvGen.ar(Env([1, 0.4, 0], [0.05, 0.13], [-2, -2]), doneAction:2);

	oscs = LFPulse.ar(env1m, 0, 0.5, 1, -0.5) +
	LFPulse.ar(env1m * 1.6, 0, 0.5, 0.5, -0.25);
	oscs = LPF.ar(oscs, env1m * 1.2, env0);
	oscs = oscs + SinOsc.ar(env1m, 0.8, env0);

	noise = WhiteNoise.ar(0.2);
	noise = HPF.ar(noise, 200, 2);
	noise = BPF.ar(noise, 6900, 0.6, 3) + noise;
	noise = noise * env2;

	sig = oscs + noise;
	sig = sig.clip2(1) * amp;

	Out.ar(out, sig.dup);
}).add;

(
SynthDef(\clap, {|out=0, amp = 0.5|
	var env1, env2, sig, noise1, noise2;

	env1 = EnvGen.ar(Env(
		[0, 1, 0, 1, 0, 1, 0, 1, 0],
		[0.001, 0.013, 0, 0.01, 0, 0.01, 0, 0.03],
		[0, -3, 0, -3, 0, -3, 0, -4]
	));
	env2 = EnvGen.ar(Env([0, 1, 0], [0.02, 0.3], [0, -4]), doneAction:2);

	noise1 = WhiteNoise.ar(env1);
	noise1 = HPF.ar(noise1, 600);
	noise1 = BPF.ar(noise1, 2000, 3);

	noise2 = WhiteNoise.ar(env2);
	noise2 = HPF.ar(noise2, 1000);
	noise2 = BPF.ar(noise2, 1200, 0.7, 0.7);

	sig = noise1 + noise2;
	sig = sig * 2;
	sig = sig.softclip * amp;

	Out.ar(out, sig.dup);
}).add;
)

(
SynthDef(\hat, {|out=0, amp=0.3|
	var env1, env2, sig, oscs1, noise, n, n2;

	n = 5;
	thisThread.randSeed = 4;

	env1 = EnvGen.ar(Env([0, 1.0, 0], [0.001, 0.2], [0, -12]));
	env2 = EnvGen.ar(
		Env([0, 1.0, 0.05, 0], [0.002, 0.05, 0.03], [0, -4, -4]),
		doneAction:2
	);

	oscs1 = Mix.fill(n, {|i|
		SinOsc.ar(
			(i.linlin(0, n-1, 42, 74) + rand2(4.0)).midicps,
			SinOsc.ar((i.linlin(0, n-1, 78, 80) + rand2(4.0)).midicps, 0.0, 12),
			1/n
		)
	});

	oscs1 = BHiPass.ar(oscs1, 1000, 2, env1);
	n2 = 8;
	noise = WhiteNoise.ar;
	noise = Mix.fill(n2, {|i|
		var freq;
		freq = (i.linlin(0, n-1, 40, 50) + rand2(4.0)).midicps.reciprocal;
		CombN.ar(noise, 0.04, freq, 0.1)
	}) * (1/n) + noise;
	noise = BPF.ar(noise, 6000, 0.9, 0.5, noise);
	noise = BLowShelf.ar(noise, 3000, 0.5, -6);
	noise = BHiPass.ar(noise, 1000, 1.5, env2);

	sig = noise + oscs1;
	sig = sig.softclip;
	sig = sig * amp;

	Out.ar(out, sig.dup);
}).add;
)

// make a synth from it
Synth("Clavi");
Synth("another");
Synth("plucking");
Synth("plucking2");
Synth("violin");
Synth("cello");
Synth(\berlinb);
Synth(\bass);
Synth(\cfstring1);
Synth(\cfstring2);
Synth(\peep);
Synth(\kick);
Synth(\snare);
Synth(\clap);
Synth(\hat);



