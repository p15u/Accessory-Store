
package controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.Category;
import model.Product;
import model.Role;
import util.MD5;
import util.Pair;

// Main data source
public class DB
{
    // Make database connection transaction
    public static Connection makeConn() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            return DriverManager.getConnection(
                "jdbc:mysql://localhost/PRJ321_G7", "root", "");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    // Check exist account
    public static int checkAccount(String username) {
        if (username == null || username.isEmpty()) return 1;
        if (!Account.validateUsername(username)) return 1;
        int id = -1;
        try {
            Connection conn = makeConn();
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(String.format(
                "SELECT accId FROM Account WHERE username='%s';", username));
            if (rs.next()) id = rs.getInt(1);
            rs.close();
            st.close();
            conn.close();
        } catch (SQLException | NullPointerException e) {
            e.printStackTrace();
        }
        return id;
    }
    
    // Authenticate account
    public static Account login(String username, String password) {
        if (username == null || username.isEmpty()) return null;
        if (password == null || password.isEmpty()) return null;
        if (!Account.validateUsername(username)) return null;
        if (!Account.validatePassword(password)) return null;
        Account account = null;
        try {
            password = MD5.get(password);
            Connection conn = makeConn();
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(String.format(
                "SELECT * FROM Account WHERE username='%s' AND password='%s';",
                username, password));
            if (rs.next()) {
                account = new Account(
                    rs.getInt(1), rs.getInt(2),
                    rs.getString(3)
                );
            }
            rs.close();
            st.close();
            conn.close();
        } catch (SQLException | NullPointerException e) {
            e.printStackTrace();
        }
        return account;
    }
    
    // Register new account
    public static boolean register(String user, String pass, Role role) {
        if (user == null || user.isEmpty()) return false;
        if (pass == null || pass.isEmpty()) return false;
        if (!Account.validateUsername(user)) return false;
        if (!Account.validatePassword(pass)) return false;
        if (checkAccount(user) != -1) return false;
        boolean success = false;
        try {
            pass = MD5.get(pass);
            String sql = "INSERT INTO Account (roleId, username, password) VALUES (?, ?, ?); ";
            Connection conn = makeConn();
            PreparedStatement st = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            st.setInt(1, role.get());
            st.setString(2, user);
            st.setString(3, pass);
            success = st.executeUpdate() > 0;
            if (success) {
                ResultSet rs = st.getGeneratedKeys();
                rs.next();
                int id = rs.getInt(1);
                st.executeUpdate(String.format(
                    "INSERT INTO Person (accId, fullname) VALUES ('%d', '%s')",
                    id, user));
                rs.close();
            }
            st.close();
            conn.close();
        } catch (SQLException | NullPointerException e) {
            e.printStackTrace();
        }
        return success;
    }
    
    // Get all categories
    public static List<Category> getAllCategories() {
        List<Category> cates = new ArrayList<>();
        try {
            Connection conn = makeConn();
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM Category;");
            while (rs.next()) {
                Category cate = new Category(
                    rs.getInt(1), rs.getString(2), rs.getString(3));
                cates.add(cate);
            }
            rs.close();
            st.close();
            conn.close();
        } catch (SQLException | NullPointerException e) {
            e.printStackTrace();
        }
        return cates;
    }
    
    // Get category by ID
    public static Category getCategory(int id) {
        Category cate = null;
        try {
            Connection conn = makeConn();
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(String.format(
                "SELECT * FROM Category WHERE catId=%d;", id));
            if (rs.next()) {
                cate = new Category(id,
                    rs.getString(2), rs.getString(2));
            }
            rs.close();
            st.close();
            conn.close();
        } catch (SQLException | NullPointerException e) {
            e.printStackTrace();
        }
        return cate;
    }

    // Get all products
    public static List<Product> getAllProducts() {
        return getProducts(-1);
    }
    
