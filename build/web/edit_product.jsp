<%-- 
    Document   : edit_product
    Created on : Mar 15, 2024, 10:58:23 AM
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
        <title>Edit Product - Dashboard Admin Template</title>
        <link
            rel="stylesheet"
            href="https://fonts.googleapis.com/css?family=Roboto:400,700"
            />
        <!-- https://fonts.google.com/specimen/Roboto -->
        <link rel="stylesheet" href="css/fontawesome.min.css" />
        <!-- https://fontawesome.com/ -->
        <link rel="stylesheet" href="jquery-ui-datepicker/jquery-ui.min.css" type="text/css" />
        <!-- http://api.jqueryui.com/datepicker/ -->
        <link rel="stylesheet" href="css/bootstrap.min.css" />
        <!-- https://getbootstrap.com/ -->
        <link rel="stylesheet" href="css/templatemo-style.css">
        <!--
            Product Admin CSS Template
            https://templatemo.com/tm-524-product-admin
        -->
    </head>

    <body>
        <jsp:include page="firts_admin.jsp"></jsp:include>
            <div class="container tm-mt-big tm-mb-big">
                <div class="row">
                    <div class="col-xl-9 col-lg-10 col-md-12 col-sm-12 mx-auto">
                        <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
                            <div class="row">
                                <div class="col-12">
                                    <h2 class="tm-block-title d-inline-block">Thêm sản phẩm</h2>
                                </div>
                            </div>
                            <h6 style="color:red">${pExist}</h6>

                        <div class="row tm-edit-product-row">
                            <div class="col-xl-6 col-lg-6 col-md-12">

                                <form action="edit" method="get" class="tm-edit-product-form" enctype="multipart/form-data">
                                    <div class="form-group mb-3">
                                        <label
                                            for="name"
                                            >ID
                                        </label>
                                        <input
                                            id="id"
                                            value="${desplay_p. getProductID()}"
                                            name="id"
                                            type="text"
                                            class="form-control validate"
                                            required
                                            />
                                    </div>
                                    <div class="form-group mb-3">
                                        <label
                                            for="name"
                                            >Tên sản phẩm
                                        </label>
                                        <input
                                            id="name"
                                            value="${desplay_p.getName()}"
                                            name="name"
                                            type="text"
                                            class="form-control validate"
                                            required
                                            />
                                    </div>
                                    <h6 style="color: red">${numError}</h6>
                                    <div class="row">
                                        <div class="form-group mb-3 col-xs-12 col-sm-6">
                                            <label
                                                for="price"
                                                >price
                                            </label>
                                            <input
                                                id="price"
                                                name="price"
                                                type="text"
                                                value="${desplay_p.getPrice() }"
                                                class="form-control validate"
                                                required
                                                />
                                        </div>
                                    </div>
                                    <div class="form-group mb-3">
                                        <label
                                            for="description"
                                            >Description</label
                                        >
                                        <textarea
                                            id="description"
                                            name="des"

                                            class="form-control validate"
                                            
                                            rows="3"
                                            required
                                            >${desplay_p.getDescription()}</textarea>
                                    </div>


                                    <div class="form-group mb-3">
                                        <label
                                            for="category"
                                            >Category</label>
                                        <select
                                            class="custom-select tm-select-accounts"
                                            id="category"
                                            name="idCate"
                                            >
                                            <c:forEach var ="i" items="${listC}">
                                                <option value="${i.getTypeID()}" ${i.getTypeID() eq desplay_p.getTypeID()?"selected":""}>${i.getNameType()}</option>
                                            </c:forEach>


                                        </select>
                                    </div>
                                    <h6 style="color: red">${numError1}</h6>
                                    <div class="row">

                                        <div class="form-group mb-3 col-xs-12 col-sm-6">
                                            <label
                                                for="discount"
                                                >Discount(Sale)
                                            </label>
                                            <input
                                                id="discount"
                                                name="discount"
                                                value="${desplay_p.getSale()}"
                                                type="text"
                                                class="form-control validate"
                                                data-large-mode="true"
                                                required

                                                />
                                        </div>
                                        <div class="form-group mb-3 col-xs-12 col-sm-6">
                                            <label
                                                for="stock"
                                                >Status
                                            </label>
                                            <select
                                                class="custom-select tm-select-accounts"
                                                id="category"
                                                name="status"
                                                >

                                               <option value="1" ${desplay_p.getStatus()  == 1?"selected":""}>IN STOCK</option>
                                                <option value="0" ${desplay_p.getStatus()  == 0?"selected":""}>OUT STOCK</option>

                                            </select>
                                        </div>
                                    </div>

                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-12 mx-auto mb-4">
                                <img id="imagePreview" src="${desplay_p.getImageURL()}" alt="" style="max-width: 300px; max-height: 300px;"> 
                                <input

                                    name="img"
                                    value="${desplay_p.getImageURL()}"
                                    type="text"
                                    class="form-control validate"
                                   

                                    />
                            </div>
                            <div class="col-12">
                                <button type="submit" class="btn btn-primary btn-block text-uppercase">UPDATE</button>
                            </div>
                            </form>
                        </div>
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
        <script>
            // Đoạn mã JavaScript để xử lý sự kiện khi người dùng chọn tập tin
            document.getElementById('fileInput').addEventListener('change', function (event) {
                // Lấy tệp tin đã chọn
                var file = event.target.files[0];

                // Kiểm tra xem có tệp tin đã chọn hay không
                if (file) {
                    // Đọc nội dung của tệp tin
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        // Hiển thị ảnh trước khi tải lên
                        var imagePreview = document.getElementById('imagePreview');
                        imagePreview.src = e.target.result;
                    };
                    reader.readAsDataURL(file);
                }
            });
        </script>
        <script>
            function previewImage(event) {
                var file = event.target.files[0];
                var reader = new FileReader();

                reader.onload = function (event) {
                    var img = document.createElement('img');
                    img.src = event.target.result;
                    img.alt = "Preview Image";
                    img.style.maxWidth = "350px";
                    img.style.maxHeight = "350px";

                    var dummyDiv = document.querySelector('.tm-product-img-dummy');
                    dummyDiv.innerHTML = ''; // Xóa nội dung cũ đi
                    dummyDiv.appendChild(img); // Thêm ảnh mới vào
                };

                reader.readAsDataURL(file);
            }
            $(function () {
                $("#expire_date").datepicker();
            });


        </script>
        <script src="js/jquery-3.3.1.min.js"></script>
        <!-- https://jquery.com/download/ -->
        <script src="jquery-ui-datepicker/jquery-ui.min.js"></script>
        <!-- https://jqueryui.com/download/ -->
        <script src="js/bootstrap.min.js"></script>
        <!-- https://getbootstrap.com/ -->
        <script>
            $(function () {
                $("#expire_date").datepicker({
                    defaultDate: "10/22/2020"
                });
            });
        </script>
    </body>
</html>

