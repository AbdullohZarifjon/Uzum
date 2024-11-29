package uz.pdp.uzummarket.D_B;

import uz.pdp.uzummarket.model.*;

import java.util.ArrayList;
import java.util.List;

public interface DB {

    List<User> users = new ArrayList<>(List.of(
            new User("Usmon", "123", "123", Status.USER, new Basket()),
            new User("Bahrom", "234", "234", Status.USER, new Basket()),
            new User("Mikhail", "345", "345", Status.USER, new Basket()),
            new User("Casha", "456", "456", Status.USER, new Basket()),
            new User("admin", "admin", "admin", Status.ADMIN, null)
    ));

    List<Category> categories = new ArrayList<>(List.of(
            new Category("Yeguliklar"),
            new Category("Ichguliklar"),
            new Category("Kiyguliklar")
    ));

    List<Product> products = new ArrayList<>(List.of(
            new Product("Olma", 20000, 1, "olma.jpg"),
            new Product("Uzum", 15000, 1, "uzum.jpg"),
            new Product("Shaftoli", 20000, 1, "shaft.jpg"),
            new Product("Ananas", 19999, 1, "Ananas.jpg"),
            new Product("Anjir", 34999, 1, "anjir.jpg"),
            new Product("Anor", 17999, 1, "anor.jpg"),
            new Product("Banan", 28999, 1, "banan.jpg"),
            new Product("Gilos", 18999, 1, "gilos.jpg"),
            new Product("18+", 9999, 2, "18+.jpg"),
            new Product("Chernogolovka", 9999, 2, "chernogolovka.jpg"),
            new Product("Shifokorlar kiyimi", 49999, 3, "doktorlar kiyimlari.jpg"),
            new Product("Flash", 8999, 2, "flash.jpg"),
            new Product("Maxsus erkaklar kiyimi", 69999, 3, "kiyimErkak.jpg"),
            new Product("Love is", 11999, 2, "love is nap.jpg"),
            new Product("Maxsus erkaklar qishgi kiyimi",149999, 3, "maxsus qishgi.jpg"),
            new Product("Milkis", 9999, 2, "milkis nap.jpg"),
            new Product("Moxito", 11999, 2, "moxito.jpg"),
            new Product("Nok", 19999, 1, "nok.jpg"),
            new Product("Pomidor", 23999, 1, "pomidor.jpg"),
            new Product("Prima taglik", 29999, 3, "Prima taglik.jpg"),
            new Product("Mol go'shti", 89999, 1, "qo'y go'shti.jpg"),
            new Product("Qulupnay", 22999, 1, "qulupnay.jpg"),
            new Product("Sabzi", 7999, 1, "sabzi.jpg"),
            new Product("Strobar", 3999, 1, "Strobar.jpg"),
            new Product("Tovuq go'shti", 29999, 1, "tovuq go'shti.jpeg"),
            new Product("YPX kiyim", 299, 3, "ypx kiyim.jpg")
    ));

    List<Order> orders = new ArrayList<>();
    List<OrderItem> orderItems = new ArrayList<>();

}
