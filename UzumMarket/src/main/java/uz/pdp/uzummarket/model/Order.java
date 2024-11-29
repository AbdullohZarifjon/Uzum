package uz.pdp.uzummarket.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import uz.pdp.uzummarket.D_B.Status;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Order {
    private int id = genId ++;
    private int userId;
    private Status status;
    private Date date;
    private static int genId = 0;

    public Order(int userId, Status status, Date date) {
        this.userId = userId;
        this.status = status;
        this.date = date;
    }
}
