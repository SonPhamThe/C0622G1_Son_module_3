package model.facility;

import java.util.Date;

public class Facility {
    private String name;
    private double area;
    private double cost;
    private int max_people;
    private String rent_type;

    public Facility() {
    }

    public Facility(String name, double area, double cost, int max_people, String rent_type) {
        this.name = name;
        this.area = area;
        this.cost = cost;
        this.max_people = max_people;
        this.rent_type = rent_type;
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

    public int getMax_people() {
        return max_people;
    }

    public void setMax_people(int max_people) {
        this.max_people = max_people;
    }

    public String getRent_type() {
        return rent_type;
    }

    public void setRent_type(String rent_type) {
        this.rent_type = rent_type;
    }
}
