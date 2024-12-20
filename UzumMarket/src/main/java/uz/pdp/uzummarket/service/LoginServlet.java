package uz.pdp.uzummarket.service;

import uz.pdp.uzummarket.D_B.DB;
import uz.pdp.uzummarket.model.Basket;
import uz.pdp.uzummarket.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Optional;

@WebServlet("/checkLogin")
public class LoginServlet extends HttpServlet {
    public static User currentUser;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String phoneNumber = req.getParameter("phone");
        String password = req.getParameter("password");
        Optional<User> first = DB.users.stream().filter(p -> p.getPhoneNumber().equals(phoneNumber)
                && p.getPassword().equals(password)).findFirst();

        if (first.isPresent()) {
            HttpSession session = req.getSession();
            currentUser = first.get();
            if (currentUser.getRole().toString().equalsIgnoreCase("admin")) {
                currentUser.setBasket(new Basket());
                session.setAttribute("user", currentUser);
                resp.sendRedirect("/addProduct.jsp");
            } else {
                Basket basket = (Basket) session.getAttribute("user");
                currentUser.setBasket(basket);
                session.setAttribute("user", currentUser);
                resp.sendRedirect("/main.jsp");
            }
        } else {
            resp.sendRedirect("/Login.jsp");
        }

    }

}
