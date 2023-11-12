map = [ 
        ["aa", "aaa", "aaa"],
        //["aaa", "aaa"],
        //["aaa", "aaa"]
    ];

thickness=3;
width=10;
height=10;
depth=10;
radius=1;
fit=0.225;
grip=true;

module aa() {
    width=15;
    height=51;
    
    cylinder(h = height, d = width);
}

module aaa() {
    width=11;
    height=45.25;
   	
    
    cylinder(h = height, d = width);
}


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

x=len(map);
y=max([for (y = map)  each(len(y))]);
maxR = (min([for (y = map)  each(y)]) == "aaa") ? 13 : 17;
maxH = (min([for (y = map)  each(y)]) == "aaa") ? 50 : 53;


module create(battery) {
 if(battery == "aa") translate([0,0,2.5]) aa(); //2
 if(battery == "aaa") translate([0,0,8.5]) aaa(); //7.75
    
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
      translate([y*maxR, battery*maxR, 0])  create(map[y][battery]);
  }
}
    }

