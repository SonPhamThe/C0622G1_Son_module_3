package model;

public class member {
    private int id;
    private String name;
    private String date_of_birth;
    private int idHouse;

    public member() {
    }

    public member(int id, String name, String date_of_birth, int idHouse) {
        this.id = id;
        this.name = name;
        this.date_of_birth = date_of_birth;
        this.idHouse = idHouse;
    }

    public member(String name, String date_of_birth, int idHouse) {
        this.name = name;
        this.date_of_birth = date_of_birth;
        this.idHouse = idHouse;
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

    public String getDate_of_birth() {
        return date_of_birth;
    }

    public void setDate_of_birth(String date_of_birth) {
        this.date_of_birth = date_of_birth;
    }

    public int getIdHouse() {
        return idHouse;
    }

    public void setIdHouse(int idHouse) {
        this.idHouse = idHouse;
    }
}
