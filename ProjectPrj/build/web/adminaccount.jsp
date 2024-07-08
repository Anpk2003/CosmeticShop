<%-- 
    Document   : adminaccount.jsp
    Created on : Mar 4, 2024, 7:52:56 PM
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
        <title>Manage account</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="css/manager.css" rel="stylesheet" type="text/css"/>
        <style>
            img{
                width: 200px;
                height: 120px;
            }
        </style>

    </head>
    <body>

        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2>Information <b>Account</b></h2>
                        </div>

                    </div>
                </div>
                <table class="table table-striped table-hover" style="border: 10px">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Username</th>
                            <th>Admin</th>
                            <th>Update Admin</th>
                        </tr>
                    </thead>

                    <tbody>
                        <c:forEach items="${requestScope.Lista}" var="c">
                        <form class="form-control" id="exampleSelect1" action="updateaccount?id=${c.id}" method="post">

                            <tr>
                                <td>${c.id}</td>
                                <td>${c.username}</td>
                                <td>${c.isAdmin}</td>
                                <td style="width: 40%">  
                                    <select name="updateaccount" >
                                        <option value="False" ${c.isAdmin == "False" ? 'selected':''}>User</option>
                                        <option value="True" ${c.isAdmin == "True" ? 'selected':''}>Admin</option>
                                    </select>
                                    <input type="submit" value="UPDATE" style="width: 20%">
                                </td>
                            </tr>
                        </form>

                    </c:forEach>
                    </tbody>

                </table>

                <a href="home"><button type="button" class="btn btn-primary">Back to home</button>

            </div>

    </body>
</html>
