<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>친구 신청 조회</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


<style>

</style>

<script type ="text/javascript">
$(function(){
	$("#getFriend").on("click", function(){
		var friendNo = $(this).next().next().next().val();
		window.location.href = "/friend/getFriend/"+friendNo;
	})
	
	$("#okFriend").on("click", function(){
		var friendNo = $(this).next().next().val();
		window.location.href = "/friend/mangFriend/"+friendNo+"/1";
	})
	
	$("#denyFriend").on("click", function(){
		var friendNo = $(this).next().val();
		window.location.href = "/friend/mangFriend/"+friendNo+"/0";
	})
})
</script>

</head>
<body>

<header>
<jsp:include page="/toolbar.jsp" />
</header>

<section style="float: left; margin-top:100px;">
<jsp:include page="/friend/sidebar.jsp" />
</section>

<c:forEach var="friend" items="${listFriend}">
${friend.reqFriend.userId}
<input type="button" id="getFriend" value="상세 조회">
<input type="button" id="okFriend" value="승인"> 
<input type="button" id="denyFriend" value="거절">
<input type="hidden" value="${friend.friendNo}"/>
<br/><br/>

</c:forEach>

</body>
</html>