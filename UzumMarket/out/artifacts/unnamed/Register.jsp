<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        body, html {
            height: 100%;
            margin: 0;
        }

        .container {
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .register-form {
            width: 100%;
            max-width: 400px;
            padding: 30px;
            border: 1px solid #ddd;
            border-radius: 8px;
            background-color: #f8f9fa;
        }

        .form-title {
            text-align: center;
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-control {
            border-radius: 5px;
            padding: 10px;
            font-size: 16px;
        }

        .form-footer {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .form-footer a {
            font-size: 14px;
        }

        .btn-primary {
            width: 100%;
            border-radius: 5px;
            padding: 10px;
            font-size: 16px;
        }

        .sign-in-link {
            font-size: 14px;
        }

    </style>
</head>
<body>

<div class="container">
    <div class="register-form">
        <div class="form-title">Register</div>
        <form action="/register" method="post">

            <div class="form-group">
                <label for="name">Name</label>
                <input type="text" id="name" name="name" class="form-control" required placeholder="Enter your name">
            </div>

            <div class="form-group">
                <label for="phoneNumber">Phone Number</label>
                <input type="text" id="phoneNumber" name="phoneNumber" class="form-control" required placeholder="Enter your phone number">
            </div>

            <!-- Password Input -->
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" class="form-control" required placeholder="Enter your password">
            </div>

            <div class="form-footer">
                <a href="/Login.jsp" class="sign-in-link">Sign In</a>
                <button type="submit" class="btn btn-primary">OK</button>
            </div>
        </form>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
