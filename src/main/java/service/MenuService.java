package service;

import dao.MenuDao;
import model.Dish;
import model.Menu;

import java.util.List;

public class MenuService {
    // Lấy tất cả menu từ csdl
    public List<Menu> getAllMenu() {
        MenuDao dao = new MenuDao();
        return dao.getAllMenu();
    }

    // Lấy tất cả món của menu đó dựa vào id menu
    public List<Dish> getAllDishByMenuID(int menuID) {
        MenuDao dao = new MenuDao();
        return dao.getAllDishByMenuID(menuID);
    }

    // 9.1.2.7 Hàm cập nhật món ăn
    public boolean updateDish(Dish dish) {
        MenuDao dao = new MenuDao();

        // 9.1.3.1 return true (có ít nhất một dòng được cập nhật)
        // 9.1.3.4 return false (nếu không có dòng nào được cập nhật)
        return dao.updateDish(dish);
    }

}
