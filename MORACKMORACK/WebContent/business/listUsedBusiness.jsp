<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>


<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src='https://fullcalendar.io/releases/fullcalendar/3.9.0/lib/moment.min.js'></script>
<script type="text/javascript" src="./fullcalendar-3.9.0/gcal.js"></script>
<link href='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.min.css'rel='stylesheet'/>
<link href='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.print.css' rel='stylesheet' media='print'/>
<script src='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.min.js'></script>

<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<!-- <script src="https://code.jquery.com/jquery-3.1.1.js"></script> -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	
	<!-- Bootstrap Dropdown Hover CSS -->
	<link href="/css/animate.min.css" rel="stylesheet">
	<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
	<!-- Bootstrap Dropdown Hover JS -->
	<script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	
	
	<!-- jQuery UI toolTip 사용 CSS-->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<!-- jQuery UI toolTip 사용 JS-->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
<script type="text/javascript">
	$(function() {
		
		$(".goToReview").on("click", function() {
			
			alert("리뷰쓰러가자~");
			/* self.location = "/review/addReview"; */
			
		})
		
	})
</script>
</head>
<body>

	<header>
		<jsp:include page="/toolbar.jsp" />
	</header>
	
	
	<div class="container">
	
		<div class="page-header text-info">
			<h2 style="padding-top:10px;">업체 이용 목록</h2>
	    </div>
	    
	    
	    <c:forEach var="pay" items="${usedBusinessList}">
			<form name='form' class='form-horizontal'>
				<span class='form-group' style="float:left; padding:15px;">
					<span class='page-header'>
						<input type="hidden" class="businessId" value="${pay.business.businessId}">
						<input type="hidden" class="offMeetId" value="${pay.offMeet.offNo}">
						
						<span style="float:left;">
							<img class='businessImg' style='float:left; height:80px; width:100px; margin:5px' src='../../resources/images/down-arrow.png' alt='@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 업체이미지 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@'>
					  		<h3 class="text-info"> ${pay.business.businessName} </h3>
					  		<h5 class="text-info"> 이용날짜 : ${pay.reserveDate} </h5>
				  		</span>
				  		<span>
				  			<i style="float:right;" class="goToReview glyphicon glyphicon-option-vertical" title="후기작성GO"></i>
				  		</span>
				  		<!-- <i style="float:right;" class="glyphicon glyphicon-ok"></i> -->
				  	</span>
				</span>
			</form>
	  	</c:forEach>
	
	</div>


</body>
</html>