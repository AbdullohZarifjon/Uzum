package uz.pdp.uzummarket.service;



import uz.pdp.uzummarket.D_B.DB;
import uz.pdp.uzummarket.model.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;

@MultipartConfig
@WebServlet("/addProd")
public class AddProduct extends HttpServlet {
  private static final String absolutePath = "D:\\IdeaProjects\\teleportAB\\src\\main\\webapp\\images\\";

    private String message;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String price = req.getParameter("price");
        String categoryId = req.getParameter("categoryId");
        Part part = req.getPart("productPhoto");

        if (name != null && price != null && categoryId != null && part != null) {
            Files.createDirectories(Path.of(absolutePath));

            String fileName = name + ".jpg";
            Path path = Path.of(absolutePath, fileName);
            System.out.println(path);
            try (InputStream input = part.getInputStream()) {
                Files.write(path, input.readAllBytes());
            }


            Product product = new Product(name, Double.parseDouble(price), Integer.parseInt(categoryId), fileName);
            DB.products.add(product);

            resp.sendRedirect("/addProduct.jsp");
        }
    }
}