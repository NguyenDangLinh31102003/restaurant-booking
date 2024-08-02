<%-- 
    Document   : products
    Created on : Mar 15, 2024, 10:45:55 AM
    Author     : buiqu
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <title>Product Page - Admin HTML Template</title>
        <link
            rel="stylesheet"
            href="https://fonts.googleapis.com/css?family=Roboto:400,700"
            />
        <!-- https://fonts.google.com/specimen/Roboto -->
        <link rel="stylesheet" href="css/fontawesome.min.css" />
        <!-- https://fontawesome.com/ -->
        <link rel="stylesheet" href="css/bootstrap.min.css" />
        <!-- https://getbootstrap.com/ -->
        <link rel="stylesheet" href="css/templatemo-style.css">
        <!--
            Product Admin CSS Template
            https://templatemo.com/tm-524-product-admin
        -->
    </head>

    <body id="reportsPage">
        <jsp:include page="firts_admin.jsp"></jsp:include>
            <div class="container mt-5">
                <div class="row tm-content-row">
                    <div class="col-sm-12 col-md-12 col-lg-8 col-xl-8 tm-block-col">
                        <div class="tm-bg-primary-dark tm-block tm-block-products">
                            <div class="tm-product-table-container">
                                <table class="table table-hover tm-table-small tm-product-table">
                                    <thead>
                                        <tr>
                                            <th scope="col">&nbsp;</th>
                                            <th scope="col">PRODUCT NAME</th>
                                            <th scope="col">PRICE</th>
                                            <th scope="col">STATUS</th>
                                            <th scope="col">ID</th>
                                            <th scope="col">&nbsp;</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${list_P}" var="p">
                                        <tr>
                                            <th scope="row"><input type="checkbox" /></th>
                                            <td class="tm-product-name"><a href="desplay?id=${p.getProductID()}" style="color: white" >${p.getName()}</a></td>
                                            <td>${p.getPrice()}$</td>
                                            <td>${p.getStatus()==1?"IN STOCK" : "OUT STOCK"}</td>
                                            <td>${p.getProductID()}</td>
                                            <td>
                                                <a href="#" class="tm-product-delete-link" onclick="confirmDelete2(${p.getProductID()})">
                                                    <i class="far fa-trash-alt tm-product-delete-icon"></i>
                                                </a>
                                            </td>
                                        </tr>
                                    </c:forEach>

                                </tbody>
                            </table>
                        </div>
                        <!-- table container -->
                        <a
                            href="add"
                            class="btn btn-primary btn-block text-uppercase mb-3">Add new product</a>

                    </div>
                </div>
                <!-- Categorize -->
                <div class="col-sm-12 col-md-12 col-lg-4 col-xl-4 tm-block-col">
                    <div class="tm-bg-primary-dark tm-block tm-block-product-categories">
                        <h2 class="tm-block-title">Product Categories</h2>
                        <div class="tm-product-table-container">
                            <table class="table tm-table-small tm-product-table">
                                <tbody>
                                    <c:forEach items="${listC}" var="c">
                                        <tr>
                                            <td >${c.getNameType()}</td>
                                            <td class="text-center">
                                                <a href="#" class="tm-product-delete-link" onclick="confirmDelete(${c.getTypeID()})">
                                                    <i class="far fa-trash-alt tm-product-delete-icon"></i>
                                                </a>
                                            </td>
                                        </tr>
                                    </c:forEach>

                                </tbody>
                            </table>
                        </div>
                        <!-- table container -->
                        <form method="get" action="addcategory" >
                         <div class="form-group mb-3">
                                        <label
                                            for="name"
                                            > ADD NAME CATEGORY
                                        </label>
                                        <input
                                            id="name"
                                            value="${name}"
                                            name="name"
                                            type="text"
                                            class="form-control validate"
                                            required
                                            />
                                    </div>
                       <button type="submit" class="btn btn-primary btn-block text-uppercase">Add new category</button>
                       </form>
                    </div>
                </div>
            </div>
        </div>
        <footer class="tm-footer row tm-mt-small">
            <div class="col-12 font-weight-light">
                <p class="text-center text-white mb-0 px-4 small">
                    Copyright &copy; <b>2018</b> All rights reserved. 

                    Design: <a rel="nofollow noopener" href="https://templatemo.com" class="tm-footer-link">Template Mo</a>
                </p>
            </div>
        </footer>

        <script src="js/jquery-3.3.1.min.js"></script>
        <!-- https://jquery.com/download/ -->
        <script src="js/bootstrap.min.js"></script>
        <!-- https://getbootstrap.com/ -->
   
        <script>
            // Hàm xác nhận xóa dòng
            function confirmDelete(typeID) {
                // Hiển thị hộp thoại xác nhận
                var confirmation = confirm("Are you sure you want to delete this category? (All Products with this Category will be deleted)");

                // Nếu người dùng chọn "Yes"
                if (confirmation) {
                    // Chuyển hướng đến trang xử lý xóa với ID của danh mục
                    window.location.href = "deletecategorize?id=" + typeID;
                }
            }
              function confirmDelete2(typeID) {
                // Hiển thị hộp thoại xác nhận
                var confirmation = confirm("Are you sure you want to delete this Product");

                // Nếu người dùng chọn "Yes"
                if (confirmation) {
                    // Chuyển hướng đến trang xử lý xóa với ID của danh mục
                    window.location.href = "deleteproduct?id=" + typeID;
                }
            }
        </script>

    </body>
</html>