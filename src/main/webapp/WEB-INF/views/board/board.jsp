<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">

function goWritePage() {
	
	var userNum = document.getElementById('userNumber').value;
	
	location.href = "writeBoard.go?custom_user_seq=" + userNum;
}

</script>

</head>
<body>

 <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">게시판</h1>
                    
                    <div class="card shadow mb-4">
                    <div class="card-header py-3">
                     
                     <input type="hidden" id="userNumber" name="custom_user_seq" value="${sessionScope.loginMember.custom_user_seq}">
                     
					<c:choose>
					<c:when test="${sessionScope.loginMember.custom_user_auth == '1'}">
						<div style="text-align: right;">
							<button class="btn btn-primary"  onclick="return goWritePage();">글쓰기</button>
							<button type="button" class="btn btn-primary" onclick="">삭제</button>
						</div>
					</c:when>
					
					<c:when test="${sessionScope.loginMember.custom_user_auth == '2'}">
						<div style="text-align: right;"> 
							<button type="button" class="btn btn-primary" onclick="return goWritePage();">글쓰기</button>
						</div>	
					</c:when>
                    </c:choose>
                        
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
                                            <th> 마지막 수정일</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    
                                    <c:forEach items="${boardList}" var="b">
                                         <tr>
                                            <td style="text-align: center;">  
                                             <input class="form-check-input" type="checkbox" id="inputCheck" style="width: 50px;"">
 											</td>
                                            <td>${b.board_seq}</td>
                                            <td> ${b.board_writer}</td>
                                            <td> <a href="board.detail?board_seq=${b.board_seq}"> ${b.board_title} </a> </td>
                                            <td>${b.board_text}</td>
                                            <td> <fmt:formatDate dateStyle="long" value="${b.board_mod_date}"/> </td>
                                        </tr>
                                    </c:forEach>
                                    
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    

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


</body>
</html>