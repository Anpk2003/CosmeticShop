<%-- 
    Document   : adminproduct
    Created on : Mar 3, 2024, 9:43:53 PM
    Author     : Phung An
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Bootstrap CRUD Data Table for Database with Modal Form</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="css/manager.css" rel="stylesheet" type="text/css"/>
        <style>
            img{
                width: 120px;
                height: 120px;
            }
        </style>
        <script type="text/javascript">
            function doDelete(id) {
                if (confirm("Are you sure to delete catogery with id: " + id)) {
                    //  tra ve 1 servlet co urlpart la delete
                    window.location = "delete?action=deletecategory&cid=" + id;
                }
            }
        </script>
    </head>
    <body>

        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <a href="manage.jsp">
                                  <h2>Manage <b>Category</b></h2>
                            </a>
                          
                        </div>
                        <div class="col-sm-6">
                            <a href="addcategory.jsp" class="btn btn-primary" style="margin: 10px"><i class="material-icons">&#xE147;</i> <span>Add New Category</span></a>
                        </div>
                        <h3>${requestScope.message}</h3>
                    </div>
                </div>
                <table class="table table-striped table-hover" style="border: 10px">
                    <thead>
                        <tr>

                            <th>ID</th>
                            <th>Name</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${requestScope.listC}" var="o">
                            <tr>
                                <td>${o.id}</td>
                                <td>${o.name}</td>
                                <td>
                                    <a href="updatec?id=${o.id}"  class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                   <a href="#" onclick="doDelete('${o.id}')"class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
                                    
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
 
            <a href="home"><button type="button" class="btn btn-primary">Back to home</button>

        </div>


        <script src="js/manager.js" type="text/javascript"></script>
    </body>
</html>
