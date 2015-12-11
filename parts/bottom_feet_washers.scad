include <../charging_station.scad>

difference()
{
    circle(r=10, center=true);
    circle(r=hole_radius, center=true);
}
