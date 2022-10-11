package model;

public class Home {
    private int id;
    private String namePerson;
    private String numberPhone;
    private String startDate;
    private String namePaypal;
    private String note;

    public Home() {
    }

    public Home(int id, String numberPhone, String startDate, String namePaypal, String namePerson, String note) {
        this.id = id;
        this.numberPhone = numberPhone;
        this.startDate = startDate;
        this.namePaypal = namePaypal;
        this.namePerson = namePerson;
        this.note = note;
    }

    public Home(String namePerson, String numberPhone, String startDate, String namePaypal, String note) {
        this.namePerson = namePerson;
        this.numberPhone = numberPhone;
        this.startDate = startDate;
        this.namePaypal = namePaypal;
        this.note = note;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNumberPhone() {
        return numberPhone;
    }

    public void setNumberPhone(String numberPhone) {
        this.numberPhone = numberPhone;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getNamePaypal() {
        return namePaypal;
    }

    public void setNamePaypal(String namePaypal) {
        this.namePaypal = namePaypal;
    }

    public String getNamePerson() {
        return namePerson;
    }

    public void setNamePerson(String namePerson) {
        this.namePerson = namePerson;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }
}
