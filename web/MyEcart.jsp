
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
   

        <style>
            a{
                text-decoration: none;
            }
            table{
                border-collapse: collapse;
            }
        </style>
        <script>
            
            
            
        </script>
            
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
                                <li class="nav-item ">
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
       <h1>Shopping cart Online</h1>
       <table border="1px" width="40%">
           <thead>
               <tr>
                   <th>No</th>
                   <th>Name</th>
                   <th>quantity</th>
                   <th>price</th>
                   <th>money</th>
                   <th>action</th>
               </tr>
           </thead>
           
           <c:set var="o" value="${sessionScope.cart}"/>
           <c:set var="t" value="0"/>
               <c:forEach items="${o.items}" var="i">
                   <c:set var="t" value="${t+1}"/>
                   
           <tbody>
               <tr>
                   <td>${t}</td>
                   <td>${i.product.getName()}</td>
                   <td>
                       <button><a href="process?num=-1&id=${i.product.getProductID()}">-</a></button>
                       <input type="text" readonly value="${i.quantity}">
                       <button><a href="process?num=1&id=${i.product.getProductID()}">+</a></button>
                       
                   </td>
                   <td><fmt:formatNumber pattern="##.##" value="${i.price - (i.price  * (i.product.getSale()/100) )}"/></td>
                  <td><fmt:formatNumber pattern="##.##" value="${(i.price - (i.price  * (i.product.getSale()/100) ))*i.quantity}"/></td>
                  <td>
                      <form action="process" method="post">
                          <input type="hidden" name="id" value="${i.product.getProductID()}"/>
                          <input type="submit" value="Return item"/>
                              
                      </form>
                  </td>
               </tr>
        
           </c:forEach>
       </table>
                <c:set var="totalAmount" value="0" />
<c:forEach items="${o.items}" var="i">
    <c:set var="totalAmount" value="${totalAmount + ((i.price - (i.price  * (i.product.getSale()/100) ))*i.quantity)}" />
</c:forEach>

<h2>Total Price: <fmt:formatNumber pattern="##.##" value="${totalAmount}"/>$</h2>
               <p></p>
               <form action="checkount" method="post">
                   <input type="submit" value="Check out"/>
               </form>
               <hr/>
               <h2 style="color: chocolate"><a href="menu">CLICK ME CONTINUE BUY</a> </h2>
              


    </body>
</html>
