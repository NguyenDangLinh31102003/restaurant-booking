package Model;

import java.sql.Date;
import java.util.ArrayList;

public class Order {

    private int id;
    private String date ;
    private int cusid;
    private double totalmoney;

    public Order() {
    }

    public Order(int id, String date, int cusid, double totalmoney) {
        this.id = id;
        this.date = date;
        this.cusid = cusid;
        this.totalmoney = totalmoney;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getCusid() {
        return cusid;
    }

    public void setCusid(int cusid) {
        this.cusid = cusid;
    }

    public double getTotalmoney() {
        return totalmoney;
    }

    public void setTotalmoney(double totalmoney) {
        this.totalmoney = totalmoney;
    }
       
    
           }