package dao;

import context.JDBIContext;
import model.CartItem;
import model.Dish;

import java.util.List;

public class CartItemDao {
    //them mon an vao gio hang
    public void addOrUpdateItem(int cartId, int dishId, int quantity, double totalAmount) {
        JDBIContext.getJdbi().useHandle(handle -> {
            // Kiểm tra xem sản phẩm đã có trong giỏ hàng chưa
            String checkSql = "SELECT quantity FROM cart_items WHERE cartId= :cartId AND dishId= :dishId";
            Integer existingQty = handle.createQuery(checkSql)
                    .bind("cartId", cartId)
                    .bind("dishId", dishId)
                    .mapTo(Integer.class)
                    .findOne()
                    .orElse(null);

            if (existingQty != null) {
                // Đã có: cập nhật số lượng
                handle.createUpdate("UPDATE cart_items SET quantity = :newQty, totalAmount = :totalAmount WHERE cartId = :cartId AND dishId = :dishId")
                        .bind("newQty", existingQty + quantity)
                        .bind("totalAmount", totalAmount)
                        .bind("cartId", cartId)
                        .bind("dishId", dishId)
                        .execute();
            } else {
                // Chưa có: thêm mới
                handle.createUpdate("INSERT INTO cart_items (cartId, dishId, quantity, totalAmount) VALUES (:cartId, :dishId, :quantity, :totalAmount)")
                        .bind("cartId", cartId)
                        .bind("dishId", dishId)
                        .bind("quantity", quantity)
                        .bind("totalAmount", totalAmount)
                        .execute();
            }
        });
    }
    //hien thi danh sach mon an voi cartId tuong ung
    public List<CartItem> getCartItems(int cartId) {
        return JDBIContext.getJdbi().withHandle(handle ->
                handle.createQuery(
                                "SELECT ci.id AS cartItemId, ci.cartId, ci.dishId, d.name, ci.totalAmount, ci.quantity, d.price, d.img," +
                                        " d.id AS dish, d.menuId, d.description, d.createdAt, d.updatedAt, d.available " +
                                        "FROM cart_items ci " +
                                        "JOIN dishes d ON ci.dishId = d.id " +
                                        "WHERE ci.cartId = :cartId")
                        .bind("cartId", cartId) // gán giá trị tham số :cartId
                        .map((rs, ctx) -> new CartItem(
                                rs.getInt("cartItemId"),
                                rs.getInt("cartId"),
                                rs.getInt("dishId"),
                                rs.getInt("quantity"),
                                rs.getDouble("totalAmount"),
                                new Dish(
                                        rs.getInt("dish"),
                                        rs.getInt("menuId"),
                                        rs.getString("name"),
                                        rs.getString("description"),
                                        rs.getDouble("price"),
                                        rs.getString("img"),
                                        rs.getDate("createdAt"),
                                        rs.getDate("updatedAt"),
                                        rs.getInt("available")
                                )))
                        .list() // thu kết quả thành List<CartItem>
        );
    }
    public static void main(String[] args){
        CartItemDao dao = new CartItemDao();
        dao.addOrUpdateItem(1, 2, 1, 20000);
        for(CartItem ci : dao.getCartItems(1)){
            System.out.println(ci);
        }
    }

}
