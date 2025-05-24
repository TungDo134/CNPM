package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Dish;
import service.DishService;

import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "IndexController", value = "/index")
public class IndexController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer cartId = (Integer) session.getAttribute("cartId");

        // Nếu chưa có cartId trong session, tạo mới cart
        if (cartId == null) {
            dao.CartDao cartDao = new dao.CartDao();
            model.Cart cart = cartDao.createCart();
            cartId = cart.getId();
            session.setAttribute("cartId", cartId);
        }

        int totalQuantity = 0;
        service.DishService ds = new service.DishService();
        List<model.Dish> dishes = ds.getAll();
        request.setAttribute("dishes", dishes);

        service.CartItemService cartItemService = new service.CartItemService();
        totalQuantity = cartItemService.getTotalQuantity(cartId);

        request.setAttribute("totalQuantity", totalQuantity);
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}