<%@ page import="uz.pdp.pdpacademy.Groups" %>
<%@ page import="java.util.List" %>
<%@ page import="uz.pdp.pdpacademy.Repo.GroupRepo" %>
<%@ page import="uz.pdp.pdpacademy.Repo.BaseRepo" %>
<%@ page import="uz.pdp.pdpacademy.Student" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Objects" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <title>Registration</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f4f4f9;
      margin: 0;
      padding: 0;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }
    .registration-form {
      background: #fff;
      padding: 20px;
      border-radius: 8px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      width: 100%;
      max-width: 400px;
    }
    .registration-form h2 {
      margin-bottom: 20px;
      color: #333;
      text-align: center;
    }
    .form-group {
      margin-bottom: 15px;
    }
    .form-group input,
    .form-group select {
      width: 100%;
      padding: 10px;
      border: 1px solid #ddd;
      border-radius: 4px;
      font-size: 16px;
    }
    .form-group select {
      background-color: #fff;
    }
    .btn {
      display: block;
      width: 100%;
      padding: 10px;
      background-color: #007bff;
      color: #fff;
      border: none;
      border-radius: 4px;
      font-size: 16px;
      cursor: pointer;
    }
    .btn:hover {
      background-color: #0056b3;
    }
  </style>
</head>
<body>
  <%
    Map<String, String> errors = new HashMap<>();
    Object object = request.getAttribute("errors");
    if (object != null) {
      errors = (Map<String, String>) object;
    }
    GroupRepo groupRepo = new GroupRepo();
    List<Groups> groups = groupRepo.findAll();
  %>
<div class="registration-form">
  <h2>Registration</h2>
  <form action="../register" method="POST">
    <div class="form-group">
<%--      <label for="name">Name:</label>--%>
      <input type="text" id="name" name="name" placeholder="Enter your name">
      <span class="text-danger"><%=Objects.requireNonNullElse(errors.get("name"), "")%></span>
    </div>
    <div class="form-group">
<%--      <label for="payment">Payment (USD):</label>--%>
      <input type="text" id="payment" name="payment" placeholder="Enter payment amount">
    </div>
    <div class="form-group">
<%--      <label for="group">Select Group:</label>--%>
      <select id="group" name="groupId" required>
        <option selected disabled>--Select a Group--</option>
        <%
          for (Groups group : groups) {
        %>
             <option value="<%=group.getId()%>"><%=group.getName()%></option>
        <%
          }
        %>
      </select>
    </div>
    <button type="submit" class="btn">Register</button>
  </form>
</div>
</body>
</html>
