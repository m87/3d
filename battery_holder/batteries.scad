A=0;
AA=0;
AA_2=0;
AAA=1;
AAAA=1;
B=0;
C=2;
SC=0;
D=3;
F=0;
N=0;
A11=0;
A23=0;
A27=0;
BA5800=0;
DUPLEX=0;
_4SR44=0;
CR123A=0;
CR2=0;

MN21=0;
LR1=0;






WIDTH=[14.5, 10.5, 26.2, 34.2];
HEIGHT=[50.5, 44.5, 50, 61.5];

module battery(id, battery_fit) {
  cylinder(h = HEIGHT[id], d = WIDTH[id] + battery_fit);
}


