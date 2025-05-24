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
        // 20.2.2: Hệ thống tiếp nhận từ khóa tìm kiếm
        String keyword = request.getParameter("keyword");
        if (keyword == null || keyword.trim().isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/");
            return;
        }
        // 20.2.3: Hệ thống xử lý từ khóa và gọi findDishes()
        List<Dish> dishList = dao.findDishes(keyword); // 20.2.4: Truy vấn DB lấy danh sách sản phẩm
        request.setAttribute("dishes", dishList);
        request.setAttribute("keyword", keyword);
        // 20.2.5: Gửi về trang hiển thị kết quả
        request.getRequestDispatcher("/search.jsp").forward(request, response);
    }

}


