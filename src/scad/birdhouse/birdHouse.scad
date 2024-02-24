
use <wall.scad>
use <front.scad>
use <body.scad>

module birdHouse() {

    sc = 10;  // normally 10 for cm
    
    scale([sc,sc,sc]) 
    translate([0,0,0]) 
    
    union(){
        body(sc);
        //translate([0,1,1.1]) rotate([0,0,-90]) front(sc);  // cloesed view
        translate([0,-5,-2]) rotate([0,0,-90]) front(sc);  // open view
    }
    
}


birdHouse();

