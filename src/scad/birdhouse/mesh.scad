// basic mesh
module mesh(n) {
    // create 2 * n lines
    w = .5;
    union() {
        translate([w/4,0,0])
        for (i = [0:n-1]) {
            translate([i*w,0,0]) scale([w,w,2*n*w]) cube(w,center = false);
        }
        translate([0,w/2,w/4])
        for (i = [0:n-1]) {
            translate([0,0,i*w]) rotate([0,0,-90])scale([w,2*n*w,w]) cube(w,center = false);
        }
    }
}

//mesh(10);


