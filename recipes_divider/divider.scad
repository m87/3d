


width = 200;

height = 200;

depth = 2;

label = "dinneraaaaaaaaaaaaaaaaa";

font_size = 12;

r = 4;


linear_extrude(depth) {
    offset(r) {
      square([width, height], center = true);
          }
	translate([width, height, 0]) {
        difference() {
	  square([font_size*len(label),font_size]);
	  text(label, font_size);
	  }
	}

}
