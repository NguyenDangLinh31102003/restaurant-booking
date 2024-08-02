<%-- 
    Document   : book
    Created on : Feb 27, 2024, 10:30:46 AM
    Author     : buiqu
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <!-- Basic -->
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <!-- Mobile Metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <!-- Site Metas -->
        <meta name="keywords" content="" />
        <meta name="description" content="" />
        <meta name="author" content="" />

        <link rel="shortcut icon" href="images/favicon.png" type="">

        <title> Feane </title>

        <!-- bootstrap core css -->
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />

        <!--owl slider stylesheet -->
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
        <!-- nice select  -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css" integrity="sha512-CruCP+TD3yXzlvvijET8wV5WxxEh5H8P4cmz0RFbKK6FlZ2sYl3AEsKlLPHbniXKSrDdFewhbmBK5skbdsASbQ==" crossorigin="anonymous" />
        <!-- font awesome style -->
        <link href="css/font-awesome.min.css" rel="stylesheet" />

        <!-- Custom styles for this template -->
        <link href="css/style.css" rel="stylesheet" />
        <!-- responsive style -->
        <link href="css/responsive.css" rel="stylesheet" />
        <!-- Font Icon -->
   

    </head>

    <body class="sub_page">

        <div class="hero_area">
            <div class="bg-box">
                <img src="images/hero-bg.jpg" alt="">
            </div>
            <!-- header section strats -->
            <header class="header_section">
                <div class="container">
                    <nav class="navbar navbar-expand-lg custom_nav-container ">
                        <a class="navbar-brand" href="index.jsp">
                            <span>
                                Feane
                            </span>
                        </a>

                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <span class=""> </span>
                        </button>

                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav  mx-auto ">
                                <li class="nav-item">
                                    <a class="nav-link" href="index">Home </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="menu">Menu</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="feedback">Feedback</a>
                                </li>
                                <li class="nav-item active">
                                    <a class="nav-link" href="book.jsp">Book Table <span class="sr-only">(current)</span> </a>
                                </li>
                            </ul>
                            <jsp:include page="hearder.jsp"></jsp:include>
                            </div>
                        </nav>
                    </div>
                </header>
                <!-- end header section -->
            </div>

            <!-- book section -->
            <section class="book_section layout_padding">
                <div class="container">
                     <h1> Information ALL YOUR TABLE BOOK</h1>
        <table id="productTable" border="1">
            <thead>
                <tr>
                       
                    <th>tableID</th>
                    <th>UserName</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>NumberOfTable</th>
                     <th>Date Name</th>
                    <th>UserID</th>
                    <th>Time</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach items="${list_table}" var="t">
                <tr>
                    <td>${t.getTableID()}</td>
                    <td>${t.getUserName()}</td>
                    <td>${t.getEmail()}</td>
                    <td>${t.getPhone()}</td>
                    <td>${t.getNumberOfTable()}</td>
                    <td>${t.getDate() }</td>
                    <td>${t.getUserID() }</td>
                    <td>${t.getTime() }</td>
                    <td><button class="delete-button"><a style="color: black"href="delete_table?di=${t.getTableID()}">Delete<a/></button></td>
                </tr>
                </c:forEach>
                <!-- Add more rows for additional products -->
            </tbody>
        </table>
                    
                </div>
            </div>
        </section>
        <script>
// Lắng nghe sự kiện click trên link
            document.getElementById("submitLink").addEventListener("click", function (event) {
                event.preventDefault(); // Ngăn chặn hành động mặc định của link

// Lấy form
                var form = document.getElementById("myForm");

// Tạo và gửi yêu cầu HTTP mới
                var request = new XMLHttpRequest();
                request.open("POST", form.action, true);
                request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

// Xử lý khi yêu cầu được hoàn thành
                request.onreadystatechange = function () {
                    if (request.readyState === XMLHttpRequest.DONE) {
                        if (request.status === 200) {
                            console.log("Form submitted successfully!");
                        } else {
                            console.error("Error submitting form.");
                        }
                    }
                };

// Gửi dữ liệu form
                var formData = new FormData(form);
                request.send(new URLSearchParams(formData));
            });
        </script>
        <!-- end book section -->
        <jsp:include page="tail.jsp"></jsp:include>
    </body>

</html>
