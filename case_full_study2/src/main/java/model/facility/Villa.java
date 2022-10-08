package model.facility;

public class Villa extends Facility {
    private String standardRoom;
    private String descriptionOtherConvenience;
    private double poolArea;
    private int numberOfFloors;

    public Villa() {
    }

    public Villa(String standard_room, String description_other_convenience, double pool_area, int number_of_floors) {
        this.standardRoom = standard_room;
        this.descriptionOtherConvenience = description_other_convenience;
        this.poolArea = pool_area;
        this.numberOfFloors = number_of_floors;
    }

    public Villa(String name, double area, double cost, int max_people, String rent_type, String standard_room, String description_other_convenience, double pool_area, int number_of_floors) {
        super(name, area, cost, max_people, rent_type);
        this.standardRoom = standard_room;
        this.descriptionOtherConvenience = description_other_convenience;
        this.poolArea = pool_area;
        this.numberOfFloors = number_of_floors;
    }

    public String getStandardRoom() {
        return standardRoom;
    }

    public void setStandardRoom(String standardRoom) {
        this.standardRoom = standardRoom;
    }

    public String getDescriptionOtherConvenience() {
        return descriptionOtherConvenience;
    }

    public void setDescriptionOtherConvenience(String descriptionOtherConvenience) {
        this.descriptionOtherConvenience = descriptionOtherConvenience;
    }

    public double getPoolArea() {
        return poolArea;
    }

    public void setPoolArea(double poolArea) {
        this.poolArea = poolArea;
    }

    public int getNumberOfFloors() {
        return numberOfFloors;
    }

    public void setNumberOfFloors(int numberOfFloors) {
        this.numberOfFloors = numberOfFloors;
    }
}
