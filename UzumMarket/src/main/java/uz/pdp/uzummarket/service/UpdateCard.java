package uz.pdp.uzummarket.service;

import uz.pdp.uzummarket.D_B.DB;
import uz.pdp.uzummarket.model.Basket;
import uz.pdp.uzummarket.model.Product;
import uz.pdp.uzummarket.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

@WebServlet("/updateCard")
public class UpdateCard extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession sesion = req.getSession();
        Map<Product, Integer> map = new HashMap<>();
        if (sesion != null) {
            Object object = Objects.requireNonNullElse(sesion.getAttribute("user"), new Basket());
            if (object instanceof Basket basket) {
                map = basket.getBasket();
            } else if (object instanceof User user) {
                map = user.getBasket().getBasket();
            }
        }
        String action = req.getParameter("action");
        if (action != null) {
            if (action.startsWith("increase-")) {
                int productId = Integer.parseInt(action.split("-")[1]);
                Product product = DB.products.stream().filter(p -> p.getId() == productId).findFirst().orElse(null);
                if (product != null) {
                    int quantity = map.getOrDefault(product, 0);
                    map.put(product, quantity + 1);
                }
            } else if (action.startsWith("decrease-")) {
                int productId = Integer.parseInt(action.split("-")[1]);
                Product product = DB.products.stream().filter(p -> p.getId() == productId).findFirst().orElse(null);
                if (product != null) {
                    int quantity = map.getOrDefault(product, 0);
                    if (quantity > 0) {
                        map.put(product, quantity - 1);
                    }
                }
            }
        }
        resp.sendRedirect("/Savatcha.jsp");
    }
}
