package dao.userDAO;

import entity.Admin;
import entity.Cart;
import entity.Order;
import entity.Product;
import entity.User;
import entity.WishList;
import java.util.*;
import java.sql.*;

/**
 *
 * @author This PC
 */
public interface IUser {

    public User loginByEmailAndPass(String email, String pass) throws SQLException;

    public List<Product> getAllProducts() throws SQLException;

    public List<Product> getProductByCategory(String category) throws SQLException;

    // =============== HANDLE CARTS ===================
    public List<Cart> getCartByUID(int uid) throws SQLException;

    public boolean updateCart(int pid, int quantity) throws SQLException;

    public boolean addToCart(Cart cart) throws SQLException;
    
    public boolean deleteProductCartByID(int pid, int uid ) throws SQLException; 
    public boolean deleteAllCart( int uid ) throws SQLException; 
    // =============== WISHLIST ===================
    public List<WishList> getWishListByID(int uid) throws SQLException;

    public boolean addToWishList(WishList w) throws SQLException;

     public boolean deleteProductWishByID(int pid, int uid) throws SQLException;
     
     public boolean deleteAllWish(int uid) throws SQLException;
    // ============== HANDLE ORDER ======================
//    public List<Order> getOrderByUID(int uid) throws SQLException;
    
//    public boolean addPlaceOrder(int uid) throws SQLException;
    

    // ================= HANDLE USER ======================
    public boolean userRegister(User user) throws SQLException;

    public boolean updateUser(User user) throws SQLException;

}
