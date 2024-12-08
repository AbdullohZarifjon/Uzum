<%@ page import="uz.pdp.pdpacademy.Groups" %>
<%@ page import="java.util.List" %>
<%@ page import="uz.pdp.pdpacademy.Repo.GroupRepo" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Objects" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 07.12.2024
  Time: 10:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
    <%
//        Map<String, String> errors = new HashMap<>();
//        Object object = request.getAttribute("errors");
//        if (object != null) {
//            errors = (Map<String, String>) object;
//        }
        GroupRepo groupRepo = new GroupRepo();
        List<Groups> groupsList = groupRepo.findAll();
    %>
    <div class="row">
        <div class="col-6 offset-3">
            <div class="card">
                <div class="card-header">Login</div>
                <div class="card-body">
                    <form action="../login" method="post">
                        <input type="text" class="form-control mb-2" name="name" placeholder="Enter your name">
<%--                        <span class="text-danger"><%=Objects.requireNonNullElse(errors.get("name"), "")%></span>--%>
                        <select name="groupId" class="form-select mb-2">
                            <option selected disabled>Serect group</option>
                            <%
                                for (Groups groups : groupsList) {
                            %>
                                    <option value="<%=groups.getId()%>"><%=groups.getName()%></option>
                            <%
                                }
                            %>
                        </select>
                        <div class="text-end">
                            <button class="btn btn-primary">Ok</button>
                        </div>
                    </form>
                    <a href="/Registration.jsp" class="btn btn-success">Registration</a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
