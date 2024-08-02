/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

import Model.Account;
import Model.BookTable;
import Model.Categorize;
import Model.Feedback;
import Model.Product;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author buiqu
 */
public class Dao extends DBContext {

    public ArrayList<Product> listProduct() {
        ArrayList<Product> list = new ArrayList<>();
        String sql = "Select * from Product";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getInt(8)));
            }
        } catch (SQLException e) {
            System.err.println(e);
        }
        return list;
    }

    public ArrayList<Categorize> listCategorize() {
        ArrayList<Categorize> list = new ArrayList<>();
        String sql = "SELECT * From Categorize";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Categorize(rs.getInt(1),
                        rs.getString(2)));
            }
        } catch (SQLException e) {
            System.err.println(e);
        }
        return list;
    }

    public ArrayList<Product> listSaleProduct() {
        ArrayList<Product> list = new ArrayList<>();
        String sql = "SELECT * from Product\n"
                + "WHERE Sale > 0";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getInt(8)));
            }
        } catch (SQLException e) {
            System.err.println(e);
        }
        return list;
    }

    public ArrayList<Product> searchByName(String searchName) {
        ArrayList<Product> list = new ArrayList<>();
        String sql = "Select * from Product\n"
                + "Where [Name] like ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + searchName + "%");

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getInt(8)));
            }
        } catch (SQLException e) {
            System.err.println(e);
        }
        return list;
    }

    public Product detailProductByID(String id) {
        String sql = "select * from Product p\n"
                + "where p.ProductID =?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, id);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getInt(8));
            }

        } catch (Exception e) {
        }
        return null;
    }

    public Product productExist(String name) {
        String sql = "Select * from Product p\n"
                + "WHERE  p.Name = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getInt(8));
            }

        } catch (Exception e) {
        }
        return null;
    }

    public ArrayList<Categorize> searchCategoryByNameP(String searchName) {
        ArrayList<Categorize> list = new ArrayList<>();
        String sql = "Select  DISTINCT c.TypeID , c.NameType  FROM Product P JOIN Categorize C\n"
                + "ON p.TypeID =c.TypeID\n"
                + "Where p.[Name] like ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + searchName + "%");

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new Categorize(rs.getInt(1),
                        rs.getString(2)));
            }
        } catch (SQLException e) {
            System.err.println(e);
        }
        return list;
    }

    public ArrayList<BookTable> searchBookTableByUserID(String id) {
        ArrayList<BookTable> list = new ArrayList<>();
        String sql = " SELECT * from  BookTable b\n"
                + "where b.UserID = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, id);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new BookTable(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8)));
            }
        } catch (SQLException e) {
            System.err.println(e);
        }
        return list;
    }

    public ArrayList<Feedback> listFeedback() {
        ArrayList<Feedback> list = new ArrayList<>();
        String sql = "Select a.UserName , b.FeedbackText from Account a join Feedback b\n"
                + "on a.UserID = b.UserID";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new Feedback(rs.getString(1),
                        rs.getString(2)));
            }
        } catch (SQLException e) {
            System.err.println(e);
        }
        return list;
    }

    public Account findAccount(String User, String Password) {
        String sql = "Select * from Account a\n"
                + "where a.UserName = ?\n"
                + "and a.PassWord = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, User);
            ps.setString(2, Password);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5));
            }

        } catch (Exception e) {
        }
        return null;
    }

    public Account checkUserExist(String User) {
        String sql = "select * from Account a\n"
                + "WHere a.UserName = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, User);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5));
            }

        } catch (Exception e) {
        }
        return null;
    }

    public Account GetAccount(String id) {
        String sql = "SELECT * from  Account a\n"
                + "where a.UserID = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, id);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5));
            }

        } catch (Exception e) {
        }
        return null;
    }

    public void signup(String User, String Gmail, String Pass) {
        String sql = "Insert Into Account(UserName, Gmail, PassWord,Control)\n"
                + "values (?,?,?,0)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, User);
            ps.setString(2, Gmail);
            ps.setString(3, Pass);

            ps.executeUpdate();
        } catch (Exception e) {
        }

    }

    public void book(String UserName, int Phone, String UserMail, int NumberOfPeople, String date, int UserID, String Time) {
        String sql = "Insert Into BookTable (UserName,Phone, UserMail,NumberOfPeople,Date, UserID, Time)\n"
                + "values (?, ?,?,?,?,?, ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, UserName);
            ps.setInt(2, Phone);
            ps.setString(3, UserMail);
            ps.setInt(4, NumberOfPeople);
            ps.setString(5, date);
            ps.setInt(6, UserID);
            ps.setString(7, Time);

            ps.executeUpdate();
        } catch (Exception e) {
        }

    }

    public int addProduct(String Name, String price, String Description, String img, String sale, String Status, String CategorizeID) {
        String sql = "Insert into Product(Name, Price, Description, ImageURL, Sale,Status,TypeID)\n"
                + "values(?,?,?,?,?,?,?)";
        int n = 0;
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, Name);
            ps.setString(2, price);
            ps.setString(3, Description);
            ps.setString(4, img);
            ps.setString(5, sale);
            ps.setString(6, Status);
            ps.setString(7, CategorizeID);

            n = ps.executeUpdate();
        } catch (Exception e) {
        }
        return n;

    }

    public int edit(String Name, String price, String Description, String img, String sale, String Status, String CategorizeID, String id) {
        String sql = "Update Product\n"
                + "                set [Name] = ?,\n"
                + "               Price = ?,\n"
                + "               [Description] =?,\n"
                + "               ImageURL =?,\n"
                + "                Sale = ?,\n"
                + "             [Status] = ?,\n"
                + "              TypeID = ?\n"
                + "              where ProductID = ?";
        int n = 0;
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, Name);
            ps.setString(2, price);
            ps.setString(3, Description);
            ps.setString(4, img);
            ps.setString(5, sale);
            ps.setString(6, Status);
            ps.setString(7, CategorizeID);
            ps.setString(8, id);

            n = ps.executeUpdate();
        } catch (Exception e) {
        }
        return n;

    }

    public void feedback(int UserID, String FeedbackTex) {
        String sql = "Insert into Feedback( UserID, FeedbackText)\n"
                + "values(?,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, UserID);
            ps.setString(2, FeedbackTex);

            ps.executeUpdate();
        } catch (Exception e) {
        }

    }

    public void AddCategory(String NameCategory) {
        String sql = "insert into Categorize(NameType) \n"
                + "Values(?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, NameCategory);

            ps.executeUpdate();
        } catch (Exception e) {
        }

    }
