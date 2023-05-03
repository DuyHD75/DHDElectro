package controller.userController;

import dao.adminDAO.AdminDAO;
import dao.userDAO.UserDAO;
import entity.Cart;
import entity.Product;
import entity.User;
import entity.WishList;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "UserServlet", urlPatterns = {"/user"})
public class UserServlet extends HttpServlet {

    private UserDAO userDAO = new UserDAO();
    private static HttpSession session;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if (action == null) {
            action = "homePage";
        }

        try {
            switch (action) {
                case "homePage":
                    showHomePage(request, response);
                    break;
                case "register":
                    showRegisterForm(request, response);
                    break;
                case "updateProfile":
                    showUpdateProfileForm(request, response);
                    break;
                case "login":
                    showLoginForm(request, response);
                    break;
                case "viewWishList":
                    showWishList(request, response);
                    break;
                case "shop":
                    showShopPage(request, response);
                    break;
                case "search":
                    showSearchForm(request, response);
                    break;
                case "category":
                    showCategoryProductPage(request, response);
                    break;
                case "contact":
                    showContactPage(request, response);
                    break;
                case "orders":
                    showOrderPage(request, response);
                    break;
                case "viewCart":
                    showCartPage(request, response);
                    break;
                case "checkout":
                    showCheckOutPage(request, response);
                    break;
                case "about":
                    showAboutPage(request, response);
                    break;
                case "logout":
                    handleLogout(request, response);
                    break;
                case "quickView":
                    quickViewProduct(request, response);
                    break;
                default:
                    throw new AssertionError();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String buttonValue = request.getParameter("submit_btn");

        String action = request.getParameter("action");

        if (action == null) {
            action = "homePage";
        }

        try {
            switch (action) {
                case "homePage":
                    handleHomePageAction(request, response);
                    break;
                case "register":
                    handleUserRegister(request, response);
                    break;
                case "category":
                    handleCategory(request, response);
                    break;
                case "quickView":
                    handleQuickView(request, response);
                    break;
                case "shop":
                    handleShop(request, response);
                    break;
                case "login":
                    handleLogin(request, response);
                    break;
                case "viewCart":
                    handleViewCart(request, response);
                    break;
                case "viewWishList":
                    handleWishList(request, response);
                    break;
                case "checkout":
                    handleCheckOut(request, response);
                    break;
                case "search":
                    handleSearch(request, response);
                    break;
                case "updateProfile":
                    handleUpdateProfile(request, response);
                    break;
                case "contact":
                    handleContact(request, response);
                    break;
                default:
                    throw new AssertionError();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

// ======================= HANDLE DOPOST ===================================
    public void handleHomePageAction(HttpServletRequest request, HttpServletResponse response)
            throws IOException, SQLException, ServletException {
        String btnValue = request.getParameter("submit_btn");
        if (btnValue.equals("Add To WishList")) {
            handleAddToWishList(request, response);
        } else if (btnValue.equals("Add To Cart")) {
            handleAddToCart(request, response);
        }
        showHomePage(request, response);
    }

    public void handleShop(HttpServletRequest request, HttpServletResponse response)
            throws IOException, SQLException, ServletException {
        String btnValue = request.getParameter("submit_btn");
        if (btnValue.equals("Add To WishList")) {
            handleAddToWishList(request, response);
        } else if (btnValue.equals("Add To Cart")) {
            handleAddToCart(request, response);
        }
        showShopPage(request, response);
    }

    public void handleQuickView(HttpServletRequest request, HttpServletResponse response)
            throws IOException, SQLException, ServletException {
        String btnValue = request.getParameter("submit_btn");
        if (btnValue.equals("Add To WishList")) {
            handleAddToWishList(request, response);
        } else if (btnValue.equals("Add To Cart")) {
            handleAddToCart(request, response);
        }
        quickViewProduct(request, response);
    }

    public void handleCategory(HttpServletRequest request, HttpServletResponse response)
            throws IOException, SQLException, ServletException {
        String btnValue = request.getParameter("submit_btn");
        if (btnValue.equals("Add To WishList")) {
            handleAddToWishList(request, response);
        } else if (btnValue.equals("Add To Cart")) {
            handleAddToCart(request, response);
        }
        showCategoryProductPage(request, response);
    }

    public void handleCheckOut(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {

        int uid = Integer.parseInt(request.getParameter("uid"));
        String payMetthod = request.getParameter("method");

        User user = userDAO.getUserByID(uid);

        if (userDAO.addPlaceOrder(user, (List<Cart>) userDAO.getCartByUID(uid), payMetthod)) {
            handleDeleteAllCart(request, response);
            request.setAttribute("message", "Thank You For Your Payment ! Continue To Shoping Now ");
        } else {
            request.setAttribute("error", "Oops Something Wrong, Please Check Again Before Payment !");
        }
        showCheckOutPage(request, response);
    }

    public void handleContact(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("message", "Thank you for your feedback. We will get back to you as soon as possible");
        request.getRequestDispatcher("components/user/contactPage.jsp").forward(request, response);
    }

    public void handleSearch(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        String name = request.getParameter("search_box");
        String btnValue = request.getParameter("submit_btn");
        if (name != "") {
            request.setAttribute("products", userDAO.getProductBySearchKey(name));

        }
        if (btnValue != null) {
            if (btnValue.equals("Add To WishList")) {
                handleAddToWishList(request, response);
            } else if (btnValue.equals("Add To Cart")) {
                handleAddToCart(request, response);
            }
        }
        request.setAttribute("keySearch", name);
        request.getRequestDispatcher("components/user/searchPage.jsp").forward(request, response);
    }

    // ============================= HANDLE VIEW CART ==========================
    public void handleViewCart(HttpServletRequest request, HttpServletResponse response)
            throws IOException, SQLException, ServletException {
        int pid = Integer.parseInt(request.getParameter("pid"));
        int uid = Integer.parseInt(request.getParameter("uid"));
        String btnValue = request.getParameter("submit_btn");
        if (btnValue.equals("updatePrd")) {
            handleUpdateCart(request, response);
        } else if (btnValue.equals("delete")) {
            handleDeleteCart(request, response);
        }
        session.setAttribute("carts", userDAO.getCartByUID(uid));
        session.setAttribute("sumPrdInCart", userDAO.countProduct(uid));
        showCartPage(request, response);
    }

    public void handleDeleteCart(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int pid = Integer.parseInt(request.getParameter("pid"));
        int uid = Integer.parseInt(request.getParameter("uid"));

        if (userDAO.deleteProductCartByID(pid, uid)) {
            request.setAttribute("message", "Product Was Deleted !");
        }
    }

    public void handleDeleteAllCart(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int uid = Integer.parseInt(request.getParameter("uid"));

        if (userDAO.deleteAllCart(uid)) {
            request.setAttribute("message", "All Products In The Cart Have Been Removed !");
            session.setAttribute("carts", userDAO.getCartByUID(uid));
            session.setAttribute("sumPrdInCart", userDAO.countProduct(uid));
        }
    }

    public void handleUpdateCart(HttpServletRequest request, HttpServletResponse response)
            throws IOException, SQLException, ServletException {
        int qty = Integer.parseInt(request.getParameter("qty"));
        int uid = Integer.parseInt(request.getParameter("uid"));
        int pid = Integer.parseInt(request.getParameter("pid"));
        int cartID = Integer.parseInt(request.getParameter("cartId"));
        if (userDAO.updateCart(pid, qty)) {
            request.setAttribute("message", "Quanntiy Of Product Was Updated !");
        }
    }

    public void handleAddToCart(HttpServletRequest request, HttpServletResponse response)
            throws IOException, SQLException, ServletException {
        if (session != null && request.getParameter("uid") != null) {
            int uid = Integer.parseInt(request.getParameter("uid"));
            int pid = Integer.parseInt(request.getParameter("pid"));
            String name = request.getParameter("name");
            double price = Double.parseDouble(request.getParameter("price"));
            String img = request.getParameter("image");
            
            
            int quantity = Integer.parseInt(request.getParameter("qty"));

            int oldQuantity = userDAO.checkProductIsExistedInCart(pid, uid);

            if (oldQuantity > 0) {
                userDAO.updateCart(pid, quantity + oldQuantity);
            } else {
                userDAO.addToCart(new Cart(uid, pid, name, price, quantity, img));
            }
            session.setAttribute("carts", userDAO.getCartByUID(uid));
            session.setAttribute("sumPrdInCart", userDAO.countProduct(uid));
            request.setAttribute("message", "Product Added To Cart Successfully !");
        } else {
            request.setAttribute("error", "Please Login Or Register Your Account First!");
        }
    }

    // ====================== HANDLE WISHLIST ====================================
    public void handleWishList(HttpServletRequest request, HttpServletResponse response)
            throws IOException, SQLException, ServletException {
        int pid = Integer.parseInt(request.getParameter("pid"));
        int uid = Integer.parseInt(request.getParameter("uid"));

        String btnValue = request.getParameter("submit_btn");
        if (btnValue.equals("Add To Cart")) {
            handleAddToCart(request, response);
        } else if (btnValue.equals("delete")) {
            handleDeleteWishList(request, response);
        }
        session.setAttribute("wishs", userDAO.getCartByUID(uid));
        showWishList(request, response);
    }

    public void handleAddToWishList(HttpServletRequest request, HttpServletResponse response)
            throws IOException, SQLException, ServletException {
        if (session != null) {
            int uid = Integer.parseInt(request.getParameter("uid"));
            int pid = Integer.parseInt(request.getParameter("pid"));
            String name = request.getParameter("name");
            double price = Double.parseDouble(request.getParameter("price"));
            String img = request.getParameter("image");
            int quantity = Integer.parseInt(request.getParameter("qty"));

            if (userDAO.selectProductInWishList(pid)) {
                request.setAttribute("message", "Product Already Exists In WishList !");
            } else {
                userDAO.addToWishList(new WishList(uid, pid, name, price, img));
                request.setAttribute("message", "Product Was Added In The WishList");
            }
            session.setAttribute("wishs", userDAO.getWishListByID(uid));

        } else {
            request.setAttribute("error", "Please Login Or Register Your Account First!");
        }
    }

    public void handleDeleteWishList(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int pid = Integer.parseInt(request.getParameter("pid"));
        int uid = Integer.parseInt(request.getParameter("uid"));

        if (userDAO.deleteProductWishByID(pid, uid)) {

            request.setAttribute("message", "Product Was Deleted !");
        }
    }

    public void handleDeleteAllWishList(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int uid = Integer.parseInt(request.getParameter("uid"));

        if (userDAO.deleteAllWish(uid)) {
            request.setAttribute("message", "All Products In The WishList Have Been Removed !");
            session.setAttribute("wishs", userDAO.getWishListByID(uid));
            request.getRequestDispatcher("components/user/wishList.jsp").forward(request, response);
        }
    }

    // ========================== HANDLE DOGET =================================
    public void showHomePage(HttpServletRequest request, HttpServletResponse response)
            throws IOException, SQLException, ServletException {
        request.setAttribute("products", userDAO.getAllProducts());
        RequestDispatcher dispatcher = request.getRequestDispatcher("components/user/userHome.jsp");
        dispatcher.forward(request, response);
    }

    public void quickViewProduct(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("pid"));
        Product product = userDAO.getProductById(id);
        String category = product.getCategory();
        request.setAttribute("samplePrd", userDAO.getProductByCategory(category));
        request.setAttribute("product", product);
        request.getRequestDispatcher("components/user/quickView.jsp").forward(request, response);
    }

    public void showAboutPage(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        request.getRequestDispatcher("components/user/userAbout.jsp").forward(request, response);
    }

    public void showContactPage(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String uid = request.getParameter("uid");
        if (uid != "") {
            int id = Integer.parseInt(uid);
            User user = userDAO.getUserByID(id);
            request.setAttribute("name", user.getName());
            request.setAttribute("email", user.getEmail());
            request.setAttribute("phone", user.getPhone());
        } else {
            request.setAttribute("message", "Please Login or register First !");
        }
        request.getRequestDispatcher("components/user/contactPage.jsp").forward(request, response);
    }

    public void showRegisterForm(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        request.getRequestDispatcher("components/user/userRegister.jsp").forward(request, response);
    }

    public void showUpdateProfileForm(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        request.getRequestDispatcher("components/user/updateUser.jsp").forward(request, response);
    }

    public void showLoginForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        request.getRequestDispatcher("components/user/userLogin.jsp").forward(request, response);
    }

    public void showWishList(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        String uid = request.getParameter("uid");
        if (uid == "") {
            request.setAttribute("error", "Login Now To See Wish List!");
            request.getRequestDispatcher("components/user/wishList.jsp").forward(request, response);
        } else {
            if (request.getParameter("delAll") != null) {
                handleDeleteAllWishList(request, response);
            } else {
                session.setAttribute("wishs", userDAO.getWishListByID(Integer.parseInt(uid)));
                request.getRequestDispatcher("components/user/wishList.jsp").forward(request, response);
            }
        }
    }

    public void showShopPage(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        request.setAttribute("products", userDAO.getAllProducts());
        request.getRequestDispatcher("components/user/shops.jsp").forward(request, response);
    }

    public void showCategoryProductPage(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String category = request.getParameter("category");
        request.setAttribute("products", userDAO.getProductByCategory(category));
        request.getRequestDispatcher("components/user/category.jsp").forward(request, response);
    }

    public void showSearchForm(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        request.getRequestDispatcher("components/user/searchPage.jsp").forward(request, response);
    }

    public void showOrderPage(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String uid = request.getParameter("uid");
        if (uid == "") {
            request.setAttribute("error", "Please Login Or Register Account First !");
            request.getRequestDispatcher("components/user/orders.jsp").forward(request, response);
        } else {

            request.setAttribute("orders",
                    userDAO.getOrderOfUser(userDAO.getUserByID(Integer.parseInt(uid)))
            );

            request.getRequestDispatcher("components/user/orders.jsp").forward(request, response);
        }
    }

    public void showCheckOutPage(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String uid = request.getParameter("uid");
        if (uid == "") {
            request.setAttribute("error", "Login Now To See You CheckOut!");
            request.getRequestDispatcher("components/user/cartList.jsp").forward(request, response);
        } else {
            request.setAttribute("carts", userDAO.getCartByUID(Integer.parseInt(uid)));
            request.getRequestDispatcher("components/user/checkout.jsp").forward(request, response);
        }
    }

    public void showCartPage(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String uid = request.getParameter("uid");
        if (uid == "") {
            request.setAttribute("error", "Login Now To See Cart!");
            request.getRequestDispatcher("components/user/cartList.jsp").forward(request, response);
        } else {
            if (request.getParameter("delAll") != null) {
                handleDeleteAllCart(request, response);
            } else {
                request.setAttribute("carts", userDAO.getCartByUID(Integer.parseInt(uid)));
            }
            request.getRequestDispatcher("components/user/cartList.jsp").forward(request, response);

        }
    }

    public void viewAllProducts(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        request.setAttribute("products", userDAO.getAllProducts());
        RequestDispatcher dispatcher = request.getRequestDispatcher("components/user/userHome.jsp");
        dispatcher.forward(request, response);
    }

    public void addToCart(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        request.setAttribute("products", userDAO.getAllProducts());
        RequestDispatcher dispatcher = request.getRequestDispatcher("components/user/userHome.jsp");
        dispatcher.forward(request, response);
    }

//    ============================== HANDLE USER ACCOUNT ====================================
    public void handleLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        String email = request.getParameter("email");
        String pass = request.getParameter("pass");
        User user = userDAO.loginByEmailAndPass(email, pass);
        session = request.getSession();

        if (user != null) {
            session.setAttribute("user", user);
            session.setAttribute("sumPrdInCart", userDAO.countProduct(user.getId()));
            session.setAttribute("wishs", userDAO.getWishListByID(user.getId()));
            request.setAttribute("products", userDAO.getAllProducts());

            request.setAttribute("message", "Logged In Successfully, Shopping Now !");
            request.getRequestDispatcher("components/user/userHome.jsp").forward(request, response);
        } else {
            request.setAttribute("error", "Login Failed, Email or Password Invalid, Try Again !");
            request.getRequestDispatcher("components/user/userLogin.jsp").forward(request, response);
        }
    }

    public void handleLogout(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        if (session != null) {
            session.invalidate();
        }
        showHomePage(request, response);
    }

    public void handleUserRegister(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String password = request.getParameter("pass");
        String confirmPass = request.getParameter("cpass");

        RequestDispatcher dispatcher;
        boolean isCreated;

        if (password.equals(confirmPass)) {
            isCreated = userDAO.userRegister(new User(name, confirmPass, address, email, phone));
            if (isCreated) {
                request.setAttribute("message", "User Account Registration Successful !");
                dispatcher = request.getRequestDispatcher("components/user/userRegister.jsp");
            } else {
                request.setAttribute("error", "Email Already Existed, Try again !");
                dispatcher = request.getRequestDispatcher("components/user/userRegister.jsp");
            }
        } else {
            request.setAttribute("error", "Confirmation Password Does Not Match !");
            dispatcher = request.getRequestDispatcher("components/user/userRegister.jsp");
        }
        dispatcher.forward(request, response);

    }

    public void handleUpdateProfile(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        int uid = Integer.parseInt(request.getParameter("uid"));
        String prePass = request.getParameter("prev_pass");
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String oldPass = request.getParameter("old_pass");
        String newPass = request.getParameter("new_pass");
        String confirmPass = request.getParameter("cpass");

        RequestDispatcher dispatcher;
        if (!prePass.equals(oldPass)) {
            request.setAttribute("error", "Old Password Invalid , Try again!");
        } else if (!newPass.equals(confirmPass)) {
            request.setAttribute("error", "Confirmation Password Does Not Match !");
        } else {
            User user = new User(uid, name, confirmPass, address, email, phone);
            userDAO.updateUser(user);
            request.setAttribute("user", user);
            request.setAttribute("message", "Profile Was Updated !");
        }
        dispatcher = request.getRequestDispatcher("components/user/userRegister.jsp");
        dispatcher.forward(request, response);
    }

}
