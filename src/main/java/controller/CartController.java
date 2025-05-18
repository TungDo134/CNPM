package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.CartItem;
import model.Dish;
import service.CartItemService;
import service.CartService;
import service.DishService;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "CartController", value = "/cart")
public class CartController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // lay cartId tu session
        HttpSession session = request.getSession();
        Integer cartId = (Integer) session.getAttribute("cartId");
        // hien thi danh sach mon an voi cartId lay tu session
        CartItemService cartItemService = new CartItemService();
        List<CartItem> cart = cartItemService.getCartItems(cartId);
        request.setAttribute("cart", cart);
        request.getRequestDispatcher("/cart.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}