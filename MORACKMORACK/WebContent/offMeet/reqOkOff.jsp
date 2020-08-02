<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">

<head>
	<meta charset="EUC-KR">

<jsp:include page="/common/listCdn.jsp" />

	

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
		window.location.href="/meet/getMeet/"+meetId
	
	});
	
	$("#list").click(function (){
		window.location.href = "/offmeet/listOffPay";
	})
	
});	



</script>
</head>

<body>
<form>
<input type="hidden" name="offNo" value="${offMeet.offNo}" />

<div class="container">
	<div class="page-header">
	     <h3 class=" text-info">오프라인모임 참여 신청 완료</h3>
	     
	</div>
	

	
    <div class="row">
	  	<div class="col-xs-4 col-md-2 "><strong>참여 신청자 명</strong></div>
		<div class="col-xs-8 col-md-4">${user.userName}</div>
	</div>
	
	
 <hr/>
 	
 	<div class="row"> 
	  	<div class="col-xs-4 col-md-2 "><strong>결제방법</strong></div> 
 		<div class="col-xs-8 col-md-4">${pay.payMethod == '0' ? "계좌이체" : pay.payMethod == '1' ? "카드결제" : "무통장입금" }</div> 
	</div> 
	
	
	
 <hr/>	
	
	<div class="row"> 
 		<div class="col-xs-4 col-md-2 "><strong>모임명</strong></div> 
 		<div class="col-xs-8 col-md-4">${pay.meet.meetName }</div> 
 	</div> 
 
 <hr/>
	
	<div class="row"> 
	  	<div class="col-xs-4 col-md-2 "><strong>입금은행</strong></div> 
		<div class="col-xs-8 col-md-4">${pay.meet.bank }</div> 
 	</div> 


  <hr/>

    <div class="row"> 
	  	<div class="col-xs-4 col-md-2 "><strong>입금가상계좌</strong></div> 
		<div class="col-xs-8 col-md-4">${pay.meet.accNum}</div> 
 	</div> 
 	
 	
  <hr/>
  
  
  
  
    <div class="row"> 
	  	<div class="col-xs-4 col-md-2 "><strong>참여비</strong></div> 
		<div class="col-xs-8 col-md-4">${pay.totalAmount}</div> 
 	</div> 
    
    

<br/>
	
<div class="row"> 
 		<div class="col-md-12 text-center"> 
 		 	  <div class="col-sm-offset-4  col-sm-4 text-center">
		         <a class="btn btn-primary btn" href="#" role="button">확 &nbsp;인</a>
		      <input type="hidden" id="meetId" value="${pay.meet.meetId}"/> 
		      <button type="button" class="btn btn-primary btn" id="list" >참여비 목록</button>
 		</div> 
	</div>
</div>
</form>
</body>
</html>