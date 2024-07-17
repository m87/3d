axel_diameter=12;
axel_diameter_tolernace=1;
axle_width=125;
base_height = 10;
base_width = 180;
base_depth = 40;
support_depth = 22;
support_relative_to_base_height = 40;
gap=0;

/* [Hidden] */
$fn=100;
r=5;
d=axel_diameter + axel_diameter_tolernace;


_base_width = base_width - 2*r;
_base_depth = base_depth - 2*r;
_support_depth = support_depth - 2*r;
_support_height = support_relative_to_base_height + base_height;
_support_width = axle_width-2*r;

difference() {
    union() {
        linear_extrude(base_height)
        offset(r)
        square([_base_depth,_base_width], center=true);

    difference(){
        linear_extrude(30)
        offset(r)
        square([_support_depth, _support_width],center = true);
        
        translate([0,0,base_height + support_relative_to_base_height /2])
        rotate([90])
        cylinder(_base_width+2*r, d=d+10, center=true);

    }
        
        translate([0,0,base_height + support_relative_to_base_height /2])
        rotate([90])
        cylinder(axle_width, d=d+10, center=true);
    }

    union(){
        translate([0,0,base_height + support_relative_to_base_height /2])
        rotate([90])
        cylinder(_base_width+2*r, d=d, center=true);
        
        translate([0,0,base_height + _support_height/2])
        cube([_base_width, gap, _support_height], center=true);
    }
}

