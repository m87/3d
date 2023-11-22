AA=0;

AAA=1;

C=2;

D=3;

LR1=4;
LR01=4;
N=4;
KN=4;
AM5=4;
_4001=4;
_810=4;
MN9100=4;
E90=4;
_910A=4;

CR2=5;
DLCR2=5;
EL1CR2=5;
CR15H270=5;

A=6;
LR23=6;
R23=6;

AA_2=0;
AAAA=1;
B=0;
SC=0;
F=0;
A11=0;
A23=0;
A27=0;
BA5800=0;
DUPLEX=0;
_4SR44=0;
CR123A=0;

MN21=0;


WIDTH=[14.5, 10.5, 26.2, 34.2, 12, 15.6, 17];
HEIGHT=[50.5, 44.5, 50, 61.5, 30.2, 27, 50];

module battery(id, battery_fit) {
  cylinder(h = HEIGHT[id], d = WIDTH[id] + battery_fit);
}


