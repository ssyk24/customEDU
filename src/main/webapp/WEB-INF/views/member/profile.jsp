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


	<ul class="list-group list-group-item-action list-group-horizontal-sm">
		<li class="list-group-item" style="width: 120px;">Profile</li>
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
	

</body>

</html>