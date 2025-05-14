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
}
