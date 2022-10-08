package model.facility;

public class Room extends Facility{
    private String facilityFree;

    public Room() {
    }

    public Room(String facility_free) {
        this.facilityFree = facility_free;
    }

    public Room(String name, double area, double cost, int max_people, String rent_type, String facility_free) {
        super(name, area, cost, max_people, rent_type);
        this.facilityFree = facility_free;
    }

    public String getFacilityFree() {
        return facilityFree;
    }

    public void setFacilityFree(String facilityFree) {
        this.facilityFree = facilityFree;
    }
}
