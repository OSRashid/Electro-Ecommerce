<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Header</title>
    <link rel="stylesheet" href="../assets/css/all.css">
</head>



<body>
<%
    // Initialize a flag to check if the JWT token exists in cookies
    boolean tokenExists = false;

    // Get cookies from the request object
    Cookie[] cookies = request.getCookies();

    if (cookies != null) {
        for (Cookie cookie : cookies) {
            // Check if the JWT token cookie exists
            if ("JWT_TOKEN".equals(cookie.getName())) {
                tokenExists = true;
                break;
            }
        }
    }

    // Set the tokenExists as a request attribute
    request.setAttribute("tokenExists", tokenExists);
%>
<!-- Start Header Area -->
<header class="header_area sticky-header">
    <div class="main_menu">
        <nav class="navbar navbar-expand-lg navbar-light main_box">
            <div class="container">
                <!-- Brand and toggle get grouped for better mobile display -->

                <div class="logo-container">
                    <a class="navbar-brand logo_h" href="/"
                    ><img src="../assets/img/electro-logo.png" alt="" class="logo-image"
                    /></a>
                </div>

                <button
                        class="navbar-toggler"
                        type="button"
                        data-toggle="collapse"
                        data-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent"
                        aria-expanded="false"
                        aria-label="Toggle navigation"
                >
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <div
                        class="collapse navbar-collapse offset"
                        id="navbarSupportedContent"
                >
                    <ul class="nav navbar-nav menu_nav ml-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="/">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/shop">Shop</a>
                        </li>
                        <c:choose>
                            <c:when test="<%= tokenExists %>">
                                <li class="nav-item">
                                    <a class="nav-link" href="/auth/logout">Logout</a>
                                </li>
                            </c:when>
                            <c:otherwise>
                                <li class="nav-item">
                                    <a class="nav-link" href="/auth/login">Login</a>
                                </li>
                            </c:otherwise>
                        </c:choose>
                        <li class="nav-item">
                            <a class="nav-link" href="/contact.jsp">Contact</a>
                        </li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <br>
                        <li class="nav-item">
                            <form action="/cart" method="get" style="display: inline;">
                                <button type="submit" class="search">
                                    <span class="ti-bag"></span>
                                </button>
                            </form>
                        </li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <br>
                        <c:if test="<%= tokenExists %>">
                        <li class="nav-item">
                            <button class="search">
                                <a href="/profile.jsp" class="cart"><span class="lnr fa-regular fa-user" id="search"></span></a>
                            </button>
                        </li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </nav>
    </div>
</header>


<!-- End Header Area -->
</body>
</html>
