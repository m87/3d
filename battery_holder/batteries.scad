WIDTH=[
	1,      // CUSTOM
	14.5,	// AA
	10.5,   // AAA
	26.2,   // C
	34.2,   // D
	12,     // LR1
	15.6,   // CR2
	17, 	// A
	10.3  	// MN21  
];
HEIGHT=[
	1, 	// CUSTOM
	50.5, 	// AA
	44.5, 	// AAA
	50, 	// C
	61.5, 	// D
	30.2, 	// LR1
	27, 	// CR2
	50, 	// A
	28.5	// MN21
];

CUSTOM=0;

AA=1;

AAA=2;

C=3;

D=4;

LR1=5;
LR01=5;
N=5;
KN=5;
AM5=5;
_4001=5;
_810=5;
MN9100=5;
E90=5;
_910A=5;

CR2=6;
DLCR2=6;
EL1CR2=6;
CR15H270=6;

A=7;
LR23=7;
R23=7;

MN21=8;
A23=8;
AG23=8;
DL21=8;
_23A=8;
_23AE=8;
V23GA=8;
LRV08=8;
L1028=8;
_8LR932=8;

// TODO
//AA_2=0;
//AAAA=1;
//B=0;
//SC=0;
//F=0;
//A11=0;
//A27=0;
//BA5800=0;
//DUPLEX=0;
//_4SR44=0;
//CR123A=0;


module battery(id, battery_fit) {
  cylinder(h = HEIGHT[id], d = WIDTH[id] + battery_fit);
}


