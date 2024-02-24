

module base() {

    z = 0; // normally 0
    atomX = 24+2.2;

    difference(){
    union(){
        difference(){
            translate([0,0,0]) scale([80,60,2]) cube(1,center=false);
            translate([1,1,1.5]) scale([80-2,60-2,1.5]) cube(1,center=false);
            translate([50+atomX/2,30+atomX/2,-1]) color("blue") cylinder(r=3,h=2.6,center=false, $fn=16);
        }
        translate([0,0,z+1.4]) color("red") SenseMounts();
        translate([5,40,z+1.4]) color("green") hub();
        translate([50,30,z+1.4]) color("magenta") atom(atomX);
    }
        translate ([5,5,0]) cylinder(r=1.6,h=4,center=true, $fn=16);
        translate ([75,5,0]) cylinder(r=1.6,h=4,center=true, $fn=16);
        translate ([5,55,0]) cylinder(r=1.6,h=4,center=true, $fn=16);
        translate ([43,55,0]) cylinder(r=1.6,h=4,center=true, $fn=16);
    }
    translate([0,0,0]) color("black") label();
}


module label(){
    font = "Liberation Mono";
    text1 = "Critical Sensors";
    text2 = "TVOC";
    text3 = "A. Kugel, 2021";
    text4 = "<=";
    h = 1.8;
    f = 4.5;
    translate([10,3,0])
    linear_extrude(height = h) {
       text(text = str(text3), font = font, size = f);
    }
    translate([10,53,0])
    linear_extrude(height = h) {
       text(text = str(text2), font = font, size = f);
    }
    translate([10,20,0])
    linear_extrude(height = h) {
       text(text = str(text1), font = font, size = f);
    }
    translate([70,40,0])
    linear_extrude(height = h) {
       text(text = str(text4), font = font, size = f);
    }
}

module holeMount(){
    d0 = 4.4;
    d1 = 5;
    h = 8.2;
    x = .5;
    difference(){
        union() {
            cylinder(r=d0/2,h=h+.1,center=false, $fn=16);
            translate ([0,0,h]) cylinder(r=d1/2,h=1,center=false, $fn=16);
            translate ([0,0,0]) cylinder(r=d1/2,h=.5,center=false, $fn=16);
        }
        translate([-x/2,-d1,1]) scale([x,2*d1,2*h]) cube(1,center=false); 
        translate([-d1,-x/2,1]) scale([2*d1,x,2*h]) cube(1,center=false); 
    }
    
}

module SenseMounts() {
    translate([10,12,0]) holeMount();
    translate([26,12,0]) holeMount();
    translate([36,12,0]) holeMount();
    translate([52,12,0]) holeMount();
  
}

module hub() {
    x = .2;
    union(){
        // 3 small pins
        union(){
            cylinder(r=.9,h=4,center=false, $fn=16);
            cylinder(r=1.5,h=1.5,center=false, $fn=16);
        }
        union(){
            translate([30,10,0]) cylinder(r=.9,h=4,center=false, $fn=16);
            translate([30,10,0]) cylinder(r=1.5,h=1.5,center=false, $fn=16);
        }
        union(){
            translate([30,-10,0]) cylinder(r=.9,h=4,center=false, $fn=16);
            translate([30,-10,0]) cylinder(r=1.5,h=1.5,center=false, $fn=16);
        }
        // 3 large pins
        difference(){
            union(){
                translate([10,-10,0]) cylinder(r=2,h=4,center=false, $fn=16);
                translate([10,-10,4]) cylinder(r=2.5,h=1,center=false, $fn=16);
            }
            translate([10-4,-15+x,1.5]) scale([8,5,6]) cube(1,center=false);
        }
        difference(){
            union(){
                    translate([10,10,0]) cylinder(r=2,h=4,center=false, $fn=16);
                    translate([10,10,4]) cylinder(r=2.5,h=1,center=false, $fn=16);
            }
            translate([10-4,10-x,1.5]) scale([8,5,6]) cube(1,center=false);
        }
        difference(){
            union(){
                translate([40,0,0]) cylinder(r=2,h=4,center=false, $fn=16);
                translate([40,0,4]) cylinder(r=2.5,h=1,center=false, $fn=16);
            }
            translate([40-x,-4,1.5]) scale([5,8,6]) cube(1,center=false);
        }
    }
}

module atomMount(){
    difference(){
        union(){
            scale([4,4,6.1]) cube(1,center=false);
        }
        translate([3,3,4]) cylinder(r=2.3,h=13.3,center=false, $fn=16);
    }

}


module atom(x) {
    // external dimensions: x due to rotation
    difference (){
        union() {
            translate([0,0,0]) rotate([0,0,0]) atomMount();
            translate([x,0,0]) rotate([0,0,90]) atomMount();
            translate([x,x,0]) rotate([0,0,180]) atomMount();
            translate([0,x,0]) rotate([0,0,270]) atomMount();
            translate([x/2,x/2,0]) cylinder(r=4,h=4,center=false, $fn=16);
        }
        translate([x/2,x/2,-.1]) cylinder(r=3,h=2,center=false, $fn=16);
        translate([x/2,x/2,-1]) cylinder(r=1.1,h=6,center=false, $fn=16);
    }
}


// create 2d projection for dxf export. Open and print with inkscape
//projection(cut=true) translate ([0,0,-1.5]) base(); 
base();
