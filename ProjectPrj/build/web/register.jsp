<%-- 
    Document   : register.jsp
    Created on : Mar 1, 2024, 9:32:57 AM
    Author     : Phung An
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Sign Up</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!--===============================================================================================-->	
        <link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
        <!--===============================================================================================-->	
        <link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
        <!--===============================================================================================-->	
        <link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="css/util.css">
        <link rel="stylesheet" type="text/css" href="css/main.css">
        <!--===============================================================================================-->
    </head>
    <body>

        <div class="limiter">
            <div class="container-login100">
                <div class="wrap-login100">
                    <form class="login100-form validate-form p-l-55 p-r-55 p-t-178" action="authentication?action=register" method="POST" >
                        <span class="login100-form-title">
                            ĐĂNG KÝ
                        </span>

                        <div class="wrap-input100 validate-input m-b-16" data-validate="Please enter username">
                            <input class="input100" type="text" name="user" placeholder="Tên tài khoản">
                            <span class="focus-input100"></span>
                        </div>
                        <div class="wrap-input100 validate-input m-b-16" data-validate="Please enter email">
                            <input class="input100" type="text" name="email" placeholder="Email">
                            <span class="focus-input100"></span>
                        </div>
                        <div class="wrap-input100 validate-input m-b-16 " data-validate = "Please enter password">
                            <input class="input100" type="password" name="pass" placeholder="Mật khẩu">
                            <span class="focus-input100"></span>
                        </div>

                        <div class="wrap-input100 validate-input m-b-16" data-validate = "Please enter password again">
                            <input class="input100" type="password" name="repass" placeholder="Nhập lại mật khẩu">
                            <span class="focus-input100"></span>
                        </div>
                        <input type="hidden" name="g-recaptcha-response" id="g-recaptcha-response">
                        <div style=" align-items: center;margin-left: 50px;margin-top: 20px " class="g-recaptcha" data-sitekey="6LefS_ApAAAAAG7d6P0zRbGoed8oK2dwNnez6agN"></div>
                        <br/>
                        <div class="container-login100-form-btn" style="margin-top: 20px">
                              <p style="color:red" ><b>${requestScope.Recaptcha}</b></p>
                            <button type="submit" class="login100-form-btn">
                                ĐĂNG KÝ
                            </button>
                        </div>
                        <h5 style="color: red;padding-top: 5px">${requestScope.error}</h5>

                        <div class="flex-col-c p-t-100 p-b-40" >
                            <span class="txt1 p-b-9">
                                Đã có tài khoản
                            </span>

                            <a href="login.jsp" class="txt3">
                                ĐĂNG NHẬP NGAY
                            </a>
                        </div>
                    </form>
                </div>
            </div>
        </div>


        <!--===============================================================================================-->
        <script src="vendor/jquery/jquery-3.2.1.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/animsition/js/animsition.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/bootstrap/js/popper.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/select2/select2.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/daterangepicker/moment.min.js"></script>
        <script src="vendor/daterangepicker/daterangepicker.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/countdowntime/countdowntime.js"></script>
        <!--===============================================================================================-->
        <script src="js/main.js"></script>
        <!-- recaptcha -->
        <script src="https://www.google.com/recaptcha/api.js" async defer></script>
        <script>
            function onSubmit() {
                var response = grecaptcha.getResponse();
                document.getElementById('g-recaptcha-response').value = response;
            }
        </script>
    </body>
</html>

