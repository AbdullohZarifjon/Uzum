package uz.pdp.pdpacademy.servlet;

import jakarta.validation.ConstraintViolation;
import jakarta.validation.Validation;
import jakarta.validation.Validator;
import uz.pdp.pdpacademy.Groups;
import uz.pdp.pdpacademy.Repo.GroupRepo;
import uz.pdp.pdpacademy.Repo.RoleRepo;
import uz.pdp.pdpacademy.Repo.StudentRepo;
import uz.pdp.pdpacademy.Repo.StudentRoleRepo;
import uz.pdp.pdpacademy.Role;
import uz.pdp.pdpacademy.Student;
import uz.pdp.pdpacademy.StudentRole;
import uz.pdp.pdpacademy.enumClass.SMAORoles;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;
import java.util.Set;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private final StudentRepo studentRepo = new StudentRepo();
    private final RoleRepo roleRepo = new RoleRepo();
    private final StudentRoleRepo studentRoleRepo = new StudentRoleRepo();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        double payment = Double.parseDouble(Objects.requireNonNullElse(req.getParameter("payment"), "0"));
        String groupId = req.getParameter("groupId");
        System.out.println(name + " " + payment + " " + groupId);
        if (groupId == null || groupId.isEmpty()) {
            resp.sendRedirect("/Registration.jsp");
            return;
        }
        Groups group = GroupRepo.getGroupById(Integer.parseInt(groupId));
        Student student = new Student(name, payment, group);
        System.out.println(student);
        Map<String, String> errors = validateStudent(student);

        if (!errors.isEmpty()) {
            req.setAttribute("errors", errors);
            req.getRequestDispatcher("/Registration.jsp").forward(req, resp);
            return;
        }
        Role role = roleRepo.getRole(SMAORoles.STUDENT);
        StudentRole studentRole = new StudentRole(role, student);
        studentRoleRepo.save(studentRole);
        studentRepo.save(student);
    }

    public static Map<String, String> validateStudent(Student student) {
        Map<String, String> errors = new HashMap<>();
        Validator validator = Validation.buildDefaultValidatorFactory().getValidator();
        Set<ConstraintViolation<Student>> violations = validator.validate(student);
        for (ConstraintViolation<Student> violation : violations) {
            errors.put(violation.getPropertyPath().toString(), violation.getMessage());
        }
        return errors;
    }
}
