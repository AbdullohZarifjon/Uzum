package uz.pdp.uzummarket.model;

import lombok.Data;
import uz.pdp.uzummarket.model.Product;

import java.util.HashMap;
import java.util.Map;

@Data
public class Basket {
    Map<Product, Integer> basket = new HashMap<>();
}
