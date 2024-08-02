<%-- 
    Document   : about
    Created on : Feb 27, 2024, 10:29:14 AM
    Author     : buiqu
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <style>
            .comment-form {
                width: 100%;
                max-width: 500px;
                margin: 0 auto;
                padding: 20px;
                border: 1px solid #ccc;
                border-radius: 5px;
            }

            .comment-form textarea {
                width: 100%;
                height: 100px;
                padding: 10px;
                margin-bottom: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
                resize: none;
            }

            .comment-form input[type="submit"] {
                background-color: #4CAF50;
                color: white;
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }

            .comment-form input[type="submit"]:hover {
                background-color: #45a049;
            }
            .container {
                text-align: center;
            }
        </style>
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
                                <li class="nav-item ">
                                    <a class="nav-link" href="index">Home </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="menu">Menu</a>
                                </li>
                                <li class="nav-item active">
                                    <a class="nav-link" href="feedback">Feedback <span class="sr-only">(current)</span> </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="book.jsp">Book Table</a>
                                </li>
                            </ul>
                            <jsp:include page="hearder.jsp"></jsp:include>
                            </div>
                        </nav>
                    </div>
                </header>
                <!-- end header section -->
            </div>

            <!-- about section -->

            <section class="about_section layout_padding">
                <div class="container  ">


                    <div class="row"  >
                        <div class="container">
                            <h2 > Write Your Feedback about Feane RestaurAnt</h2>
                        </div>
                    </div>
                    <div class="row" >
                        <div class="comment-form"  >
                            <h2>Write a Comment</h2>
                            <form action="feedback" method="post">
                                <input type="hidden" name="id" value="${sessionScope.acc.getUserID()}">
                            <textarea name="comment" placeholder="Write your comment here..." required></textarea><br>

                            <c:if test="${sessionScope.acc == null}">
                                <div class="btn_box">
                                    <button>
                                        <a href="login.jsp">YOU NEED LOGIN</a>
                                    </button>
                                </div> 
                            </c:if>
                            <c:if test="${sessionScope.acc != null}">
                                <div class="btn_box">
                                    <input type="submit" value="Submit Comment">
                                </div> 
                            </c:if>
                        </form>
                    </div>
                </div>
            </div>

        </section>
        <section class="client_section layout_padding-bottom">
            <div class="container">
                <div class="carousel-wrap row">
                    <div class="owl-carousel client_owl-carousel">
                        <c:forEach var="f" items="${list_fb}">
                            <div class="item">
                                <div class="box">
                                    <div class="detail-box">
                                        <p>${f.getTexFeedback()}</p>
                                        <h6>${f.getUserName()}</h6>
                                    </div>
                                    <div class="img-box">
                                        <!-- Đây là nơi bạn có thể chèn hình ảnh của phản hồi nếu có -->
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </section>



        <!-- end about section -->

        <jsp:include page="tail.jsp"></jsp:include>
        <script>document.addEventListener("DOMContentLoaded", function () {
                document.querySelectorAll('.read-more').forEach(function (element) {
                    element.addEventListener('click', function (e) {
                        e.preventDefault();
                        var content = this.previousElementSibling;
                        if (content.style.display === "none") {
                            content.style.display = "block";
                            this.textContent = "Read Less";
                        } else {
                            content.style.display = "none";
                            this.textContent = "Read More";
                        }
                    });
                });
            });</script>
    </body>

</html>
