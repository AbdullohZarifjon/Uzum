package uz.pdp.uzummarket.filter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class Filter extends HttpFilter {
    List<String> openPage = new ArrayList<String>(List.of(
            "/index.jsp",
            "/main.jsp",
            "/Savatcha.jsp",
            "/royxatdanUt.jsp",
            "/Register.jsp",
            "/orderCreated.jsp",
            "/Login.jsp",
            "/getOrder.jsp",
            "/addProduct.jsp",
            "/addCategory.jsp",
            "/addProd",
            "/addToBasket",
            "/checkLogin",
            "/myOrders",
            "/register",
            "/remove",
            "/updateCard"));

    @Override
    protected void doFilter(HttpServletRequest req, HttpServletResponse res, FilterChain chain) throws IOException, ServletException {
        if (openPage.contains(req.getRequestURI())) {
            chain.doFilter(req, res);
        }
    }
}
