package dao.adminDAO;

import dao.ConnectionDB;
import entity.Admin;
import entity.Order;
import entity.OrderDetails;
import entity.Product;
import entity.User;
import java.sql.*;
import java.util.*;

public class AdminDAO implements IAdmin {

    private static final String SELECT_ALL_ADMIN = "SELECT * FROM admins;";

    private static final String SELECT_ADMIN_BY_NAME_AND_PASS = "SELECT * FROM admins where name = ? and password = ?;";

    private static final String SELECT_ADMIN_BY_ID = "SELECT * FROM admins WHERE id = ?;";

    private static final String SELECT_ALL_USERS = "SELECT * FROM customers;";

    private static final String SELECT_USER_BY_ID = "SELECT * FROM customers WHERE id = ?;";

    private static final String ADD_NEW_ADMIN = "INSERT INTO admins VALUES ( ? , ? );";

    private static final String UPDATE_ADMIN = "UPDATE admins SET name = ?, password = ? WHERE id = ?;";

    private static final String DELETE_ADMIN = "DELETE FROM admins WHERE id = ?;";

    private static final String ADD_NEW_PRODUCT = "INSERT INTO products VALUES (? , ? ,?, ? , ?, ? , ? , ? );";

    private static final String UPDATE_PRODUCT = "UPDATE products SET adminID = ? , name= ? , productDesc = ? , price = ?, img1= ? , img2= ? , img3 = ? WHERE id = ?;";

    private static final String DELETE_PRODUCT = "DELETE FROM products WHERE id = ? ;";

    private static final String GET_ALL_PRODUCTS = "SELECT * FROM products;";

    private static final String GET_ORDER_BY_STATUS = "select status ,sum(quantityOrdered * priceEach) as Total from orderdetails od inner join orders o on od.orderID = o.id group by o.status;";

    private static final String DELETE_USER_ACCOUNT = "DELETE FROM customers WHERE id = ?;";

    private static final String SELECT_PRODUCT_BY_ID = "SELECT * FROM products WHERE id = ?;";

    private static final String SELCT_ALL_ORDERS = "SELECT * FROM orders;";

    private static final String UPDATE_ORDER_STATUS = "update orders set  status = ? where id =?;";

    private static final String DELETE_ORDER = "DELETE FROM orders WHERE id = ? ;";

    // ========================= ADMIN ===========================
    @Override
    public Admin getAdminByID(int id) throws SQLException {
        Admin ad = null;
        try (
                Connection con = ConnectionDB.getConnection(); PreparedStatement pstm = con.prepareStatement(SELECT_ADMIN_BY_ID);) {
            pstm.setInt(1, id);

            ResultSet rs = pstm.executeQuery();

            while (rs.next()) {
                ad = new Admin(id, rs.getString("name"), rs.getString("password"));
            }
        }
        return ad;
    }

    @Override
    public Admin getAdminByNameAndPass(String username, String passs) throws SQLException {
        try (
                Connection con = ConnectionDB.getConnection(); PreparedStatement pstm = con.prepareStatement(SELECT_ADMIN_BY_NAME_AND_PASS);) {
            pstm.setString(1, username);
            pstm.setString(2, passs);
            ResultSet rs = pstm.executeQuery();
            Admin ad = null;
            while (rs.next()) {
                ad = new Admin(rs.getInt(1), rs.getString(2), rs.getString(3));
            }
            return ad;
        }
    }

