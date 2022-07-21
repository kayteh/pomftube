$doobLength = 109;
$doobTip = 8/2;
$overhang = 5;//

// Main Tube
difference() {
    cylinder(r=$doobTip+$overhang, h=$doobLength+$overhang, $fn=6);
    translate([0,0,$overhang]) cylinder(r=$doobTip+2, h=$doobLength+$overhang, $fn=32);

    // bottom dot grid
    translate([0,0,-0.1]) intersection() {
        cylinder(r=$doobTip+$overhang-1, h=3, $fn=6);

        for (x=[-6:3:6]) for(y=[-6:3:6]) {
            $yOffset = x % 2 == 0 ? y+1.3 : y;
            translate([x,$yOffset,0]) {
                cylinder(r=1.3, h= 3, $fn=16);
            }
        };
    }
}


// lid
rotate([0,180,0]) translate([0,17,-8])  {
    cylinder(r=$doobTip+$overhang, h=5, $fn=6);
    translate([0,0,-4]) difference() {
        cylinder(r=$doobTip+2-0.1, h=4, $fn=32);
        translate([0,0,-1]) cylinder(r=$doobTip+1, h=4, $fn=32);
    }

    translate([0,0,5]) difference() {
        cylinder(r=$doobTip+$overhang, h=3, $fn=6);
        for (x=[-40:6:40]) translate([x,-35,0.1]) cube([3,70,3]);
    }
}