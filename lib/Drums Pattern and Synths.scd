~mTempo = 80;
//DRUMS
( SynthDef(\kickdrum, {var osc, env, output;

	osc = {SinOsc.ar(65.41)};
	env = {XLine.ar(1, 0, 1, doneAction: 2)};

	output = osc * env;

	Out.ar(0,
	Pan2.ar(output, 0)
	)
}).send(s); );

(
SynthDef(\SOSsnare,
	{arg out = 0, sustain = 0.1, drum_mode_level = 0.25,
	snare_level = 40, snare_tightness = 1000,
	freq = 521.1357, amp = 0.8;
	var drum_mode_sin_1, drum_mode_sin_2, drum_mode_pmosc, drum_mode_mix, drum_mode_env;
	var snare_noise, snare_brf_1, snare_brf_2, snare_brf_3, snare_brf_4, snare_reson;
	var snare_env;
	var snare_drum_mix;

	drum_mode_env = EnvGen.ar(Env.perc(0.005, sustain), 1.0, doneAction: 2);
	drum_mode_sin_1 = SinOsc.ar(freq*0.53, 0, drum_mode_env * 0.5);
	drum_mode_sin_2 = SinOsc.ar(freq, 0, drum_mode_env * 0.5);
	drum_mode_pmosc = PMOsc.ar(	LFSaw.ar(freq*0.85),
	184,
	0.5/1.3,
	mul: drum_mode_env*5,
	add: 0);
	drum_mode_mix = Mix.new([drum_mode_sin_1, drum_mode_sin_2, drum_mode_pmosc]) * drum_mode_level;

	// choose either noise source below
	//	snare_noise = Crackle.ar(2.01, 1);
	snare_noise = LFNoise0.ar(20000, 0.1);
	snare_env = EnvGen.ar(Env.perc(0.005, sustain), 1.0, doneAction: 2);
	snare_brf_1 = BRF.ar(in: snare_noise, freq: 8000, mul: 0.5, rq: 0.1);
	snare_brf_2 = BRF.ar(in: snare_brf_1, freq: 5000, mul: 0.5, rq: 0.1);
	snare_brf_3 = BRF.ar(in: snare_brf_2, freq: 3600, mul: 0.5, rq: 0.1);
	snare_brf_4 = BRF.ar(in: snare_brf_3, freq: 2000, mul: snare_env, rq: 0.0001);
	snare_reson = Resonz.ar(snare_brf_4, snare_tightness, mul: snare_level) ;
	snare_drum_mix = Mix.new([drum_mode_mix, snare_reson]) * 5 * amp;
	Out.ar(out, [snare_drum_mix, snare_drum_mix])
	}
).add
);

(
SynthDef(\SOShats,
	{arg out = 0, freq = 7040/*7571.9*/, sustain = 0.8, amp = 0.4;
	var root_cymbal, root_cymbal_square, root_cymbal_pmosc;
	var initial_bpf_contour, initial_bpf, initial_env;
	var body_hpf, body_env;
	var cymbal_mix;

	root_cymbal_square = LFPulse.ar(freq, 0.5, mul: 1);
	root_cymbal_pmosc = PMOsc.ar(root_cymbal_square,
	[freq*1.34, freq*2.405, freq*3.09, freq*1.309],
	[310/1.3, 26/0.5, 11/3.4, 0.72772],
	mul: 1,
	add: 0);
	root_cymbal = Mix.new(root_cymbal_pmosc);
	initial_bpf_contour = Line.kr(15000, 9000, 0.1);
	initial_env = EnvGen.ar(Env.perc(0.005, 0.1), 1.0);
	initial_bpf = BPF.ar(root_cymbal, initial_bpf_contour, mul:initial_env);
	body_env = EnvGen.ar(Env.perc(0.005, sustain, 1, -2), 1.0, doneAction: 2);
	body_hpf = HPF.ar(in: root_cymbal, freq: Line.kr(9000, 12000, sustain),mul: body_env, add: 0);
	cymbal_mix = Mix.new([initial_bpf, body_hpf]) * amp;
	Out.ar(out, [cymbal_mix, cymbal_mix])
}).add
);

