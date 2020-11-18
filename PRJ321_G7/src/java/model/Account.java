
package model;

import controller.DB;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import util.MD5;

public class Account implements Serializable
{
    private int     id;
    private Role    role;
    private String  username;
    // No password here!
    
    public Account(int id, int role, String username) {
        this.id = id;
        this.role = Role.get(role);
        this.username = username;
    }
    
    public int getId() {
        return id;
    }
    
    public String getUsername() {
        return username;
    }
    
    public String getName() {
        return getInfo().getFullname();
    }

    public Role getRole() { return role; }
    public void setRole(Role role) { this.role = role; }
    public boolean isAdmin() { return role.isAdmin();}
    public boolean isEmployee() { return role.isEmppoyee(); }
    public boolean isCustomer() { return role.isCustomer(); }
    
    public boolean isSocial() {
        return isCustomer();
    }
    
    public static boolean validateUsername(String user) {
        return user != null && user.matches("^[a-zA-Z][a-zA-Z0-9_]{2,31}$");
    }
    
    public static boolean validatePassword(String pass) {
        return pass != null && pass.length() >= 8 && pass.length() <= 16;
    }
    
    // Get account info
    public Person getInfo() {
        Person info = new Person(username);
        try {
            String sql = "SELECT * FROM Person WHERE accId=" + this.id + ";";
            Connection conn = DB.makeConn();
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            if (rs.next()) {
                info = new Person(
                    rs.getString(2), rs.getString(3), rs.getString(4),
                    rs.getString(5), rs.getString(6),rs.getString(7),
                    rs.getString(8), rs.getString(9));
            }
            st.close();
            conn.close();
        } catch (SQLException | NullPointerException e) {
            e.printStackTrace();
        }
        return info;
    }
    
    public void update(String fullname, String idcard, String phone,
        String email, String address , String birthday, String gender)
    {
        String sql = "UPDATE Person SET fullname=?, idcard=?, phone=?, "
            + "email=?, address=?, birthday=?, gender=? WHERE accId=?;";
        try {
            Connection conn = DB.makeConn();
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, fullname);
            st.setString(2, idcard);
            st.setString(3, phone);
            st.setString(4, email);
            st.setString(5, address);
            st.setString(6, birthday);
            st.setString(7, gender);
            st.setInt(8, this.id);
            st.executeUpdate();
            st.close();
            conn.close();
        } catch (SQLException | NullPointerException e) {
            e.printStackTrace();
        }
    }
    
    // Get all own products (employee only)
    public List<Product> getOwnProducts() {
        List<Product> list = new ArrayList<>();
        if (!isEmployee()) return list;
        List<Category> cates = DB.getAllCategories();
        try {
            String sql = "SELECT * FROM Product WHERE seller=?;";
            Connection conn = DB.makeConn();
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, this.id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(
                    rs.getInt(1), cates.get(rs.getInt(2)-1),
                    this, rs.getString(4),
                    rs.getInt(5), rs.getInt(6), rs.getString(7),
                    rs.getInt(8), rs.getString(9), rs.getBoolean(10));
                list.add(p);
            }
            rs.close();
            st.close();
            conn.close();
        } catch (SQLException | NullPointerException e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public void addProduct(int catId, String name, int size, int weight,
        String description, int price, String image, String information, String subImages[])
    {
        String sql = "INSERT INTO Product (catId, seller, name, size, weight, "
            + "description, price, image) VALUES (?, ?, ?, ?, ?, ?, ?, ?);";
        String sql2 = "INSERT INTO ProductPage (proId, content) VALUES (?, ?)";
        String sql3 = "INSERT INTO ProductImage (proId, url) VALUES (?, ?)";
        try {
            Connection conn = DB.makeConn();
            PreparedStatement st = conn.prepareStatement(sql,
                Statement.RETURN_GENERATED_KEYS);
            st.setInt(1, catId);
            st.setInt(2, this.id);
            st.setString(3, name);
            st.setInt(4, size);
            st.setInt(5, weight);
            st.setString(6, description);
            st.setInt(7, price);
            st.setString(8, image);
            if (st.executeUpdate() > 0) {
                ResultSet rs = st.getGeneratedKeys();
                rs.next();
                int proId = rs.getInt(1);
                st.close();
                st = conn.prepareStatement(sql2);
                st.setInt(1, proId);
                st.setString(2, information);
                st.executeUpdate();
                if (subImages != null) {
                    for (int i = 1; i <= subImages.length; i++) {
                        st.close();
                        st = conn.prepareStatement(sql3);
                        st.setInt(1, proId);
                        st.setString(2, subImages[i-1]);
                        st.executeUpdate();
                    }
                }
                rs.close();
            }
            st.close();
            conn.close();
        } catch (SQLException | NullPointerException e) {
            e.printStackTrace();
        }
    }
    
    // Comment on a product
    public void comment(int proId, String content) {
        try {
            String sql = "INSERT INTO Comment (proId, author, content) VALUES (?, ?, ?);";
            Connection conn = DB.makeConn();
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, proId);
            st.setInt(2, this.id);
            st.setString(3, content);
            st.executeUpdate();
            st.close();
            conn.close();
        } catch (SQLException | NullPointerException e) {
            e.printStackTrace();
        }
    }
    
    // Reply a comment
    public void reply(int cmtId, String content) {
        try {
            String sql = "INSERT INTO Reply (cmtId, author, content) VALUES (?, ?, ?);";
            Connection conn = DB.makeConn();
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, cmtId);
            st.setInt(2, this.id);
            st.setString(3, content);
            st.executeUpdate();
            st.close();
            conn.close();
        } catch (SQLException | NullPointerException e) {
            e.printStackTrace();
        }
    }
    
    public void changeAvatar(String avatar) {
        try {
            String sql = "UPDATE Person SET avatar=? WHERE accId=?;";
            Connection conn = DB.makeConn();
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, avatar);
            st.setInt(2, this.id);
            st.executeUpdate();
            st.close();
            conn.close();
        } catch (SQLException | NullPointerException e) {
            e.printStackTrace();
        }
    }
    
    // Change account password
    public boolean changePassword(String current, String password) {
        if (!validatePassword(current)) return false;
        if (!validatePassword(password)) return false;
        
        boolean success = false;
        current = MD5.get(current);
        password = MD5.get(password);
        
        try {
            String sql = "UPDATE Account SET password=? WHERE accId=? AND password=?;";
            Connection conn = DB.makeConn();
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, password);
            st.setInt(2, this.id);
            st.setString(3, current);
            success = st.executeUpdate() > 0;
            st.close();
            conn.close();
        } catch (SQLException | NullPointerException e) {
            e.printStackTrace();
        }
        
        return success;
    }
    
    public List<Order> getAllOrders() {
        List<Order> list = new ArrayList<>();
        try {
            String sql = String.format(
                "SELECT * FROM Order_ WHERE accId=%d;", this.id);
            Connection conn = DB.makeConn();
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                list.add(new Order(
                    rs.getInt(1), this, rs.getString(3),
                    rs.getString(4), rs.getString(5), rs.getString(6),
                    rs.getString(7), rs.getInt(8)));
            }
            rs.close();
            st.close();
            conn.close();
        } catch (SQLException | NullPointerException e) {
            e.printStackTrace();
        }
        return list;
    }
}
