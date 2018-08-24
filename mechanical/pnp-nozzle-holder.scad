module Magnet() {
    cube([20, 10, 3], center=true);
}

module Nozzle() {
    translate([0, 0, 1])
    cylinder(3, d=6);

    cylinder(1, d=10);

    translate([0, 0, -5])
    cylinder(5, d=6);

    translate([0, 0, -6 + -5])
    cylinder(6, d=5);
}

module CutoutNozzle() {
    length = 30;
    difference() {
        translate([0, 0, 4.5])
        rotate(-90, [0, 0, 1])
        rotate(-90, [1, 0, 0])
        linear_extrude(length)
        polygon([[-3.5, 5.5], [-3.5, 3], [-6.5, 3],
                 [-6.5, 1.5], [-3.5, 1.5], [-3.5, -1],
                 [3.5, -1], [3.5, 1.5], [6.5, 1.5],
                 [6.5, 3], [3.5, 3], [3.5, 5.5]]);

        translate([0, -3.5, -1])
        linear_extrude(2.5)
        polygon([[0, 0], [5, 0], [0, 2]]);

        translate([0, -3.5, 3])
        linear_extrude(2.5)
        polygon([[0, 0], [5, 0], [0, 2]]);

        translate([0, 3.5, -1])
        linear_extrude(2.5)
        polygon([[0, 0], [5, 0], [0, -2]]);

        translate([0, 3.5, 3])
        linear_extrude(2.5)
        polygon([[0, 0], [5, 0], [0, -2]]);
    }
}

module PnPHolder() {
    length = 142;
    difference() {
        translate([0, length, 0])
        rotate(90, [1, 0, 0])
        linear_extrude(length)
        polygon([[0, 0], [35, 0], [35, 1.5], [25, 1.5], [25, 4.5], [0, 4.5]]);

        for(i=[0:5]) {
            translate([10, i * 22 + 12, 0])
            CutoutNozzle();
        }
    }
}

module PnPHolderWithParts() {
    PnPHolder();
    for (i=[0:5]) {
        translate([5, i * 22 + 12, 3.5 + 1.5])
        rotate(90, [0, 0, 1])
        Magnet();

        translate([15, i * 22 + 12, 1.5])
        Nozzle();
    }
}

//PnPHolderWithParts();
PnPHolder();
//CutoutNozzle();