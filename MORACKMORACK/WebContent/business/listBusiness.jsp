<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��ü ��� ��ȸ</title>


	<!-- ���� : http://getbootstrap.com/css/   ���� -->
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
	
	
	<!-- jQuery UI toolTip ��� CSS-->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<!-- jQuery UI toolTip ��� JS-->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!-- KAKAO MAP ��� SDK -->
	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

 
 
<script type="text/javascript" > 

	var businessLoc = "��Ʈķ�� ��������";

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
											"<img src='resources/images/uploadFiles/"+JSONData[i].businessImg+"' alt='��ü ��ǥ �̹���' title='"+JSONData[i].businessName+"' style='height:150px'>" +
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

	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-info">
			<h2 style="padding-top:10px;">��ü ����Ʈ</h2>
	    </div>

		<span style="width:30%; float:left">
		
			<span>
				<input type="text" id="searchKeyword" name="searchKeyword">
				<input type="button" id="search" name="search" class="btn btn-primary" value="�˻�">
			</span>

			<span id="businessList">
				<span id="list">
				
					<c:forEach var="business" items="${businessList}">
						<span>
							<span class="thumbnail" style="height:200px;">
								<img src="resources/images/uploadFiles/${business.businessImg}" alt="��ü ��ǥ �̹���" title="${business.businessName}" style="height:150px">
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
					
					//��Ŀ�� Ŭ���ϸ� ��Ҹ��� ǥ���� ���������� �Դϴ�
					var infowindow = new kakao.maps.InfoWindow({zIndex:1});
					
					var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
					    mapOption = {
					        center: new kakao.maps.LatLng(37.566826, 126.9786567), // ������ �߽���ǥ
					        level: 3 // ������ Ȯ�� ����
					    };  
					
					// ������ �����մϴ�    
					var map = new kakao.maps.Map(mapContainer, mapOption); 
					
					// ��� �˻� ��ü�� �����մϴ�
					var ps = new kakao.maps.services.Places(); 
					
					// Ű����� ��Ҹ� �˻��մϴ�(��ü �̹��� Ŭ�� �� �޾ƿ� businessLoc�� ���� �������� ��� �˻�)
					ps.keywordSearch(businessLoc, placesSearchCB);
					
					// Ű���� �˻� �Ϸ� �� ȣ��Ǵ� �ݹ��Լ� �Դϴ�
					function placesSearchCB (data, status, pagination) {
					    if (status === kakao.maps.services.Status.OK) {
					
					        // �˻��� ��� ��ġ�� �������� ���� ������ �缳���ϱ�����
					        // LatLngBounds ��ü�� ��ǥ�� �߰��մϴ�
					        var bounds = new kakao.maps.LatLngBounds();
					
					        for (var i=0; i<data.length; i++) {
					            displayMarker(data[i]);    
					            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
					        }       
					
					        // �˻��� ��� ��ġ�� �������� ���� ������ �缳���մϴ�
					        map.setBounds(bounds);
					    } 
					}
					
					// ������ ��Ŀ�� ǥ���ϴ� �Լ��Դϴ�
					function displayMarker(place) {
					    
					    // ��Ŀ�� �����ϰ� ������ ǥ���մϴ�
					    var marker = new kakao.maps.Marker({
					        map: map,
					        position: new kakao.maps.LatLng(place.y, place.x) 
					    });
					
					    // ��Ŀ�� Ŭ���̺�Ʈ�� ����մϴ�
					    kakao.maps.event.addListener(marker, 'click', function() {
					        // ��Ŀ�� Ŭ���ϸ� ��Ҹ��� ���������쿡 ǥ��˴ϴ�
					        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
					        infowindow.open(map, marker);
					    });
					};
				}
				
			</script>

		</div>
		
		
		
		
		
		
		<div style="width:65%; float:right;">
			<div style="width:100%; height:1000px; background-color:pink; margin-top:50px;">
				~~~��� ���~~~~~
				<c:forEach var="review" items="${reviewList}">
				</c:forEach>
			</div>
		</div>

	  
 	</div>
 	<!--  ȭ�鱸�� div End /////////////////////////////////////-->

</body>
</html>