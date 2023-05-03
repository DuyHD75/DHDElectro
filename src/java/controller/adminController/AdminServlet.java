package controller.adminController;

import dao.adminDAO.AdminDAO;
import dao.ConnectionDB;
import entity.Admin;
import entity.Order;
import entity.Product;
import entity.User;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.*;

@WebServlet(name = "AdminServlet", urlPatterns = {"/admin"})
public class AdminServlet extends HttpServlet {

    private static HttpSession session;
    private AdminDAO adminDAO = new AdminDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "homePage":
                    showHomePage(request, response);
                    break;
                case "create_admin":
                    showCreateAdminForm(request, response);
                    break;
                case "update_admin":
                    showUpdateProfileForm(request, response);
                    break;
                case "viewAdmins":
                    viewAllAdmins(request, response);
                    break;
                case "delete_admin":
                    deleteAdmin(request, response);
                    break;
                case "viewUsers":
                    viewAllUsers(request, response);
                    break;
                case "delete_user":
                    deleteUser(request, response);
                    break;
                case "create_product":
                    viewAllProducts(request, response);
                    break;
                case "update_product":
                    showUpdateProduct(request, response);
                    break;
                case "viewOrders":
                    viewAllOrders(request, response);
                    break;
                case "delete_product":
                    deleteProduct(request, response);
                    break;
                case "delete_order":
                    deleteOrder(request, response);
                    break;
                case "logout":
                    handleLogOut(request, response);
                    break;
                default:
                    showLoginForm(request, response);
                    break;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        try {
            switch (action) {
                case "create_admin":
                    createAdmin(request, response);
                    break;
                case "update_admin":
                    upadteAdmin(request, response);
                    break;
                case "create_product":
                    createProduct(request, response);
                    break;
                case "update_product":
                    updateProduct(request, response);
                    break;
                case "viewOrders":
                    updateOrder(request, response);
                    break;

                default:
                    login(request, response);
                    break;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    // ============================== LOGIN ====================================
    public void showHomePage(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        if (session != null) {
            Map<String, Double> orderMap = adminDAO.getOrderByStatus();
            session.setAttribute("pendingTotal", orderMap.get("Pending"));
            session.setAttribute("compeleteTotal", orderMap.get("Completed"));
            session.setAttribute("totalOrders", adminDAO.getAllOrders().size());
            request.getRequestDispatcher("components/admin/adminHome.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("components/admin/adminLogin.jsp").forward(request, response);
        }

    }

    public void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        String username = request.getParameter("name");
        String password = request.getParameter("password");
        session = request.getSession();
        RequestDispatcher dispatcher = null;
        session.setAttribute("admin", adminDAO.getAdminByNameAndPass(username, password));

        Map<String, Double> orderMap = adminDAO.getOrderByStatus();
        session.setAttribute("pendingTotal", orderMap.get("Pending"));
        session.setAttribute("compeleteTotal", orderMap.get("Completed"));
        session.setAttribute("totalOrders", adminDAO.getAllOrders().size());

        if (session.getAttribute("admin") != null) {
            request.setAttribute("admin", session.getAttribute("admin"));
            request.getRequestDispatcher("components/admin/adminHome.jsp").forward(request, response);
        } else {
            request.setAttribute("message", "Login Failed, Try Again !");
            dispatcher = request.getRequestDispatcher("components/admin/adminLogin.jsp");
        }
        dispatcher.forward(request, response);
    }

    public void handleLogOut(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (session != null) {
//            session.removeAttribute("admin");
            session.invalidate();
        }
        request.getRequestDispatcher("components/admin/adminLogin.jsp").forward(request, response);
    }

    // ============================== LOGIN END ===================================
    // ============================== SHOW FORM  ==================================
    public void showLoginForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("components/admin/adminLogin.jsp");
        dispatcher.forward(request, response);
    }

    public void showUpdateProfileForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("admin", adminDAO.getAdminByID(id));
        RequestDispatcher dispatcher = request.getRequestDispatcher("components/admin/updateProfile.jsp");
        dispatcher.forward(request, response);
    }

