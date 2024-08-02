/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author buiqu
 */
public class Account {

    private int UserID;
    private String UserName;
    private String Gmail;
    private String PassWord;
    private int Control;

    public Account() {
    }

    public Account(int UserID, String UserName, String Gmail, String PassWord, int Control) {
        this.UserID = UserID;
        this.UserName = UserName;
        this.Gmail = Gmail;
        this.PassWord = PassWord;
        this.Control = Control;
    }

    public int getUserID() {
        return UserID;
    }

    public void setUserID(int UserID) {
        this.UserID = UserID;
    }

    public String getUserName() {
        return UserName;
    }

    public void setUserName(String UserName) {
        this.UserName = UserName;
    }

    public String getGmail() {
        return Gmail;
    }

    public void setGmail(String Gmail) {
        this.Gmail = Gmail;
    }

    public String getPassWord() {
        return PassWord;
    }

    public void setPassWord(String PassWord) {
        this.PassWord = PassWord;
    }

    public int getControl() {
        return Control;
    }

    public void setControl(int Control) {
        this.Control = Control;
    }

    @Override
    public String toString() {
        return "Account{" + "UserID=" + UserID + ", UserName=" + UserName + ", Gmail=" + Gmail + ", PassWord=" + PassWord + ", Control=" + Control + '}';
    }
    

}
