package model;

import jdk.nashorn.internal.ir.SplitReturn;

import java.util.Date;

public class contract {
    private String id;
    private Date start_date;
    private Date end_date;
    private double deposit;
    private double total_money;

    public contract() {
    }

    public contract(String id, Date start_date, Date end_date, double deposit, double total_money) {
        this.id = id;
        this.start_date = start_date;
        this.end_date = end_date;
        this.deposit = deposit;
        this.total_money = total_money;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Date getStart_date() {
        return start_date;
    }

    public void setStart_date(Date start_date) {
        this.start_date = start_date;
    }

    public Date getEnd_date() {
        return end_date;
    }

    public void setEnd_date(Date end_date) {
        this.end_date = end_date;
    }

    public double getDeposit() {
        return deposit;
    }

    public void setDeposit(double deposit) {
        this.deposit = deposit;
    }

    public double getTotal_money() {
        return total_money;
    }

    public void setTotal_money(double total_money) {
        this.total_money = total_money;
    }
}
