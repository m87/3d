AA=0;
AAA=1;

MAX_R = [ 17, 13 ];
MAX_H = [ 53, 50 ];
Z_OFFSET = [2.5, 8.5];
WIDTH=[15, 11];
HEIGHT=[51, 45.25];

module battery(id) {
  cylinder(h = HEIGHT[id], d = WIDTH[id]);
}


