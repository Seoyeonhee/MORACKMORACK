<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>제휴업체 상세 조회</title>
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

	$(document).ready(function(){
	
		$('#calendar').fullCalendar({ 
		 
		header: { //헤더부분정의 
		left: 'title', //년도, 월
		center : '',
		right: 'prev,next today' //전월, 다음월, 오늘 버튼
		},
		dayClick: function(date, allDay, jsEvent, view) { //날짜클릭시 실행되는 함수
			 	
			var yy = date.format("YYYY");
			var mm = date.format("MM");
			var dd = date.format("DD");
			onchangeDay(yy,mm,dd); //년, 월, 일을 담아 onchangeDay 함수 실행
			}
		});  
	});
 

	function onchangeDay(year,month,j){ //날짜클릭시 실행되는 함수
		
		var reserveDate = year+"-"+month+"-"+j; //"2019-11-04" 형식의  reserveDate
		var businessId = $("#businessId").val();
		
		$.ajax({
			url : "/business/json/showReserveAbleTimeList/"+businessId+"/"+reserveDate,
			type : 'GET', //GET방식으로
			dataType : "json" ,
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
			success : function(JSONData, status) {
				
				var listSelectedTime = [];
									
				var displayValue ="<div>";
									
									
				for(var i=0 ; i<JSONData.length ; i++) {
					
					displayValue += "<span>" +
									"<form name='form' action='/offmeet' method='POST'>" +
									"<span class='selectTime' style='width:80px; height:80px; margin:20px; float:left; border:1px solid black;'>" +
									"<input type='checkbox' style='float:left; margin:10px; margin-top:30px;' id='selected_"+JSONData[i].reserveAbleNo+"' name=selected_'"+JSONData[i].reserveAbleNo+"' value='"+JSONData[i].reserveAbleNo+"'/>" +
									"<input type='hidden' value='"+JSONData[i].reserveAbleNo+"'/>" +
									"<p style='margin-top:8px;'>"+JSONData[i].reserveAbleStartTime+"<br> &nbsp;&nbsp;&nbsp; ~ <br>"+JSONData[i].reserveAbleEndTime+"</p>" +
									"</span>" +
									"</form>" +
									"</span>";
					
				}
				
				displayValue += "</div>" +
								"<div>" +
								"<input type='button' id='addReserve' name='addReserve' value=' 예 약 하 기 ' style='width:500px; margin-top:20px;' class='btn btn-primary'>" +
								"</div>";

								
				$("#reserveAbleTimeList").html(displayValue);
				
				
				$(".selectTime").on("click", function() {
					var selectedTimeNo = $( $(this).children()[0] ).val();
					
					for(var i=0 ; i<listSelectedTime.length ; i++) {
						if(listSelectedTime[i]==selectedTimeNo){
							listSelectedTime.splice(i, 1);
						}
					}
					
					listSelectedTime.push(selectedTimeNo);
					console.log(listSelectedTime);
					
				});
				
				$("#addReserve").on("click", function() {
					
					if(listSelectedTime.length==0) {
						alert("시간이 선택되지 않았습니다.");
					} else {
						alert("선택된 예약시간 번호 : " + listSelectedTime);
						
						$.ajax({
							url : "/business/json/reserve",
							type : "POST",
							dataType : "text",
							data : {
								listSelectedTime: listSelectedTime,
								reserveDate : reserveDate
							}
						});
						
						/*  이 주소는 나중에 예약하기 위한 화면으로 이동하는 컨트롤러 태우는 url로 이동하도록 수정할것!!!!!  */
						/* self.location="#"; */
					}
					
				})
				
			}
		
		});
	}


/* 	function check(id){ //next버튼(submit)을 눌렀을 경우 실행되는 함수
		if(!document.form1.reserveDate.value){ //날짜 선택을 하지 않고 버튼을 눌렀을 시 못넘어가도록
			alert("날짜를 선택하세요.");
			return false;
		}
	}  */

</script>

</head>
<body>

	<jsp:include page="/business/businessToolbar.jsp"/>
	
	
	<div class="container">
	
		<div class="page-header text-info">
			<h2 style="padding-top:10px;">예약</h2>
	    </div>
	    
	    <div>
	    	<span style="width:50%; float:left;">
	    		<input type="hidden" id="businessId" name="businessId" value="${business.businessId }"/>
				<img src="resources/images/uploadFiles/${business.businessImg}" alt="업체 대표 이미지" title="${business.businessName}" style="width:100%; height:400px; background-color:yellow;">
				<p id="businessName" style="font-size:30px;">${business.businessName} &nbsp;&nbsp;&nbsp; 별점 : ${business.businessStar}</p>
				<h3>업체 위치</h3>
				<h5 style="padding-bottom:10px;">${business.businessLoc }</h5>
				<h3>업체 번호</h3>
				<h5 style="padding-bottom:10px;">${business.businessPhone }</h5>
				<h3>업체 운영 시간</h3>
				<h5 style="padding-bottom:10px;">${business.businessStartTime } &nbsp; ~ &nbsp; ${business.businessEndTime }</h5>
				
				
				
				
				
				<h3>메뉴</h3>
				<c:forEach var="menu" items="${menu}">
					<form name='form' class='form-horizontal'>
						<span class='form-group' style="float:left; padding:15px;">
							<span class='page-header text-info'>
								<input type="hidden" class="menuNo" value="${menu.menuNo}">
								<input type="hidden" class="businessId" value="${menu.businessId}">
								
								<p style="float:left">&nbsp;&nbsp;&nbsp;&nbsp;</p>
								<img class='businessMenuImg' style='float:left; height:50px; width:50px; margin:5px' src='../../resources/images/down-arrow.png' alt='@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 메뉴 이미지 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@'>
						  		<h4> ${menu.businessMenu} </h4>
						  		<h5> ${menu.businessMenuFee} </h5>
						  		<br><br>
						  	</span>
						</span>
					</form>
			  	</c:forEach>
			  	
			</span>
			
			<span style="float:right; width:45%;">
	    		<span id="calendar" style="width:100%; height:500px;"></span>
	    		
	    		<br><br>
	    		<h1 style="text-align:center;"> [ 예약시간 선택 ] </h1>
	    		
	    		<span id="reserveAbleTimeList">
					
	    		</span>
	    	</span>
	    	
	    </div>

	</div>
	
	
	
	
	
	
	<div class="container">
			<div style="height:500px; background-color:pink; margin-top:20px;">
				<h1>~~~업체 후기 목록~~~~~</h1>
				<c:forEach var="review" items="${reviewList}">
				</c:forEach>
			</div>
	</div>

</body>

</html>