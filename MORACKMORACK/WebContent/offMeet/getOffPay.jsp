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
	});
$(function() {
	$($("a:contains('참여비목록')")[0]).on("click" , function() {
		history.go(-1);
		});
	$($("a:contains('참여비목록')")[1]).on("click" , function() {
		window.location.href = "/offmeet/getPayList";
		});
});	



</script>
</head>

<body>

<header>
<jsp:include page="/toolbar.jsp" />
</header>

<form>
<div class="container">
	<div class="page-header">
	     <h3 class=" text-info">오프라인 모임 결제 확인</h3>
	     
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
 		<div class="col-xs-8 col-md-4">${pay.meetName}</div> 
 	</div> 
 
 <hr/>
	
	<div class="row"> 
	  	<div class="col-xs-4 col-md-2 "><strong>입금은행</strong></div> 
		<div class="col-xs-8 col-md-4">${pay.bank }</div> 
 	</div> 


  <hr/>

    <div class="row"> 
	  	<div class="col-xs-4 col-md-2 "><strong>입금가상계좌</strong></div> 
		<div class="col-xs-8 col-md-4">${pay.accNum}</div> 
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
		    	<c:if test="${!empty param.currentPage }">
				  <a class="btn btn-primary btn" href="#" role="button">확인</a>
				</c:if>
				<c:if test="${empty param.currentPage }">
				<a class="btn btn-primary btn" href="#" role="button">참여비목록</a>
				</c:if>
 		</div> 
	</div>
</div>
</form>
</body>
</html>