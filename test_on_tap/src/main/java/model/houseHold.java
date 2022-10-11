package model;

public class houseHold {
    private int id;
    private String name;
    private String startDate;
    private String address;
    private int so_luong_thanh_vien;

    public houseHold() {
    }

    public houseHold(int id, String name, String startDate, String address, int so_luong_thanh_vien) {
        this.id = id;
        this.name = name;
        this.startDate = startDate;
        this.address = address;
        this.so_luong_thanh_vien = so_luong_thanh_vien;
    }



    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }



    public int getSo_luong_thanh_vien() {
        return so_luong_thanh_vien;
    }

    public void setSo_luong_thanh_vien(int so_luong_thanh_vien) {
        this.so_luong_thanh_vien = so_luong_thanh_vien;
    }
}
