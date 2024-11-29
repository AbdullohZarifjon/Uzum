<%@ page import="uz.pdp.uzummarket.model.User" %>
<%@ page import="uz.pdp.uzummarket.model.Order" %>
<%@ page import="java.util.List" %>
<%@ page import="uz.pdp.uzummarket.D_B.DB" %>
<!-- Order klassini import qiling -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Buyurtmalar</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .order-card {
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 20px;
            background-color: #f8f9fa;
        }

        .order-header {
            font-size: 1.5rem;
            font-weight: bold;
        }

        .order-details {
            margin-top: 10px;
            font-size: 1rem;
            color: #555;
        }

        .order-button {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 1rem;
            border-radius: 5px;
            cursor: pointer;
        }

        .order-button:hover {
            background-color: #0056b3;
        }

        .order-modal .modal-content {
            padding: 20px;
        }
    </style>
</head>
<body>

<div class="container my-5">
    <h1 class="text-center mb-5">Buyurtmalar</h1>

    <%
        HttpSession session1 = request.getSession();
        User user = (User) session1.getAttribute("user");

        List<Order> orders = DB.orders.stream().filter(t -> {
            assert user != null;
            return t.getUserId() == user.getId();
        }).toList();
        for (Order order : orders) {
    %>

    <div class="order-card">
        <div class="order-header">Buyurtma ID: <%= order.getId() %></div>
        <div class="order-details">
            <p>Status: <%= order.getStatus() %></p>
            <p>Sana: <%= order.getDate() %></p>
            <p>User ID: <%= order.getUserId() %></p>
        </div>
        <button class="order-button" data-bs-toggle="modal" data-bs-target="#orderModal<%= order.getId() %>">Batafsil</button>
    </div>

    <!-- Modal for order details -->
    <div class="modal fade" id="orderModal<%= order.getId() %>" tabindex="-1" aria-labelledby="orderModalLabel<%= order.getId() %>" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="orderModalLabel<%= order.getId() %>">Buyurtma batafsil: <%= order.getId() %></h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <h5>Buyurtma ID: <%= order.getId() %></h5>
                    <p><strong>Status:</strong> <%= order.getStatus() %></p>
                    <p><strong>Sana:</strong> <%= order.getDate() %></p>
                    <p><strong>User ID:</strong> <%= order.getUserId() %></p>
                    <!-- Bu yerga orderning boshqa batafsil ma'lumotlarini qo'shishingiz mumkin -->
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Yopish</button>
                </div>
            </div>
        </div>
    </div>

    <%
        }
    %>

</div>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"></script>

</body>
</html>

