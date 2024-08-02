/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author buiqu
 */
public class Feedback {
    private String UserName;
    private String TexFeedback;

    public Feedback() {
    }

    public Feedback(String UserName, String TexFeedback) {
        this.UserName = UserName;
        this.TexFeedback = TexFeedback;
    }

    public String getUserName() {
        return UserName;
    }

    public void setUserName(String UserName) {
        this.UserName = UserName;
    }

    public String getTexFeedback() {
        return TexFeedback;
    }

    public void setTexFeedback(String TexFeedback) {
        this.TexFeedback = TexFeedback;
    }

    @Override
    public String toString() {
        return "Feedback{" + "UserName=" + UserName + ", TexFeedback=" + TexFeedback + '}';
    }
    
    
}