    public void showCreateAdminForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("components/admin/adminRegister.jsp");
        dispatcher.forward(request, response);
    }

    // ============================== SHOW FORM  END ==================================
    // ============================== ADMIN ===========================================
    public void viewAllAdmins(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        List<Admin> admins = new ArrayList<>();
        admins = adminDAO.getAllAdmins();
        request.setAttribute("admins", admins);

        RequestDispatcher dispatcher = request.getRequestDispatcher("components/admin/adminAccount.jsp");
        dispatcher.forward(request, response);
    }

    public void createAdmin(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        String userName = request.getParameter("name");
        String password = request.getParameter("pass");
        String confirmPass = request.getParameter("cpass");

        RequestDispatcher dispatcher;
        if (password.equals(confirmPass)) {
            boolean isCreated = adminDAO.createAdmin(new Admin(userName, password));
            request.setAttribute("message", "Register New Admin Was Successfully !");
            dispatcher = request.getRequestDispatcher("components/admin/adminRegister.jsp");
        } else {
            request.setAttribute("message", "Confirm Passsword Not Matched !");
            dispatcher = request.getRequestDispatcher("components/admin/adminRegister.jsp");
        }

        dispatcher.forward(request, response);

    }

    public void upadteAdmin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("id"));

        String prePass = adminDAO.getAdminByID(id).getPassword();
        String name = request.getParameter("name");
        String oldPass = request.getParameter("old_pass");
        String newPass = request.getParameter("new_pass");
        String confirmPass = request.getParameter("confirm_pass");

        if (!prePass.equals(oldPass)) {
            request.setAttribute("error", "Old Password Did Not Match, Try Again !");
        } else if (!newPass.equals(confirmPass)) {
            request.setAttribute("error", "Confirm Password Did Not Match, Try Again !");
        } else {
            boolean isUpdated = adminDAO.updateAdmin(new Admin(id, name, newPass));
            request.setAttribute("message", "Profile Was Updated !");
        }
        request.getRequestDispatcher("components/admin/updateProfile.jsp").forward(request, response);
    }

    public void deleteAdmin(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));

        boolean isDeleted = adminDAO.deleteAdmin(id);

        if (isDeleted) {
            request.setAttribute("mesage", "Account Was Deleted !");
            request.setAttribute("admins", adminDAO.getAllAdmins());
        } else {
            request.setAttribute("mesage", "Delete Account Failed!");
        }
        request.getRequestDispatcher("components/admin/adminAccount.jsp").forward(request, response);

    }

    // ============================== ADMIN END ===========================================
    // ============================== USER =====================================
    public void viewAllUsers(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        List<User> users = new ArrayList<>();
        users = adminDAO.getAllUsers();

        request.setAttribute("users", users);
        RequestDispatcher dispatcher = request.getRequestDispatcher("components/admin/userAccounts.jsp");
        dispatcher.forward(request, response);

    }

    public void deleteUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        RequestDispatcher dispatcher;

        boolean isDeleted = adminDAO.deleteUser(id);
        if (isDeleted) {
            request.setAttribute("users", adminDAO.getAllUsers());
            request.setAttribute("message", "User Account Was Deleted !");
        } else {
            request.setAttribute("error", "Delete User account was failed , Try again !");
        }

        dispatcher = request.getRequestDispatcher("components/admin/userAccounts.jsp");
        dispatcher.forward(request, response);
    }

    //================= PRODUCTS ===============================
    public void viewAllProducts(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        request.setAttribute("products", adminDAO.getAllProducts());
        RequestDispatcher dispatcher = request.getRequestDispatcher("components/admin/productList.jsp");
        dispatcher.forward(request, response);
    }

    public void createProduct(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int adminId = Integer.parseInt(request.getParameter("adminId"));
        String category = request.getParameter("category");
        String name = request.getParameter("namePrd");
        String details = request.getParameter("details");
        double price = Double.parseDouble(request.getParameter("price"));
        String img1 = request.getParameter("image_01");
        String img2 = request.getParameter("image_02");
        String img3 = request.getParameter("image_03");

        Product p = new Product(adminId, category, name, details, price, img1, img2, img3);

        boolean isCreated = adminDAO.createProduct(p);
        if (isCreated) {
            request.setAttribute("message", "Product Was Created !");
        } else {
            request.setAttribute("error", "Create Product Failed , Try again !");
        }
        viewAllProducts(request, response);

    }

    public void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("pid"));

        RequestDispatcher dispatcher;
        boolean isDeleted = adminDAO.deleteProduct(id);

        if (isDeleted) {
            request.setAttribute("users", adminDAO.getAllUsers());
            request.setAttribute("message", "Product Was Deleted !");
        } else {
            request.setAttribute("error", "Delete Product Failed , Try again !");
        }
        viewAllProducts(request, response);
    }

    public void showUpdateProduct(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("pid"));
        Product product = adminDAO.getProductById(id);
        request.setAttribute("product", product);
        RequestDispatcher dispatcher = request.getRequestDispatcher("components/admin/updateProduct.jsp");
        dispatcher.forward(request, response);
    }

    public void updateProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int pid = Integer.parseInt(request.getParameter("pid"));
        int adminId = Integer.parseInt(request.getParameter("adminId"));
        String category = request.getParameter("category");
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String img1 = request.getParameter("image_01");
        String img2 = request.getParameter("image_02");
        String img3 = request.getParameter("image_03");
        String details = request.getParameter("details");

        Product product = new Product(pid, adminId, category, name, details, price, img1, img2, img3);

        RequestDispatcher dispatcher;
        boolean isUpdated = adminDAO.updateProduct(product);

        if (isUpdated) {
            request.setAttribute("message", "Product Was Updated !");
        } else {
            request.setAttribute("error", "Update Product Failed , Try again !");
        }
        dispatcher = request.getRequestDispatcher("components/admin/updateProduct.jsp");
        dispatcher.forward(request, response);
    }

    // ====================== ORDERS =========================
    public void viewAllOrders(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        List<Order> orders = adminDAO.getAllOrders();

//        response.getWriter().print(orders);
        request.setAttribute("orders", orders);
        RequestDispatcher dispatcher = request.getRequestDispatcher("components/admin/orderList.jsp");
        dispatcher.forward(request, response);
    }

    public void updateOrder(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        String status = request.getParameter("payment_status");
        String payMethod = request.getParameter("payMethod");
        User user = adminDAO.getUserByID(Integer.parseInt(request.getParameter("uid")));
        int orderId = Integer.parseInt(request.getParameter("order_id"));
        String orderDate = request.getParameter("order_date");

        boolean isUpdated = adminDAO.updateOrder(status, orderId);
        if (isUpdated) {
            request.setAttribute("message", "Order Was Updated !");
        } else {
            request.setAttribute("error", "Update Order Failed , Try again !");
        }

        viewAllOrders(request, response);
    }

    public void deleteOrder(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        RequestDispatcher dispatcher;
        boolean isDeleted = adminDAO.deleteOrder(id);

        if (isDeleted) {
            request.setAttribute("users", adminDAO.getAllOrders());
            request.setAttribute("message", "Order Was Deleted !");
        } else {
            request.setAttribute("error", "Delete Order Failed , Try again !");
        }
        viewAllOrders(request, response);
    }

}
