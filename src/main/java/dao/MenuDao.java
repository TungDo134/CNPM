package dao;

import context.JDBIContext;
import model.Dish;
import model.Menu;

import java.util.List;

public class MenuDao {
    // get all menu
    public List<Menu> getAllMenu() {
        return JDBIContext.getJdbi().withHandle(handle ->
                (handle.createQuery("select * from menu").mapToBean(Menu.class).list())
        );
    }

    public List<Dish> getAllDishByMenuID(int menuID) {
        return JDBIContext.getJdbi().withHandle(handle ->
                (handle.createQuery("select * from dishes where menuId=?")
                        .bind(0, menuID)
                        .mapToBean(Dish.class).list())
        );
    }

    // Cập nhật món ăn xuống csdl
    public boolean updateDish(Dish dish) {
        return JDBIContext.getJdbi().withHandle(handle -> {
            int updatedRows = handle.createUpdate("UPDATE dishes SET menuId = ?, name = ?, description = ?, price = ?, img = ?, available = ?, updatedAt = ? WHERE id = ?")
                    .bind(0, dish.getMenuId())
                    .bind(1, dish.getName())
                    .bind(2, dish.getDescription())
                    .bind(3, dish.getPrice())
                    .bind(4, dish.getImg())
                    .bind(5, dish.getAvailable())
                    .bind(6, dish.getUpdatedAt())
                    .bind(7, dish.getId())
                    .execute();


            return updatedRows > 0;
        });
    }

//    public static void main(String[] args) {
//        MenuDao dao = new MenuDao();
//        System.out.println(dao.getAllDishByMenuID(1));
//    }
}