    @Override
    public List<Admin> getAllAdmins() throws SQLException {
        List<Admin> admins = new ArrayList<>();

        try (
                Connection con = ConnectionDB.getConnection(); PreparedStatement pstm = con.prepareStatement(SELECT_ALL_ADMIN);) {
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                admins.add(new Admin(rs.getInt("id"), rs.getString("name"), rs.getString("password")));
            }
            return admins;
        }
    }

    @Override
    public boolean createAdmin(Admin admin) throws SQLException {
        try (
                Connection con = ConnectionDB.getConnection(); PreparedStatement pstm = con.prepareStatement(ADD_NEW_ADMIN);) {
            pstm.setString(1, admin.getName());
            pstm.setString(2, admin.getPassword());
            return pstm.executeUpdate() > 0;
        }
    }

    @Override
    public boolean updateAdmin(Admin admin) throws SQLException {
        try (
                Connection con = ConnectionDB.getConnection(); PreparedStatement pstm = con.prepareStatement(UPDATE_ADMIN);) {
            pstm.setString(1, admin.getName());
            pstm.setString(2, admin.getPassword());
            pstm.setInt(3, admin.getId());
            return pstm.executeUpdate() > 0;
        }
    }

    @Override
    public boolean deleteAdmin(int id) throws SQLException {
        try (
                Connection con = ConnectionDB.getConnection(); PreparedStatement pstm = con.prepareStatement(DELETE_ADMIN);) {
            pstm.setInt(1, id);
            return pstm.executeUpdate() > 0;
        }
    }

    //================= PRODUCTS ==========================
    @Override
    public boolean createProduct(Product product) throws SQLException {
        try (
                Connection con = ConnectionDB.getConnection(); PreparedStatement pstm = con.prepareStatement(ADD_NEW_PRODUCT);) {
            pstm.setInt(1, product.getAdminId());
            pstm.setString(2, product.getCategory());
            pstm.setString(3, product.getName());
            pstm.setString(4, product.getDetail());
            pstm.setDouble(5, product.getPrice());
            pstm.setString(6, product.getImg1());
            pstm.setString(7, product.getImg2());
            pstm.setString(8, product.getImg3());
            return pstm.executeUpdate() > 0;
        }
    }
