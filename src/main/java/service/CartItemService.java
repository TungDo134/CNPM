package service;

import dao.CartItemDao;
import model.CartItem;

import java.util.List;

public class CartItemService {
    static CartItemDao cartItemDao = new CartItemDao();
    //Xử lý thêm món ăn
    //5.1.4 addCartItem(cartId, dishId, quantity)
    public void addCartItem(int cartId, String dishId, int quantity) {
        try{
            int id = Integer.parseInt(dishId);
            cartItemDao.addOrUpdateItem(cartId, id, quantity);
        }catch (NumberFormatException e){
            e.printStackTrace();
        }
    }
    //Lấy ra danh sách món ăn theo mã giỏ hàng
    //5.1.10 getCartItems(int cartId).
    public List<CartItem> getCartItems(int cartId) { return cartItemDao.getCartItems(cartId); }
    //tong so luong san pham trong gio hang
    public int getTotalQuantity(int cartId) {
        List<CartItem> items = getCartItems(cartId);
        int total = 0;
        for (CartItem item : items) {
            total += item.getQuantity();
        }
        return total;
    }

}
