package service;

import dao.CartDao;
import model.Cart;

public class CartService {
    static CartDao cartDao = new CartDao();
    public Cart createCart() { return cartDao.createCart(); }
    //get id
    public int getId(){ return cartDao.getId(); }
}
