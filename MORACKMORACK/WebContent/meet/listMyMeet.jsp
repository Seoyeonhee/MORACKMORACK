<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>모임 목록 조회</title>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<script type="text/javascript">

$(function(){
	$("div").on("click", function(){
		var meetId = $(this).next.val();
		selef.location="/meet/getMeet"+meetId
	})
})

</script>

</head>
<body>
<c:forEach var="meetMem" items="${listMyMeet}">
<div>${meetMem.meet.meetId} ${meetMem.meet.meetName}</div> <input type="hidden" id="meetId" value="${meetMem.meet.meetId}"/>
</c:forEach>
</body>
</html>