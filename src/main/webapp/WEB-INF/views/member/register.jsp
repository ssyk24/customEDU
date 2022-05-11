<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>CUSTOMEDU - Register</title>

    <!-- Custom fonts for this template-->
    <link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="resources/css/sb-admin-2.min.css" rel="stylesheet">

    
    <!-- Bootstrap core JavaScript-->
    <script src="resources/vendor/jquery/jquery.min.js"></script>
    <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="resources/js/sb-admin-2.min.js"></script>
    
    <!-- 유효성 검사 -->
    <script type="text/javascript" src="resources/js/check.js"></script>
    
    
</head>

<body class="bg-gradient-primary">

    <div class="container">

        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row">
                    <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
                    <div class="col-lg-7">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">Create an Account!</h1>
                            </div>
                            
                            
                            
                            
                            <form class="registerInfo" action="register.do" method="post">
                            
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="text" class="form-control form-control-user" id="inputName" name="custom_user_name"
                                            placeholder="Name">
                                     <span class="ps-1" id="name_check" style="color: green;"></span>
                                    </div>
                                    <div class="col-sm-6">
                                        <input type="text" class="form-control form-control-user" id="inputBirth" name="custom_user_birth"
                                            placeholder="Birth ex)19990101" maxlength="8">
                                        <span class="ps-1" id="birth_check" style="color: green;"></span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control form-control-user" id="inputNickname" name="custom_user_nick"
                                        placeholder="Nickname(30자 이하)" maxlength="30">
                                    <span class="ps-1" id="nickname_check" style="color: green;"></span>
                                </div>
                                <div class="form-group">
                                    <input type="email" class="form-control form-control-user" id="inputEmail" name="custom_user_email"
                                        placeholder="Email Address">
                                     <span class="ps-1" id="email_check" style="color: green;"></span>
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control form-control-user" id="inputAddress" name="custom_user_address"
                                        placeholder="Address">
                                    <span class="ps-1" id="address_check" style="color: green;"></span>
                                </div>
                                <div class="form-group">
                                    <input type="tel" class="form-control form-control-user" id="inputPhone" name="custom_user_phone"
                                        placeholder="Phone ex)010-0000-0000" maxlength="13">
                                    <span class="ps-1" id="phone_check" style="color: green;"></span>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="password" class="form-control form-control-user" maxlength="20"
                                            id="inputPassword" name="custom_user_pswd" placeholder="Password">
                                        <span class="ps-1" id="password_check" style="color: green;"></span>
                                    </div>
                                    <div class="col-sm-6">
                                        <input type="password" class="form-control form-control-user"
                                            id="inputPWcheck" name="custom_user_pswd_check" placeholder="Repeat Password">
                                   		<span class="ps-1" id="pwCheck_check" style="color: green;"></span>
                                    </div>
                                </div>
                                <button class="btn btn-primary btn-user btn-block" id="reg_account">  
                                    Register Account
                                </button>
                            </form>
                                
                                <hr>
                                <button href="#" class="btn btn-google btn-user btn-block">
                                    <i class="fab fa-google fa-fw"></i> Register with Google
                                </button>
                                <button href="#l" class="btn btn-facebook btn-user btn-block">
                                    <i class="fab fa-facebook-f fa-fw"></i> Register with Facebook
                                </button>
                            
                            
                            <hr>
                            <!-- 5. 클릭시 해당 페이지 이동 -->
                            <div class="text-center">
                                <a class="small" href="forgetPswd.go">Forgot Password?</a>
                            </div>
                            <div class="text-center">
                                <a class="small" href="login.go">Already have an account? Login!</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

</body>

</html>