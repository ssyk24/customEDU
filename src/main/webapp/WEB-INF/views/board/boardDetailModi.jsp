<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

 <!-- Begin Page Content -->
                <div class="container-fluid">

                    <div class="card shadow mb-4">
                    <div class="card-header py-3">
                     <h1 class="h3 mb-2 text-gray-800">게시판</h1>
                     
                        </div>
                        <div class="card-body">
                        
                        	<form action="modifyBoard.do" method="post" enctype="multipart/form-data">
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
                            			<td width="75%"> <input name="board_title" style="width: 70%;" required="required" value="${boardDetail.board_title}"> </td>
                            		</tr>
                            		<tr>
                            			<td width="20%" style="background-color: #f1f1f1;">내용</td>
                            			<td width="75%">
                            			 <textarea name="board_text" class="form border border-dark" style="height: 280px; width: 80%; resize: none; border-radius: 3px;" 
                            			 required="required">${boardDetail.board_text}</textarea>
                            			</td>
                            		</tr>
                            		<tr>
                            			<td width="20%" style="background-color: #f1f1f1;">파일</td>
                            				<td width="75%"> 
                            			<c:if test="${boardDetail.board_img_path != null}">
                            				<img src="resources/board_img/${boardDetail.board_img_path}" style="max-width: 800px;"> <br>
                            				${boardDetail.board_img_path} <br> <br>
                            			</c:if>
                            				<input id="modify_file" name="board_img_path" type="file" class="border border-dark" style="border-radius: 3px;">
                            				 </td>
                            		</tr>
                            	</table>
                            	
                           	  <c:if test="${sessionScope.loginMember.custom_user_nick eq boardDetail.board_writer || sessionScope.loginMember.custom_user_nick eq 'adminEdu'}">
                            	<div align="right">
                           		 	<button class="btn btn-primary">수정하기</button>
                            	</div>
                           	  </c:if> 
                            
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