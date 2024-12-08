<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="uz.pdp.pdpacademy.Repo.CourseRepo" %>
<%@ page import="uz.pdp.pdpacademy.Course" %>
<%@ page import="uz.pdp.pdpacademy.Repo.ModuleRepo" %>
<%@ page import="jakarta.persistence.EntityManager" %>
<%@ page import="uz.pdp.pdpacademy.MyListener" %>
<%@ page import="uz.pdp.pdpacademy.Module" %>
<%@ page import="uz.pdp.pdpacademy.Repo.GroupRepo" %>
<%@ page import="java.util.Objects" %>
<%@ page import="uz.pdp.pdpacademy.Groups" %>
<html>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CMG</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .course-list {
            max-width: 800px;
            margin: 50px auto;
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 20px;
            background-color: #f9f9f9;
        }
        .course-item {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 10px 15px;
            border-bottom: 1px solid #ddd;
        }
        .course-item:last-child {
            border-bottom: none;
        }
        .btn-module {
            width: 150px;
            text-align: center;
        }
    </style>
</head>
<body>
    <%
        CourseRepo courseRepo = new CourseRepo();
        String name = request.getParameter("name");
        String idi = request.getParameter("id");
        String button = "";
        String path = "";
        if (name == null || idi == null) {
            name = "Course";
            idi = "0";
        }
        List<?> list;
        int id = Integer.parseInt(idi);
        if (name.equals("Course")) {
            list = courseRepo.findAll();
            path = "/AddCourse.jsp";
            button = "Module";
        } else if (name.equals("Module")) {
            list = ModuleRepo.getModulesByCourseId(id);
            button = "Groups";
            path = "/AddModule.jsp";
        } else if (name.equals("Groups")) {
            list = GroupRepo.getGroupByModuleId(id);
            button = "Students";
            path = "/AddGroup.jsp";
        } else {
            list = new ArrayList<>();
        }
    %>
<div class="container course-list">
    <h2 class="text-center mb-4"><%=name%> List</h2>
    <form action="<%=path%>">
        <input type="hidden" name="moduleId" value="<%=id%>">
        <button class="btn btn-primary">Add <%=name%></button>
    </form>
    <%
        for (Object object: list) {
            if (object instanceof Course) {
                Course course = (Course) object;
    %>
                <div class="course-item">
                    <span>Course: <%=course.getName()%></span>
                    <form action="/CMG.jsp" method="post">
                        <input type="hidden" name="name" value="<%=button%>">
                        <input type="hidden" name="id" value="<%=course.getId()%>">
                        <button class="btn btn-primary btn-module"><%=button%></button>
                    </form>
                </div>
        <%
            } else if (object instanceof Module) {
                Module module = (Module) object;
        %>
                <div class="course-item">
                    <span>Module: <%=module.getName()%></span>
                    <form action="CMG.jsp" method="post">
                        <input type="hidden" name="name" value="<%=button%>">
                        <input type="hidden" name="id" value="<%=module.getId()%>">
                        <button class="btn btn-primary btn-module"><%=button%></button>
                    </form>
                </div>
        <%
            } else {
                Groups groups = (Groups) object;
        %>
                <div class="course-item">
                    <span>Group: <%=groups.getName()%></span>
                    <form action="/Students.jsp" method="post">
                        <input type="hidden" name="groupId" value="<%=groups.getId()%>">
                        <button class="btn btn-primary btn-module"><%=button%></button>
                    </form>
                </div>
    <%
            }
        }
    %>

</div>
<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
