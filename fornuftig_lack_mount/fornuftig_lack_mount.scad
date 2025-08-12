
top_hook_w = 12;
top_hook_t = 1.8;
top_hook_h = 2;
top_hook_h2 = 18;

module top_hook(w, t, h, h2) {
  union() {
    square(size=[w, h], center=false);
    translate([0, 18, 0])
      square(size=[w, h], center=false);
    translate([4.5, 0, 0])
      square(size=[t, h2], center=false);


  }
}

union() {
  translate(v = [-10,-15,0]) 
cube(size = [30,20,42], center = false);
linear_extrude(height=20, center=false, convexity=10, twist=0, slices=20, scale=1.0)
  top_hook(top_hook_w, top_hook_t, top_hook_h, top_hook_h2);
}

