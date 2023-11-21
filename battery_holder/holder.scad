include <batteries.scad>

map = [ 
        [AAA, AA, C, D],
    ];


// cap thickness
thickness=3;
// corener radius
radius=1;
// test
cap_fit=0.215;
battery_fit=0.5;
space=2;
bottom_thickness=1.5;
grip=true;


x=len(map);
y=max([for (y = map)  each(len(y))]);


maxR = max([for (x = [for (y = map)  each(y)]) WIDTH[x]]) + space; // TO WIDHT with offset and max
maxH = max([for (x = [for (y = map)  each(y)]) HEIGHT[x]]) + bottom_thickness; // TO HEIHGHT with offset and max


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
         base(width+cap_fit, depth+cap_fit, height, radius);
    }
}

module create(id, maxH) {
 translate([0,0, maxH-HEIGHT[id]]) battery(id, battery_fit); 
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

