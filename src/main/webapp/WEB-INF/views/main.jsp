<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">

    <title>CUSTO_EDU</title>

	<!-- 폰트 / CSS -->
    <link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    <link href="resources/css/sb-admin-2.min.css" rel="stylesheet">
    
    <!-- Custom styles for this page -->
    <link href="resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    
    <!-- Bootstrap / jQuery -->
    <script src="resources/vendor/jquery/jquery.min.js"></script>
    <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="resources/js/sb-admin-2.min.js"></script>
    
    <!-- Page level plugins -->
    <script src="resources/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>
    
    
    <!-- Page level custom scripts -->
    <script src="resources/js/demo/datatables-demo.js"></script>
    
    <!-- 유효성 검사 -->
    <script type="text/javascript" src="resources/js/registerCheck.js"></script>
    
    <script type="text/javascript">
    
    $(function() {
    	
    	$('#userDropdown').css("color", "gray");
    	
		$('#userDropdown').mouseover(function() {
			$('#userDropdown').css("background-color", "#4469d7");
			$('#userDropdown').css("color", "white");
			$('#guest').text("Login");
		});

		
		$('#userDropdown').mouseout(function() {
			$('#userDropdown').css("background-color", "");
			$('#userDropdown').css("color", "gray");
			$('#guest').text("Guest");
		});
		
		
		
	});
    
    </script>

</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion " id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center " href="main.go" id="siteLogo">
                <div class=" mx-3"><h4 style="font-weight: 1000;">CUSTOMEDU</h4></div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading" style="font-size: 9pt; border-radius: 10px;">
                PAGES
            </div>
            
            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
                    aria-expanded="true" aria-controls="collapsePages">
                    <i class="fas fa-fw fa-folder"></i>
                    <span style="font-size: 12pt;">게시판</span>
                </a>
                <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                    
                    <c:choose>
                    
                    	<c:when test="${sessionScope.loginMember == null}">
                    
                        <h6 class="collapse-header">LOGIN SCREENS:</h6>
                        <a class="collapse-item" href="login.go">Login</a>
                        <a class="collapse-item" href="register.go">Register</a>
                        <a class="collapse-item" href="forgetPswd.go">Forgot Password</a>
                        <div class="collapse-divider"></div>
                        <h6 class="collapse-header">OTHER PAGES:</h6>
                        <a class="collapse-item" href="board.go">Board</a>
                        <a class="collapse-item" href="#">Q&A</a>
                        <div class="collapse-divider"></div>
                        
                    	</c:when>
                    
                    	<c:when test="${sessionScope.loginMember.custom_user_auth eq '1'}">
                    
                        <h6 class="collapse-header">LOGINED:</h6>
                        <a class="collapse-item" href="login.go">Login</a>
                        <a class="collapse-item" href="register.go">Register</a>
                        <a class="collapse-item" href="forgetPswd.go">Forgot Password</a>
                        <div class="collapse-divider"></div>
                        <h6 class="collapse-header">OTHER PAGES:</h6>
                        <a class="collapse-item" href="board.go">Board</a>
                        <a class="collapse-item" href="#">Q&A</a>
                        <div class="collapse-divider"></div>
                        <h6 class="collapse-header">ADMIN PAGES:</h6>
                        <a class="collapse-item" href="manage.go">Member managment</a>
                        
                    	</c:when>
                    
                    	<c:when test="${sessionScope.loginMember.custom_user_auth eq '2'}">
                    
                        <h6 class="collapse-header">LOGINED</h6>
                        <a class="collapse-item" href="profile.go?custom_user_seq=${sessionScope.loginMember.custom_user_seq}">Profile</a>
                        <a class="collapse-item" href="logout.do">Logout</a>
                        <div class="collapse-divider"></div>
                        <h6 class="collapse-header">OTHER PAGES:</h6>
                        <a class="collapse-item" href="board.go">Board</a>
                        <a class="collapse-item" href="#">Q&A</a>
                        <div class="collapse-divider"></div>
                        
                    	</c:when>
                    	
                    </c:choose>
                        
                    </div>
                </div>
            </li>

        </ul>
        <!-- End of Sidebar -->





        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Sidebar Toggle (Topbar) -->
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>

                    <!-- Topbar Search -->
                    <form
                        class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                        <div class="input-group">
                            <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..."
                                aria-label="Search" aria-describedby="basic-addon2">
                            <div class="input-group-append">
                                <button class="btn btn-primary" type="button">
                                    <i class="fas fa-search fa-sm"></i>
                                </button>
                            </div>
                        </div>
                    </form>

                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">

                        <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                        <li class="nav-item dropdown no-arrow d-sm-none">
                            <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-search fa-fw"></i>
                            </a>
                            <!-- Dropdown - Messages -->
                            <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                                aria-labelledby="searchDropdown">
                                <form class="form-inline mr-auto w-100 navbar-search">
                                    <div class="input-group">
                                        <input type="text" class="form-control bg-light border-0 small"
                                            placeholder="Search for..." aria-label="Search"
                                            aria-describedby="basic-addon2">
                                        <div class="input-group-append">
                                            <button class="btn btn-primary" type="button">
                                                <i class="fas fa-search fa-sm"></i>
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </li>

						<!-- 로그인 안 되었을 때(guest) -->
						<c:if test="${sessionScope.loginMember == null}">
						<li class="nav-item" >
						  <a class="nav-link " href="login.go" id="userDropdown" style="border-radius:30px; height: 50px;"
                                 aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-600 small" id="guest" style="font-size: 12pt;">Guest</span>
                                <img class="img-profile rounded-circle" src="resources/img/undraw_profile.svg">
                          </a>
						 </li>
						 </c:if>

<!--  -->
						<!-- 로그인 했을 때 -->
						<c:if test="${sessionScope.loginMember != null}">
						
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" style="border-radius:30px; height: 50px; role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-600 small" id="loginPage" style="font-size: 11pt;">${sessionScope.loginMember.custom_user_nick} 님</span>
                                <img class="img-profile rounded-circle"  src="resources/img/undraw_profile.svg">
                            </a>
                            
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown">
                                <a class="dropdown-item" href="profile.go?custom_user_seq=${sessionScope.loginMember.custom_user_seq}">
                                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Profile
                                </a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="logout.do">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Logout
                                </a>
                            </div>
                        </li>
                        
                        </c:if>

                    </ul>

                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid"> 
                <jsp:include page="${contentPage}"></jsp:include>
                </div>



</body>

</html>