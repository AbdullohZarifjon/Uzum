package uz.pdp.pdpacademy.servlet;

import jakarta.persistence.EntityManager;
import uz.pdp.pdpacademy.Groups;
import uz.pdp.pdpacademy.Module;
import uz.pdp.pdpacademy.MyListener;
import uz.pdp.pdpacademy.Repo.GroupRepo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/addGroup")
public class AddGroupServlet extends HttpServlet {
    private final GroupRepo groupRepo = new GroupRepo();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try (EntityManager entityManager = MyListener.EMF.createEntityManager()) {
            String name = req.getParameter("name");
            int moduleId = Integer.parseInt(req.getParameter("moduleId"));
            Module module = entityManager.find(Module.class, moduleId);
            Groups groups = new Groups(name, module);
            groupRepo.save(groups);
            resp.sendRedirect("/AddGroup.jsp?moduleId=" + moduleId);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
