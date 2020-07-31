<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>오프라인 모임 생성</title>


<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<jsp:include page="/common/listCdn.jsp" />
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=15b8f0fdd2c890d73266c3e68efbfdf6&libraries=services"></script> 
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script> 
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<style>
 body > div.container{
           padding-top : 50px;
 }
</style> 

<script type="text/javascript">


function fncAddOffMeet(){

	
	
	var name = $("input[name='offName']").val();
	var date =$("input[name='offDate']").val();
	var time = $("input[name='offTime']").val();
	var max = $("input[name='offMax']").val();

	
	if(name == null || name.length<1){
		alert("오프라인명은 반드시 입력하여야 합니다.");
		return;
	}
	if(date == null || date.length<1){
		alert("모임날짜는 반드시 입력하여야 합니다.");
		return;
	}
	if(time == null || time.length<1){
		alert("모임시간은 반드시 입력하셔야 합니다.");
		return;
	}
	if(max == null || max.length < 1){
		alert("모임최대인원은 반드시 입력하셔야 합니다.");
		return;
	}
	if(max > 21 ){
		alert("모임최대인원 최대 20명 입력하셔야 합니다.");
		return;
	}
	
	$("form").attr("method", "POST").attr("action", "/offmeet/addOff?meetId=${param.meetId}").submit();
	
	//document.detailForm.submit();
}

$(function() {
	//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	$( "button.btn.btn-primary" ).on("click" , function() {
		fncAddOffMeet();
	});
});	

	

$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("a[href='#' ]").on("click" , function() {
				$("form")[0].reset();
			});
		});	


$( function() {
    $("#offDate").datepicker({
    	dateFormat: 'yy-mm-dd'
  });  
});

</script>
</head>

<body>

<header>
<jsp:include page="/toolbar.jsp" />
</header>

<div class="container">
	


<form class="form-horizontal" enctype="multipart/form-data">

<input type="hidden" id="meetId" value="${parm.meetId}"/>

 <div class="form-group">
 <label for="offName" class="col-sm-offset-1 col-sm-3 control-label">오프라인 모임명</label>
	<div class="col-sm-4">
	   <input type="text" class="form-control" id="offName" name="offName" placeholder="오프라인 모임명 입력하세요">
   </div>
  </div>



 <div class="form-group">
 <label for="offDate" class="col-sm-offset-1 col-sm-3 control-label">모임장소</label>
	<div class="col-sm-4">
	   <input type="text" class="form-control" id="offLoc" name="offLoc">
	   <input type="button" onclick="execDaumPostcode()" value="주소 검색">
  <div id="map" style="width:300px;height:300px;margin-top:10px;display:none">
   </div>
  </div>
  <script>
  var mapContainer = document.getElementById('map'), // 지도를 표시할 div
  mapOption = { 
  		
      center: new kakao.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표 level: 5 // 지도의 확대 레벨 }; //지도를 미리 생성 
      level: 5 // 지도의 확대 레벨
      };
     
  	var map = new kakao.maps.Map(mapContainer, mapOption); //주소-좌표 변환 객체를 생성 
  	
  	var geocoder = new kakao.maps.services.Geocoder(); //마커를 미리 생성 
  	
  	var marker = new kakao.maps.Marker({ 
  	  position: new kakao.maps.LatLng(37.537187, 127.005476)
  	, map: map 
  	});

  	searchAddrFromCoords(map.getCenter(), displayCenterInfo);
     
  function execDaumPostcode() { 

  	new daum.Postcode({ 
  		
  		oncomplete: function(data) { 

  		var fullAddr = data.address; 
  		var extraAddr = ''; 
  		if(data.addressType === 'R'){ 
  			if(data.bname !== '')
  			{ 
  				extraAddr += data.bname;
  			} 
  			if(data.buildingName !== ''){
  				extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName); 
  				} 
  				fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : ''); 
  			    }
  	

  	document.getElementById("offLoc").value = fullAddr; 
  	
  	geocoder.addressSearch(data.address, function(results, status) { 
  		
  		if (status === kakao.maps.services.Status.OK) {
  			
  			var result = results[0];

  			var coords = new kakao.maps.LatLng(result.y, result.x);

  			mapContainer.style.display = "block"; 
  			 
  			  map.relayout();

  			 map.setCenter(coords);
  			
  			marker.setPosition(coords)
  			
  			var infowindow = new kakao.maps.InfoWindow({
  				
  				 
  				content: '<div style="width:150px;text-align:center;padding:6px 0;">'+fullAddr+'</div>'
  	    
  			});
  			
  	        infowindow.open(map, marker);
  	        		 
          }
      });
  }
  }).open();
  	
  }
  
  </script>
  
  </div> 
    
  <div class="form-group">
				<label for="fileName"class="col-sm-offset-1 col-sm-3 control-label">오프라인 모임 이미지</label>
				<div class="col-sm-4">
			<input type="file" class="form-control" id="image" name="image" accept="image/*">
			</div>
   </div>
  
 <div class="form-group">
 <label for="offDate" class="col-sm-offset-1 col-sm-3 control-label">모임날짜</label>
	<div class="col-sm-4">
	   <input type="text" class="form-control" id="offDate" name="offDate" readonly="readonly">
   </div>
  </div>
		
 <div class="form-group">
 <label for="offTime" class="col-sm-offset-1 col-sm-3 control-label">모임시간</label>
	<div class="col-sm-4">
	   <input type="text" class="form-control" id="offTime" name="offTime">
   </div>
  </div>
  
  <div class="form-group">
 <label for="offMax" class="col-sm-offset-1 col-sm-3 control-label">최대참여인원수</label>
	<div class="col-sm-4">
	   <input type="number" class="form-control" id="offMax" name="offMax">
   </div>
  </div>
  
<div class="form-group">
 <label for="offFee" class="col-sm-offset-1 col-sm-3 control-label">참여비</label>
	<div class="col-sm-4">
	   <input type="text" class="form-control" id="amount" name="amount">
   </div>
  </div>
  
    	
 <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >등 &nbsp;록</button>
			  <a class="btn btn-primary btn" href="#" role="button">취 &nbsp;소</a>
		    </div>
		  </div>
		</form>
</div>

</body>
</html>