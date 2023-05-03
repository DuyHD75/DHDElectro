/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author This PC
 */
public class Cart {

    private int id, uid, pid;
    private String name;
    private double price;
    private int quantity;
    private String img;

    public Cart() {
    }

    public Cart(int uid, int pid, String name, double price, int quantity, String img) {
        super();
        this.uid = uid;
        this.pid = pid;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.img = img;
    }

    public Cart(int id, int uid, int pid, String name, double price, int quantity, String img) {
        super();
        this.id = id;
        this.uid = uid;
        this.pid = pid;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.img = img;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    @Override
    public String toString() {
        return "Cart{" + "id=" + id + ", uid=" + uid + ", pid=" + pid + ", name=" + name + ", price=" + price + ", quantity=" + quantity + ", img=" + img + '}';
    }

}
