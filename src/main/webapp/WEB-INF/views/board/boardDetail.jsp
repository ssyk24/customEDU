<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">

function deleteContent() {
	
		let seqNumber = document.getElementById('boardNumber').value;
		
	if (confirm("정말로 삭제하시겠습니까?")) {
		location.href = "deleteBoard.do?board_seq=" + seqNumber;
	};
	
}


function letsModify() {
	
	let seqNumber = document.getElementById('boardNumber').value;
	
	location.href = 'modifyBoard.go?board_seq=' + seqNumber;
}

</script>

</head>
<body>

 <!-- Begin Page Content -->
                <div class="container-fluid">

                    <div class="card shadow mb-4">
                    <div class="card-header py-3">
                     <h1 class="h3 mb-2 text-gray-800">게시판</h1>
                     
                        </div>
                        <div class="card-body">
                        
                        	<form action="writeBoard.do" method="post" enctype="multipart/form-data">
                    		<input type="hidden" id="boardNumber" name="board_seq" value="${param.board_seq}">
                    		
                            <div class="table-responsive">
                            
                            	<table class="table table-bordered border border-dark" id="dataTable" width="100%" cellspacing="0">
                            		<tr>
                            			<td width="20%" style="background-color: #f1f1f1;">게시판 타입</td>
                            			<td width="75%">자유 게시판</td>
                            		</tr>
                            		<tr>
                            			<td width="20%" style="background-color: #f1f1f1;">작성자</td>
                            			<td width="75%"> ${boardDetail.board_writer} </td>
                            		</tr>
                            		<tr>
                            			<td width="20%" style="background-color: #f1f1f1;">제목</td>
                            			<td width="75%"> ${boardDetail.board_title}  </td>
                            		</tr>
                            		<tr>
                            			<td width="20%" style="background-color: #f1f1f1;">내용</td>
                            			<td width="75%"> <pre><c:out value="${boardDetail.board_text}" /> </pre> </td>
                            		</tr>
                            		<tr>
                            			<td width="20%" style="background-color: #f1f1f1;">파일</td>
                            			<c:choose>
                            			<c:when test="${boardDetail.board_img_path != null}">
                            				<td width="75%"> <img src="resources/board_img/${boardDetail.board_img_path}" style="max-width: 800px;">  </td>
                            			</c:when>
                            			<c:otherwise>
                            				<td width="75%"> <img src="resources/board_img/noImage.png"> </td>
                            			</c:otherwise>
                            			</c:choose>
                            		</tr>
                            	</table>
                            	
                            	<div align="right">
                           	  <c:if test="${sessionScope.loginMember.custom_user_nick eq boardDetail.board_writer || sessionScope.loginMember.custom_user_nick eq 'adminEdu'}">
                           		 	<button type="button" class="btn btn-primary" onclick="return letsModify();">수정</button>
                           			 <button type="button" class="btn btn-primary" onclick="return deleteContent();">삭제</button>
                           	  </c:if> 
                           	  
                            		<button type="button" class="btn btn-primary" onclick="location.href = 'board.go';">목록으로</button> </span>
                            	</div>
                            
                            </div>
                            
                           </form>
                            
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


</body>
</html>