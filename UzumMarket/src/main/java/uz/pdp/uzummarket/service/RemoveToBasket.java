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
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

@WebServlet("/remove")
public class RemoveToBasket extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String categoryName = req.getParameter("categoryName");
        int productId = Integer.parseInt(req.getParameter("productId"));
        Product product = DB.products.stream().filter(t -> t.getId() == productId).findFirst().get();
        System.out.println(product);
        HttpSession session = req.getSession();
        Object object = session.getAttribute("user");
        if (object instanceof Basket basket) {
            basket.getBasket().remove(product);
            session.setAttribute("user", basket);
            String redirectUrl = "/main.jsp?categoryName=" + URLEncoder.encode(categoryName, StandardCharsets.UTF_8);
            resp.sendRedirect(redirectUrl);
        } else if (object instanceof User user) {
            Basket basket = user.getBasket();
            basket.getBasket().remove(product);
            session.setAttribute("user", user);
            String redirectUrl = "/main.jsp?categoryName=" + URLEncoder.encode(categoryName, StandardCharsets.UTF_8);
            resp.sendRedirect(redirectUrl);
        }
    }
}
