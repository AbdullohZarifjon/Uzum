<%@ page import="java.util.List" %>
<%@ page import="uz.pdp.pdpacademy.Student" %>
<%@ page import="uz.pdp.pdpacademy.Repo.StudentRepo" %>
<%@ page import="org.hibernate.Session" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Students</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        .course-list {
            max-width: 800px;
            margin: 50px auto;
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 20px;
            background-color: white;
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
        HttpSession session1 = request.getSession();
        int groupId;
        if (session1.getAttribute("groupId") != null) {
            groupId = (Integer) session1.getAttribute("groupId");
        } else {
            groupId = Integer.parseInt(request.getParameter("groupId"));
        }
        List<Student> students = StudentRepo.getStudentsByGroupId(groupId);
    %>
    <div class="container course-list">
        <h2 class="text-center mb-4">Students</h2>
        <form action="/AddStudent.jsp" method="post">
            <button class="btn btn-primary" name="groupId" value="<%=groupId%>">Add student</button>
        </form>
            <a href="/aboutStudents.jsp" class="btn btn-primary">All Students</a>
        <%
            for (Student student : students) {
        %>
                <div class="course-item">
                    <span><%=student.getName()%></span>
                    <span><%=student.getPayment()%></span>
                    <form action="/addPayment" method="post">
                        <input type="hidden" name="groupId" value="<%=groupId%>">
                        <input type="hidden" name="studentId" value="<%=student.getId()%>">
                        <button class="btn btn-primary btn-module">Paid</button>
                    </form>
                </div>
        <%
            }
        %>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
