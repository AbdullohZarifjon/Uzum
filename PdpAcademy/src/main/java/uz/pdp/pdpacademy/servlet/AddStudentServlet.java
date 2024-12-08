package uz.pdp.pdpacademy.servlet;

import jakarta.persistence.EntityManager;
import uz.pdp.pdpacademy.Groups;
import uz.pdp.pdpacademy.MyListener;
import uz.pdp.pdpacademy.Student;
import uz.pdp.pdpacademy.Repo.StudentRepo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/addStudent")
public class AddStudentServlet extends HttpServlet {
    private final StudentRepo studentRepo = new StudentRepo();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try (EntityManager entityManager = MyListener.EMF.createEntityManager()) {
            int groupId = Integer.parseInt(req.getParameter("groupId"));
            String name = req.getParameter("name");
            double grade = Double.parseDouble(req.getParameter("payment"));

            Groups groups = entityManager.find(Groups.class, groupId);
            Student student = new Student(name, grade, groups);
            studentRepo.save(student);
            resp.sendRedirect("/AddStudent.jsp?groupId=" + groupId);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
