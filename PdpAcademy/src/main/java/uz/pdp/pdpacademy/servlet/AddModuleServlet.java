package uz.pdp.pdpacademy.servlet;

import jakarta.persistence.EntityManager;
import uz.pdp.pdpacademy.Course;
import uz.pdp.pdpacademy.Module;
import uz.pdp.pdpacademy.MyListener;
import uz.pdp.pdpacademy.Repo.ModuleRepo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/addModule")
public class AddModuleServlet extends HttpServlet {
    private final ModuleRepo moduleRepo = new ModuleRepo();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try (EntityManager entityManager = MyListener.EMF.createEntityManager()) {
            String name = req.getParameter("name");
            int courseId = Integer.parseInt(req.getParameter("courseId"));
            Course course = entityManager.find(Course.class, courseId);
            Module module = new Module(
                    name,
                    course
            );
            moduleRepo.save(module);
            resp.sendRedirect("/AddModule.jsp");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
