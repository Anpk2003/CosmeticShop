<%-- 
    Document   : verify.jsp
    Created on : May 22, 2024, 10:20:09 PM
    Author     : Phung An
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="v" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="verify" method="post">
            <input type="text" name="authcode">
            <input type ="submit" value="VERIFY">
        </form>
        <h3 style="color: red">${sessionScope.msg}</h3>
    </body>
</html>