    // Get top lastest product
    public static List<Product> getProducts(int top) {
        List<Category> cates = getAllCategories();
        List<Product> pros = new ArrayList<>();
        try {
            Connection conn = makeConn();
            Statement st = conn.createStatement();
            String sql = top <= 0 ? "SELECT * FROM Product;" : String.format(
                "SELECT * FROM Product ORDER BY proId DESC LIMIT %d;", top);
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                Product p = new Product(
                    rs.getInt(1), cates.get(rs.getInt(2)-1),
                    getAccount(rs.getInt(3)), rs.getString(4),
                    rs.getInt(5), rs.getInt(6), rs.getString(7),
                    rs.getInt(8), rs.getString(9), rs.getBoolean(10));
                pros.add(p);
            }
            rs.close();
            st.close();
            conn.close();
        } catch (SQLException | NullPointerException e) {
            e.printStackTrace();
        }
        return pros;
    }
    
    // Get product by ID
    public static Product getProduct(int id) {
        Product pro = null;
        try {
            Connection conn = makeConn();
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(String.format(
                "SELECT * FROM Product WHERE proId=%d;", id));
            if (rs.next()) {
                pro = new Product(id,
                    getCategory(rs.getInt(2)),
                    getAccount(rs.getInt(3)), rs.getString(4),
                    rs.getInt(5), rs.getInt(6), rs.getString(7),
                    rs.getInt(8), rs.getString(9), rs.getBoolean(10));
            }
            rs.close();
            st.close();
            conn.close();
        } catch (SQLException | NullPointerException e) {
            e.printStackTrace();
        }
        return pro;
    }
    
    // Get account by ID
    public static Account getAccount(int id) {
        Account acc = null;
        try {
            Connection conn = makeConn();
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(String.format(
                "SELECT * FROM Account WHERE accId=%d;", id));
            if (rs.next()) {
                acc = new Account(rs.getInt(1),
                    rs.getInt(2), rs.getString(3));
            }
            rs.close();
            st.close();
            conn.close();
        } catch (SQLException | NullPointerException e) {
            e.printStackTrace();
        }
        return acc;
    }
    
    // Get all account by role
    public static List<Account> getAllAccount(Role role) {
        List<Account> list = new ArrayList<>();
        try {
            Connection conn = makeConn();
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(String.format(
                "SELECT * FROM Account WHERE roleId=%d;", role.get()));
            while (rs.next()) {
                Account acc = new Account(rs.getInt(1),
                    rs.getInt(2), rs.getString(3));
                list.add(acc);
            }
            rs.close();
            st.close();
            conn.close();
        } catch (SQLException | NullPointerException e) {
            e.printStackTrace();
        }
        return list;
    }
    
    // Get total product sold times
    public static int getTotalSold() {
        int n = 0;
        try {
            Connection conn = makeConn();
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("SELECT SUM(quantity) FROM OrderDetail;");
            if (rs.next()) n = rs.getInt(1);
            rs.close();
            st.close();
            conn.close();
        } catch (SQLException | NullPointerException e) {
            e.printStackTrace();
        }
        return n;
    }
    
    // Get total money income
    public static int getTotalIncome() {
        int n = 0;
        try {
            String sql = "SELECT SUM(totalCost) FROM Order_;";
            Connection conn = makeConn();
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            if (rs.next()) n = rs.getInt(1);
            rs.close();
            st.close();
            conn.close();
        } catch (SQLException | NullPointerException e) {
            e.printStackTrace();
        }
        return n;
    }
    
    // Get top user have most paid
    public static List<Pair<Account, Integer>> getTopPaid(int top)
    {
        List<Pair<Account, Integer>> list = new ArrayList<>();
        try {
            String sql = "SELECT accId, SUM(totalCost) as total FROM Order_ "
                + "WHERE accId IS NOT NULL "
                + "GROUP BY accId "
                + "ORDER BY total DESC "
                + "LIMIT " + top + ";";
            Connection conn = makeConn();
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                Pair<Account, Integer> p = new Pair<>(
                    getAccount(rs.getInt(1)),
                    rs.getInt(2));
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
    
    // Get top seller have most product sold time
    public static List<Pair<Account, Integer>> getTopSeller(int top)
    {
        List<Pair<Account, Integer>> list = new ArrayList<>();
        try {
            String sql = "SELECT Account.accId, SUM(OrderDetail.quantity) as total FROM "
                + "Product INNER JOIN OrderDetail ON Product.proId=OrderDetail.proId "
                + "INNER JOIN Account ON Account.accId=Product.seller "
                + "WHERE Account.accId IS NOT NULL "
                + "GROUP BY Account.accId "
                + "ORDER BY total DESC "
                + "LIMIT " + top + ";";
            Connection conn = makeConn();
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                Pair<Account, Integer> p = new Pair<>(
                    getAccount(rs.getInt(1)),
                    rs.getInt(2));
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
    
    public static List<Pair<Product, Integer>> getTopSellingProduct(int top) {
        List<Pair<Product, Integer>> list = new ArrayList<>();
        try {
            String sql = "SELECT proId, SUM(quantity) as total FROM OrderDetail "
                + "GROUP BY proId "
                + "ORDER BY total DESC "
                + "LIMIT " + top + ";";
            Connection conn = makeConn();
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                Pair<Product, Integer> p = new Pair<>(
                    getProduct(rs.getInt(1)),
                    rs.getInt(2));
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
}
