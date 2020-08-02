<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>index</title>

<jsp:include page="/common/listCdn.jsp" />

<style>

</style>

<script type ="text/javascript">
$(function(){
	

$('#carousel-example-generic').carousel({
	// 슬리아딩 자동 순환 지연 시간
	// false면 자동 순환하지 않는다.
	interval: 1000,
	// hover를 설정하면 마우스를 가져대면 자동 순환이 멈춘다.
	pause: "hover",
	// 순환 설정, true면 1 -> 2가면 다시 1로 돌아가서 반복
	wrap: true,
	// 키보드 이벤트 설정 여부(?)
	keyboard : true
	});
	
});

</script>

 <style>
h2 {
 margin: 20px;
} 
</style>

</head>
<body>

<header>
<c:if test="${ ! empty sessionScope.business }">
<jsp:include page="/business/businessToolbar.jsp" />
</c:if>
<c:if test="${ empty sessionScope.business }">
<jsp:include page="/toolbar.jsp" />
</c:if>
</header>

<article>

<!-- carousel -->
<div style="width: 300px;margin: 100px;">
<div id="carousel-example-generic" class="carousel slide" >
<ol class="carousel-indicators">
<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
<li data-target="#carousel-example-generic" data-slide-to="1"></li>
<li data-target="#carousel-example-generic" data-slide-to="2"></li>
<li data-target="#carousel-example-generic" data-slide-to="3"></li>
<li data-target="#carousel-example-generic" data-slide-to="4"></li>
</ol>

<div class="carousel-inner" role="listbox">
<c:set var="i" value="1"/>
<c:forEach var="meet" items="${listMeetMain}">
<c:if test="${i == 1}">
<div class="item active">
</c:if>
<c:if test="${i != 1}">
<div class="item">
</c:if>
<img src="/resources/images/uploadFiles/meet/${meet.meetImg}" style="width:100%">
</div>
<c:set var="i" value="${i+1}"/>
</c:forEach>
</div>


<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
</a>

<a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
</a>
</div>
</div>

ddd
<c:forEach var="meet" items="${listMeetRank}">
eees
<div class="row" style="margin-top:180px"> <!-- 모임 순위 -->
  <div class="col-xs-6 col-md-4">
    <a href="#" class="thumbnail">
      <img src="/resources/images/uploadFiles/meet/${meet.meetImg}" alt="IMAGE">
    </a>
  </div>
  
 <!--  <div class="col-xs-6 col-md-4">
    <a href="#" class="thumbnail">
      <img src="..." alt="IMAGE">
    </a>
  </div>
  
  <div class="col-xs-6 col-md-4">
    <a href="#" class="thumbnail">
      <img src="..." alt="IMAGE">
    </a>
  </div>
  -->
</div> 
</c:forEach>  

<div class="row" style="margin-top:180px"> <!-- 업체 추천 -->
  <div class="col-xs-6 col-md-3"> 
    <a href="#" class="thumbnail">
      <img src="..." alt="...">
    </a>
  </div>
  
  <div class="col-xs-6 col-md-3">
    <a href="#" class="thumbnail">
      <img src="..." alt="...">
    </a>
  </div>
  
  <div class="col-xs-6 col-md-3">
    <a href="#" class="thumbnail">
      <img src="..." alt="...">
    </a>
  </div>
  
  <div class="col-xs-6 col-md-3">
    <a href="#" class="thumbnail">
      <img src="..." alt="...">
    </a>
  </div>
</div> 
<script id="embeddedChatbot" data-botId="B2k983" src="https://www.closer.ai/js/webchat.min.js"> </script>
</article>
</body>
</html>