<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<jsp:include page="/business/businessToolbar.jsp"/>
	
	
	<div class="container">
	
		<div class="page-header text-info">
			<img id="businessImg" style="float:left; height:100px; width:100px; margin:5px" src="../../resources/images/down-arrow.png" alt="@@업체 대표 이미지@@">
			<h2 style="padding-top:10px;">${business.businessName}</h2>
			<!-- <h2 style="padding-top:10px;">업체명</h2> -->
			<h5>예약 가능 시간 등록</h5>
	    </div>
	    
	    
	
	</div>

</body>
</html>