<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 02.12.2024
  Time: 15:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>AddCourse</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

</head>
<body>
<div class="row">
    <div class="col-6 offset-3">
        <div class="card">
            <div class="card-header">Add Course</div>
            <div class="card-body">
                <form action="../addCourse" method="post">
                    <input class="form-control mb-2" type="text" placeholder="Course name" name="name">
                    <div class="text-end">
                        <button class="btn btn-success">save</button>
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
