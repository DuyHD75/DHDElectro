package dao.adminDAO;

import entity.Admin;
import entity.Order;
import entity.Product;
import entity.User;
import java.sql.SQLException;
import java.util.*;


public interface IAdmin {

    //Admin action
    public Admin getAdminByID(int id) throws SQLException;

    public Admin getAdminByNameAndPass(String username, String pass) throws SQLException;

    public List<Admin> getAllAdmins() throws SQLException;

    public boolean createAdmin(Admin admin) throws SQLException;

    public boolean updateAdmin(Admin admin) throws SQLException;

    public boolean deleteAdmin(int id) throws SQLException;

    // Order action
    public List<Order> getAllOrders() throws SQLException;

    public boolean updateOrder(String status, int orderId) throws SQLException;

    public Map<String, Double> getOrderByStatus() throws SQLException;

    // Product action
    public boolean createProduct(Product product) throws SQLException;

    public boolean updateProduct(Product product) throws SQLException;

    public boolean deleteProduct(int id) throws SQLException;

    public Product getProductById(int id) throws SQLException;

    public List<Product> getAllProducts() throws SQLException;

    // User : 
    public List<User> getAllUsers() throws SQLException;

    public boolean deleteUser(int id) throws SQLException;

    public User getUserByID(int id) throws SQLException;

}
