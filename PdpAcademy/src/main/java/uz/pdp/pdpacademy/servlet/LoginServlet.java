package uz.pdp.pdpacademy.servlet;

import jakarta.validation.ConstraintViolation;
import jakarta.validation.Validation;
import jakarta.validation.Validator;
import uz.pdp.pdpacademy.Groups;
import uz.pdp.pdpacademy.Repo.GroupRepo;
import uz.pdp.pdpacademy.Repo.StudentRepo;
import uz.pdp.pdpacademy.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.*;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private final StudentRepo studentRepo = new StudentRepo();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        int groupId = Integer.parseInt(Objects.requireNonNullElse(req.getParameter("groupId"), "0"));
        Student student = getStudentByNameByGroupId(name, groupId);

        if (student == null) {
            resp.sendRedirect("/Login.jsp");
            return;
        }
        HttpSession session = req.getSession();
        session.setAttribute("student", student);
        resp.sendRedirect("/CMG.jsp");
        return;
    }

    private Student getStudentByNameByGroupId(String name, int groupId) {
        return studentRepo.findAll().stream()
                .filter(s -> s.getName().equals(name) && s.getGroup().getId() == groupId)
                .findFirst().orElse(null);
    }
}
