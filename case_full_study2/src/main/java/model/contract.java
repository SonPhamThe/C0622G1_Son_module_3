package model;

import java.util.Date;

public class contract {
    private String id;
    private Date startDate;
    private Date endDate;
    private double deposit;
    private double totalMoney;

    public contract() {
    }

    public contract(String id, Date start_date, Date end_date, double deposit, double total_money) {
        this.id = id;
        this.startDate = start_date;
        this.endDate = end_date;
        this.deposit = deposit;
        this.totalMoney = total_money;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public double getDeposit() {
        return deposit;
    }

    public void setDeposit(double deposit) {
        this.deposit = deposit;
    }

    public double getTotalMoney() {
        return totalMoney;
    }

    public void setTotalMoney(double totalMoney) {
        this.totalMoney = totalMoney;
    }
}
