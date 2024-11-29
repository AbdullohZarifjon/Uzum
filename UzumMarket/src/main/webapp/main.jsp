
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="uz.pdp.uzummarket.model.Basket" %>
<%@ page import="java.util.List" %>
<%@ page import="uz.pdp.uzummarket.model.Product" %>
<%@ page import="uz.pdp.uzummarket.D_B.DB" %>
<%@ page import="uz.pdp.uzummarket.model.Category" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Objects" %>
<%@ page import="uz.pdp.uzummarket.model.User" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>Main</title>
    <style>
        body, html {
            height: 100%;
            margin: 0;
        }

        .sidebar {
            width: 20%;
            background-color: #f8f9fa;
            border-right: 1px solid #ddd;
            padding: 20px;
            height: 100vh;
        }
        .col .btn.active {
            color: white;
            background-color: aqua;
        }

        .sidebar .btn.active {
            background-color: red;
            color: white;
            width: 100%;
            border-color: #0d6efd;
        }

        .content {
            width: 80%;
            padding: 20px;
            overflow-y: auto;
        }

        .row-container {
            display: flex;
            height: 100%;
        }

        .product-card {
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 15px;
            text-align: center;
            background-color: #f8f9fa;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .product-card:hover {
            background-color: #e9ecef;
            cursor: pointer;
        }

        .product-img {
            max-width: 100%;
            height: auto;
            border-radius: 5px;
            object-fit: cover;
            max-height: 150px;
        }

        .product-name {
            margin: 10px 0 5px;
            font-size: 1.1rem;
            font-weight: bold;
        }

        .product-price {
            color: #28a745;
            font-size: 1rem;
            margin-bottom: 10px;
        }


    </style>
</head>
<body>
    <%
        String categoryName = request.getParameter("categoryName");
        Basket basket;
        if (categoryName == null) {
            categoryName = "All";
        }
        List<Product> products = DB.products;
        if (!categoryName.equals("All")) {
            String finalCategoryName = categoryName;
            Category category = DB.categories.stream().filter(t -> t.getName().equals(finalCategoryName)).findFirst().orElse(null);
            if (category != null) {
                products = DB.products.stream().filter(t -> t.getCategoryId() == category.getId()).toList();
            }
        }
        Map<Product, Integer> map = new HashMap<>();
        HttpSession session1 = request.getSession();
        if (session1 == null) {
            session1 = request.getSession(true);
        }
        Object object = Objects.requireNonNullElse(session1.getAttribute("user"), new Basket());
        if (object instanceof Basket) {
            basket = (Basket) object;
            map = basket.getBasket();
        } else if (object instanceof User) {
            User user = (User) object;
            if (user.getRole().toString().equals("admin")) {
                user.setBasket(new Basket());
            } else {
                basket = user.getBasket();
                map = basket.getBasket();
            }
        }
    %>
    <div class="row-container">
        <div class="sidebar">
            <h4 style="margin-left: 75px">Categories</h4>
            <form action="/main.jsp" method="post">
                <input type="hidden" name="categoryId" value="0">
                <button name="category" value="All" class="btn btn-primary w-100 <%="All".equals(categoryName) ? "active" : ""%>">All</button>
            </form>
            <%
                for (Category category: DB.categories) {
            %>
            <form action="/main.jsp" method="post">

                <button name="categoryName" value="<%=category.getName()%>" class="btn btn-primary w-100 <%=category.getName().equals(categoryName) ? "active" : ""%>"><%=category.getName()%></button>
            </form>
            <%
                }
            %>
        </div>

        <div class="content">
            <h1>Products List</h1>
            <div class="d-flex justify-content-end mb-3">

                <form action="/getOrder.jsp">
                    <button class="btn btn-primary me-2">My Orders</button>
                </form>

                <form action="/Login.jsp">
                    <button class="btn btn-primary me-2">Admin</button>
                </form>

                <form action="/savatcha.jsp" class="d-inline" method="post">
                    <button name="categoryName" value="<%=categoryName%>" class="btn btn-primary">
                        Savatcha <%=map.size()%>
                    </button>
                </form>
            </div>
            <div class="row row-cols-4 g-4">
                <% for (Product product : products) { %>
                <%if (map.containsKey(product)) {%>
                <div class="col">
                    <form action="../remove" method="post">
                        <div class="product-card">
                            <%
                                File file = new File(application.getRealPath("/images/" + product.getPath()));
                                String imagePath;
                                if (file.exists()) {
                                    imagePath = "/images/" + product.getPath();
                                } else {
                                    imagePath = "/images/default-image.jpg";
                                }
                            %>
                            <img src="<%=imagePath%>" alt="<%=product.getName()%>" class="product-img img-fluid mb-2">
                            <h5 class="product-name"><%=product.getName()%></h5>
                            <p class="product-price"><%=product.getPrice()%> so'm</p>
                            <input type="hidden" name="productId" value="<%=product.getId()%>">
                            <input type="hidden" name="categoryName" value="<%=categoryName%>">
                            <button class="btn btn-dark w-100">
                                Remove
                            </button>
                        </div>
                    </form>
                </div>
                <% } else {%>
                <div class="col">
                    <form action="../addToBasket" method="post">
                        <div class="product-card">
                            <%
                                File file = new File(application.getRealPath("/images/" + product.getPath()));
                                String imagePath = "";
                                if (file.exists()) {
                                    imagePath = "/images/" + product.getPath();  // Fayl yo'li to'g'rilandi
                                } else {
                                    imagePath = "/images/default-image.jpg";  // Fayl topilmasa, default rasm qo'yamiz
                                }
                            %>
                            <img src="<%=imagePath%>" alt="<%= product.getName() %>" class="product-img img-fluid mb-2">
                            <h5 class="product-name"><%=product.getName()%></h5>
                            <p class="product-price"><%=product.getPrice()%> so'm</p>
                            <input type="hidden" name="productId" value="<%=product.getId()%>">
                            <input type="hidden" name="categoryName" value="<%=categoryName%>">
                            <button class="btn btn-primary w-100">
                                Add to Cart
                            </button>
                        </div>
                    </form>
                </div>
                <%}%>
                <%}%>
            </div>
        </div>
    </div>

</body>
</html>
