<%@ page import="uz.pdp.pdpacademy.Student" %>
<%@ page import="java.util.List" %>
<%@ page import="uz.pdp.pdpacademy.Repo.StudentRepo" %>
<%@ page import="uz.pdp.pdpacademy.Groups" %>
<%@ page import="uz.pdp.pdpacademy.Repo.GroupRepo" %>
<%@ page import="uz.pdp.pdpacademy.Repo.ModuleRepo" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 04.12.2024
  Time: 12:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>All Students</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <%
        String raqam = request.getParameter("page");
        int id = 0;
        if (raqam != null) {
            id = Integer.parseInt(raqam);
        }
        List<Student> studentList = StudentRepo.getStudents(id);
    %>

    <table class="table">
        <tr>
            <th>Course</th>
            <th>Module</th>
            <th>Group</th>
            <th>Name</th>
            <th>Payment</th>
        </tr>
        <%
            for (Student student: studentList) {
        %>
                <tr>
                    <td><%=student.getGroup().getModule().getCourse().getName()%></td>
                    <td><%=student.getGroup().getModule().getName()%></td>
                    <td><%=student.getGroup().getName()%></td>
                    <td><%=student.getName()%></td>
                    <td><%=student.getPayment()%></td>
                </tr>
        <%
            }
        %>
    </table>
    <%
        int countAllStudents = StudentRepo.countStudents();
        double countStudents = (Math.ceil(countAllStudents/10.0));
        for (int i = 0; i < countStudents; i ++) {
    %>
            <a href="?page=<%=i+1%>" style="margin-left: 2px" class="btn btn-primary"><%=i + 1%></a>
    <%
        }
    %>
</body>
</html>
