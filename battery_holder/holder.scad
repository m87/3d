thickness=3;
width=10;
height=10;
depth=10;
radius=1;
fit=0.225;
grip=true;

y=3; 
map = [ 
        ["aaa", "aaa", "aaa"]
        //["aa", "aaa", "aa"],
    ];
//map = [[],[],[]];

x=len(map);

module aa() {
    width=14;
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


function ww() = (min([for (y = map)  each(y)]) == "aaa") ? 11 : 15;
function hh() = (min([for (y = map)  each(y)]) == "aaa") ? 50 : 53;

www=ww();

translate([x*22, 2*depth, 0])
difference(){
top(www*x, www*y, 40, radius, thickness);
if(grip) rotate([0,90,0]) translate([-www*y+10,0,-www*x/2-thickness]) cylinder(www*x+thickness*2,r=10);
}

module create(battery) {
 if(battery == "aa") translate([0,0,2]) aa();
 if(battery == "aaa") translate([0,0,7.75]) aaa();
    
}

difference(){
translate([www*x/2-www/2, www*y/2-www/2])
base(www*x, www*y, hh(), radius);


for(y = [0:len(map)-1]) {
  for(battery = [0:len(map[y])-1]) {
      translate([y*www, battery*www, 0])  create(map[y][battery]);
  }
}
    }

