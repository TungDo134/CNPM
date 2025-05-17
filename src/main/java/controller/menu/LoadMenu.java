package controller.menu;

import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;
import model.Menu;
import service.MenuService;

import java.io.IOException;
import java.util.List;

@WebServlet(value = "/menu/load-menu")
public class LoadMenu extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        MenuService menuService = new MenuService();
        List<Menu> menuList = menuService.getAllMenu();

        request.setAttribute("menuList", menuList);
        request.getRequestDispatcher("/pages/menu.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}