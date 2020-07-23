<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>화면 단위테스트</title>

<script src="https://code.jquery.com/jquery-3.1.1.js"></script>

<script type="text/javascript">

</script>

</head>
<body>

	<a href="/business/addBusinessMenu.jsp">업체 메뉴 등록</a>
	<br>
	
	<!-- 화면 없이 단위테스트 -->
	<a href="/business/listBusinessMenu?businessId=bus02">업체 메뉴 목록</a>
	<br>
	
	<a href="/business/getBusinessMenu?businessId=bus01&menuNo=3">업체 메뉴 상세</a>
	<br>
	
	<a href="/business/getBusinessMenu?businessId=bus01&menuNo=3">업체 메뉴 수정(=메뉴 상세페이지)</a>
	<br>
	
	<a href="/business/delBusinessMenu?menuNo=3">업체 메뉴 삭제</a>
	<br><br><br><br><br><br><br><br>
	
	
	
	
	
	
	<a href="/business/listReserveAbleTime?businessId=bus02">업체 예약 가능 시간 목록</a>
	<br><br><br><br><br><br><br><br>
	
	
	
	
	
	<a href="/business/addBusiness">제휴 신청(업체회원가입)</a>
	<br>
	
	<a href="/business/loginBusiness">업체 로그인</a>
	<br>
	
	<a href="/business/updateBusiness">업체 정보 변경</a>
	<br>
	
	<a href="/business/listBusiness?businessId=bus01">업체 정보 변경</a>
	<br>
	

</body>
</html>