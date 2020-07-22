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

	$( "button.btn.btn-primary" ).on("click" , function() {
		self.location =  "/meet/getMeet?meetId=${meet.meetId}"
		}); 
	});
</script>
</head>

<body>
<div class="container">

	<div class="page-header">
	     <h3 class=" text-info">오프라인모임 참여 신청 완료</h3>
	     
	</div>
	

	
    <div class="row">
	  	<div class="col-xs-4 col-md-2 "><strong>참여 신청자 명</strong></div>
		<div class="col-xs-8 col-md-4">${user.name}</div>
	</div>
	
	
 <hr/>
 	
 	<div class="row"> 
	  	<div class="col-xs-4 col-md-2 "><strong>결제방법</strong></div> 
 		<div class="col-xs-8 col-md-4">${pay.payMethod == '0' ? "계좌이체" : pay.payMethod == '1' ? "카드결제" : "무통장입금" }</div> 
	</div> 
	
	
	
 <hr/>	
	
	<div class="row"> 
 		<div class="col-xs-4 col-md-2 "><strong>모임명</strong></div> 
 		<div class="col-xs-8 col-md-4">${meet.meetName }</div> 
 	</div> 
 
 <hr/>
	
	<div class="row"> 
	  	<div class="col-xs-4 col-md-2 "><strong>입금은행</strong></div> 
		<div class="col-xs-8 col-md-4">${meet.bank }</div> 
 	</div> 


  <hr/>

    <div class="row"> 
	  	<div class="col-xs-4 col-md-2 "><strong>입금가상계좌</strong></div> 
		<div class="col-xs-8 col-md-4">${meet.accNum}</div> 
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
		      <button type="button" class="btn btn-primary"  >확인</button> 
 		</div> 
	</div>
</div>

</body>
</html>