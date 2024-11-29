<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>Title</title>
    <style>
        body, html {
            height: 100%;
            margin: 0;
        }
    </style>
    <script>
        function redirectToRegister() {
            window.location.href = '/Register.jsp';
        }
    </script>
</head>
<body>
<div class="d-flex justify-content-center align-items-center h-100">
    <div class="col-4">
        <div class="card">
            <div class="card-header bg-dark text-white text-center">
                <strong>Login</strong>
            </div>
            <div class="card-body">
                <form action="/checkLogin" method="post">
                    <input type="text" name="phone" class="form-control" placeholder="Phone" required>
                    <input type="password" name="password" class="form-control my-2" placeholder="Password" required>
                    <div class="d-flex justify-content-between">
                        <!-- Register tugmasi -->
                        <button type="button" class="btn btn-dark" onclick="redirectToRegister()">Register</button>

                        <!-- OK tugmasi -->
                        <button type="submit" class="btn btn-dark">OK</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
