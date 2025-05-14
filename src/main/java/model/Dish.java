package model;

import java.sql.Date;

public class Dish {
    private int id;
    private int menuId;
    private String name;
    private String description;
    private double price;
    private String img;
    private Date createdAt;
    private Date updatedAt;
    private int available;

    // Constructor rỗng
    public Dish() {
    }

    // Constructor đầy đủ
    public Dish(int id, int menuId, String name, String description, double price, String img, Date createdAt, Date updatedAt, int available) {
        this.id = id;
        this.menuId = menuId;
        this.name = name;
        this.description = description;
        this.price = price;
        this.img = img;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.available = available;
    }

    // Getter và Setter
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getMenuId() {
        return menuId;
    }

    public void setMenuId(int menuId) {
        this.menuId = menuId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public Date getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Date updatedAt) {
        this.updatedAt = updatedAt;
    }

    public int getAvailable() {
        return available;
    }

    public void setAvailable(int available) {
        this.available = available;
    }

    @Override
    public String toString() {
        return "Dish{" +
                "id=" + id +
                ", menuId=" + menuId +
                ", name='" + name + '\'' +
                ", description='" + description + '\'' +
                ", price=" + price +
                ", img='" + img + '\'' +
                ", createdAt=" + createdAt +
                ", updatedAt=" + updatedAt +
                ", available=" + available +
                '}';
    }
}