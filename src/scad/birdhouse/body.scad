
use <wall.scad>
use <mesh.scad>

module body(sc) {

    r = sc/10;
    union(){
        // left and right with fan cutout
        translate([-1,0,0]) color ("gray") union() {
                translate([0,11,18]) rotate([90,90,0]) mesh(10) ;
                difference() {
                wall(1,12,20);  // left
                translate([.5,8,16]) rotate([0,90,0]) cylinder(h = 2, r = 2, $fn=20,center = true);  
            }
        }
        // translate([15,0,0]) color ("gray") wall(1,12,20);   // right
        translate([15,0,0]) color ("gray") union(){
                translate([.75,11,18]) rotate([90,90,0]) mesh(10) ;
                difference() {
                wall(1,12,20);  // left
                translate([.5,8,16]) rotate([0,90,0]) cylinder(h = 2, r = 2, $fn=20,center = true);  
            }
        }
        // 
        
        // translate([0,0,1]) color ("red") rotate([0,90,0]) wall(1,12,15);   // bottom
        translate([0,0,1]) color ("red") rotate([0,90,0]) difference() {
            wall(1,12,15);   // bottom
            translate([.5,.5,3]) rotate([0,90,0])cylinder(h=2,r=.25, $fn=20,center = true);
            translate([.5,.5,6]) rotate([0,90,0])cylinder(h=2,r=.25, $fn=20,center = true);
            translate([.5,.5,9]) rotate([0,90,0])cylinder(h=2,r=.25, $fn=20,center = true);
            translate([.5,.5,12]) rotate([0,90,0])cylinder(h=2,r=.25, $fn=20,center = true);
        }
        // rear with mounting holes and cable opening
        translate([0,12,0]) rotate([0,0,-90]) 
            union(){
            difference(){
                wall(1,15,20);   // rear
                translate([.5,3,15]) rotate([0,90,0]) cylinder(h=2,r=.22/r, $fn=20,center = true);
                translate([.5,12,15]) rotate([0,90,0]) cylinder(h=2,r=.22/r, $fn=20,center = true);
                translate([.5,7.5,15]) rotate([0,90,0]) scale([.6,1,1]) cylinder(h=2,r=.7/r, $fn=20,center = true);
            }
            //translate([-.5,7.5-10/sc,15-10/sc]) rotate([0,0,90]) color("red") scale([.5/r,1,.5/r]) mesh(8) ;
            translate([.2,7.5-1/r,15-1/r]) rotate([0,0,90]) color("red") scale([.5/r,1,.5/r]) mesh(8) ;
        }


        // top with fixation hole
        difference(){
            translate([-4,-5,21]) color ("gray") rotate([0,90,0]) wall(1,18,23);   // top
            translate([7.5,-.5,20]) rotate([0,0,0]) cylinder(h=2,r=.22, $fn=20,center = true);
        }
        // top extension
        translate([0,1,20.2]) color ("red") rotate([0,90,0]) wall(1,1,15);   // top
        
        
    };
    
}


body(10);
