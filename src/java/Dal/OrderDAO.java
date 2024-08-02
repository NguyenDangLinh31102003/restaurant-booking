/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

import Model.Account;
import Model.Cart;
import Model.Item;
import java.sql.PreparedStatement;
import java.time.LocalDate;
import java.sql.ResultSet;
/**
 *
 * @author buiqu
 */
public class OrderDAO extends DBContext{
    public void addOrder(Account u, Cart cart){
        LocalDate curDate =java.time.LocalDate.now();
        String date = curDate.toString();
        try {
            String sql ="insert into [Order] values(?,?,?)";
            PreparedStatement st =connection.prepareStatement(sql);
            st.setString(1, date);
            st.setInt(2, u.getUserID());
            st.setDouble(3, cart.getTotalMoney());
            st.executeUpdate();
            String sqll ="select top 1 id from [Order] order by id desc";
            PreparedStatement st1 = connection.prepareStatement(sqll);
            ResultSet rs = st1.executeQuery();
            if(rs.next()){
                int oid = rs.getInt(1);
                for(Item i:cart.getItems()){
            String sql2 ="insert into [OderLine] values(?,?,?,?)";
            PreparedStatement st2 = connection.prepareStatement(sql2);
            st.setInt(1, oid);
            st.setInt(2, i.getProduct().getProductID());
            st.setInt(3, i.getQuantity());
            st.setDouble(4, i.getPrice());
            st2.executeUpdate();
                }
            }
        } catch (Exception e) {
            System.err.println(e);
        }
    }
    
}
