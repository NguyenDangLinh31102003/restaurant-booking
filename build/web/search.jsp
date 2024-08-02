<%-- 
    Document   : menu
    Created on : Feb 27, 2024, 10:33:03 AM
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
                        <a class="navbar-brand" href="index">
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
                                <li class="nav-item ">
                                    <a class="nav-link" href="menu">Menu <span class="sr-only">(current)</span> </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="feedback">About</a>
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
        <!-- food section -->

        <section class="food_section layout_padding">
            <div class="container">
                <div class="heading_container heading_center">
                    <h2>
                      Products are searched and Categorize
                    </h2>
                </div>
                 <div class="heading_container heading_center">
                    <h2>
                    ${mis}
                    </h2>
                </div>

                 <ul class="filters_menu">
                    <li class="active" data-filter="*">All</li>
                    <c:forEach items="${listC}" var="c">
                    <li data-filter=".${c.getTypeID()}">${c.getNameType()}</li>
                    </c:forEach>
                </ul>

                <div class="filters-content">

                    <div class="row grid">
                        <c:forEach items="${listP}" var="p"> 
                            <div class="col-sm-6 col-lg-4 all ${p.getTypeID()}">

                                <div class="box">

                                    <div>

                                        <div class="img-box">

                                             <a href="detail?id=${p.getProductID()}"> <img src="${p.getImageURL()}" alt="" style="width:250px; height: 200px;"></a>
                                        </div>
                                        <div class="detail-box">

                                            <h5>
                                                ${p.getName()}
                                            </h5>

                                            <p>
                                                ${p.getDescription()}
                                            </p>
                                            <div class="options">
                                                <h6>
                                                   <b style="color: orange"> ${p.getPrice()} $</b>
                                                </h6>
                                               
                                                <jsp:include page="icon1.jsp"></jsp:include>
                                                 
                                                </div>
                                            </div>

                                        </div>

                                    </div>

                                </div>

                        </c:forEach>
                    </div>

                </div>

                <div class="btn-box">
                    <a href="">
                        View More
                    </a>
                </div>
            </div>
        </section>


        <!-- end food section -->

        <!-- footer section -->
        <jsp:include page="tail.jsp"></jsp:include>
        <!-- footer section -->

       

    </body>

</html>
