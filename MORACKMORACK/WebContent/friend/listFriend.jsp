<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>내 친구  목록</title>

<jsp:include page="/common/listCdn.jsp" />

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
${friend.myFriend.userId}
<input type="button" id="delFriend" value="친구 삭제"/>
<input type="hidden" value="${friend.friendNo}"/>
<br/><br/>
</c:forEach>

</body>
</html>