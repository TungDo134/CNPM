package dao;

import context.JDBIContext;
import model.Dish;
import java.util.List;

public class DishDao {
    // get all dish
    public List<Dish> getAllDish() {
        return JDBIContext.getJdbi().withHandle(handle ->
                (handle.createQuery("select * from dishes").mapToBean(Dish.class).list())
        );
    }
    //get id
    public Dish getDishById(int id) {
        return JDBIContext.getJdbi().withHandle(handle ->handle.createQuery(
                        " select * from dishes where id= :id")
                .bind("id", id)
                .mapToBean(Dish.class)
                .findOne().orElse(null));
    }

    // 20.2.4: Tìm món ăn theo từ khóa
    public List<Dish> findDishes(String keyword) {
        System.out.println("==> [DishDao] Searching for keyword: " + keyword);
        return JDBIContext.getJdbi().withHandle(handle ->
                handle.createQuery("SELECT * FROM dishes WHERE name LIKE :keyword")
                        .bind("keyword", "%" + keyword + "%")
                        .mapToBean(Dish.class)
                        .list()
        );
    }
}
