
package model;

import controller.DB;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Comment implements Serializable
{
    private int     id;
    private Product product;
    private Account author;
    private String  content;
    private Date    time;
    
    public Comment(int id, Product product, Account author,
        String content, Date time)
    {
        this.id = id;
        this.product = product;
        this.author = author;
        this.content = content;
        this.time = time;
    }

    public int getId() {
        return id;
    }

    public Product getProduct() {
        return product;
    }
    
    public Account getAuthor() {
        return author;
    }

    public String getContent() {
        return content;
    }

    public Date getTime() {
        return time;
    }
    
    // Get all replies on this comment
    public List<Reply> getReplies() {
        List<Reply> list = new ArrayList<>();
        try {
            String sql = String.format(
                "SELECT * FROM Reply WHERE cmtId=%d;", this.id);
            Connection conn = DB.makeConn();
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                list.add(new Reply(this,
                    DB.getAccount(rs.getInt(2)),
                    rs.getString(3),
                    rs.getDate(4)));
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
