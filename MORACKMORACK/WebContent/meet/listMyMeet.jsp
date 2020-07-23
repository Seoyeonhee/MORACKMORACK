<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>나의 모임 목록 조회</title>

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
	
	$("#outMeet").on("click", function(){ //탈퇴
		self.location="/meet/delMeet/"+meetId+"/0";
	})
	
	$("#delMeet").on("click", function(){ //삭제
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
  <div class="col-md-2"><h3>모임명</h3></div>
  <div class="col-md-2"><h3>가입 날짜</h3></div>
  <div class="col-md-2"><h3>현재 인원/모임 정원</h3></div>
  <div class="col-md-2"><h3>모임 카테고리</h3></div>
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
		<c:when test="${meet.category eq 0}">여행</c:when>
		<c:when test="${meet.category eq 1}">게임</c:when>
		<c:when test="${meet.category eq 2}">음악</c:when>
		<c:when test="${meet.category eq 3}">영화</c:when>
		<c:when test="${meet.category eq 4}">공연</c:when>
		<c:when test="${meet.category eq 5}">맛집</c:when>
		<c:when test="${meet.category eq 6}">취업/자기계발</c:when>
		<c:when test="${meet.category eq 7}">액티비티</c:when>
		<c:when test="${meet.category eq 8}">독서/만화</c:when>
		<c:when test="${meet.category eq 9}">댄스</c:when>
		<c:when test="${meet.category eq 10}">사진</c:when>
		<c:when test="${meet.category eq 11}">반려동물</c:when>
		<c:when test="${meet.category eq 12}">요리</c:when>
		<c:when test="${meet.category eq 13}">차</c:when>
		<c:when test="${meet.category eq 14}">스포츠</c:when>
		<c:when test="${meet.category eq 15}">공예</c:when>
		<c:when test="${meet.category eq 16}">기타</c:when>
	</c:choose>
  </div>
 		 <div class="col-md-2">
 		 <p><input type="button" id="outMeet" value="모임 탈퇴"/></p>
 		 <input type="button" id="delMeet" value="모임 삭제"/>
 		 </div>
</div>  
</c:forEach>

</body>
</html>