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
import java.util.ArrayList;
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
        List<CartItem> cart = null;
        int totalQuantity = 0;
        //có sp thi them hien thi sp trong gio
        if (cartId != null) {
            //Gọi phương thức lấy danh sách món ăn
           // 5.1.9 cartItemService.getCartItems(cartId)
            cart = cartItemService.getCartItems(cartId);
            totalQuantity = cartItemService.getTotalQuantity(cartId);
        }
        // Nếu cartId null hoặc không có item nào, gửi list rỗng
        if (cart == null) {
            cart = new ArrayList<>();
        }
        request.setAttribute("totalQuantity",totalQuantity);
        request.setAttribute("cart", cart);
        request.getRequestDispatcher("/cart.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}