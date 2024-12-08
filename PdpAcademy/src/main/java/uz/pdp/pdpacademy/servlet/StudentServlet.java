package uz.pdp.pdpacademy.servlet;

import jakarta.persistence.EntityManager;
import uz.pdp.pdpacademy.MyListener;
import uz.pdp.pdpacademy.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Random;

@WebServlet("/addPayment")
public class StudentServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try (EntityManager entityManager = MyListener.EMF.createEntityManager()) {
            int groupId = Integer.parseInt(req.getParameter("groupId"));
            int studentId = Integer.parseInt(req.getParameter("studentId"));
            entityManager.getTransaction().begin();
            Student student = entityManager.find(Student.class, studentId);
            Random random = new Random();
            student.setPayment(student.getPayment() + random.nextInt(100));
            entityManager.getTransaction().commit();
            req.getSession().setAttribute("groupId", groupId);
            resp.sendRedirect("/Students.jsp");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
