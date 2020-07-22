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
	     <h3 class=" text-info">�������θ��� ���� ��û �Ϸ�</h3>
	     
	</div>
	

	
    <div class="row">
	  	<div class="col-xs-4 col-md-2 "><strong>���� ��û�� ��</strong></div>
		<div class="col-xs-8 col-md-4">${user.name}</div>
	</div>
	
	
 <hr/>
 	
 	<div class="row"> 
	  	<div class="col-xs-4 col-md-2 "><strong>�������</strong></div> 
 		<div class="col-xs-8 col-md-4">${pay.payMethod == '0' ? "������ü" : pay.payMethod == '1' ? "ī�����" : "�������Ա�" }</div> 
	</div> 
	
	
	
 <hr/>	
	
	<div class="row"> 
 		<div class="col-xs-4 col-md-2 "><strong>���Ӹ�</strong></div> 
 		<div class="col-xs-8 col-md-4">${meet.meetName }</div> 
 	</div> 
 
 <hr/>
	
	<div class="row"> 
	  	<div class="col-xs-4 col-md-2 "><strong>�Ա�����</strong></div> 
		<div class="col-xs-8 col-md-4">${meet.bank }</div> 
 	</div> 


  <hr/>

    <div class="row"> 
	  	<div class="col-xs-4 col-md-2 "><strong>�Աݰ������</strong></div> 
		<div class="col-xs-8 col-md-4">${meet.accNum}</div> 
 	</div> 
 	
 	
  <hr/>
  
  
  
  
    <div class="row"> 
	  	<div class="col-xs-4 col-md-2 "><strong>������</strong></div> 
		<div class="col-xs-8 col-md-4">${pay.totalAmount}</div> 
 	</div> 
    
    

<br/>
	
<div class="row"> 
 		<div class="col-md-12 text-center"> 
 		 	  <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >Ȯ��</button> 
 		</div> 
	</div>
</div>

</body>
</html>