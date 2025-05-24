package model;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.Date;

public class CartItem implements Serializable {
    private int id;
    private int cartId;
    private int dishId;
    private int quantity;
    private Date createdAt;
    private Date updatedAt;
    private Dish dish;
    public CartItem() {}
    public CartItem(int id, int cartId, int dishId, int quantity, Date createdAt, Date updatedAt, Dish dish) {
        this.id = id;
        this.cartId = cartId;
        this.dishId = dishId;
        this.quantity = quantity;
        this.dish = dish;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getDishId() {
        return dishId;
    }

    public void setDishId(int dishId) {
        this.dishId = dishId;
    }

    public int getCartId() {
        return cartId;
    }

    public void setCartId(int cartId) {
        this.cartId = cartId;
    }

    public Dish getDish() {
        return dish;
    }

    public void setDish(Dish dish) {
        this.dish = dish;
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

}
