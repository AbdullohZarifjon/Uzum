package uz.pdp.uzummarket.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Category {
    private int id = genId ++;
    private String name;
    private static int genId = 1;

    public Category(String name) {
        this.name = name;
    }
}
