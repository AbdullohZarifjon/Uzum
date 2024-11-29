package uz.pdp.uzummarket.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderItem {
    private int id = genId ++;
    private int orderId;
    private int productId;
    private double price;
    private static int genId = 0;

    public OrderItem(int orderId, int productId, double price) {
        this.orderId = orderId;
        this.productId = productId;
        this.price = price;
    }
}
