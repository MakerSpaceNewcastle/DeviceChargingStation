include <charging_station.scad>;

color("blue")
    translate([0, (section_y / 2) + material_thickness])
        rotate([90, 0])
            linear_extrude(height=material_thickness)
                MainPanel(section_x);

color("green")
    translate([-(section_x / 2) - material_thickness, 0])
        rotate([90, 0, 90])
            linear_extrude(height=material_thickness)
                MainPanel(section_y);

color("red")
{
    for(i = [0 : num_sections])
    {
        translate([0, 0, i * (section_z + material_thickness)])
        {
            linear_extrude(height=material_thickness)
            {
                if (i == num_sections)
                {
                    PowerSupplySectionPanel();
                }
                else
                {
                    SectionPanel();
                }
            }
        }
    }
}
