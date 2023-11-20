AA=0;
AAA=1;

MAX_R = [ 17, 13 ];
MAX_H = [ 53, 50 ];
WIDTH=[15, 11];
HEIGHT=[50.5, 44.5];

module battery(id) {
  cylinder(h = HEIGHT[id], d = WIDTH[id]);
}


