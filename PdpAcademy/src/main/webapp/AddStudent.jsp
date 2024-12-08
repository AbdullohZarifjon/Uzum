<%@ page import="uz.pdp.pdpacademy.Groups" %>
<%@ page import="uz.pdp.pdpacademy.Repo.GroupRepo" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 03.12.2024
  Time: 19:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Student</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
    <%
        String id = request.getParameter("groupId");
        int groupId = 0;
        if (id != null) {
            groupId = Integer.parseInt(id);
        }
    %>
<div class="row">
    <div class="col-6 offset-3">
        <div class="card">
            <div class="card-header">Add Student</div>
            <div class="card-body">
                <form action="/addStudent" method="post">
                    <input type="text" class="form-control mb-2" placeholder="name" name="name">
                    <input type="text" class="form-control mb-2" placeholder="payment" name="payment">
                    <div class="text-end">
                        <button class="btn btn-success" name="groupId" value="<%=groupId%>">save</button>
                    </div>
                </form>
                <form action="/Students.jsp">
                    <button class="btn btn-primary" name="groupId" value="<%=groupId%>">view</button>
                </form>
            </div>
        </div>
    </div>
</div>

</body>
</html>
