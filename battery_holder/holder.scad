include <batteries.scad>

map = [ 
        [AAA, AA],
    ];


// cap thickness
thickness=3;
// corener radius
radius=1;
// test
fit=0.215;
grip=true;


x=len(map);
y=max([for (y = map)  each(len(y))]);


maxR = MAX_R[min([for (y = map)  each(y)])];
maxH = MAX_H[min([for (y = map)  each(y)])];


module base(width, depth, height, radius) {
 linear_extrude(height)
 offset(r=radius)
  square([width, depth], center=true);
}

module top(width, depth, height, radius, thickness) {
    difference() {
         linear_extrude(height/2+thickness)
         offset(r=radius)
          square([width+thickness, depth+thickness], center=true);
         
         translate([0,0,thickness])
         base(width+fit, depth+fit, height, radius);
    }
}

module create(id, maxH) {
 translate([0,0, maxH-HEIGHT[id]]) battery(id); 
}

translate([maxR*x*2, maxR*y/2-maxR/2])
difference(){
	top(maxR*x, maxR*y, 40, radius, thickness);
	if(grip) rotate([0,90,0]) translate([-25,0,-maxR*x/2-thickness/2-radius]) cylinder(maxR*x+thickness+radius*2,r=10);
}

difference(){
	translate([maxR*x/2-maxR/2, maxR*y/2-maxR/2])
	base(maxR*x, maxR*y, maxH, radius);


	for(y = [0:len(map)-1]) {
	  for(battery = [0:len(map[y])-1]) {
	      translate([y*maxR, battery*maxR, 0])  create(map[y][battery], maxH);
	  }
	}
    }

