<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ���� ��� ��ȸ</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript">

$(function(){
	//var meetId = $("#div").children().val();
	
	$("#meetImg, #meetName").on("click", function(){
		var meetId = $(this).next().val();
		self.location="/meet/getMeet/"+meetId;
	})
	
	$("#outMeet").on("click", function(){ //Ż��
		self.location="/meet/delMeet/"+meetId+"/0";
	})
	
	$("#delMeet").on("click", function(){ //����
		self.location="/meet/delMeet/"+meetId+"/1";
	})
})

</script>

</head>
<body>

<div class="container">
	<jsp:include page="/toolbar.jsp"/>
</div>

<div class="row">
  <div class="col-md-2"></div>
  <div class="col-md-2"><h3>���Ӹ�</h3></div>
  <div class="col-md-2"><h3>���� ��¥</h3></div>
  <div class="col-md-2"><h3>���� �ο�/���� ����</h3></div>
  <div class="col-md-2"><h3>���� ī�װ�</h3></div>
</div> 

<c:forEach var="meetMem" items="${listMyMeet}">
<div class="row" id="div">
  <div class="col-md-2" id="meetImg" style="margin-top:50px">${meetMem.meet.meetImg}</div>
  <div class="col-md-2" id="meetName">${meetMem.meet.meetName}</div> 
  <input type="hidden" id="meetId" value="${meetMem.meet.meetId}"/>
  <div class="col-md-2"><fmt:formatDate value="${meetMem.joinDate}" pattern="yyyy.MM.dd" /></div>
  <div class="col-md-2">${meetMem.meet.memNum}/${meetMem.meet.maxNum}</div>
  <div class="col-md-2">
 	<c:choose>
		<c:when test="${meet.category eq 0}">����</c:when>
		<c:when test="${meet.category eq 1}">����</c:when>
		<c:when test="${meet.category eq 2}">����</c:when>
		<c:when test="${meet.category eq 3}">��ȭ</c:when>
		<c:when test="${meet.category eq 4}">����</c:when>
		<c:when test="${meet.category eq 5}">����</c:when>
		<c:when test="${meet.category eq 6}">���/�ڱ���</c:when>
		<c:when test="${meet.category eq 7}">��Ƽ��Ƽ</c:when>
		<c:when test="${meet.category eq 8}">����/��ȭ</c:when>
		<c:when test="${meet.category eq 9}">��</c:when>
		<c:when test="${meet.category eq 10}">����</c:when>
		<c:when test="${meet.category eq 11}">�ݷ�����</c:when>
		<c:when test="${meet.category eq 12}">�丮</c:when>
		<c:when test="${meet.category eq 13}">��</c:when>
		<c:when test="${meet.category eq 14}">������</c:when>
		<c:when test="${meet.category eq 15}">����</c:when>
		<c:when test="${meet.category eq 16}">��Ÿ</c:when>
	</c:choose>
  </div>
 		 <div class="col-md-2">
 		 <p><input type="button" id="outMeet" value="���� Ż��"/></p>
 		 <input type="button" id="delMeet" value="���� ����"/>
 		 </div>
</div>  
</c:forEach>

</body>
</html>