package model.facility;

public class House extends Facility {
    private String standardRoom;
    private String descriptionOtherConvenience;
    private int numberOfFloors;


    public House() {
    }

    public House(String standard_room, String description_other_convenience, int number_of_floors) {
        this.standardRoom = standard_room;
        this.descriptionOtherConvenience = description_other_convenience;
        this.numberOfFloors = number_of_floors;
    }

    public House(String name, double area, double cost, int max_people, String rent_type, String standard_room, String description_other_convenience, int number_of_floors) {
        super(name, area, cost, max_people, rent_type);
        this.standardRoom = standard_room;
        this.descriptionOtherConvenience = description_other_convenience;
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

    public int getNumberOfFloors() {
        return numberOfFloors;
    }

    public void setNumberOfFloors(int numberOfFloors) {
        this.numberOfFloors = numberOfFloors;
    }
}
