thickness=2;
width=10;
height=10;
depth=10;
radius=1;


y=3; 
x=1; 
map = [ 
        ["aaa", "aaa", "aaa"]
        //["aaa", "aaa"],
    ];
//map = [[],[],[]];

module aa() {
    width=14;
    height=51;
    
    cylinder(h = height, d = width);
}

module aaa() {
    width=11;
    height=45.25;
   	
    translate([0,0,5.75])
    cylinder(h = height, d = width);
}


module base(width, depth, height, radius) {
 linear_extrude(height)
 offset(r=radius)
  square([width, depth], center=true);
}

module top(width, depth, height, radius, thickness) {
    difference() {
         linear_extrude(heigt/2+thickness)
         offset(r=radius)
          square([width+thickness, depth+thickness], center=true);
         
         translate([0,0,thickness])
         base(width, depth, height, radius);
    }
}

//translate([0, 2*depth, 0])
//top(width, depth, height, radius, thickness);

module create(battery) {
 if(battery == "aa") aa();
 if(battery == "aaa") aaa();
    
}

difference(){
translate([15*x/2-7, 15*y/2-7])
base(15*x, 15*y, 51, radius);


for(y = [0:len(map)-1]) {
  for(battery = [0:len(map[y])-1]) {
      translate([y*15, battery*15, 0])  create(map[y][battery]);
  }
}
    }
