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


<a href="/meet/addMeet">���� ����</a><br/>
<a href="/meet/getMeet/meet01">���� �� ��ȸ</a><br/>
<a href="/meet/listMyMeet">�� ���� ��� ��ȸ</a><br/>
<a href="/meet/listMeet">��� ���� ��� ��ȸ</a><br/>
</body>
</html>