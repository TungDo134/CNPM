<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="f" uri="jakarta.tags.fmt" %>
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
        Quản lí menu
    </title>
    <!--     Fonts and icons     -->
    <link href="https://fonts.googleapis.com/css?family=Inter:300,400,500,600,700,800" rel="stylesheet"/>
    <!-- Font Awesome Icons -->
    <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
    <!-- CSS Files -->
    <link id="pagestyle" href="<%=request.getContextPath()%>/assets/css/soft-ui-dashboard.css?v=1.1.0"
          rel="stylesheet"/>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #fff;
            margin: 0;
            padding: 20px;
            color: #333;
        }

        h2 {
            font-size: 1.5em;
            margin: 20px 0;
            color: #000;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
            background-color: #f9f9f9;
        }

        th,
        td {
            padding: 10px;
            text-align: left;
            border: 1px solid #ddd;
        }

        th {
            background-color: #f4f4f4;
            font-weight: bold;
        }

        td {
            background-color: #fff;
        }

        .action-buttons {
            display: flex;
            gap: 5px;
        }

        button {
            padding: 5px 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 0.9em;
        }

        .add-btn {
            background-color: #28a745;
            color: #fff;
            margin-bottom: 10px;
        }

        .add-btn:hover {
            background-color: #218838;
        }

        .view-btn,
        .edit-btn {
            background-color: #17a2b8;
            color: #fff;
        }

        .view-btn:hover,
        .edit-btn:hover {
            background-color: #138496;
        }

        .delete-btn {
            background-color: #dc3545;
            color: #fff;
        }

        .delete-btn:hover {
            background-color: #c82333;
        }

        .available-yes {
            background-color: #28a745;
            color: #fff;
            padding: 2px 5px;
            border-radius: 4px;
            text-align: center;
        }

        .dishes-section {
            display: none;
        }

        .dishes-section.active {
            display: block;
        }

        /* Modal Styles */
        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 1000;
        }

        .modal-content {
            background-color: #fff;
            width: 500px;
            max-width: 90%;
            margin: 50px auto;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .modal-content h3 {
            margin-top: 0;
            color: #000;
        }

        .modal-content label {
            display: block;
            margin: 10px 0 5px;
            font-weight: bold;
        }

        .modal-content input,
        .modal-content textarea {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        .modal-content button {
            margin-right: 10px;
        }

        .save-btn {
            background-color: #28a745;
            color: #fff;
        }

        .save-btn:hover {
            background-color: #218838;
        }

        .cancel-btn {
            background-color: #dc3545;
            color: #fff;
        }

        .cancel-btn:hover {
            background-color: #c82333;
        }
    </style>
</head>

<body class="g-sidenav-show  bg-gray-100">
<% String msg = (String) request.getAttribute("message");%>
<aside class="sidenav navbar navbar-vertical navbar-expand-xs border-0 border-radius-xl my-3 fixed-start ms-3 "
       id="sidenav-main">
    <div class="sidenav-header">
        <i class="fas fa-times p-3 cursor-pointer text-secondary opacity-5 position-absolute end-0 top-0 d-none d-xl-none"
           aria-hidden="true" id="iconSidenav"></i>
        <a class="navbar-brand m-0" href="#"
           target="_blank">
            <img src="<%=request.getContextPath()%>/assets/img/logo-ct-dark.png" class="navbar-brand-img h-100"
                 alt="main_logo">
            <span class="ms-1 font-weight-bold">Admin Dashboard</span>
        </a>
    </div>
    <hr class="horizontal dark mt-0">
    <div class="collapse navbar-collapse  w-auto " id="sidenav-collapse-main">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link  " href="<%=request.getContextPath()%>/pages/dashboard.jsp">
                    <span class="nav-link-text ms-1">Dashboard</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link  active" href="<%=request.getContextPath()%>/pages/menu.jsp">
                    <span class="nav-link-text ms-1">Quản lí menu và món ăn</span>
                </a>
            </li>
        </ul>
    </div>

</aside>
<main class="main-content position-relative max-height-vh-100 h-100 border-radius-lg ">
    <div class="container-fluid py-4">

        <!-- Menu & Dishes Section -->
        <div class="content-menu">
            <!-- Menu Section -->
            <h2>Danh sách Menu</h2>
            <button
                    class="add-btn"
                    disabled
            >
                Thêm Menu
            </button>
            <table id="menuTable">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Tên Menu</th>
                    <th>Mô tả</th>
                    <th>Ngày tạo</th>
                    <%--<th>Cập nhật</th>--%>
                    <th>Hành động</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${menuList}" var="menu">
                    <tr>
                        <td>${menu.id}</td>
                        <td>${menu.name}</td>
                        <td>${menu.description}</td>
                        <td>${menu.createdAt}</td>
                            <%--<td>${menu.updatedAt}</td>--%>
                        <td class="action-buttons">

                                <%-- Todo: 9.1.1.3 Nhấn chọn "Xem món" từ menu cụ thể
                                     Todo: // để hiển thị danh sách món ăn của menu đó --%>
                            <button class="view-btn"><a style="color: inherit; text-decoration: none"
                                                        href="<%=request.getContextPath()%>/get-dishes?menuID=${menu.id}">Xem
                                món</a></button>

                            <button
                                    class="edit-btn"
                                    onclick="showMenuEditForm('${menu.id}', '${menu.name}', '${menu.description}')"
                            >
                                Chỉnh Sửa
                            </button>
                            <button class="delete-btn" disabled>
                                Xóa
                            </button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <c:if test="${empty dishes}">
                <div style="text-align: center; padding: 2px; background: white;">
                    <h2>Menu hiện không có món ăn</h2>
                </div>
            </c:if>
            <!-- Dishes Section -->
            <div class="dishes-section " id="dishesSection" style="display: ${not empty dishes ? 'block' : 'none'};">
                <h2>Danh sách món ăn </h2>
                <button
                        class="add-btn"
                        disabled
                >
                    Thêm món ăn
                </button>
                <table id="dishesTable">
                    <thead>
                    <tr>
                        <th>ID món ăn</th>
                        <th>ID menu</th>
                        <th>Tên món</th>
                        <th>Mô tả</th>
                        <th>Giá</th>
                        <th>Có sẵn</th>
                        <th>Hành động</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${dishes}" var="dish">
                        <tr>
                            <td>${dish.id}</td>
                            <td>${dish.menuId}</td>
                            <td>${dish.name}</td>
                            <td>${dish.description}</td>
                            <td>
                                <f:setLocale value="vi_VN"/>
                                <f:formatNumber value=" ${dish.price}">
                                </f:formatNumber>
                            </td>
                            <td>
                                <c:if test="${dish.available==1}">
                                    Có
                                </c:if>
                                <c:if test="${dish.available!=1}">
                                    Không có
                                </c:if>
                            </td>

                            <td class="action-buttons">
                                <button
                                        class="edit-btn"
                                    <%-- Todo: 9.1.1.4 Tìm món ăn cần chỉnh sửa và chọn nút "Chỉnh sửa" --%>
                                        onclick="showDishEditForm('${dish.id}', '${dish.menuId}', '${dish.name}', '${dish.description}', ${dish.price}, ${dish.available})">
                                    Chỉnh Sửa
                                </button>

                                <button class="delete-btn">
                                    Xóa
                                </button>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>

            </div>
        </div>

        <!-- Dish Edit Modal -->
        <div class="modal" id="dishEditModal">
            <div class="modal-content">
                <h3>Sửa Món ăn</h3>
                <form id="dishEditForm">
                    <label for="dishId">ID</label>
                    <input type="text" id="dishId" name="dishId" readonly/>

                    <label for="dishMenuId">Menu ID</label>
                    <input type="text" id="dishMenuId" name="dishMenuId" readonly/>

                    <label for="dishName">Tên món</label>
                    <input type="text" id="dishName" name="dishName" required/>

                    <label for="dishDescription">Mô tả</label>
                    <textarea id="dishDescription" name="dishDescription"></textarea>

                    <label for="dishPrice">Giá</label>
                    <input type="number" id="dishPrice" name="dishPrice" step="1" required/>

                    <label for="dishAvailable">Có sẵn</label>
                    <input type="checkbox" id="dishAvailable" name="dishAvailable"/>

                    <label for="dishCreatedAt">Ngày tạo</label>
                    <input type="text" id="dishCreatedAt" name="dishCreatedAt" readonly/>

                    <label for="dishUpdatedAt">Cập nhật</label>
                    <input type="text" id="dishUpdatedAt" name="dishUpdatedAt" readonly/>

                    <%-- Todo: 9.1.1.6 Người dùng chỉnh sửa thông tin cần thiết và bấm "Lưu" --%>
                    <button type="submit" class="save-btn">Lưu</button>

                    <button type="button" class="cancel-btn" onclick="closeModals()">
                        Hủy
                    </button>
                </form>
            </div>
        </div>

    </div>
</main>


<!-- Script Custom -->
<script>
    // 9.1.1.5 Kích hoạt sự kiện onClick
    // Gọi hàm showDishEditForm nhận vào các thông tin của món ăn cần chỉnh và hiển thị
    function showDishEditForm(id, menuId, name, description, price, available) {
        document.getElementById("dishEditModal").style.display = "block";
        document.getElementById("dishId").value = id;
        document.getElementById("dishMenuId").value = menuId;
        document.getElementById("dishName").value = name;
        document.getElementById("dishDescription").value = description;
        document.getElementById("dishPrice").value = price;
        document.getElementById("dishAvailable").checked = available;
        document.getElementById("dishCreatedAt").value = "2024-01-01";
        document.getElementById("dishUpdatedAt").value = "2025-05-16";
    }

    document.getElementById('dishEditForm').addEventListener('submit', async function (e) {
            e.preventDefault();

            // 9.1.1.7 Tạo FormData từ form người dùng chỉnh sửa
            let formData = new URLSearchParams(new FormData(this));
            let url = `${pageContext.request.contextPath}/edit-dish`

            // 9.1.1.8 Gọi đến hàm checkIsDataValid nhận vào tên và giá món ăn
            // Kích hoạt sự kiện submit của form, gọi đến hàm checkIsDataValid nhận vào tên và giá món ăn
            if (!checkIsValidData(formData.get('dishName'), formData.get('dishPrice'))) return;

            try {
                // 9.1.2.2 Gửi fetch request POST đến /edit-dish
                // (Headers: application/x-www-form-urlencoded,Body: formData)
                let response = await fetch(url, {
                    method: 'Post',
                    headers: {
                        "Content-Type": "application/x-www-form-urlencoded"
                    },
                    body: formData,
                })

                let result = await response.json();

                if (result.isSuccess) {
                    // 9.1.3.3 Hiển thị alert("Cập nhật thành công")
                    alert('Cập nhật thành công')
                    window.location.reload()
                } else {
                    // 9.1.3.6 Hiển thị alert("Cập nhật thất bại")
                    alert('Cập nhật thất bại')
                    window.location.reload()
                }
            } catch (error) {
            }
        }
    )

    // Hàm ktra định dạng
    function checkIsValidData(name, price) {
        // Kiểm tra định dạng
        let isValid = true;
        let errorMessage = '';

        // Kiểm tra name
        const nameRegex = /^[\p{L}0-9\s]+$/u; // Hỗ trợ ký tự có dấu (Unicode), số và khoảng trắng
        if (!nameRegex.test(name)) {
            isValid = false;
            errorMessage += 'Tên món không được chứa ký tự đặc biệt.\n';
        }

        // Kiểm tra price
        const dishPrice = price ? parseInt(price) : null;
        if (dishPrice === null || isNaN(dishPrice) || dishPrice < 0) {
            isValid = false;
            errorMessage += 'Giá phải là số dương và không được để trống.\n';
        }

        // Nếu có lỗi, hiển thị thông báo và dừng gửi dữ liệu
        if (!isValid) {
            // 9.1.2.11 Hiển thị alert báo lỗi
            alert(errorMessage);
        }
        // 9.1.2.1 return true (Dữ liệu hợp lệ)
        // 9.1.2.10 return false (Dữ liệu không hợp lệ)
        return isValid;
    }

    function closeModals() {
        // document.getElementById("menuEditModal").style.display = "none";
        document.getElementById("dishEditModal").style.display = "none";
    }


</script>
</body>

</html>