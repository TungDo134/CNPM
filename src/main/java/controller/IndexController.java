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
        // Truy vấn cơ sở dữ liệu
        DishService ds = new DishService();
        List<Dish> dishes = ds.getAll();
        request.setAttribute("dishes", dishes);

        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}