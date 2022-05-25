<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">


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
                    		<input type="hidden" id="userNumber" name="custom_user_seq" value="${param.custom_user_seq}">
                    		
                            <div class="table-responsive">
                            
                            	<table class="table table-bordered border border-light" id="dataTable" width="100%" cellspacing="0">
                            		<tr>
                            			<td width="20%" style="background-color: #f1f1f1;">게시판 타입</td>
                            			<td width="75%">자유 게시판</td>
                            		</tr>
                            		<tr>
                            			<td width="20%" style="background-color: #f1f1f1;">작성자</td>
                            			<td width="75%"> <input value="${sessionScope.loginMember.custom_user_nick}" required="required"> </td>
                            		</tr>
                            		<tr>
                            			<td width="20%" style="background-color: #f1f1f1;">제목</td>
                            			<td width="75%"> <input style="width: 70%;" required="required"> </td>
                            		</tr>
                            		<tr>
                            			<td width="20%" style="background-color: #f1f1f1;">내용</td>
                            			<td width="75%"> 
                            			<textarea class="form border border-dark" placeholder="게시글의 내용을 입력해주세요."
                            			 id="" style="height: 280px; width: 80%; resize: none; border-radius: 3px;" required="required"></textarea>
										  </td>
                            		</tr>
                            		<tr>
                            			<td width="20%" style="background-color: #f1f1f1;">파일</td>
                            			<td width="75%"> <input type="file" class="border border-dark" id="" style="border-radius: 3px;" required="required"> </td>
                            		</tr>
                            	</table>
                            	
                            	<div align="right">
                           		 <button type="button" class="btn btn-primary" onclick="return history.back();">목록으로</button>
                           		 <c:if test="${sessionScope.loginMember != null}">
                           		 <button class="btn btn-primary" onclick="return confirm('저장하시겠습니까?');">글쓰기</button>
                           		 </c:if>
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