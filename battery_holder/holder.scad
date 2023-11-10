thickness=3;
width=10;
height=10;
depth=10;
radius=1;


y=3; 
x=1; 
map = [ 
        ["aaa", "aaa", "aaa"]
      //  ["aaa", "aaa"],
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
         linear_extrude(height/2+thickness)
         offset(r=radius)
          square([width+thickness, depth+thickness], center=true);
         
         translate([0,0,thickness])
         base(width+0.5, depth+0.5, height, radius);
    }
}

biggest=max([for (y = map)  each(y)]);
    

function ww(batt) = (batt == "aaa") ? 11 : 15;

www=ww(biggest);

translate([20, 2*depth, 0])
top(www*x, www*y, 40, radius, thickness);

module create(battery) {
 if(battery == "aa") aa();
 if(battery == "aaa") aaa();
    
}

difference(){
translate([www*x/2-www/2, www*y/2-www/2])
base(www*x, www*y, 51, radius);


for(y = [0:len(map)-1]) {
  for(battery = [0:len(map[y])-1]) {
      translate([y*www, battery*www, 0])  create(map[y][battery]);
  }
}
    }
