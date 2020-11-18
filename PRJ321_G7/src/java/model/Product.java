
package model;

import controller.DB;
import java.io.Serializable;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Product implements Serializable
{
    private int id;
    private Category category;
    private Account seller;
    private String name;
    private int size;
    private int weight;
    private String description;
    private int price;
    private String image;
    private boolean status;

    public Product(int id, Category category, Account seller, String name,
        int size, int weight, String description, int price, String image, boolean status)
    {
        this.id = id;
        this.category = category;
        this.seller = seller;
        this.name = name;
        this.size = size;
        this.weight = weight;
        this.description = description;
        this.price = price;
        this.image = image;
        this.status = status;
    }
    
    public boolean equal(Product that) {
        return id == that.id;
    }

    public int getId() {
        return id;
    }

    public Category getCategory() {
        return category;
    }

    public String getName() {
        return name;
    }

    public int getSize() {
        return size;
    }

    public int getWeight() {
        return weight;
    }

    public String getDescription() {
        return description;
    }

    public int getPrice() {
        return price;
    }

    public String getImage() {
        return image;
    }

    public boolean getStatus() {
        return status;
    }
    
    public Account getAuthor() {
        return seller;
    }
    
    // Can an account comment on this product
    public boolean canComment(Account acc) {
        if (acc == null) return false;
        if (acc.isAdmin()) return true;
        if (acc.isEmployee()) return acc.getId() == seller.getId();
        boolean can = false;
        try {
            String sql = String.format(
                "SELECT Order_.ordId FROM Order_ "
                + "INNER JOIN OrderDetail ON Order_.ordId=OrderDetail.ordId "
                + "WHERE Order_.accId=%d AND OrderDetail.proId=%d;",
                acc.getId(), id);
            Connection conn = DB.makeConn();
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            can = rs.next();
            rs.close();
            st.close();
            conn.close();
        } catch (SQLException | NullPointerException e) {
            e.printStackTrace();
        }
        return can;
    }
    
    // Get all comments on this product
    public List<Comment> getComments() {
        List<Comment> list = new ArrayList<>();
        try {
            String sql = String.format(
                "SELECT * FROM Comment WHERE proId=%d;" ,this.id);
            Connection conn = DB.makeConn();
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                list.add(new Comment(
                    rs.getInt(1), this,
                    DB.getAccount(rs.getInt(3)),
                    rs.getString(4), rs.getTime(5)));
            }
            rs.close();
            st.close();
            conn.close();
        } catch (SQLException | NullPointerException e) {
            e.printStackTrace();
        }
        return list;
    }
    
    // Get product page
    public ProductPage getProductPage() {
        ProductPage page = null;
        try {
            String sql = String.format(
                "SELECT * FROM ProductPage WHERE proId=%d;", this.id);
            Connection conn = DB.makeConn();
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            if (rs.next()) {
                page = new ProductPage(this,
                    rs.getString(2), rs.getDate(3));
            }
            rs.close();
            st.close();
            conn.close();
        } catch (SQLException | NullPointerException e) {
            e.printStackTrace();
        }
        return page;
    }
    
    // Get all sub-image of this product.
    public List<String> getSubImages() {
        List<String> urls = new ArrayList<>();
        try {
            Connection conn = DB.makeConn();
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(String.format(
                "SELECT url FROM ProductImage WHERE proId=%d;", this.id));
            while (rs.next()) {
                urls.add(rs.getString(1));
            }
            rs.close();
            st.close();
            conn.close();
        } catch (SQLException | NullPointerException e) {
            e.printStackTrace();
        }
        return urls;
    }
    
    // Get sold quantity
    public int countSold() {
        int n = 0;
        try {
            Connection conn = DB.makeConn();
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(String.format(
                "SELECT SUM(quantity) FROM OrderDetail WHERE proId=%d;", this.id));
            if (rs.next()) n = rs.getInt(1);
            rs.close();
            st.close();
            conn.close();
        } catch (SQLException | NullPointerException e) {
            e.printStackTrace();
        }
        return n;
    }
    
    // Check is product name existing
    public static boolean existName(String name) {
        boolean existing = true;
        try {
            String sql = "SELECT * FROM Product WHERE name like ?;";
            Connection conn = DB.makeConn();
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, name);
            ResultSet rs = st.executeQuery();
            existing = rs.next();
            rs.close();
            st.close();
            conn.close();
        } catch (SQLException | NullPointerException e) {
            e.printStackTrace();
        }
        return existing;
    }
}
