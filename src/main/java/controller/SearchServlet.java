package controller;

import com.google.gson.Gson;
import dao.DishDao;
import jakarta.servlet.annotation.WebServlet;
import model.Dish;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.ServletException;
import java.io.IOException;
import java.util.List;

@WebServlet("/search")
public class SearchServlet extends HttpServlet {

    private DishDao dao = new DishDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String keyword = request.getParameter("keyword");
        if (keyword == null || keyword.trim().isEmpty()) {
            // có thể redirect về trang chủ hoặc báo lỗi
            response.sendRedirect(request.getContextPath() + "/");
            return;
        }

        List<Dish> dishList = dao.findDishes(keyword);
        request.setAttribute("dishes", dishList);
        request.setAttribute("keyword", keyword);
        request.getRequestDispatcher("/search.jsp").forward(request, response);
    }

}


