package service;

import dao.CartItemDao;
import model.CartItem;

import java.util.List;

public class CartItemService {
    static CartItemDao cartItemDao = new CartItemDao();
    public void addCartItem(int cartId, String dishId, int quantity, double totalAmount) {
        try{
            int id = Integer.parseInt(dishId);
            cartItemDao.addOrUpdateItem(cartId, id, quantity, totalAmount);
        }catch (NumberFormatException e){
            e.printStackTrace();
        }
    }
    public List<CartItem> getCartItems(int cartId) { return cartItemDao.getCartItems(cartId); }
}
