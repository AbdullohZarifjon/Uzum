package uz.pdp.uzummarket.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Product {
    private int id = genId ++;
    private String name;
    private double price;
    private int categoryId;
    private String path;
    private static int genId = 1;

    public Product(String name, double price, int categoryId, String path) {
        this.name = name;
        this.price = price;
        this.categoryId = categoryId;
        this.path = path;
    }
}
