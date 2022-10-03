package model.person;

import java.util.Date;

public class Employee extends Person {
    private String education_degree_id;
    private String position_id;
    private double salary;

    public Employee() {
    }

    public Employee(String education_degree_id, String position_id, double salary) {
        this.education_degree_id = education_degree_id;
        this.position_id = position_id;
        this.salary = salary;
    }

    public Employee(String name, Date date_of_birth, String id_card, String phone, String email, String education_degree_id, String position_id, double salary, String education_degree_id1, String position_id1, double salary1) {
        super(name, date_of_birth, id_card, phone, email, education_degree_id, position_id, salary);
        this.education_degree_id = education_degree_id1;
        this.position_id = position_id1;
        this.salary = salary1;
    }

    public String getEducation_degree_id() {
        return education_degree_id;
    }

    public void setEducation_degree_id(String education_degree_id) {
        this.education_degree_id = education_degree_id;
    }

    public String getPosition_id() {
        return position_id;
    }

    public void setPosition_id(String position_id) {
        this.position_id = position_id;
    }

    public double getSalary() {
        return salary;
    }

    public void setSalary(double salary) {
        this.salary = salary;
    }
}
