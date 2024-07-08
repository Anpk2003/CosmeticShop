<%-- 
    Document   : updateproduct
    Created on : Mar 4, 2024, 3:40:20 PM
    Author     : Phung An
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <title>Beautiful Form</title>
        <script src="https://cdn.ckeditor.com/4.16.2/standard/ckeditor.js"></script>
    </head>
    <body>

        <div class="container mt-5">
            <h2>Update Form</h2>
            <c:set var="c" value="${requestScope.product}"/>
            <form action="updatep" method="post">
                <div class="form-group">
                    <label for="name">ID:</label>
                    <input  class="form-control" type="number" readonly name="id" value="${c.id}" required>
                            </div>
                            <div class="form-group">
                    <label for="name">Title:</label>
                    <input type="text" class="form-control" name="title" value="${c.title}" required>
                </div>
                <div class="form-group">
                    <label for="name">Price:</label>
                    <input type="number" class="form-control" name="price" value="${c.price}" required>
                </div>
                   <div class="form-group">
                    <label for="name">Quantity:</label>
                    <input type="number" min="0" class="form-control" name="quantity" value="${c.quantity}" required>
                </div>
                <div class="form-group">
                    <label for="name">Thumbnail:</label>
                    <input type="text" class="form-control" name="thum" value="${c.thumbnail}" required>
                </div>
                <div class="form-group">
                    <label for="name">Description:</label>
                    <textarea class="ckeditor" name="des">${c.description}</textarea>
                                    <script>
                                        CKEDITOR.replace('des');
                                    </script>
                </div>
                <div class="form-group">
                    <label>Category</label>
                    <select name="category" class="form-select" aria-label="Default select example">
                        <c:forEach items="${listC}" var="o">
                            <option value="${o.id}">${o.name}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group">
                    <label>Brand</label>
                    <select name="brand" class="form-select" aria-label="Default select example">
                        <c:forEach items="${listB}" var="o">
                            <option value="${o.id}">${o.name}</option>
                        </c:forEach>
                    </select>
                </div>
                <button type="submit" value="UPDATE" class="btn btn-primary">Submit</button>
            </form>
        </div>

        <!-- Bootstrap JS and jQuery -->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

    </body>
</html>
