<%@ page import="uz.pdp.pdpacademy.Course" %>
<%@ page import="uz.pdp.pdpacademy.Repo.CourseRepo" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 02.12.2024
  Time: 20:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>

    <%
        CourseRepo courseRepo = new CourseRepo();
        List<Course> courseList = courseRepo.findAll();
    %>
<div class="row">
    <div class="col-6 offset-3">
        <div class="card">
            <div class="card-header">Add Module</div>
            <div class="card-body">
                <form action="/addModule" method="post">
                    <input class="form-control mb-2" type="text" placeholder="Module" name="name">
                    <select name="courseId" class="form-select mb-2">
                        <option selected disabled>Select Course</option>
                    <%
                        for (Course course : courseList) {
                    %>
                        <option value="<%=course.getId()%>"><%=course.getName()%></option>
                    <%
                        }
                    %>
                    </select>
                    <div class="text-end">
                        <button type="submit" class="btn btn-success">save</button>
                    </div>
                </form>
                <a href="/CMG.jsp">
                    <button class="btn btn-primary">view</button>
                </a>
            </div>
        </div>
    </div>
</div>

</body>
</html>
