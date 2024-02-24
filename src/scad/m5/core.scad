

module core(height = 20) {

    s = 53.5; // inner size
    r = 1.5; // radius and cutout

    difference(){
    union() {
        difference(){
        scale([1,1,1]) color("blue") cube([s,s,height],center=false);

        translate([-.1,-.1,-.1]) scale([1,1,height+1]) cube(r,center=false);
        translate([s-r+.1,-.1,-.1]) scale([1,1,height+1]) cube(r,center=false);

        translate([s-r+.1,s-r+.1,-.1]) scale([1,1,height+1]) cube(r,center=false);
        translate([-.1,s-r+.1,-.1]) scale([1,1,height+1]) cube([r+.1,r+.1,height+1],center=false);

        }

    // radii
    translate([r,r,0]) scale([1,1,1]) cylinder(r=r,h=height,center=false, $fn=16);
    translate([s-r,r,0]) scale([1,1,1]) cylinder(r=r,h=height,center=false, $fn=16);
    translate([s-r,s-r,0]) scale([1,1,1]) cylinder(r=r,h=height,center=false, $fn=16);
    translate([r,s-r,0]) scale([1,1,1]) cylinder(r=r,h=height,center=false, $fn=16);

    // display
        translate([5.5,12,height-.5]) color("green") cube([42,31,1],center = false);
    // buttons
        translate([11,2.5,height-.5]) color("red") cube([8,5,1],center = false);
        translate([23,2.5,height-.5]) color("red") cube([8,5,1],center = false);
        translate([35,2.5,height-.5]) color("red") cube([8,5,1],center = false);

    }
    
        // mounting holes
    translate([4.5,4.5,-.5]) scale([1,1,1]) cylinder(r=3,h=2,center=false, $fn=16);
    translate([4.5,4.5,-.5]) scale([1,1,1]) cylinder(r=1,h=3,center=false, $fn=16);
    translate([s-4.5,4.5,-.5]) scale([1,1,1]) cylinder(r=3,h=1,center=false, $fn=16);
    translate([s-4.5,4.5,-.5]) scale([1,1,1]) cylinder(r=1,h=3,center=false, $fn=16);
    
    // usb
    translate([-.1,s/2,height-5]) rotate([0,90,0]) scale([.3,1,1]) cylinder(r=5,h=1,center=true, $fn=16);
    // pwr btn
    translate([-.1,3*s/4,height-5]) rotate([0,90,0]) scale([3,8,1]) cube(1,center=true);
    // grove
    translate([-.1,s/4,height-6]) rotate([0,90,0]) scale([4,8,1]) cube(1,center=true);
    
}


    
    
    
}

core();