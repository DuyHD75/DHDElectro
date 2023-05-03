/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author This PC
 */
public class WishList {

    private int id;
    private int uid;
    private int pid;
    private String name;
    private double price;
    private String img;

    public WishList() {
    }

    public WishList(int uid, int pid, String name, double price, String img) {
        this.uid = uid;
        this.pid = pid;
        this.name = name;
        this.price = price;
        this.img = img;
    }
    
    

    public WishList(int id, int uid, int pid, String name, double price, String img) {
        this.id = id;
        this.uid = uid;
        this.pid = pid;
        this.name = name;
        this.price = price;
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

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    @Override
    public String toString() {
        return "WishList{" + "uid=" + uid + ", pid=" + pid + ", name=" + name + ", price=" + price + ", img=" + img + '}';
    }
}
