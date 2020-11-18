
package model;

import controller.DB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

public class Order
{
    public int id;
    public Account who;
    public String orderDate;
    public String receiverName;
    public String address;
    public String receiverPhone;
    public String notes;
    public int totalCost;
    
    public class Detail
    {
        public Order order;
        public Product product;
        public int price;
        public int quantity;

        public Detail(Order order, Product product, int price, int quantity) {
            this.order = order;
            this.product = product;
            this.price = price;
            this.quantity = quantity;
        }
        
        public Order getOrder() {
            return order;
        }
        
        public Product getProduct() {
            return product;
        }
        
        public int getQuantity() {
            return quantity;
        }
        
        public int getPrice() {
            return price;
        }
    }

    public Order(int id, Account who, String orderDate, String notes,
        String receiverName, String address, String receiverPhone, int totalCost)
    {
        this.id = id;
        this.who = who;
        this.orderDate = orderDate;
        this.notes = notes;
        this.address = address;
        this.receiverName = receiverName;
        this.receiverPhone = receiverPhone;
        this.totalCost = totalCost;
    }

    public int getId() {
        return id;
    }

    public Account getWho() {
        return who;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public String getReceiverName() {
        return receiverName;
    }

    public String getAddress() {
        return address;
    }

    public String getReceiverPhone() {
        return receiverPhone;
    }

    public String getNotes() {
        return notes;
    }

    public int getTotalCost() {
        return totalCost;
    }
    
    public List<Detail> getDetails() {
        List<Detail> list = new ArrayList<>();
        try {
            Connection conn = DB.makeConn();
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(String.format(
                "SELECT * FROM OrderDetail WHERE ordId=%d;", this.id));
            while (rs.next()) {
                list.add(new Detail(
                    this, DB.getProduct(rs.getInt("proId")),
                    rs.getInt("price"), rs.getInt("quantity")));
            }
            rs.close();
            st.close();
            conn.close();
        } catch (SQLException | NullPointerException e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public static void checkout(Account account, Cart cart,
        String fullname, String zip, String address, String phone, String email, String notes)
    {
        try {
            String sql = "INSERT INTO Order_ (accId, notes, receiverName, "
                + "address, receiverPhone, totalCost) VALUES (?, ?, ?, ?, ?, ?)";
            
            Connection conn = DB.makeConn();
            PreparedStatement st = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            if (account == null) st.setNull(1, Types.INTEGER);
            else st.setInt(1, account.getId());
            st.setString(2, notes);
            st.setString(3, fullname);
            st.setString(4, address);
            st.setString(5, phone);
            st.setInt(6, cart.totalTotal());

            if (st.executeUpdate() > 0) {
                ResultSet rs = st.getGeneratedKeys();
                rs.next();
                int id = rs.getInt(1);

                List<Cart.Item> items = cart.getItems();
                for (Cart.Item i: items) {
                    st.executeUpdate(String.format(
                        "INSERT INTO OrderDetail (ordId, proId, price, quantity) "
                        + "VALUES (%d, %d, %d, %d);",
                        id, i.product.getId(), i.product.getPrice(), i.count));
                }
                
                rs.close();
            }
            
            st.close();
            conn.close();
        } catch (SQLException | NullPointerException e) {
            e.printStackTrace();
        }
    }
}
