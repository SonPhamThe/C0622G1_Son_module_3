package Customers;

public class Customers {
    private String nameCustomers;
    private String dayOfBirth;
    private String address;
    private String imageOfCustomers;

    public Customers() {
    }

    public Customers(String nameCustomers, String dayOfBirth, String address, String imageOfCustomers) {
        this.nameCustomers = nameCustomers;
        this.dayOfBirth = dayOfBirth;
        this.address = address;
        this.imageOfCustomers = imageOfCustomers;
    }

    public String getNameCustomers() {
        return nameCustomers;
    }

    public void setNameCustomers(String nameCustomers) {
        this.nameCustomers = nameCustomers;
    }

    public String getDayOfBirth() {
        return dayOfBirth;
    }

    public void setDayOfBirth(String dayOfBirth) {
        this.dayOfBirth = dayOfBirth;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getImageOfCustomers() {
        return imageOfCustomers;
    }

    public void setImageOfCustomers(String imageOfCustomers) {
        this.imageOfCustomers = imageOfCustomers;
    }
}
