package dao.userDAO;

import dao.ConnectionDB;
import dao.adminDAO.AdminDAO;
import entity.Admin;
import entity.Cart;
import entity.Order;
import entity.OrderDetails;
import entity.Product;
import entity.User;
import entity.WishList;
import java.sql.*;
import java.time.LocalDate;
import java.util.*;

public class UserDAO implements IUser {

    private AdminDAO adminDAO = new AdminDAO();

    @Override
    public User loginByEmailAndPass(String email, String pass) throws SQLException {
        User user = null;

        try (
                Connection con = ConnectionDB.getConnection(); PreparedStatement pstm = con.prepareStatement("select * from customers where email = ? AND password = ?;")) {
            pstm.setString(1, email);
            pstm.setString(2, pass);

            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                user = new User(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6));
            }
            return user;
        }
    }

    @Override
    public List<Product> getAllProducts() throws SQLException {
        List<Product> products = new ArrayList<>();
        try (
                Connection con = ConnectionDB.getConnection(); 
                PreparedStatement pstm = con.prepareStatement("select * from products;");) {
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

//        @Override
    public List<Product> getProductBySearchKey(String name) throws SQLException {
        List<Product> products = new ArrayList<>();
        try (
                Connection con = ConnectionDB.getConnection(); 
                PreparedStatement pstm = con.prepareStatement("select * from products where name LIKE ? OR category LIKE ?;");) {
            pstm.setString(1, "%" + name + "%");
            pstm.setString(2, "%" + name + "%");

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

    @Override
    public List<Product> getProductByCategory(String category) throws SQLException {
        List<Product> products = new ArrayList<>();
        try (
                Connection con = ConnectionDB.getConnection(); PreparedStatement pstm = con.prepareStatement("select * from products where category = ?;");) {
            pstm.setString(1, category);
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

    @Override
    public List<Cart> getCartByUID(int uid) throws SQLException {
        List<Cart> carts = new ArrayList<>();
        try (
                Connection con = ConnectionDB.getConnection(); PreparedStatement pstm = con.prepareStatement("select * from carts where user_id = ?;");) {
            pstm.setInt(1, uid);
            ResultSet rs = pstm.executeQuery();

            while (rs.next()) {
                carts.add(new Cart(rs.getInt("id"),
                        rs.getInt("user_id"),
                        rs.getInt("pid"),
                        rs.getString("name"),
                        rs.getDouble("price"),
                        rs.getInt("quantity"),
                        rs.getString("img")));
            }
            return carts;
        }
    }

    public boolean getUserByEmail(User user) throws SQLException {
        boolean isExits = false;
        try (
                Connection con = ConnectionDB.getConnection(); PreparedStatement pstm = con.prepareStatement("select * from customers where email = ?;");) {
            pstm.setString(1, user.getEmail());
            ResultSet rs = pstm.executeQuery();

            if (rs.next()) {
                return isExits;
            } else {
                return !isExits;
            }
        }
    }

    public User getUserByID(int id) throws SQLException {
        try (
                Connection con = ConnectionDB.getConnection(); PreparedStatement pstm = con.prepareStatement("SELECT * FROM customers WHERE id = ?;");) {
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
    public boolean userRegister(User user) throws SQLException {
        boolean isCreated = false;
        try (
                Connection con = ConnectionDB.getConnection(); PreparedStatement pstm = con.prepareStatement("insert into customers values  (?, ? , ?, ?, ?);");) {
            if (!getUserByEmail(user)) {
                return isCreated;
            } else {
                pstm.setString(1, user.getName());
                pstm.setString(2, user.getPassword());
                pstm.setString(3, user.getAddress());
                pstm.setString(4, user.getEmail());
                pstm.setString(5, user.getPhone());
                return pstm.executeUpdate() > 0;
            }
        }
    }

    @Override
    public boolean updateUser(User user) throws SQLException {
        boolean isUpdated = false;
        try (
                Connection con = ConnectionDB.getConnection(); PreparedStatement pstm = con.prepareStatement("update customers set name = ? , password = ? , address = ? , email = ? , phone = ? where id = ? ;");) {
            pstm.setString(1, user.getName());
            pstm.setString(2, user.getPassword());
            pstm.setString(3, user.getAddress());
            pstm.setString(4, user.getEmail());
            pstm.setString(5, user.getPhone());
            pstm.setInt(6, user.getId());
            return pstm.executeUpdate() > 0;
        }

    }

    @Override
    public List<WishList> getWishListByID(int uid) throws SQLException {
        List<WishList> wishList = new ArrayList<>();
        try (
                Connection con = ConnectionDB.getConnection(); PreparedStatement pstm = con.prepareStatement("select * from wishList where customerId = ?;");) {
            pstm.setInt(1, uid);
            ResultSet rs = pstm.executeQuery();

            while (rs.next()) {
                wishList.add(new WishList(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getDouble(5),
                        rs.getString(6)
                ));
            }
            return wishList;
        }
    }

    public Product getProductById(int id) throws SQLException {
        Product product = null;
        try (
                Connection con = ConnectionDB.getConnection(); PreparedStatement pstm = con.prepareStatement("SELECT * FROM products WHERE id = ?;");) {
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

    public List<OrderDetails> getOrderDetailByOID(int oid) throws SQLException {
        List<OrderDetails> ods = new ArrayList<>();
        try (
                Connection con = ConnectionDB.getConnection(); PreparedStatement pstm = con.prepareStatement("select * from orderDetails where orderId = ?;");) {
            pstm.setInt(1, oid);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                ods.add(new OrderDetails(oid,
                        adminDAO.getProductById(rs.getInt("productCode")),
                        rs.getInt("quantityOrdered")));
            }
            return ods;
        }
    }

    public List<Order> getOrderOfUser(User user) throws SQLException {
        List<Order> orders = new ArrayList<>();
        try (
                Connection con = ConnectionDB.getConnection(); PreparedStatement pstm = con.prepareStatement("SELECT * FROM orders where customerId = ? ;");) {
            pstm.setInt(1, user.getId());

            ResultSet rs = pstm.executeQuery();

            int orderID = 0;
            String orderDate = "";
            String status = "";
            String payMethod = "";
            while (rs.next()) {
                Order order = new Order(
                        rs.getInt("id"),
                        user,
                        rs.getString("orderDate"),
                        rs.getString("status"),
                        rs.getString("payMethod"),
                        getOrderDetailByOID(rs.getInt("id")));
                orders.add(order);
            }
            return orders;
        }
    }

    public int checkProductIsExistedInCart(int pid, int uid) throws SQLException {
        try (
                Connection con = ConnectionDB.getConnection(); PreparedStatement pstm = con.prepareStatement("select quantity from carts where user_id = ? and pid = ? ;");) {
            pstm.setInt(1, uid);
            pstm.setInt(2, pid);
            ResultSet rs = pstm.executeQuery();
            int oldQty = 0;
            while (rs.next()) {
                oldQty = rs.getInt(1);
            }
            return oldQty;
        }
    }

    @Override
    public boolean updateCart(int pid, int quatity) throws SQLException {
        try (
                Connection con = ConnectionDB.getConnection(); PreparedStatement pstm = con.prepareStatement("update carts set quantity = ? where pid  = ? ;");) {
            pstm.setInt(1, quatity);
            pstm.setInt(2, pid);
            return pstm.executeUpdate() > 0;
        }
    }

    public int countProduct(int uid) throws SQLException {
        try (
                Connection con = ConnectionDB.getConnection(); PreparedStatement pstm = con.prepareStatement("select user_id , SUM(quantity) from carts GROUP BY(user_id) having user_id = ?;");) {
            pstm.setInt(1, uid);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                return rs.getInt(2);
            }
            return 0;
        }
    }

    @Override
    public boolean addToCart(Cart cart) throws SQLException {
        try (
                Connection con = ConnectionDB.getConnection(); PreparedStatement pstm = con.prepareStatement("insert into carts values(?, ? , ? , ? , ? , ?);");) {
            pstm.setInt(1, cart.getUid());
            pstm.setInt(2, cart.getPid());
            pstm.setString(3, cart.getName());
            pstm.setDouble(4, cart.getPrice());
            pstm.setInt(5, cart.getQuantity());
            pstm.setString(6, cart.getImg());

            return pstm.executeUpdate() > 0;
        }
    }

    public boolean selectProductInWishList(int pid) throws SQLException {
        boolean isExisted = false;
        try (
                Connection con = ConnectionDB.getConnection(); PreparedStatement pstm = con.prepareStatement("select * from wishList where productCode = ?;");) {
            pstm.setInt(1, pid);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                return !isExisted;
            }
            return isExisted;
        }
    }

    @Override
    public boolean addToWishList(WishList w) throws SQLException {
        try (
                Connection con = ConnectionDB.getConnection(); PreparedStatement pstm = con.prepareStatement("insert into wishList values(?, ? , ? , ? ,  ?);");) {
            pstm.setInt(1, w.getUid());
            pstm.setInt(2, w.getPid());
            pstm.setString(3, w.getName());
            pstm.setDouble(4, w.getPrice());
            pstm.setString(5, w.getImg());
            return pstm.executeUpdate() > 0;
        }
    }

    @Override
    public boolean deleteProductCartByID(int pid, int uid) throws SQLException {
        try (
                Connection con = ConnectionDB.getConnection(); PreparedStatement pstm = con.prepareStatement("delete from carts where pid = ? and user_id = ?;");) {
            pstm.setInt(1, pid);
            pstm.setInt(2, uid);
            return pstm.executeUpdate() > 0;
        }
    }

    @Override
    public boolean deleteAllCart(int uid) throws SQLException {
        try (
                Connection con = ConnectionDB.getConnection(); PreparedStatement pstm = con.prepareStatement("delete from carts where user_id = ?;");) {
            pstm.setInt(1, uid);
            return pstm.executeUpdate() > 0;
        }
    }

    @Override
    public boolean deleteProductWishByID(int pid, int uid) throws SQLException {
        try (
                Connection con = ConnectionDB.getConnection(); PreparedStatement pstm = con.prepareStatement("delete from wishList where productCode = ? and customerId = ?;");) {
            pstm.setInt(1, pid);
            pstm.setInt(2, uid);
            return pstm.executeUpdate() > 0;
        }
    }

    @Override
    public boolean deleteAllWish(int uid) throws SQLException {
        try (
                Connection con = ConnectionDB.getConnection(); PreparedStatement pstm = con.prepareStatement("delete from wishList where customerId = ?;");) {
            pstm.setInt(1, uid);
            return pstm.executeUpdate() > 0;
        }
    }

    public boolean addPlaceOrder(User user, List<Cart> carts, String payMethod) throws SQLException {
        try (
                Connection con = ConnectionDB.getConnection(); 
                PreparedStatement pstm = con.prepareStatement("insert into orders (orderDate, customerId, payMethod)  values(GETDATE() , ? , ? );");) {
            pstm.setInt(1, user.getId());
            pstm.setString(2, payMethod);
            if (pstm.executeUpdate() > 0) {
                return addOrderDetails(carts, getOrderIDByOrderDate());
            }
            return false;
        }
    }

    public int getOrderIDByOrderDate() throws SQLException {
        try (
                Connection con = ConnectionDB.getConnection(); Statement pstm = con.createStatement();) {

            ResultSet rs = pstm.executeQuery("select id from orders where orderDate = CAST(GETDATE() AS DATE); ");
            int orderID = -1;
            while (rs.next()) {
                orderID = rs.getInt("id");
            }
            return orderID;
        }
    }

    public boolean addOrderDetails(List<Cart> carts, int oid) throws SQLException {
        boolean isAdded = false;
        try (
                Connection con = ConnectionDB.getConnection(); PreparedStatement pstm = con.prepareStatement("insert into orderdetails values(?, ? , ? , ? );");) {
            for (Cart cart : carts) {
                pstm.setInt(1, oid);
                pstm.setInt(2, cart.getPid());
                pstm.setInt(3, cart.getQuantity());
                pstm.setDouble(4, cart.getPrice());
                if (pstm.executeUpdate() > 0) {
                    isAdded = true;
                }
            }
            return isAdded;
        }
    }

}
