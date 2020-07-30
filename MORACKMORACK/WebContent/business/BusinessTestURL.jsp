<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>화면 단위테스트</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

<style>

</style>

</head>
<body>

	<!-- Button HTML (to Trigger Modal) -->
	<jsp:include page="/business/loginBusiness2.jsp"/>
	<br><br><br><br><br><br><br><br>



	<a href="/business/addBusinessMenu.jsp">업체 메뉴 등록</a>
	<br>
	
	<a href="/business/listBusinessMenu">업체 메뉴 목록</a>
	<br>

	
	
	
	
	
	<a href="/business/listReserveAbleTime">업체 예약 가능 시간 목록</a>
	<br><br><br><br><br><br><br><br>
	
	
	
	
	
	<a href="/business/addBusiness">제휴 신청(업체회원가입)</a>
	<br>
	
	<a href="/business/loginBusiness">업체 로그인</a>
	<br>
	
	<a href="/business/updateBusiness">업체 정보 변경</a>
	<br>
	
	<a href="/business/listBusiness?businessId=bus01">업체 정보 변경</a>
	<br><br><br><br><br><br><br><br>
	
	
	
	
	<jsp:include page="/business/getReserveBusiness.jsp"/>
	<br><br><br><br><br><br><br><br>
	

</body>
</html>