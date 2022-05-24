<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

 <!-- Begin Page Content -->
                <div class="container-fluid">

					<c:choose>

					<c:when test="${sessionScope.loginMember.custom_user_auth eq '1'}">
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">회원 목록</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>이름</th>
                                            <th>닉네임</th>
                                            <th>메일</th>
                                            <th>휴대폰번호</th>
                                            <th>주소</th>
                                            <th>유저 권한</th>
                                            <th>탈퇴 여부</th>
                                        </tr>
                                    </thead>
                                    
                                    <tfoot>
                                        <tr>
                                             <th>이름</th>
                                            <th>닉네임</th>
                                            <th>메일</th>
                                            <th>휴대폰번호</th>
                                            <th>주소</th>
                                            <th>유저 권한</th>
                                            <th>탈퇴 여부</th>
                                        </tr>
                                    </tfoot>
                                    
                                    
                                    <tbody>
                                    	<c:forEach items="${membersInfo}" var="m">
                                         <tr>
                                            <td>${m.custom_user_name}</td>
                                            <td>${m.custom_user_nick}</td>
                                            <td>${m.custom_user_email}</td>
                                            <td>${m.custom_user_phone}</td>
                                            <td>${m.custom_user_address}</td>
                                            <td>${m.custom_user_auth}</td>
                                            <td>${m.custom_user_del_yn}</td>
                                        </tr>
                                    	</c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    </c:when>
                    
                    
                   	<c:otherwise>
					
					<h3 style="text-align: center;"> 관리자 전용 페이지 입니다. </h3>
					
					</c:otherwise>	
                    
                    
                    </c:choose>

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Your Website 2020</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
                </div>
            </div>
        </div>
    </div>

</body>
</html>