

$fa = 1;
$fs = 0.25;

holder_diamater = 23;

holder_height = 30; 

edge_width = 2;

base_depth = 1.5;

base_width = 10;

difference(){
    translate([0,(holder_diamater+base_depth)/2,5])
    cube([base_width, base_depth, holder_height+10], center=true);
    
    translate([0,0,holder_height/2 + 5])
    rotate([90,0,0])
    cylinder(base_depth+10000, d=3, center=true);
}

difference(){
    cylinder(h=holder_height, d=holder_diamater+edge_width, center=true);
    cylinder(h=holder_height, d=holder_diamater, center=true);
}
