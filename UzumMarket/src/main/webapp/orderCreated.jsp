
<%@ page import="java.io.IOException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Tranzaksiya</title>
    <style>
        body, html {
            margin: 0;
            padding: 0;
            height: 100%;
            font-family: Arial, sans-serif;
        }

        .row {
            background-image: url("https://img.freepik.com/premium-vector/free-fast-delivery-service-by-yellow-truck-van-courier-delivers-food-order-by-auto-online-package-tracking_284092-918.jpg");
            background-size: cover;
            background-position: center;
            height: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
            position: relative;
        }

        .message {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            color: green;
            text-align: center;
            font-size: 28px;
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.7);
            z-index: 1;
        }

        .back-button {
            position: absolute;
            top: 20px;
            right: 20px;
            background-color: #0d6efd;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            color: #333;
            cursor: pointer;
            border-radius: 5px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            z-index: 2;
        }

        .back-button:hover {
            background-color: rgba(255, 255, 255, 1);
            color: #000;
        }
    </style>
</head>
<body>
<div class="row">
    <div class="message">Zakazingiz tez orada qo'lingizda bo'ladi...!</div>
    <a href="/main.jsp">
        <button class="back-button" onclick="window.location.href='index.jsp'">Yana zakaz qilaman</button>
    </a>
</div>
</body>
</html>
