<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>발신 쪽지 상세 조회</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


<style>

</style>


<script type ="text/javascript">

$(function (){
	
	$("#ok").on("click", function(){
		window.history.back();
	})
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
<strong>쪽지 제목</strong> ${message.title} <br/><br/>
<strong>받는 사람</strong><br/>
<strong>모임명</strong>${message.meetName} <br/>
<strong>수신자 ID</strong>  ${message.receiver.userId} / <strong>발신자 ID</strong>  ${message.sender.userId} <br/>
<strong>수신자 닉네임</strong> ${message.receiver.nickName} / <strong>발신자 닉네임</strong>  ${message.sender.nickName} <br/><br/>

<strong>보낸 사람</strong> ${message.sender.userId} / <strong>받은 사람</strong> ${message.receiver.userId} <br/><br/>

<strong>쪽지 보낸 날짜</strong> ${message.sendDate} <br/><br/>

${message.content} <br/><br/>

<button type="button" id="delMessage">삭제</button>
<button type="button" id="ok">확인</button>
</aside>

</body>
</html>