
package model;

import java.io.Serializable;
import java.util.Date;

public class ProductPage implements Serializable
{
    private Product product;
    private String content;
    private Date updateTime;

    public ProductPage(Product product, String content, Date updateTime) {
        this.product = product;
        this.content = content;
        this.updateTime = updateTime;
    }

    public Product getProduct() {
        return product;
    }

    public String getContent() {
        return content;
    }

    public Date getUpdateTime() {
        return updateTime;
    }
}
