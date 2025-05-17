package controller.menu;

import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;
import model.Dish;
import model.Menu;
import service.MenuService;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "getDishByMenu", value = "/get-dishes")
public class GetDishes extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String menuID = request.getParameter("menuID");

        MenuService menuService = new MenuService();
        List<Dish> list_dishes = menuService.getAllDishByMenuID(Integer.parseInt(menuID));
        List<Menu> menuList = menuService.getAllMenu();

        request.setAttribute("menuList", menuList);
        request.setAttribute("dishes", list_dishes);
        request.getRequestDispatcher("/pages/menu.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}