/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Phung An
 */
public class Cart {

    private List<Item> items;

    public Cart() {
        items = new ArrayList<>();
    }

    public Cart(List<Item> items) {
        this.items = items;
    }

    public List<Item> getItems() {
        return items;
    }

    public void setItems(List<Item> items) {
        this.items = items;
    }

    // dung de check item co chua
    private Item getItemById(int id) {
        for (Item i : items) {
            if (i.getProduct().getId() == id) {
                return i;
            }
        }
        return null;
    }

    public int getQuantityById(int id) {
        return getItemById(id).getQuantity();
    }

    // add item vao cart
    public void addItem(Item t) {
        Item m = getItemById(t.getProduct().getId());
        if (m != null) {
            // Mục sản phẩm đã tồn tại, tăng số lượng
            m.setQuantity(m.getQuantity());
        } else {
            items.add(t);
        }
    }

    public void removeItem(int id) {
        if (getItemById(id) != null) {
            items.remove(getItemById(id));
        }
    }

    public double getTotalMoney() {
        int t = 0;
        for (Item i : items) {
            t += (i.getQuantity()) * (i.getProduct().getPrice());
        }
        return t;
    }

    @Override
    public String toString() {
        return "Cart{" + "items=" + items + '}';
    }

}
