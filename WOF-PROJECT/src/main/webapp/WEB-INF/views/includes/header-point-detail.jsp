<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>WOF ver.Spring</title>

<!-- Favicon -->
<link rel="icon" href="/resources/template/assets/img/brand/favicon.png"
	type="image/png">
<!-- Fonts -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700">
<!-- Icons -->
<link rel="stylesheet"
	href="/resources/template/assets/vendor/nucleo/css/nucleo.css"
	type="text/css">
<link rel="stylesheet"
	href="/resources/template/assets/vendor/@fortawesome/fontawesome-free/css/all.min.css"
	type="text/css">
<!-- Argon CSS -->
<link rel="stylesheet"
	href="/resources/template/assets/css/argon.css?v=1.2.0" type="text/css">
<link rel="stylesheet" type="text/css"
	href="/resources/template/assets/css/argon.css" media="all" />
</head>

<body>


	<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal.member" var="member"/>	
	</sec:authorize>

<!-- Main content -->
<!-- <div class="main-content" id="panel"> -->

