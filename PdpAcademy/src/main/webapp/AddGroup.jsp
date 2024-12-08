<%@ page import="uz.pdp.pdpacademy.Repo.ModuleRepo" %>
<%@ page import="uz.pdp.pdpacademy.Module" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 05.12.2024
  Time: 7:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Group</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
<%
    int moduleId = Integer.parseInt(request.getParameter("moduleId"));
%>

<div class="row">
    <div class="col-6 offset-3">
        <div class="card">
            <div class="card-header">Add Group</div>
            <div class="card-body">
                <form action="/addGroup" method="post">
                    <input type="text" class="form-control mb-2" placeholder="Group name" name="name">
                    <div class="text-end">
                        <button class="btn btn-success" name="moduleId" value="<%=moduleId%>">save</button>
                    </div>
                </form>
                <form action="/CMG.jsp" method="post">
                    <input type="hidden" name="name" value="Groups">
                    <button class="btn btn-primary" name="id" value="<%=moduleId%>">view</button>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
