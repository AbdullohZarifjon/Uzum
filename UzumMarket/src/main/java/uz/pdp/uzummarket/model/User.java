package uz.pdp.uzummarket.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import uz.pdp.uzummarket.D_B.Status;
import uz.pdp.uzummarket.model.Basket;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class User {
    private int id = genId ++;
    private String name;
    private String phoneNumber;
    private String password;
    private Status role;
    private Basket basket;
    private static int genId = 1;

    public User(String name, String phoneNumber, String password, Status role, Basket basket) {
        this.name = name;
        this.phoneNumber = phoneNumber;
        this.password = password;
        this.role = role;
        this.basket = basket;
    }

}
