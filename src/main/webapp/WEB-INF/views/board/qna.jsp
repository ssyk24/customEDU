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

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">Q & A</h1>
                    
                    <c:choose>
					<c:when test="${sessionScope.loginMember.custom_user_auth == '1'}">
						<div style="text-align: right; margin: 10px;"> 글쓰기 </div>	
						<div style="text-align: right; margin: 10px;"> 삭제 </div>	
					</c:when>
					
					<c:when test="${sessionScope.loginMember.custom_user_auth == '2'}">
						<div style="text-align: right; margin: 10px;"> 글쓰기 </div>	
					</c:when>
                    </c:choose>
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">회원 목록</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th> </th>
                                            <th>글 번호</th>
                                            <th>작성자</th>
                                            <th>제목</th>
                                            <th>내용</th>
                                            <th>수정일</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                         <tr>
                                            <td style="text-align: center;">  
                                             <input class="form-check-input" type="checkbox" id="inputCheck" style="width: 50px;"">
 											</td>
                                            <td>게시글</td>
                                            <td>게시글</td>
                                            <td>게시글</td>
                                            <td>게시글</td>
                                            <td>게시글</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    
                    
                   <%-- 	<c:otherwise>
					
					<h3 style="text-align: center;"> 관리자 전용 페이지 입니다. </h3>
					
					</c:otherwise>	 --%>
                    
                    

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