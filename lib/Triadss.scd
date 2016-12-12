/*
Set of major, minor, diminished, major7, minor7, and 7 chords.
use \note in Pbind

//write ~c, ~g,...   to play a major chord
//write ~c_, ~g_,... to play a minor chord
//write ~fdim to play a diminished chord
*/

//these variables are for internal use
~majorChord       = [0,4,7]-12;
~minorChord       = [0,3,7]-12;
~diminishedChord  = [0,3,6]-12;

~majorChord1      = [4,7,12]-12;
~minorChord1      = [3,7,12]-12;
~diminishedChord1 = [3,6,0]-12;

~majorChord2      = [7,12,16]-12;
~minorChord2      = [7,12,15]-12;
~diminishedChord2 = [6,12,15]-12;


//major chords
~c  = ~majorChord; // c
~cs = ~majorChord +1; // c sharp
~d  = ~majorChord +2;  // d
~ds = ~majorChord +3; //d sharp
~e  = ~majorChord +4;
~f  = ~majorChord +5;
~fs = ~majorChord +6;
~g  = ~majorChord +7;
~gs = ~majorChord +8;
~a  = ~majorChord +9;
~as = ~majorChord +10;
~b  = ~majorChord +11;


//minor chords
~c_  = ~minorChord;
~cs_ = ~minorChord+1;
~d_  = ~minorChord+2;
~ds_ = ~minorChord+3;
~e_  = ~minorChord+4;
~f_  = ~minorChord+5;
~fs_ = ~minorChord+6;
~g_  = ~minorChord+7;
~gs_ = ~minorChord+8;
~a_  = ~minorChord+9;
~as_ = ~minorChord+10;
~b_  = ~minorChord+11;


//diminished chords
~cdim = ~diminishedChord;
~csdim = ~diminishedChord +1;
~ddim = ~diminishedChord +2;
~dsdim = ~diminishedChord +3;
~edim = ~diminishedChord +4;
~fdim = ~diminishedChord +5;
~fsdim = ~diminishedChord +6;
~gdim = ~diminishedChord +7;
~gsdim = ~diminishedChord +8;
~adim = ~diminishedChord +9;
~asdim = ~diminishedChord +10;
~bdim = ~diminishedChord +11;


//1
~c1 = ~majorChord1;
~cs1 = ~majorChord1 +1;
~d1 = ~majorChord1 +2;
~ds1 = ~majorChord1 +3;
~e1 = ~majorChord1 +4;
~f1 = ~majorChord1 +5;
~fs1 = ~majorChord1 +6;
~g1 = ~majorChord1 +7;
~gs1 = ~majorChord1 +8;
~a1 = ~majorChord1 +9;
~as1 = ~majorChord1 +10;
~b1 = ~majorChord1 +11;

~c_1 = ~minorChord1;
~cs_1 = ~minorChord1+1;
~d_1 = ~minorChord1+2;
~ds_1 = ~minorChord1+3;
~e_1 = ~minorChord1+4;
~f_1 = ~minorChord1+5;
~fs_1 = ~minorChord1+6;
~g_1 = ~minorChord1+7;
~gs_1 = ~minorChord1+8;
~a_1 = ~minorChord1+9;
~as_1 = ~minorChord1+10;
~b_1 = ~minorChord1+11;

~cdim1 = ~diminishedChord1;
~csdim1 = ~diminishedChord1 +1;
~ddim1 = ~diminishedChord1 +2;
~dsdim1 = ~diminishedChord1 +3;
~edim1 = ~diminishedChord1 +4;
~fdim1 = ~diminishedChord1 +5;
~fsdim1 = ~diminishedChord1 +6;
~gdim1 = ~diminishedChord1 +7;
~gsdim1 = ~diminishedChord1 +8;
~adim1 = ~diminishedChord1 +9;
~asdim1 = ~diminishedChord1 +10;
~bdim1 = ~diminishedChord1 +11;



//2
~c2 = ~majorChord2;
~cs2 = ~majorChord2 +1;
~d2 = ~majorChord2 +2;
~ds2 = ~majorChord2 +3;
~e2 = ~majorChord2 +4;
~f2 = ~majorChord2 +5;
~fs2 = ~majorChord2 +6;
~g2 = ~majorChord2 +7;
~gs2 = ~majorChord2 +8;
~a2 = ~majorChord2 +9;
~as2 = ~majorChord2 +10;
~b2 = ~majorChord2 +11;

~c_2 = ~minorChord2;
~cs_2 = ~minorChord2+1;
~d_2 = ~minorChord2+2;
~ds_2 = ~minorChord2+3;
~e_2 = ~minorChord2+4;
~f_2 = ~minorChord2+5;
~fs_2 = ~minorChord2+6;
~g_2 = ~minorChord2+7;
~gs_2 = ~minorChord2+8;
~a_2 = ~minorChord2+9;
~as_2 = ~minorChord2+10;
~b_2 = ~minorChord2+11;

~cdim2 = ~diminishedChord2;
~csdim2 = ~diminishedChord2 +1;
~ddim2 = ~diminishedChord2 +2;
~dsdim2 = ~diminishedChord2 +3;
~edim2 = ~diminishedChord2 +4;
~fdim2 = ~diminishedChord2 +5;
~fsdim2 = ~diminishedChord2 +6;
~gdim2 = ~diminishedChord2 +7;
~gsdim2 = ~diminishedChord2 +8;
~adim2 = ~diminishedChord2 +9;
~asdim2 = ~diminishedChord2 +10;
~bdim2 = ~diminishedChord2 +11;
