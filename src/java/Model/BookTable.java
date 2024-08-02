/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author buiqu
 */
public class BookTable {

    private String tableID;
    private String UserName;
    private String Email;
    private String Phone;
    private String NumberOfTable;
    private String Date;
    private String UserID;
    private String Time;

    public BookTable() {
    }

    public BookTable(String tableID, String UserName, String Email, String Phone, String NumberOfTable, String Date, String UserID, String Time) {
        this.tableID = tableID;
        this.UserName = UserName;
        this.Email = Email;
        this.Phone = Phone;
        this.NumberOfTable = NumberOfTable;
        this.Date = Date;
        this.UserID = UserID;
        this.Time = Time;
    }

    public String getTableID() {
        return tableID;
    }

    public void setTableID(String tableID) {
        this.tableID = tableID;
    }

    public String getUserName() {
        return UserName;
    }

    public void setUserName(String UserName) {
        this.UserName = UserName;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getPhone() {
        return Phone;
    }

    public void setPhone(String Phone) {
        this.Phone = Phone;
    }

    public String getNumberOfTable() {
        return NumberOfTable;
    }

    public void setNumberOfTable(String NumberOfTable) {
        this.NumberOfTable = NumberOfTable;
    }

    public String getDate() {
        return Date;
    }

    public void setDate(String Date) {
        this.Date = Date;
    }

    public String getUserID() {
        return UserID;
    }

    public void setUserID(String UserID) {
        this.UserID = UserID;
    }

    public String getTime() {
        return Time;
    }

    public void setTime(String Time) {
        this.Time = Time;
    }

    @Override
    public String toString() {
        return "BookTable{" + "tableID=" + tableID + ", UserName=" + UserName + ", Email=" + Email + ", Phone=" + Phone + ", NumberOfTable=" + NumberOfTable + ", Date=" + Date + ", UserID=" + UserID + ", Time=" + Time + '}';
    }
    

}
