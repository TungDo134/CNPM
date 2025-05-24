package model;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.Date;

public class Cart implements Serializable {
    private int id;
    private int userId;
    private LocalDate createAt;
    public Cart() {}
    public Cart(int id, int userId, LocalDate createAt) {
        this.id = id;
        this.userId = userId;
        this.createAt = createAt;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public LocalDate getCreateAt() {
        return createAt;
    }

    public void setCreateAt(LocalDate createAt) {
        this.createAt = createAt;
    }


    @Override
    public String toString() {
        return "Cart{" +
                "id=" + id +
                ", userId=" + userId +
                ", createAt=" + createAt +
                '}';
    }
}
