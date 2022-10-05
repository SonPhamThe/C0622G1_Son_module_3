package model.facility;

import java.util.Date;

public class Room extends Facility{
    private String facility_free;

    public Room() {
    }

    public Room(String facility_free) {
        this.facility_free = facility_free;
    }

    public Room(String name, double area, double cost, int max_people, String rent_type, String facility_free) {
        super(name, area, cost, max_people, rent_type);
        this.facility_free = facility_free;
    }

    public String getFacility_free() {
        return facility_free;
    }

    public void setFacility_free(String facility_free) {
        this.facility_free = facility_free;
    }
}
