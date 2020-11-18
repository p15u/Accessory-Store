
package model;

import java.io.Serializable;
import java.util.Date;

public class Reply implements Serializable
{
    private Comment comment;
    private Account author;
    private String  content;
    private Date    time;

    public Reply(Comment comment, Account author, String content, Date time) {
        this.comment = comment;
        this.author = author;
        this.content = content;
        this.time = time;
    }

    public Comment getComment() {
        return comment;
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
}
