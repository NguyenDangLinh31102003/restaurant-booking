<%-- 
    Document   : index
    Created on : Feb 27, 2024, 10:32:06 AM
    Author     : buiqu
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
     <meta name="description" content="Male_Fashion Template">
    <meta name="keywords" content="Male_Fashion, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Male-Fashion | Template</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
    rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
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

<body>

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
              <li class="nav-item active">
                <a class="nav-link" href="index">Home <span class="sr-only">(current)</span></a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="menu">Menu</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="feedback">Feedback</a>
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
    <!-- slider section -->
    <section class="slider_section ">
      <div id="customCarousel1" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
          <div class="carousel-item active">
            <div class="container ">
              <div class="row">
                <div class="col-md-7 col-lg-6 ">
                  <div class="detail-box">
                    <h1>
                      Fast Food Restaurant
                    </h1>
                      <p style="font-size: 19px">
                      with 3 newest dishes
                    </p>
                    
                  </div>
                </div>
              </div>
            </div>
          </div>
        <c:forEach items="${listTopP}" var="p">
          <div class="carousel-item ">
            <div class="container ">
              <div class="row">
                <div class="col-md-7 col-lg-6 ">
                  <div class="detail-box">
                    <h1>
                     ${p.getName()}
                    </h1>
                    <p>
                       ${p.getDescription()}
                    </p>
                    <div class="btn-box">
                      <a href="menu" class="btn1">
                        Order Now
                      </a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
                    </c:forEach>
       
            

        </div>
        <div class="container">
          <ol class="carousel-indicators">
            <li data-target="#customCarousel1" data-slide-to="0" class="active"></li>
            <li data-target="#customCarousel1" data-slide-to="1"></li>
            <li data-target="#customCarousel1" data-slide-to="2"></li>
            <li data-target="#customCarousel1" data-slide-to="3"></li>
          </ol>
        </div>
      </div>

    </section>
    <!-- end slider section -->
  </div>

  <!-- offer section -->

  <section class="offer_section layout_padding-bottom">
    <div class="offer_container">
      <div class="container ">
           <div class="heading_container heading_center psudo_white_primary mb_45">
               <h2>
          Super SALE
        </h2>
      </div>
        <div class="row">
        <c:forEach items="${listSaleP}" var="s">
          <div class="col-md-6  ">
            <div class="box ">
              <div class="img-box">
                  <a href="">
                  <img src="${s.getImageURL()}" alt="" style="width: 150px; height: 200px;">
                  </a>
              </div>
              <div class="detail-box">
                  <h5 >
                 ${s.getName()}
                </h5>
                <h6>
                  <span style="color: red">  ${s.getSale()}%</span> 
                </h6>
                <a href="menu">
                  Order Now <jsp:include page="icon1.jsp"></jsp:include>
                  </a>
               
              </div>
            </div>
          </div>
                </c:forEach>
        </div>
      </div>
    </div>
  </section>

  <!-- end offer section -->

 

  <!-- client section -->

      <section class="about_section layout_padding">
                <div class="container  ">

                    <div class="row">
                        <div class="col-md-6">
                            <div class="img-box">
                                <img src="images/about-img.png" alt="">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="detail-box">
                                <div class="heading_container">
                                    <h2>We Are Feane</h2>
                                </div>
                                <div class="content">
                                    <p>

                                        Feane Restaurant is a culinary haven nestled in the heart of the bustling city, beckoning food enthusiasts on a delectable journey through the world of fast food delights. With an unwavering commitment to culinary excellence, Feane has earned its place as a go-to destination for those seeking the ultimate comfort food experience.

                                        Feane Restaurant prides itself on its diverse menu, catering to a wide range of palates. From freshly baked pizzas to gourmet burgers, and from creamy pasta to authentic Italian-style dishes, Feane offers something for everyone. Each dish is meticulously crafted using the finest ingredients sourced from local producers, ensuring a burst of flavor in every bite.

                                        Quality and freshness are paramount at Feane. Our skilled chefs are dedicated to delivering dishes that tantalize the taste buds while adhering to the highest standards of hygiene and food safety. Every ingredient is carefully selected and prepared with precision, guaranteeing a dining experience that is both satisfying and wholesome.

                                        Stepping into Feane Restaurant, guests are greeted with an inviting ambiance that complements the delicious food. The warm, cozy interiors, coupled with friendly and attentive staff, create an atmosphere perfect for enjoying a meal with loved ones. Whether catching up over lunch or celebrating a special occasion, Feane provides the ideal setting for memorable dining experiences.
                                    </p>
                                    <p class="extra-content" style="display:none;">
                                        Beyond serving delicious food, Feane Restaurant is committed to giving back to the community. Through various charitable initiatives and partnerships with local organizations, Feane strives to spread joy and support to those in need.

                                        In a world full of culinary experiences, Feane Restaurant stands out as a beacon of excellence. With its diverse menu, impeccable quality, and warm ambiance, Feane promises to satisfy cravings and delight the senses with every bite. Join us on a culinary journey like no other and discover why Feane is more than just a restaurant—it's a culinary haven.
                                    </p>
                                    <a href="#" class="read-more">Read More</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    </div>
             
                                    
            </section>
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
  <!-- end client section -->

   <jsp:include page="tail.jsp"></jsp:include>

</body>

</html>
