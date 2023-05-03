package entity;

import java.util.*;

/**
 *
 * @author This PC
 */
public class Order {

    private int id;
    private User user;
    private String orderDate;
    private String status;
    private String paymentMethod;
    private List<OrderDetails> orderDetails;

    public Order() {
    }

    public Order(int id, User user, String orderDate, String status, String paymentMethod, List<OrderDetails> orderDetails) {
        this.id = id;
        this.user = user;
        this.orderDate = orderDate;
        this.status = status;
        this.paymentMethod = paymentMethod;
        this.orderDetails = orderDetails;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public List<OrderDetails> getOrderDetails() {
        return orderDetails;
    }

    public void setOrderDetails(List<OrderDetails> orderDetails) {
        this.orderDetails = orderDetails;
    }

    @Override
    public String toString() {
        return "Order{" + "id=" + id + ", user=" + user + ", orderDate=" + orderDate + ", status=" + status + ", paymentMethod=" + paymentMethod + ", orderDetails=" + orderDetails + '}';
    }
    
}
