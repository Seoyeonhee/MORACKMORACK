<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>발신 쪽지 목록</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


<style>

</style>


<script type ="text/javascript">

$(function (){
	
	$("td[id^='getMessage']").on("click", function(){
		var messageNo = $(this).next().val();
		self.location="/message/getMessage/"+ messageNo;
	});
})
</script>

</head>

<body>

<header>
<jsp:include page="/toolbar.jsp" />
</header>

<section style="float: left; margin-top:100px;">
<jsp:include page="/message/sidebar.jsp" />
</section>

<aside>
보낸 쪽지함

<section style="float: left; margin-left:100px; margin-top:100px">
<div style="text-align: center;">
<section id="container" style="text-align: center;">
    <table class="table table-hover">

<c:forEach var="message" items="${listSendMessage}">
<tr>
<td>
<c:if test="${!empty message.receiver.profileImg}">
       	<img class="sidebar-image" src="/resources/images/uploadFiles/user/${message.receiver.profileImg}">
       	</c:if>
       	<c:if test="${empty message.receiver.profileImg and message.receiver.gender eq '남'}">
       	<img class="sidebar-image" src="/resources/images/uploadFiles/man.png">
       	</c:if>
       	<c:if test="${empty message.receiver.profileImg and message.receiver.gender eq '여'}">
       	<img class="sidebar-image" src="/resources/images/uploadFiles/woman.png">
       	</c:if>
<td>${message.meetName} <br/>${message.receiver.userId}<br/> ${message.receiver.nickName}</td>
<td id="getMessage"> ${message.title}</td>
<input type="hidden" value="${message.messageNo}"/>
<td id="getMessage"> <fmt:formatDate value="${message.sendDate}" pattern="yyyy.MM.dd" /></td>
<input type="hidden" value="${message.messageNo}"/>
</tr>
</c:forEach>
</table>
</section>
</div>
</section>

</aside>

</body>
</html>