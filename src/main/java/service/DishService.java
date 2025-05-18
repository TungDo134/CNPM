package service;

import dao.DishDao;
import model.Dish;

import java.util.List;

public class DishService {
    static DishDao dao = new DishDao();
    public List<Dish> getAll() { return dao.getAllDish(); }
    //get by id
    public Dish getById(String in) {
        try{
            int id = Integer.parseInt(in);
            return dao.getDishById(id);
        }catch (NumberFormatException e){
            return null;
        }
    }
}
