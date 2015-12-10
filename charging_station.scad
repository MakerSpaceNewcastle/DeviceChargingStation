use <CAD-Library/panel_nut_fixing.scad>;

material_thickness = 3;

section_z = 30;
section_x = 150;
section_y = 90;

num_sections = 5;

tab_width = 10;

module PowerSupplyMount()
{
    x = 20.5;
    y = 14.5;

    positions = [[x, y], [x, -y], [-x, y], [-x, -y]];

    for (p = positions)
        translate(p)
            circle(r=1.6);
}

module PowerSupplySectionPanel()
{
    difference()
    {
        SectionPanel();
        translate([10, 0])
            PowerSupplyMount();
    }
    }

module SectionPanel()
{
    difference()
    {
        square([section_x, section_y], center=true);

        translate([0, section_y / 2])
            rotate([180, 0, 0])
                PanelNutFixing_M3(thickness=0);

        rotate([0, 0, 90])
            translate([0, section_x / 2])
                rotate([180, 0, 0])
                    PanelNutFixing_M3(thickness=0);
    }

    translate([0, section_y / 2])
        SectionPanelFixings(section_x);

    rotate([0, 0, 90])
        translate([0, section_x / 2])
            SectionPanelFixings(section_y);
}

module SectionPanelFixings(x)
{
    translate([x * 0.25, 0])
        square([tab_width, material_thickness * 2.1], center=true);

    translate([x * -0.25, 0])
        square([tab_width, material_thickness * 2.1], center=true);
}

module MainPanelFixings(x)
{
    translate([x * 0.25, 0])
        square([tab_width + 0.1, material_thickness + 0.1], center=true);

    translate([x * -0.25, 0])
        square([tab_width + 0.1, material_thickness + 0.1], center=true);

    circle(r=1.5);
}

module MainPanel(width, d = 20)
{
    y = d + num_sections * (section_z + material_thickness);

    difference()
    {
        translate([0, (y - d) / 2])
            square([width, y], center=true);

        translate([0, material_thickness / 2])
        for(i = [0 : num_sections])
            translate([0, i * (section_z + material_thickness)])
                MainPanelFixings(width);
    }
}
