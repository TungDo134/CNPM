<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png">
    <link rel="icon" type="image/png" href="<%=request.getContextPath()%>/assets/img/favicon.png">
    <title>
        Admin Dashboard
    </title>
    <!--     Fonts and icons     -->
    <link href="https://fonts.googleapis.com/css?family=Inter:300,400,500,600,700,800" rel="stylesheet"/>
    <!-- Font Awesome Icons -->
    <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
    <!-- CSS Files -->
    <link id="pagestyle" href="<%=request.getContextPath()%>/assets/css/soft-ui-dashboard.css?v=1.1.0"
          rel="stylesheet"/>
</head>

<body class="g-sidenav-show  bg-gray-100">
<aside class="sidenav navbar navbar-vertical navbar-expand-xs border-0 border-radius-xl my-3 fixed-start ms-3 "
       id="sidenav-main">
    <div class="sidenav-header">
        <i class="fas fa-times p-3 cursor-pointer text-secondary opacity-5 position-absolute end-0 top-0 d-none d-xl-none"
           aria-hidden="true" id="iconSidenav"></i>
        <a class="navbar-brand m-0" href="#"
           target="_blank">
            <img src="../assets/img/logo-ct-dark.png" class="navbar-brand-img h-100" alt="main_logo">
            <span class="ms-1 font-weight-bold">Admin Dashboard</span>
        </a>
    </div>
    <hr class="horizontal dark mt-0">
    <div class="collapse navbar-collapse  w-auto " id="sidenav-collapse-main">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link  active" href="<%=request.getContextPath()%>/pages/dashboard.jsp">
                    <span class="nav-link-text ms-1">Dashboard</span>
                </a>
            </li>

            <%--Todo:  9.1.1.2 Chọn "Quản lí menu và món ăn" --%>
            <li class="nav-item">
                <a class="nav-link  " href="<%=request.getContextPath()%>/menu/load-menu">
                    <span class="nav-link-text ms-1">Quản lí menu và món ăn</span>
                </a>
            </li>
        </ul>
    </div>

</aside>
<main class="main-content position-relative max-height-vh-100 h-100 border-radius-lg ">
    <div class="container-fluid py-4 container text-center" style="margin-top: 200px">
        <div>
     <span style="padding: 1rem; background: #f97316; color:#000; border-radius:20px;font-weight: 600; ">
         CÔNG NGHỆ PHẦN MỀN
     </span>
        </div>
        <div style="margin-top: 3rem;
    font-size: 20px;
    font-weight: 700;color:#000;">
         <span>
         WEB GIAO ĐỒ ĂN
     </span>
        </div>
    </div>
</main>
</body>

</html>