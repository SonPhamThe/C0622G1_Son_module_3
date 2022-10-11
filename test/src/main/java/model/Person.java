package model;

public class Person {
    private int id_card;
    private String name;

    public Person() {
    }

    public Person(int id_card, String name) {
        this.id_card = id_card;
        this.name = name;
    }

    public int getId_card() {
        return id_card;
    }

    public void setId_card(int id_card) {
        this.id_card = id_card;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
