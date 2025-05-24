package dao;

import context.JDBIContext;
import model.Cart;

import java.time.LocalDate;

public class CartDao {
    // Tạo giỏ hàng mới
    public Cart createCart() {
        return JDBIContext.getJdbi().withHandle(handle -> {
            LocalDate updatedAt = LocalDate.now();
            // Insert giỏ hàng mới và lấy id sinh ra
            int cartId = handle.createUpdate("INSERT INTO carts (userId, createdAt, updatedAt) VALUES (:userId, :createdAt, :updatedAt)")
                    .bind("userId", 1) // set la 1
                    .bind("createdAt", LocalDate.now())
                    .bind("updatedAt", updatedAt)
                    .executeAndReturnGeneratedKeys("id")
                    .mapTo(Integer.class)
                    .one();

            // Trả về đối tượng Cart
            Cart cart = new Cart();
            cart.setId(cartId);
            cart.setCreatedAt(LocalDate.now());

            return cart;
        });

    }
    //lay id cua gio hang
    public int getId(){
        return JDBIContext.getJdbi().withHandle(handle -> handle.createQuery(
                        " select id from carts")
                .mapTo(Integer.class)
                .findOne().orElse(null));
    }
    public static void main(String[] args){
        CartDao cartDao = new CartDao();
        System.out.println(cartDao.getId());
    }
}
