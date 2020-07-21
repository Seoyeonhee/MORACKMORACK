<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ include file="/webSocket.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>index</title>

<script src="https://code.jquery.com/jquery-3.1.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>

<script type ="text/javascript">

$(function(){
	var checkMeetCount = "${checkMeetCount}";
	
	if(checkMeetCount != ""){
	alert(checkMeetCount);
	}
})

</script>

</head>
<body>


<a href="/meet/addMeet">모임 생성</a><br/>
<a href="/meet/getMeet/meet01">모임 상세 조회</a><br/>
<a href="/meet/listMyMeet">내 모임 목록 조회</a><br/>
<a href="/meet/listMeet">모든 모임 목록 조회</a><br/>
</body>
</html>