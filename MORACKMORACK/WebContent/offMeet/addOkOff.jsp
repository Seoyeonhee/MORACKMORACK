<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">

<head>
	<meta charset="EUC-KR">

	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	

   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   

   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	

	<style>
 		body {
            padding-top : 50px;
        }
     </style>
     
<script type="text/javascript">

	
	
$(function() {
	//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	$("a[href='#' ]").on("click" , function() {
		var meetId = $(this).next().val();
		self.location="/meet/getMeet/"+meetId

	});
});	

</script>
</head>

<body>


<header>
<jsp:include page="/toolbar.jsp" />
</header>

<div class="container">
	

	 
	 
	<div class="page-header">
	     <h3 class=" text-info">오프라인모임 생성 확인</h3>
	     
	</div>
	

	
    <div class="row">
	  	<div class="col-xs-4 col-md-2 "><strong>오프라인모임명</strong></div>
		<div class="col-xs-8 col-md-4">${offMeet.offName}</div>
	</div>
	
	
 <hr/>
 	
 	<div class="row"> 
	  	<div class="col-xs-4 col-md-2 "><strong>모임장소</strong></div> 
 		<div class="col-xs-8 col-md-4">${offMeet.offLoc}</div> 
	</div> 
	
	
	
 <hr/>	
	
	<div class="row"> 
 		<div class="col-xs-4 col-md-2 "><strong>모임날짜</strong></div> 
 		<div class="col-xs-8 col-md-4">${offMeet.offDate }</div> 
 	</div> 
 
 <hr/>
	
	<div class="row"> 
	  	<div class="col-xs-4 col-md-2 "><strong>모임시간</strong></div> 
		<div class="col-xs-8 col-md-4">${offMeet.offTime }</div> 
 	</div> 


  <hr/>

    <div class="row"> 
	  	<div class="col-xs-4 col-md-2 "><strong>참여비</strong></div> 
		<div class="col-xs-8 col-md-4">${offMeet.amount}</div> 
 	</div> 
 	
 	
  <hr/>
  
  
  
  
    <div class="row"> 
	  	<div class="col-xs-4 col-md-2 "><strong>현재인원수</strong></div> 
		<div class="col-xs-8 col-md-4">${offMeet.offMem}</div> 
 	</div> 
    
    
  <hr/>
    
    <div class="row"> 
	  	<div class="col-xs-4 col-md-2 "><strong>최대인원수</strong></div> 
		<div class="col-xs-8 col-md-4">${offMeet.offMax}</div> 
 	</div> 


<br/>
	
<div class="row"> 
 		<div class="col-md-12 text-center"> 
 		 	  <div class="col-sm-offset-4  col-sm-4 text-center">
		      <a class="btn btn-primary btn" href="#" role="button">확 &nbsp;인</a>
		      <input type="hidden" id="meetId" value="${offMeet.meet.meetId}"/>
 		</div> 
	</div>
</div>

</body>
</html>