// cup

s = 40;
d = 2;
e = 1.5;
w = .9;
h = 2.5;
ld = 10;
ts = 5;
t1 = "Transparenzcafe  KA  ";
t2 = "A.Kugel  2019  ";

// $fn controls number of segments => smoothnes
$fn = 80;

module oklHammer (l=10,hl=10) {
    sc = .3;
    translate([0,0,sc*l/2]) 
        difference(){
            union(){
            scale ([1,sc,sc]) sphere(d=l);
            scale ([1,sc,1]) cylinder(l,d=l*.8);
            translate ([0,0,l]) scale ([1,sc,sc]) sphere(d=l);
            translate([0,0,l/4]) rotate([0,-60,0])  
                scale ([1,sc,1]) cylinder(hl,d=l*.4);
        }
        translate([-l/10,-l*sc/4,l/5]) rotate([90,-90,0])
        linear_extrude(height=1) {
            text("{OD{", l/5, font="Arial");
        }
        // the "-" to turn { into E 
        translate([-l/10,-l*sc/4,l/5+l/2]) rotate([90,-90,0])
        linear_extrude(height=1) {
            text("-", l/5, font="Arial");
        }
        translate([2*l/10,-l*sc/4,l/5]) rotate([90,-90,0])
        linear_extrude(height=1) {
            text("for KA", l/6, font="Arial");
        }
    }
}

//color("white") 
difference(){
    union(){
        difference(){
            union(){
                // outer sphere
                color("pink")
                translate([0,0,s*h/2]) scale([e,e,h]) sphere(d=s);
                // bottom foot
                color("azure")
                translate([0,0,0]) cylinder(4,d=s*.8);
                // handle
                //cylHandle();
                translate([33,0,0]) rotate(0,0,0) oklHammer(20,30);
            }

            // inner sphere
            color("blue")
            translate([0,0,s/2*h]) scale([e*w,e*w,w*h]) sphere(d=s);
            // top cylinder for opening
            color("gray") 
            translate ([0,0,s/2*h]) cylinder(.5*s*h,d=2*s*h);
        }
        // top torus
        translate([0,0,s*h/2]) 
            rotate_extrude() 
                translate([s*e/2-1.5,0,0]) 
                    scale ([.75,.5]) circle(2);
    }


    for(i = [0:len(t1)-1]){
        rotate([90,0,82+(360/len(t1))*i])
        //linear_extrude(height=1)
        translate([s/2+7,s,10.0])
        rotate([0,70,0])
        linear_extrude(height=1.0) 
        {
            text(t1[i], size = ts, halign="center", valign="center", font="Arial");
        };
    }

    for(i = [0:len(t2)-1]){
        rotate([180,0,(360/len(t2))*i])
        //linear_extrude(height=1)
        translate([0,10,-.5])
        linear_extrude(height=1) {
            text(t2[i], size=4, halign="center", valign="center", font="Arial");
        }
    }

    translate([33.5,2,13.2]) rotate([-90,-90,0]) scale ([.025,.025,.01]) surface(file = "zkmLogo_4cols.png", invert = false, center = true);

}

