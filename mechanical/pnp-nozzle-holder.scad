module Magnet() {
    translate([-10, 0, 0])
    cube([20, 10, 3]);
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
    difference() {
        translate([0, 0, 4.5])
        rotate(-90, [1, 0, 0])
        linear_extrude(30)
        polygon([[-3.5, 5.5], [-3.5, 3], [-6.5, 3],
                 [-6.5, 1.5], [-3.5, 1.5], [-3.5, -1],
                 [3.5, -1], [3.5, 1.5], [6.5, 1.5],
                 [6.5, 3], [3.5, 3], [3.5, 5.5]]);

        translate([-3.5, 0, -1])
        linear_extrude(2.5)
        polygon([[0, 0], [0, 5], [2, 0]]);

        translate([-3.5, 0, 3])
        linear_extrude(2.5)
        polygon([[0, 0], [0, 5], [2, 0]]);

        translate([3.5, 0, -1])
        linear_extrude(2.5)
        polygon([[0, 0], [0, 5], [-2, 0]]);

        translate([3.5, 0, 3])
        linear_extrude(2.5)
        polygon([[0, 0], [0, 5], [-2, 0]]);
    }
}

module CutoutMagnet() {
    translate([-10, 0, 0])
    cube([20, 11, 3]);
    //translate([0, 5, -6])
    //cylinder(d=3, 15);
}

module NozzleHolder() {
    length = 142;
    difference() {
        cube([142, 35, 9.5]);

        translate([-1, 10, 4.5])
        cube([144, 16, 6]);

        translate([-1, 25, 1.5])
        cube([144, 11, 9]);

        for(i=[0:5]) {
            translate([i * 22 + 16, 14, 0])
            CutoutNozzle();
        }

        for(i=[0:5]) {
            translate([i * 22 + 16, 0, 4.5])
            CutoutMagnet();
        }
    }
}

module MountingBracket() {
    translate([0, -5, -15])
    cube([142, 5, 24.5]);
    translate([0, 0, -15])
    difference() {
        cube([142, 10, 8]);
        translate([-1, 0, 2])
        cube([144, 11, 4]);
    }
}

module PnPHolder() {
    NozzleHolder();
    MountingBracket();
}

module PnPHolderWithParts() {
    PnPHolder();

    for(i=[0:5]) {
        translate([i * 22 + 16, 14 + 5, 1.5])
        Nozzle();
    }

    for(i=[0:5]) {
        translate([i * 22 + 16, 0, 4.5])
        Magnet();
    }
}

//PnPHolderWithParts();
rotate(90, [1, 0, 0])
PnPHolder();
//CutoutNozzle();