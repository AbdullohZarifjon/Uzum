package uz.pdp.uzummarket.service;

import uz.pdp.uzummarket.D_B.DB;
import uz.pdp.uzummarket.D_B.Status;
import uz.pdp.uzummarket.model.Basket;
import uz.pdp.uzummarket.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String phoneNumber = req.getParameter("phoneNumber");
        String password = req.getParameter("password");

        if (name != null && password != null && phoneNumber != null) {
            User user = new User(name, phoneNumber, password, Status.USER, new Basket());
            DB.users.add(user);
            req.getSession().setAttribute("user", user);
            resp.sendRedirect("/main.jsp");
        } else {
            resp.sendRedirect("/Register.jsp");
        }
    }
}
