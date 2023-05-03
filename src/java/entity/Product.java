package entity;

public class Product {

    private int id, adminId;
    private String category, name, detail;
    private double price;
    private String img1, img2, img3;

    public Product() {
    }

    public Product(int adminId, String category, String name, String detail, double price, String img1, String img2, String img3) {
        super();
        this.adminId = adminId;
        this.name = name;
        this.detail = detail;
        this.price = price;
        this.img1 = img1;
        this.img2 = img2;
        this.img3 = img3;
    }

    public Product(int id, int adminId, String category, String name, String detail, double price, String img1, String img2, String img3) {
        super();
        this.id = id;
        this.category = category;
        this.adminId = adminId;
        this.name = name;
        this.detail = detail;
        this.price = price;
        this.img1 = img1;
        this.img2 = img2;
        this.img3 = img3;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getAdminId() {
        return adminId;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public void setAdminId(int adminId) {
        this.adminId = adminId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getImg1() {
        return img1;
    }

    public void setImg1(String img1) {
        this.img1 = img1;
    }

    public String getImg2() {
        return img2;
    }

    public void setImg2(String img2) {
        this.img2 = img2;
    }

    public String getImg3() {
        return img3;
    }

    public void setImg3(String img3) {
        this.img3 = img3;
    }

    @Override
    public String toString() {
        return "Product{" + "id=" + id + ", adminId=" + adminId + ", name=" + name + ", detail=" + detail + ", price=" + price + ", img1=" + img1 + ", img2=" + img2 + ", img3=" + img3 + '}';
    }

}
