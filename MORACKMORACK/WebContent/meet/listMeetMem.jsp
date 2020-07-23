<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>모임 회원 목록 조회</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


<style>

</style>

</head>
<body>

<div class="container">
	<jsp:include page="/toolbar.jsp"/>
</div>

<div class="row" style="margin-left:30px">
	<jsp:include page="/meet/sidebar.jsp"/>
	<input type="hidden" id="meetId" value="${meetId}"/>
</div>

<div class="container">
<c:forEach var="joinMeetUser" items="${listJoinMeetUser}">
${joinMeetUser.user.profileImg} ${joinMeetUser.user.nickName}(${joinMeetUser.user.userId}) ${joinMeetUser.user.gender} ${joinMeetUser.user.birthday} 
<c:forEach var="category" items="${joinMeetUser.user.category}"> ${category} </c:forEach> 
<c:forEach var="blacklist" items="${joinMeetUser.blackList}"> ${blacklist} </c:forEach> 
</c:forEach>
</div>
</body>
</html>