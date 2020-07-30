<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>

	<meta charset="EUC-KR">
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="/resources/demos/style.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script type="text/javascript">

function fncNotifyUser() {
	$("form").attr("method","POST").attr("action","/notify/notifyUser").submit();
}

$(function(){
	
	$("button.btn.btn-primary").on('click',function(){
		
		alert("신고하시겠습니까?????");
		
		fncNotifyUser();
	});
	
});

$(function(){
	
	$("a[href='#']").on('click',function(){
		
		alert("취소하시겠습니까????");
		
		$("form")[0].reset();
	});
});


</script>
</head>

<body>

<!-- <form name="addPurchase" method="post" action="/purchase/addPurchase"> -->
 <div class="navbar  navbar-default">
 	<div class="container">
 		<jsp:include page="/toolbar.jsp"/>
 	</div>
 </div>
 
 <div class="container">
 	<h1 class="bg-primary text-center">신고 하기</h1>
 	
 	<form class="form-horizontal">
 	
 		<div class="form-group">
 			<input type="hidden" name="recvNotiUser.userId"  value ="${notify.recvNotiUser.userId}">
 			<label class="col-sm-offset-1 col-sm-3 control-label">신고받는 회원 Id</label>
 			<div class="col-sm-4">
 			<input type="text" class="form-control" value="${notify.recvNotiUser.userId}" readonly>
			</div>
		</div>
		
		<div class="form-group">
			<label for="reqNotiUser.userId" class="col-sm-offset-1 col-sm-3 control-label">신고 하는 회원 Id</label>
			<div class="col-sm-4">
			<input type="text" class="form-control" value="${notify.reqNotiUser.userId}" readonly>
			</div>
		</div>
		
		<div class="form-group">
		    <label for="paymentOption" class="col-sm-offset-1 col-sm-3 control-label">신고 유형</label>
		     <div class="col-sm-3">
		      <select class="form-control" name="notiType" id="notiType">
				  	<option value="0" >선동</option>
					<option value="1" >절도</option>
					<option value="2" >폭행</option>
					<option value="3" >성범죄</option>
					<option value="4" >악플</option>
				</select>
		    </div>
		  </div>
		  
		<div class="form-group">
			<label for="notiDetail" class="col-sm-offset-1 col-sm-3 control-label">신고 내용</label>
			<div class="col-sm-4">
			<textarea class="form-control" rows="3"  id="notiDetail" name="notiDetail" ></textarea>
			</div>
		</div>


<div class="form-group">
				<div class="col-sm-offset-4 col-sm-4 text-center">
					<button type="button" class="btn btn-primary">신고</button>
						<a class="btn btn-primary btn" href="#" role="button">취소</a>
				</div>
			</div>
		</form>
	</div>
	</body>
	</html>