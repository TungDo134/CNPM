package dao;

import context.JDBIContext;
import model.Menu;

import java.util.List;

public class MenuDao {
    // get all menu
    public List<Menu> getAllMenu() {
        return JDBIContext.getJdbi().withHandle(handle ->
                (handle.createQuery("select * from menu").mapToBean(Menu.class).list())
        );
    }

//    public static void main(String[] args) {
//        MenuDao dao = new MenuDao();
//        System.out.println(dao.getAllMenu());
//    }
}
