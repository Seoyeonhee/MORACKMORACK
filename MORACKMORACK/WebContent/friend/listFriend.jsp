<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>내 친구  목록</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


<style>

</style>

<script type ="text/javascript">
$(function(){
	
	$("#delFriend").on("click", function(){
		var friendNo = $(this).next().val();
		window.location.href = "/friend/mangFriend/"+friendNo+"/0";
	})
	
});
</script>

</head>
<body>

<header>
<jsp:include page="/toolbar.jsp" />
</header>

<section style="float: left; margin-top:100px;">
<jsp:include page="/friend/sidebar.jsp" />
</section>

<strong> 내 친구 ${friendCount} 명 </strong>
<br/><br/>

<c:forEach var="friend" items="${listFriend}">
친구 이름 : 
<c:if test="${user.userId eq friend.reqFriend.userId}">${friend.recvFriend.userId}</c:if> 
<c:if test="${user.userId eq friend.recvFriend.userId}">${friend.reqFriend.userId}</c:if>
<input type="button" id="delFriend" value="친구 삭제"/>
<input type="hidden" value="${friend.friendNo}"/>
<br/><br/>
</c:forEach>

</body>
</html>