package model;

import java.io.Serializable;

public class CartItem implements Serializable {
    private int id;
    private int cartId;
    private int dishId;
    private int quantity;
    private double totalAmount;
    private Dish dish;
    public CartItem() {}
    public CartItem(int id, int cartId, int dishId, int quantity, double totalAmount, Dish dish) {
        this.id = id;
        this.cartId = cartId;
        this.dishId = dishId;
        this.quantity = quantity;
        this.totalAmount = totalAmount;
        this.dish = dish;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
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

    @Override
    public String toString() {
        return "CartItem{" +
                "id=" + id +
                ", cartId=" + cartId +
                ", dishId=" + dishId +
                ", quantity=" + quantity +
                ", totalAmount=" + totalAmount +
                ", dish=" + dish +
                '}';
    }
}
