/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author This PC
 */
public class OrderDetails extends Order {

    private int orderId;
    private Product prd;
    private int quantity;

    public OrderDetails(int orderId, Product prd, int quantity) {
        this.orderId = orderId;
        this.prd = prd;
        this.quantity = quantity;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public Product getPrd() {
        return prd;
    }

    public void setPrd(Product prd) {
        this.prd = prd;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "OrderDetails{" + "orderId=" + orderId + ", prd=" + prd + ", quantity=" + quantity + '}';
    }

    
    
}
