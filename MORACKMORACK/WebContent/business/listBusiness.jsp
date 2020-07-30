<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>업체 목록 조회</title>


	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.js"></script>
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
	
	<!-- KAKAO MAP 사용 SDK -->
	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

 
 
<script type="text/javascript" > 

	var businessLoc = "비트캠프 강남센터";

 	function getBusinessList(searchKeyword) {

 		$("#list").remove();
 		
 		$.ajax( 
				{
					url : "/business/json/listBusiness/"+searchKeyword ,
					method : "GET" ,
					dataType : "json" ,
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json; charset=UTF-8"
					},
					success : function(JSONData , status) {

													
						console.log(JSONData);
						
						var displayValue ="";
						
						for (var i=0; i<JSONData.length; i++) {
							
							displayValue += "<span>" +
											"<span class='thumbnail' style='height:200px;'>" +
											"<img src='resources/images/uploadFiles/"+JSONData[i].businessImg+"' alt='업체 대표 이미지' title='"+JSONData[i].businessName+"' style='height:150px'>" +
											"<div id='businessName'>"+JSONData[i].businessName+"</div>" +
											"<input type='hidden' value='"+JSONData[i].businessLoc+"'/>" +
											"</span>" +
											
											"<span>" +
											"<input type='hidden' value='"+JSONData[i].businessId+"'/>" +
											"</span>" +
										
											"</span>";
							
						}

						$("#businessList").html(displayValue);
						
						$("img").on("click", function() {
				 			businessLoc = $( $(this).parents("span").children()[2] ).val();
				 			
				 			markMap(businessLoc);
				 			
				 		});

					}
			});
 		

 		
 		
 		
 	};

 	
 	$(function() {
 		
 		$("#search").on("click", function() {

 			var searchKeyword = document.getElementById("searchKeyword").value;
 			
 			getBusinessList(searchKeyword);
 			
 		});
 		
 		
 		$("img").on("click", function() {
 			
 			businessLoc = $( $(this).parents("span").children()[1] ).val();
 			
 			markMap(businessLoc);
 			
 		})
 		
 	});
 	
 
</script>




</head>

<body>

	<header>
		<jsp:include page="/toolbar.jsp" />
	</header>

	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-info">
			<h2 style="padding-top:10px;">업체 리스트</h2>
	    </div>

		<span style="width:30%; float:left">
		
			<span>
				<input type="text" id="searchKeyword" name="searchKeyword">
				<input type="button" id="search" name="search" class="btn btn-primary" value="검색">
			</span>

			<span id="businessList">
				<span id="list">
				
					<c:forEach var="business" items="${businessList}">
						<span>
							<span class="thumbnail" style="height:200px;">
								<img src="resources/images/uploadFiles/${business.businessImg}" alt="업체 대표 이미지" title="${business.businessName}" style="height:150px">
								<input type="hidden" value="${business.businessLoc}"/>
								<p id="businessName">${business.businessName}</p>
								<input type="hidden" value="${business.businessId}"/>
							
							</span>
						</span>
					</c:forEach> 

			 		<br><br>
					<span>
						<i class="glyphicon glyphicon-ok" id= "${business.businessId}"></i>
						<input type="hidden" value="${business.businessId}"/>
					</span>
					
				</span>
			</span>
			
		</span>
		




		
		<div style="width:65%; float:right;">
			<div id="map" style="width:100%;height:600px;"></div>
			
			<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8d156dfca4270917c96c5556ab03903d&libraries=services"></script>
			<script>
				$(function() {
					markMap(businessLoc);
				});
			
				function markMap(businessLoc) {
					
					//마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
					var infowindow = new kakao.maps.InfoWindow({zIndex:1});
					
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
					    mapOption = {
					        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
					        level: 3 // 지도의 확대 레벨
					    };  
					
					// 지도를 생성합니다    
					var map = new kakao.maps.Map(mapContainer, mapOption); 
					
					// 장소 검색 객체를 생성합니다
					var ps = new kakao.maps.services.Places(); 
					
					// 키워드로 장소를 검색합니다(업체 이미지 클릭 시 받아온 businessLoc를 통해 지도에서 장소 검색)
					ps.keywordSearch(businessLoc, placesSearchCB);
					
					// 키워드 검색 완료 시 호출되는 콜백함수 입니다
					function placesSearchCB (data, status, pagination) {
					    if (status === kakao.maps.services.Status.OK) {
					
					        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
					        // LatLngBounds 객체에 좌표를 추가합니다
					        var bounds = new kakao.maps.LatLngBounds();
					
					        for (var i=0; i<data.length; i++) {
					            displayMarker(data[i]);    
					            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
					        }       
					
					        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
					        map.setBounds(bounds);
					    } 
					}
					
					// 지도에 마커를 표시하는 함수입니다
					function displayMarker(place) {
					    
					    // 마커를 생성하고 지도에 표시합니다
					    var marker = new kakao.maps.Marker({
					        map: map,
					        position: new kakao.maps.LatLng(place.y, place.x) 
					    });
					
					    // 마커에 클릭이벤트를 등록합니다
					    kakao.maps.event.addListener(marker, 'click', function() {
					        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
					        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
					        infowindow.open(map, marker);
					    });
					};
				}
				
			</script>

		</div>
		
		
		
		
		
		
		<div style="width:65%; float:right;">
			<div style="width:100%; height:1000px; background-color:pink; margin-top:50px;">
				~~~댓글 목록~~~~~
				<c:forEach var="review" items="${reviewList}">
				</c:forEach>
			</div>
		</div>

	  
 	</div>
 	<!--  화면구성 div End /////////////////////////////////////-->

</body>
</html>