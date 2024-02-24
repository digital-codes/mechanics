// front door with cutout

use <wall.scad>
use <mesh.scad>

// add 4 plugs => inside body, reduce height by 1. Reduce height a bit more ....

module front(sc){
            r = sc/10;
            union(){
            translate([.5,3,0]) rotate([0,0,0]) color("blue") cylinder(h=.6,r=.22, $fn=20,center = true);
            translate([.5,3,-.3]) rotate([0,0,0]) color("green") sphere(r=.22, $fn=20);
            translate([.5,6,0]) rotate([0,0,0]) color("blue") cylinder(h=.6,r=.22, $fn=20,center = true);
            translate([.5,6,-.3]) rotate([0,0,0]) color("green") sphere(r=.22, $fn=20);
            translate([.5,9,0]) rotate([0,0,0]) color("blue") cylinder(h=.6,r=.22, $fn=20,center = true);
            translate([.5,9,-.3]) rotate([0,0,0]) color("green") sphere(r=.22, $fn=20);
            translate([.5,12,0]) rotate([0,0,0]) color("blue") cylinder(h=.6,r=.22, $fn=20,center = true);
            translate([.5,12,-.3]) rotate([0,0,0]) color("green") sphere(r=.22, $fn=20);

            difference() {
               // front with cutout for solar panel
               wall(1,15,20-1-.4);   
               translate([-.50,4.5,2]) wall(2,6,8);  
               // cutout light sensor
               translate([.5,7.5,15]) rotate([90,0,90]) cylinder(h=2,r=2,$fn=20,center = true);  
            }
            translate([.8,10,17.5]) rotate([90,90,0]) color("red") mesh(10) ;

        }
        
    };

front(1);
