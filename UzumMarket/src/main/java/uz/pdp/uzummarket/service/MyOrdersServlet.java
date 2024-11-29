package uz.pdp.uzummarket.service;

import uz.pdp.uzummarket.D_B.DB;
import uz.pdp.uzummarket.D_B.Status;
import uz.pdp.uzummarket.model.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;
import java.util.Map;
import java.util.Objects;

@WebServlet("/myOrders")
public class MyOrdersServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Object object = Objects.requireNonNullElse(session.getAttribute("user"), new Basket());
        if (object instanceof Basket) {
            resp.sendRedirect("/Login.jsp");
            return;
        }
        User user = (User) session.getAttribute("user");

        Map<Product, Integer> map = user.getBasket().getBasket();

        Order order = new Order(user.getId(), Status.NEW, new Date());
        DB.orders.add(order);
        for (Product product: map.keySet()) {
            for (int i = 0; i < map.get(product); i++) {
                OrderItem orderItem = new OrderItem(order.getId(), product.getId(), product.getPrice());
                DB.orderItems.add(orderItem);
            }
        }
        order.setStatus(Status.COMPLETED);
        map.clear();
        session.setAttribute("user", user);
        resp.sendRedirect("/orderCreated.jsp");
    }

}
