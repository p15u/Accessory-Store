package model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class Cart implements Serializable {

    private final List<Item> items = new ArrayList<>();

    public class Item implements Serializable {

        public Product product;
        public int count;

        public Item(Product pro, int n) {
            count = n;
            product = pro;
        }
    }

    public int count() {
        if (items.isEmpty()) {
            return 0;
        }
        int n = 0;
        for (Item i : items) {
            n += i.count;
        }
        return n;
    }

    public int total() {
        if (items.isEmpty()) {
            return 0;
        }
        int n = 0;
        for (Item i : items) {
            n += i.product.getPrice() * i.count;
        }
        return n;
    }

    public void reset() {
        items.clear();
    }

    public int shipCost() {
        return 7000 * items.size();
    }

    public int vat() {
        return (int) ((total() + shipCost()) * 0.1);
    }

    public int totalTotal() {
        return total() + vat() + shipCost();
    }

    public boolean isEmpty() {
        return count() == 0;
    }

    public void add(Product pro, int n) {
        if (n <= 0) {
            n = 1;
        }
        for (Item i : items) {
            if (i.product.equal(pro)) {
                i.product = pro;
                i.count += n;
                return;
            }
        }
        items.add(new Item(pro, n));
    }

    public void remove(Product pro) {
        if (isEmpty()) {
            return;
        }
        int n = 0;
        for (Item i : items) {
            if (i.product.equal(pro)) {
                items.remove(n);
                break;
            }
            n++;
        }
    }

    public void decrease(Product pro) {
        if (isEmpty()) {
            return;
        }
        int n = 0;
        for (Item i : items) {
            if (i.product.equal(pro)) {
                i.product = pro;
                if (--i.count <= 0) {
                    items.remove(n);
                }
                break;
            }
            n++;
        }
    }

    public List<Item> getItems() {
        return items;
    }

    public void update() {
        
    }
}
