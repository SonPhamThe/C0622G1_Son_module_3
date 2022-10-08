package model.facility;

public abstract class Facility {
    private int id;
    private String name;
    private double area;
    private double cost;
    private int maxPeople;
    private String rentType;

    public Facility() {
    }

    public Facility(String name, double area, double cost, int max_people, String rent_type) {
        this.name = name;
        this.area = area;
        this.cost = cost;
        this.maxPeople = max_people;
        this.rentType = rent_type;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getArea() {
        return area;
    }

    public void setArea(double area) {
        this.area = area;
    }

    public double getCost() {
        return cost;
    }

    public void setCost(double cost) {
        this.cost = cost;
    }

    public int getMaxPeople() {
        return maxPeople;
    }

    public void setMaxPeople(int maxPeople) {
        this.maxPeople = maxPeople;
    }

    public String getRentType() {
        return rentType;
    }

    public void setRentType(String rentType) {
        this.rentType = rentType;
    }
}
