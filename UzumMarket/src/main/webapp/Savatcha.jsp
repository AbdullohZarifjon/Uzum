<%@ page import="uz.pdp.uzummarket.model.Product" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Objects" %>
<%@ page import="java.util.Map" %>
<%@ page import="uz.pdp.uzummarket.model.Basket" %>
<%@ page import="uz.pdp.uzummarket.model.User" %>
<%@ page import="java.io.File" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>Savatcha</title>
    <style>
        .cart-item {
            display: flex;
            align-items: center;
            padding: 15px;
            border: 1px solid #ddd;
            border-radius: 8px;
            margin-bottom: 15px;
            background-color: #f8f9fa;
        }

        .product-img {
            max-width: 120px;
            height: auto;
            border-radius: 5px;
            object-fit: cover;
        }

        .product-info {
            flex: 1;
            margin-left: 15px;
        }

        .product-name {
            font-size: 1.2rem;
            font-weight: bold;
            margin-top: 5px;
        }

        .quantity-control {
            display: flex;
            align-items: center;
            gap: 5px;
        }

        .quantity-btn {
            border: none;
            background-color: #0d6efd;
            color: white;
            width: 30px;
            height: 30px;
            border-radius: 50%;
            font-size: 18px;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
        }

        .quantity-btn:hover {
            background-color: #0047ab;
        }

        .quantity-display {
            font-size: 1.2rem;
            font-weight: bold;
            margin: 0 10px;
        }

        .product-price {
            font-size: 1.2rem;
            color: #28a745;
            font-weight: bold;
            margin-left: 15px;
        }

        .order-btn {
            background-color: #28a745;
            color: white;
            font-size: 1.5rem;
            padding: 10px 20px;
            border-radius: 8px;
            position: fixed;
            bottom: 20px;
            right: 20px;
            text-decoration: none;
            text-align: center;
            display: inline-block;
        }

        .order-btn:hover {
            background-color: #218838;
        }

        .total {
            text-align: right;
            margin-right: 50px;
            margin-top: 20px;
            font-size: 1.5rem;
        }

    </style>
</head>
<body>
<%
    Map<Product, Integer> map = new HashMap<>();
    HttpSession sesion = request.getSession();
    Object object = Objects.requireNonNullElse(sesion.getAttribute("user"), new Basket());

    if (object instanceof Basket) {
        Basket basket = (Basket) object;
        map = basket.getBasket();
    } else if (object instanceof User) {
        User user = (User) object;
        map = user.getBasket().getBasket();
    }
    String categoryName = request.getParameter("categoryName");
%>

<div class="container my-5">
    <form action="main.jsp" method="post" class="position-absolute" style="top: 20px; left: 20px;">
        <input type="hidden" name="categoryName" value="<%=categoryName%>">
        <button type="submit" class="btn btn-secondary" style="padding: 10px 20px; font-size: 1rem; border-radius: 8px;">
            &larr; Orqaga
        </button>
    </form>

    <h1 class="mb-4 text-center">Savatcha</h1>

    <form method="post" action="../updateCard">
        <%
            double sum = 0;
            for (Map.Entry<Product, Integer> entry : map.entrySet()) {
                Product product = entry.getKey();
                int quantity = entry.getValue();
                double totalPrice = product.getPrice() * quantity;
                sum += totalPrice;
        %>
        <div class="cart-item">
            <%
                File file = new File(application.getRealPath("/images/" + product.getPath()));
                String imagePath = "";
                if (file.exists()) {
                    imagePath = "/images/" + product.getPath();
                } else {
                    imagePath = "/images/default-image.jpg";
                }
            %>
            <img src="<%=imagePath%>" alt="<%=product.getName()%>" class="product-img">
            <div class="product-info">
                <h5 class="product-name"><%=product.getName()%></h5>
            </div>
            <div class="quantity-control">
                <button type="submit" name="action" value="decrease-<%=product.getId()%>" class="quantity-btn">-</button>
                <span class="quantity-display"><%=quantity%></span>
                <button type="submit" name="action" value="increase-<%=product.getId()%>" class="quantity-btn">+</button>
            </div>
            <div class="product-price">
                <%=totalPrice%> so'm
            </div>
        </div>
        <% } %>

        <h3 class="total text-end">Total: <%=sum%> so'm </h3>
    </form>

    <form action="../myOrders" method="post">
        <button type="submit" class="order-btn">Order</button>
    </form>

</div>


</body>
</html>

