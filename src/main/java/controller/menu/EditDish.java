package controller.menu;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;
import model.Dish;
import service.MenuService;
import java.io.IOException;
import java.util.Date;


@WebServlet(name = "edit-dish", value = "/edit-dish")
public class EditDish extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // 1.2.9 Lấy thông tin món ăn cần cập nhật từ FormData
        String dishId = request.getParameter("dishId");
        String dishMenuId = request.getParameter("dishMenuId");
        String dishName = request.getParameter("dishName");
        String dishDescription = request.getParameter("dishDescription");
        String dishPriceStr = request.getParameter("dishPrice");
        String dishImg = request.getParameter("dishImg");
        String dishAvailableStr = request.getParameter("dishAvailable");

        // 1.2.10 Parse and check data
        int id = Integer.parseInt(dishId);
        int menuId = Integer.parseInt(dishMenuId);
        int price = Integer.parseInt(dishPriceStr);

        if (dishAvailableStr != null) {
            dishAvailableStr = String.valueOf(1);
        } else {
            dishAvailableStr = String.valueOf(0);
        }
        Date updatedAt = new Date();

        // 1.2.11 Tạo và set thuộc tính cho đối tượng Dish
        Dish dish = new Dish();
        dish.setId(id);
        dish.setMenuId(menuId);
        dish.setName(dishName);
        dish.setDescription(dishDescription);
        dish.setPrice(price);
        dish.setImg(dishImg);
        dish.setAvailable(Integer.parseInt(dishAvailableStr));
        dish.setUpdatedAt(updatedAt);

        // 1.2.12 Gọi hàm cập nhật món ăn có tham số là món ăn cần cập nhật
        MenuService menuService = new MenuService();
        boolean isSuccess = menuService.updateDish(dish);

        JsonObject jsonObject = new JsonObject();
        // 1.3.2 Trả về JSON (isSuccess: True)
        // 1.3.5 Trả về JSON (isSuccess: False)
        jsonObject.addProperty("isSuccess", isSuccess);

        Gson gson = new Gson();
        String json = gson.toJson(jsonObject);
        response.getWriter().write(json);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}