//DELETE////

    public void deleteProductByCategory(String ID) {
        String sql = "delete Product\n"
                + "WHere TypeID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, ID);

            ps.executeUpdate();
        } catch (Exception e) {
        }

    }

    public void deleteProduct(String ID) {
        String sql = "delete Product\n"
                + "where ProductID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, ID);

            ps.executeUpdate();
        } catch (Exception e) {
        }

    }

    public void deleteTableBook(String ID) {
        String sql = "Delete BookTable \n"
                + "Where TableID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, ID);

            ps.executeUpdate();
        } catch (Exception e) {
        }

    }

    public void deleteCategory(String ID) {
        String sql = "delete Categorize\n"
                + "WHere TypeID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, ID);

            ps.executeUpdate();
        } catch (Exception e) {
        }

    }
    //DELETE//// 

    public static void main(String[] args) {
        Dao lis = new Dao();
        System.out.println(lis.searchBookTableByUserID("1"));
//        lis.edit("Pasta Asciutta dasddsdsasdd thao", "2", "Pasta Asciutta", "Pasta Asciutta", "22", "1", "3", "7");

        // Sử dụng SimpleDateFormat để chuyển đổi chuỗi thành java.util.Date
//        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
//        Date date = null;
//        try {
//            date = sdf.parse("22-04-2024"); // Chú ý định dạng chuỗi phải phù hợp với định dạng được chỉ định ở đây
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//
//        // Gọi hàm book với ngày đã chuyển đổi
//       lis.book("Thaiiiiir", 123456789, "test@example.com", 2, date, 1,"13:66");
    }

}
