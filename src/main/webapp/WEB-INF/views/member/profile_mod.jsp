<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">

<title></title>

</head>

<body id="page-top">

	<form action="modify.do" method="post">
	<input type="hidden" name="custom_user_seq" value="${param.custom_user_seq}">
	<div class="row">

	<div class="col">
	
	<ul class="list-group list-group-item-action list-group-horizontal-sm">
		<li class="list-group-item" style="width: 120px; text-align: center;">Profile</li>
	</ul>
	<ul class="list-group list-group-horizontal-lg">
		<li class="list-group-item" style="width: 150px; text-align: center;">  Email </li>
		<li class="list-group-item" style="width: 400px;">${user.custom_user_email}</li>
	</ul>
	<ul class="list-group list-group-horizontal-lg">
		<li class="list-group-item" style="width: 150px; text-align: center;">Name</li>
		<li class="list-group-item" style="width: 400px;"> 
		 <input id="inputName" name="custom_user_name" class="form-control" type="text" 
		  style="width: 300px;" value="${user.custom_user_name}">
		  <span class="ps-1" id="name_check" style="color: green;"></span>
		</li>
	</ul>
	<ul class="list-group list-group-horizontal-lg">
		<li class="list-group-item" style="width: 150px; text-align: center;">Birth Day</li>
		<li class="list-group-item" style="width: 400px;"> ${user.custom_user_birth} </li>
	</ul>
	<ul class="list-group list-group-horizontal-lg">
		<li class="list-group-item" style="width: 150px; text-align: center;">Nickname</li>
		<li class="list-group-item" style="width: 400px;"> 
		 <input id="inputNickname" name="custom_user_nick" class="form-control" type="text" 
		  style="width: 300px;" value="${user.custom_user_nick}">
		   <span class="ps-1" id="nickname_check" style="color: green;"></span>
		</li>
	</ul>
	<ul class="list-group list-group-horizontal-lg">
		<li class="list-group-item" style="width: 150px; text-align: center;">Address</li>
		<li class="list-group-item" style="width: 400px;"> 
		 <input id="inputAddress" name="custom_user_address" class="form-control" type="text" 
		  style="width: 300px;" value="${user.custom_user_address}">
		   <span class="ps-1" id="address_check" style="color: green;"></span>
		</li>
	</ul>
	<ul class="list-group list-group-horizontal-lg">
		<li class="list-group-item" style="width: 150px; text-align: center;">Phone Number</li>
		<li class="list-group-item" style="width: 400px;"> 
		 <input id="inputPhone" name="custom_user_phone" class="form-control" type="text"
		  style="width: 300px;" value="${user.custom_user_phone}">
		   <span class="ps-1" id="phone_check" style="color: green;"></span>
		</li>
	</ul>
	
	<div class="btn" style="width: 450px;">
	  <button class="btn btn-outline-primary" id="reg_account">수정하기</button>
	</div>
	
	</div>

	</div>  
	</form>
	

</body>

</html>