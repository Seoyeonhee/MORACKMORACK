<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ include file="/webSocket.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>유형 모임 목록</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


<style>

</style>


<script type ="text/javascript">

$(function (){
	
	$("#meetImg, #meetName").on("click", function(){
		var meetId = $(this).next().val();
		self.location="/meet/getMeet/"+meetId;
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
  <div class="col-md-2"><h3>모임명</h3></div>
  <div class="col-md-2"><h3>가입 날짜</h3></div>
  <div class="col-md-2"><h3>현재 인원/모임 정원</h3></div>
  <div class="col-md-2"><h3>모임 카테고리</h3></div>
</div> 

<c:forEach var="meet" items="${listMeet}">
<div class="row" id="div">
  <div class="col-md-2" id="meetImg" style="margin-top:50px">${meet.meetImg}</div>
  <div class="col-md-2" id="meetName">${meet.meetName}</div> 
  <input type="hidden" id="meetId" value="${meet.meetId}"/>
  <div class="col-md-2">${meet.memNum}/${meet.maxNum}</div>
  <div class="col-md-2">
 	<c:choose>
		<c:when test="${meet.category eq 1}">여행</c:when>
		<c:when test="${meet.category eq 2}">게임</c:when>
		<c:when test="${meet.category eq 3}">음악</c:when>
		<c:when test="${meet.category eq 4}">영화</c:when>
		<c:when test="${meet.category eq 5}">공연</c:when>
		<c:when test="${meet.category eq 6}">맛집</c:when>
		<c:when test="${meet.category eq 7}">취업/자기계발</c:when>
		<c:when test="${meet.category eq 8}">액티비티</c:when>
		<c:when test="${meet.category eq 9}">독서/만화</c:when>
		<c:when test="${meet.category eq 10}">댄스</c:when>
		<c:when test="${meet.category eq 11}">사진</c:when>
		<c:when test="${meet.category eq 12}">반려동물</c:when>
		<c:when test="${meet.category eq 13}">요리</c:when>
		<c:when test="${meet.category eq 14}">차</c:when>
		<c:when test="${meet.category eq 15}">스포츠</c:when>
		<c:when test="${meet.category eq 16}">공예</c:when>
		<c:when test="${meet.category eq 17}">기타</c:when>
	</c:choose>
  </div>
</div>  
</c:forEach>

</body>
</html>