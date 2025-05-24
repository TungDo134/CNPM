package controller;

import com.google.gson.Gson;
import dao.DishDao;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Dish;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/search-suggest")
public class SearchSuggestServlet extends HttpServlet {
    private DishDao dao;

    @Override
    public void init() {
        dao = new DishDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        String keyword = request.getParameter("keyword");
        List<Dish> results = dao.findDishes(keyword);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        PrintWriter out = response.getWriter();
        Gson gson = new Gson();
        out.print(gson.toJson(results));
        out.flush();
    }
}
