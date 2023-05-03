package entity;

/**
 *
 * @author This PC
 */
public class User {

    private int id;
    private String name, password;
    private String address, email, phone;

    public User() {
    }

    public User(String name, String password, String address, String email, String phone) {
        super();
        this.name = name;
        this.password = password;
        this.address = address;
        this.email = email;
        this.phone = phone;
    }

    public User(int id, String name, String password, String address, String email, String phone) {
        super();
        this.id = id;
        this.name = name;
        this.password = password;
        this.address = address;
        this.email = email;
        this.phone = phone;
    }

    public User(int id, String name, String address, String email, String phone) {
        super();
        this.id = id;
        this.name = name;
        this.address = address;
        this.email = email;
        this.phone = phone;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    @Override
    public String toString() {
        return "User{" + "id=" + id + ", name=" + name + ", password=" + password + ", address=" + address + ", email=" + email + ", phone=" + phone + '}';
    }

}