//    SteelSeries Arctis 1 Wireless, Over-ear,  20Hz - 20kHz, USB, PC, PS4™, Nintendo Switch™, Xbox One™, VR

    @Override
    public boolean updateProduct(Product product) throws SQLException {
        try (
                Connection con = ConnectionDB.getConnection(); PreparedStatement pstm = con.prepareStatement(UPDATE_PRODUCT);) {
            pstm.setInt(1, product.getAdminId());
            pstm.setString(2, product.getName());
            pstm.setString(3, product.getDetail());
            pstm.setDouble(4, product.getPrice());
            pstm.setString(5, product.getImg1());
            pstm.setString(6, product.getImg2());
            pstm.setString(7, product.getImg3());
            pstm.setInt(8, product.getId());
            return pstm.executeUpdate() > 0;
        }
    }

    @Override
    public boolean deleteProduct(int id) throws SQLException {
        try (
                Connection con = ConnectionDB.getConnection(); PreparedStatement pstm = con.prepareStatement(DELETE_PRODUCT);) {
            pstm.setInt(1, id);
            return pstm.executeUpdate() > 0;
        }
    }

    public boolean deleteOrderDetails(int id) throws SQLException {
        try (
                Connection con = ConnectionDB.getConnection(); PreparedStatement pstm = con.prepareStatement("delete from orderDetails where orderID = ?");) {
            pstm.setInt(1, id);
            return pstm.executeUpdate() > 0;
        }
    }

    public boolean deleteOrder(int id) throws SQLException {
        try (
                Connection con = ConnectionDB.getConnection(); PreparedStatement pstm = con.prepareStatement(DELETE_ORDER);) {
            deleteOrderDetails(id);
            pstm.setInt(1, id);
            return pstm.executeUpdate() > 0;
        }
    }

    @Override
    public Product getProductById(int id) throws SQLException {
        Product product = null;
        try (
                Connection con = ConnectionDB.getConnection(); PreparedStatement pstm = con.prepareStatement(SELECT_PRODUCT_BY_ID);) {
            pstm.setInt(1, id);
            ResultSet rs = pstm.executeQuery();

            while (rs.next()) {
                product = new Product(
                        rs.getInt("id"),
                        rs.getInt("adminId"),
                        rs.getString("category"),
                        rs.getString("name"),
                        rs.getString("productDesc"),
                        rs.getDouble("price"),
                        rs.getString("img1"),
                        rs.getString("img2"),
                        rs.getString("img3"));
            }

            return product;
        }
    }

    @Override
    public List<Product> getAllProducts() throws SQLException {
        List<Product> products = new ArrayList<>();
        try (
                Connection con = ConnectionDB.getConnection(); PreparedStatement pstm = con.prepareStatement(GET_ALL_PRODUCTS);) {
            ResultSet rs = pstm.executeQuery();

            while (rs.next()) {
                products.add(new Product(
                        rs.getInt("id"),
                        rs.getInt("adminId"),
                        rs.getString("category"),
                        rs.getString("name"),
                        rs.getString("productDesc"),
                        rs.getDouble("price"),
                        rs.getString("img1"),
                        rs.getString("img2"),
                        rs.getString("img3")));
            }
            return products;
        }
    }

    // =================== USER MANAGEMENT ======================
    @Override
    public List<User> getAllUsers() throws SQLException {
        List<User> users = new ArrayList<>();
        try (
                Connection con = ConnectionDB.getConnection(); PreparedStatement pstm = con.prepareStatement(SELECT_ALL_USERS);) {
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                users.add(new User(rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("password"),
                        rs.getString("address"),
                        rs.getString("email"),
                        rs.getString("phone")));
            }
            return users;
        }
    }

    @Override
    public User getUserByID(int id) throws SQLException {
        try (
                Connection con = ConnectionDB.getConnection(); PreparedStatement pstm = con.prepareStatement(SELECT_USER_BY_ID);) {
            pstm.setInt(1, id);
            ResultSet rs = pstm.executeQuery();

            User user = null;
            while (rs.next()) {
                user = new User(rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("password"),
                        rs.getString("address"),
                        rs.getString("email"),
                        rs.getString("phone"));
            }
            return user;
        }
    }

    @Override
    public boolean deleteUser(int id) throws SQLException {
        try (
                Connection con = ConnectionDB.getConnection(); PreparedStatement pstm = con.prepareStatement(DELETE_USER_ACCOUNT);) {
            pstm.setInt(1, id);
            return pstm.executeUpdate() > 0;
        }
    }

    public int removeUser(int id) throws SQLException {
        try (
                Connection con = ConnectionDB.getConnection(); PreparedStatement pstm = con.prepareStatement(DELETE_USER_ACCOUNT);) {
            pstm.setInt(1, id);
            return pstm.executeUpdate();
        }
    }

    // ======================== ORDERS ==========================================
    public List<OrderDetails> getOrderDetailByOID(int oid) throws SQLException {
        List<OrderDetails> ods = new ArrayList<>();
        try (
                Connection con = ConnectionDB.getConnection(); PreparedStatement pstm = con.prepareStatement("select * from orderDetails where orderID = ?;");) {
            pstm.setInt(1, oid);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                ods.add(new OrderDetails(oid,
                        getProductById(rs.getInt("productCode")),
                        rs.getInt("quantityOrdered")));
            }
            return ods;
        }
    }

    @Override
    public List<Order> getAllOrders() throws SQLException {
        List<Order> orders = new ArrayList<>();

        try (Connection con = ConnectionDB.getConnection(); PreparedStatement pstm = con.prepareStatement(SELCT_ALL_ORDERS);) {
            ResultSet rs = pstm.executeQuery();

            int orderID = 0;
            String orderDate = "";
            String status = "";
            String payMethod = "";
            while (rs.next()) {
                Order order = new Order(
                        rs.getInt("id"),
                        getUserByID(rs.getInt("customerId")),
                        rs.getString("orderDate"),
                        rs.getString("status"),
                        rs.getString("payMethod"),
                        getOrderDetailByOID(rs.getInt("id")));
                orders.add(order);
            }
            return orders;
        }
    }

    @Override
    public boolean updateOrder(String status, int orderId) throws SQLException {
        try (
                Connection con = ConnectionDB.getConnection(); PreparedStatement pstm = con.prepareStatement(UPDATE_ORDER_STATUS);) {
            pstm.setString(1, status);
            pstm.setInt(2, orderId);
            return pstm.executeUpdate() > 0;
        }
    }

    @Override
    public Map<String, Double> getOrderByStatus() throws SQLException {
        Map<String, Double> orderMap = new HashMap<>();
        try (Connection con = ConnectionDB.getConnection(); PreparedStatement pstm = con.prepareStatement(GET_ORDER_BY_STATUS);) {

            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                orderMap.put(rs.getString("status"), rs.getDouble("Total"));
            }
            return orderMap;
        }
    }

}
