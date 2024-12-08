package uz.pdp.pdpacademy.servlet;

import uz.pdp.pdpacademy.Course;
import uz.pdp.pdpacademy.Repo.CourseRepo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/addCourse")
public class AddCourseServlet extends HttpServlet {
    private final CourseRepo courseRepo = new CourseRepo();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String courseName = req.getParameter("name");
        Course course = new Course(courseName);
        courseRepo.save(course);
        resp.sendRedirect("/AddCourse.jsp");
    }

}
