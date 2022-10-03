package model.person;

import java.util.Date;

public class Customer extends Person{
    private String customer_type_id;
    private String address;

    public Customer() {
    }

    public Customer(String customer_type_id, String address) {
        this.customer_type_id = customer_type_id;
        this.address = address;
    }

    public Customer(String name, Date date_of_birth, String id_card, String phone, String email, String education_degree_id, String position_id, double salary, String customer_type_id, String address) {
        super(name, date_of_birth, id_card, phone, email, education_degree_id, position_id, salary);
        this.customer_type_id = customer_type_id;
        this.address = address;
    }

    public String getCustomer_type_id() {
        return customer_type_id;
    }

    public void setCustomer_type_id(String customer_type_id) {
        this.customer_type_id = customer_type_id;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
