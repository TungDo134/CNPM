package service;

import dao.MenuDao;
import model.Menu;

import java.util.List;

public class MenuService {
    public List<Menu> getAllMenu() {
        MenuDao dao = new MenuDao();
        return dao.getAllMenu();
    }
}