(
SynthDef(\fullkickdrum, {

	var mix, subosc, subenv, suboutput, clickosc, clickenv, clickoutput;

	subosc = {SinOsc.ar(65.41)};
	subenv = {XLine.ar(1, 0, 1, doneAction: 2)};

	clickosc = {LPF.ar(WhiteNoise.ar(1),1500)};
	clickenv = {XLine.ar(1, 0, 0.02)};

	suboutput = (subosc * subenv);
	clickoutput = (clickosc * clickenv);

	Out.ar(0,
	Pan2.ar(suboutput + clickoutput, 0);
	)

}).send(s);
);
(
SynthDef(\SOSkick,
	{ arg out = 0, freq =  55/*65.41*/, mod_freq = 5, mod_index = 5, sustain = 0.4, amp = 0.8, beater_noise_level = 0.025;
	var pitch_contour, drum_osc, drum_lpf, drum_env;
	var beater_source, beater_hpf, beater_lpf, lpf_cutoff_contour, beater_env;
	var kick_mix;
	pitch_contour = Line.kr(freq*2, freq, 0.02);
	drum_osc = PMOsc.ar(	pitch_contour,
	mod_freq,
	mod_index/1.3,
	mul: 1,
	add: 0);
	drum_lpf = LPF.ar(in: drum_osc, freq: 1035.57, mul: 1, add: 0);
	drum_env = drum_lpf * EnvGen.ar(Env.perc(0.005, sustain), 1.0, doneAction: 2);
	beater_source = WhiteNoise.ar(beater_noise_level);
	beater_hpf = HPF.ar(in: beater_source, freq: 500, mul: 1, add: 0);
	lpf_cutoff_contour = Line.kr(6000, 500, 0.03);
	beater_lpf = LPF.ar(in: beater_hpf, freq: lpf_cutoff_contour, mul: 1, add: 0);
	beater_env = beater_lpf * EnvGen.ar(Env.perc, 1.0, doneAction: 2);
	kick_mix = Mix.new([drum_env, beater_env]) * 2 * amp;
	Out.ar(out, [kick_mix, kick_mix])
	}
).add
);
(
SynthDef(\SOStom,
	{arg out = 0, sustain = 0.4, drum_mode_level = 0.25,
	freq = 55/*65.41*/, drum_timbre = 1.0, amp = 0.8;
	var drum_mode_sin_1, drum_mode_sin_2, drum_mode_pmosc, drum_mode_mix, drum_mode_env;
	var stick_noise, stick_env;
	var drum_reson, tom_mix;

	drum_mode_env = EnvGen.ar(Env.perc(0.005, sustain), 1.0, doneAction: 2);
	drum_mode_sin_1 = SinOsc.ar(freq*0.8, 0, drum_mode_env * 0.5);
	drum_mode_sin_2 = SinOsc.ar(freq, 0, drum_mode_env * 0.5);
	drum_mode_pmosc = PMOsc.ar(	Saw.ar(freq*0.9),
	freq*0.85,
	drum_timbre/1.3,
	mul: drum_mode_env*5,
	add: 0);
	drum_mode_mix = Mix.new([drum_mode_sin_1, drum_mode_sin_2, drum_mode_pmosc]) * drum_mode_level;
	stick_noise = Crackle.ar(2.01, 1);
	stick_env = EnvGen.ar(Env.perc(0.005, 0.01), 1.0) * 3;
	tom_mix = Mix.new([drum_mode_mix, stick_env]) * 2 * amp;
	Out.ar(out, [tom_mix, tom_mix])
	}
).add
);

(
SynthDef(\snare909,{ |out=0,mul=1,velocity=1|
	var excitation, membrane;

	excitation = LPF.ar(WhiteNoise.ar(1), 7040, 1) * (0.1 + velocity);
	membrane = (
	/* Two simple enveloped oscillators represent the loudest resonances of the drum membranes */
	(LFTri.ar(330,0,1) * EnvGen.ar(Env.perc(0.0005,0.055),doneAction:0) * 0.25)
	+(LFTri.ar(185,0,1) * EnvGen.ar(Env.perc(0.0005,0.075),doneAction:0) * 0.25)

	/* Filtered white noise represents the snare */
	+(excitation * EnvGen.ar(Env.perc(0.0005,0.4),doneAction:2) * 0.2)
	+(HPF.ar(excitation, 523, 1) * EnvGen.ar(Env.perc(0.0005,0.283),doneAction:0) * 0.2)

	) * mul;
	Out.ar(out, membrane!2)
}).add
);


(
SynthDef(\drums, {|out = 7, bassLevel = 7 , snareLevel = 0, hatLevel = 0, tomLevel = 0, pan1 = 0, pan2 = 0, pan3 = 0, pan4 = 0|

	var env1, env2, env3, env4, bass, snare, hat, tom, bassOut, snareOut, hatOut, tomOut, mixer;
	env1 = EnvGen.kr(Env.perc(0.001, 0.2, 1, -4), 1, doneAction:2);
	env2 = EnvGen.kr(Env.perc(0.001, 0.5, 1, -1), 1, doneAction:2);
	env3 = EnvGen.kr(Env.perc(0.002, 0.3, 1, -2), 1, doneAction:2);
	env4 = EnvGen.kr(Env.perc(0.001, 0.1, 1, -5), 1, doneAction:2);


	bass = SinOsc.ar(65.41) + Crackle.ar(1, 0.5);
	bassOut = Pan2.ar(bass*env1, pan1, bassLevel);

	snare = SinOsc.ar(261.63) - WhiteNoise.ar(0.5, 0.5);
	snareOut = Pan2.ar(snare*env4, pan2, snareLevel);

	hat = Klank.ar(`[ [ 6563, 9875 ],
	[ 0.6, 0.3 ],
	[ 0.002, 0.003] ], PinkNoise.ar(1));
	hatOut = Pan2.ar(hat*env3, pan2, hatLevel);

	tom = SinOsc.ar(261.57);
	tomOut = Pan2.ar(tom*env4, pan4, tomLevel);

	mixer = Mix.new([bassOut, snareOut, hatOut, tomOut]);


	Out.ar(out, mixer);

}).store
);


(

~drums = Pbind(
   	\instrument, Pseq([\drums,\SOShats,\SOShats,\drums,
		               \SOSsnare,\SOSkick,\drums,\SOStom,
		               \drums,\SOShats,\SOShats,\fullkickdrum,
		               \SOSsnare,\SOShats,\SOShats,\SOSsnare],inf),
	\dur,0.25,
	\legato, 1.3,
	\tempo, Pfunc({~mTempo/60}),
	\amp, 0.3,
).play;
);

// End of Drums
