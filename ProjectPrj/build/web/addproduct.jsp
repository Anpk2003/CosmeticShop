<%-- 
    Document   : addproduct.jsp
    Created on : Mar 6, 2024, 2:08:40 AM
    Author     : Phung An
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:out value="${listB}" />
<c:out value="${listC}" />
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <title>Add Form</title>
    </head>
    <body>

        <div class="container mt-5">
            <h2>Add Form</h2>
            <form action="manageproducts?action=add" method="post">
                <div class="form-group">
                    <label for="name">ID:</label>
                    <input  class="form-control" type="number" name="id" required>
                </div>
                <div class="form-group">
                    <label for="name">ID_Category:</label>
                    <input  class="form-control" type="number" name="category" required>
                </div>
                <div class="form-group">
                    <label for="name">ID_Brand:</label>
                    <input  class="form-control" type="number" name="brand" required>
                </div>
             
                <div class="form-group">
                    <label for="name">Title:</label>
                    <input type="text" class="form-control" name="title" required>
                </div>
                <div class="form-group">
                    <label for="name">Price:</label>
                    <input type="number" class="form-control" name="price" required>
                </div>
                  <div class="form-group">
                    <label for="name">Quantity:</label>
                    <input type="number" class="form-control" name="quantity" min="0" required>
                </div>
                <div class="form-group">
                    <label for="name">Thumbnail:</label>
                    <input type="text" class="form-control" name="thum"  required>
                </div>
                <div class="form-group">
                    <label for="name">Description:</label>
                    <input type="text" class="form-control" name="des"  required>
                </div>
                
        </div>
        <button type="submit" value="Add" class="btn btn-primary">Thêm</button>
    </form>
</div>

<!-- Bootstrap JS and jQuery -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

</body>
</html>