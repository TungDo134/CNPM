package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Cart;
import model.Dish;
import service.CartItemService;
import service.CartService;
import service.DishService;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "AddCart", value = "/add-cart")
public class AddCart extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        // Lấy cartId từ session, nếu chưa có thì tạo mới
        Integer cartId = (Integer) session.getAttribute("cartId");
        if (cartId == null) {
            CartService cartService = new CartService();
            Cart newCart = cartService.createCart();
            cartId =  newCart.getId(); // Trả về cartId vừa tạo
            session.setAttribute("cartId", cartId);  // Lưu vào session
        }

        // Lấy dishId từ request
        String dishId = request.getParameter("dishId");

        // Lấy thông tin món ăn
        DishService dishService = new DishService();
        Dish dish = dishService.getById(dishId);

        if (dish != null) {
            double price = dish.getPrice();
            int quantity = 1;

            CartItemService cartItemService = new CartItemService();
            cartItemService.addCartItem(cartId, dishId, quantity, price * quantity);
        }

        response.sendRedirect(request.getContextPath() + "/index");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}