<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">

<title></title>

<script type="text/javascript">

	function goModPage() {
		
		var seq = document.getElementById("paramSeq").value;
		
		location.href = "modify.go?custom_user_seq=" + seq;
		
	};

	function doDelete() {
		
		var seq = document.getElementById("paramSeq").value;
		
		location.href = "delete.member?custom_user_seq=" + seq;
		
	};

</script>

</head>

<body id="page-top">

	<div class="row">

	<div class="col">
	
	<ul class="list-group list-group-item-action list-group-horizontal-sm">
		<li class="list-group-item" style="width: 120px; text-align: center;">Profile</li>
	</ul>
	<ul class="list-group list-group-horizontal-lg">
		<li class="list-group-item" style="width: 150px;">Email</li>
		<li class="list-group-item" style="width: 300px;">${user.custom_user_email}</li>
	</ul>
	<ul class="list-group list-group-horizontal-lg">
		<li class="list-group-item" style="width: 150px;">Name</li>
		<li class="list-group-item" style="width: 300px;">${user.custom_user_name}</li>
	</ul>
	<ul class="list-group list-group-horizontal-lg">
		<li class="list-group-item" style="width: 150px;">Birth Day</li>
		<li class="list-group-item" style="width: 300px;">${user.custom_user_birth}</li>
	</ul>
	<ul class="list-group list-group-horizontal-lg">
		<li class="list-group-item" style="width: 150px;">Nickname</li>
		<li class="list-group-item" style="width: 300px;">${user.custom_user_nick}</li>
	</ul>
	<ul class="list-group list-group-horizontal-lg">
		<li class="list-group-item" style="width: 150px;">Address</li>
		<li class="list-group-item" style="width: 300px;">${user.custom_user_address}</li>
	</ul>
	<ul class="list-group list-group-horizontal-lg">
		<li class="list-group-item" style="width: 150px;">Phone Number</li>
		<li class="list-group-item" style="width: 300px;">${user.custom_user_phone}</li>
	</ul>
	<ul class="list-group list-group-horizontal-lg">
		<li class="list-group-item" style="width: 150px;">?????????</li>
		<li class="list-group-item" style="width: 300px;">
		<fmt:formatDate value="${user.custom_user_reg_date}" dateStyle="long" />
		</li>
	</ul>
	<ul class="list-group list-group-horizontal-lg">
		<li class="list-group-item" style="width: 150px;">?????? ?????????</li>
		<li class="list-group-item" style="width: 300px;">
		<fmt:formatDate value="${user.custom_user_mod_date}" dateStyle="long" />
		</li>
	</ul>
	
	<c:if test="${sessionScope.loginMember == null}">
	<input type="hidden" id="paramSeq" name="custom_user_seq" value="${param.custom_user_seq}">
	<div class="btn" style="width: 450px; text-align: center;"> ????????? ????????? ?????? ???????????????. </div>
	</c:if>
	
	
	<c:if test="${sessionScope.loginMember != null}">
	<div class="btn row" style="width: 450px;">
	  <button id="mod_btn" type="button" class="btn btn-outline-primary" onclick="return goModPage();">??????</button>
	  <button id="del_btn" type="button" class="btn btn-outline-dark mx-5"  onclick="return doDelete();">????????????</button>
	</div>
	<input type="hidden" id="paramSeq" name="custom_user_seq" value="${param.custom_user_seq}">
	</c:if>
	
	</div>
	

	</div>  
	

</body>

</html>