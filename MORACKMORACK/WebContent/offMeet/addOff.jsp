<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>오프라인 모임 생성</title>


<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<jsp:include page="/common/listCdn.jsp" />
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b8a89bc94a4dd7edb06c8440bdd78b7c&libraries=services"></script> 
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script> 
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<style>
 body > div.container{
           padding-top : 50px;
 }
</style> 

<script type="text/javascript">


$(function(){
	
	 $("input[type='file']").change(function(e){//div 내용 비워주기
	      $('#offMeetImgPrev').empty();

	      var files = e.target.files;
	      var arr =Array.prototype.slice.call(files);
	      
	      //업로드 가능 파일인지 체크
	      for(var i=0;i<files.length;i++){
	        if(!checkExtension(files[i].name,files[i].size)){
	          return false;
	        }
	      }
	      
	      preview(arr);
	      
	      
	    });//file change
	    
	    function checkExtension(fileName,fileSize){

	      var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	      var maxSize = 20971520;  //20MB
	      
	      if(fileSize >= maxSize){
	        alert('파일 사이즈 초과');
	        $("input[type='file']").val("");  //파일 초기화
	        return false;
	      }
	      
	      if(regex.test(fileName)){
	        alert('업로드 불가능한 파일이 있습니다.');
	        $("input[type='file']").val("");  //파일 초기화
	        return false;
	      }
	      return true;
	    }
	    
	    function preview(arr){
	      arr.forEach(function(f){
	        
	        //파일명이 길면 파일명...으로 처리
	        var fileName = f.name;
	        if(fileName.length > 10){
	          fileName = fileName.substring(0,7)+"...";
	        }
	        
	        //div에 이미지 추가
	        var str = '<div style="display: inline-flex; padding: 10px;">';
	        
	        
	        //이미지 파일 미리보기
	        if(f.type.match('image.*')){
	          var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
	          reader.onload = function (e) { //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
	            //str += '<button type="button" class="delBtn" value="'+f.name+'" style="background: red">x</button><br>';
	            str += '<img src="'+e.target.result+'" title="'+f.name+'" width=480px height=280px />';
	            str += '</li></div>';
	            $(str).appendTo('#offMeetImgPrev');
	          } 
	          reader.readAsDataURL(f);
	        }else{
	          str += '<img src="/resources/images/uploadFiles/fileImg.png" title="'+f.name+'" width=100 height=100 />';
	          $(str).appendTo('#offMeetImgPrev');
	        }
	      });//arr.forEach
	    }
  
	    $("#offMeetImgThum").on("click", function(e){
			document.all.offMeetImg.click();
			
			var aa = $(this).next.id();
		}) 
		
});

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
										"<img src='/resources/images/uploadFiles/business/"+JSONData[i].businessImg+"' alt='업체 대표 이미지' title='"+JSONData[i].businessName+"' style='height:150px'>" +
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
			document.getElementById("offLoc").value = businessLoc;
			markMap(businessLoc);
			
		})
		
	});
	
</script>
</head>

<body>

<header>
<jsp:include page="/toolbar.jsp" />
</header>

<div class="container">
	

<h2 class=" text">오프라인 모임 생성</h2>  
<form class="form-horizontal" enctype="multipart/form-data">




<div class="col-xs-6 col-md-6">
  		
	<div class="form-group">
		<label for="offMeetImg">오프라인 모임 이미지 선택</label>
			<a href="#" class="thumbnail" id="offMeetImgThum" style="height:330px; width:500px">
			<input type="file" name="image" id="offMeetImg" accept="image/*" style="display: none;" />  
			<div id="offMeetImgPrev"></div>
			</a>
			


 <div class="form-group">
		  <p><strong>오프라인 모임장소</strong></p>
		    <div class="col-sm-7">
			<input type="text" class="form-control" id="offLoc" name="offLoc" style="height:40px; width:300px"> 
			<span style="float:right;">
			 <div id="address" style="width:300px;height:300px;margin-top:10px;display:none"> </div>
		    </span>
		    </div>
		    <div class="col-sm-3">
		    <button type="button" class="btn btn-info" onclick="execDaumPostcode()" value="주소검색">주소 검색</button>
		    </div> 	 
		  </div>
 
  <script>
  var mapContainer = document.getElementById('address'), // 지도를 표시할 div
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
  </div>




<div class="col-xs-6 col-md-6">
<p><strong>오프라인 모임명</strong></p>
   <input type="text" class="form-control" id="offName" name="offName" placeholder="오프라인 모임명 입력하세요" style="height:40px; width:300px" />
  </div>


<div class="col-xs-6 col-md-6">
<p><strong>모임 날짜</strong></p>
    <input type="text" class="form-control" id="offDate" name="offDate" readonly="readonly" style="height:40px; width:300px">
  </div>
  

		
<div class="col-xs-6 col-md-6">
<p><strong>모임 시간</strong></p>
 <input type="text" class="form-control" id="offTime" name="offTime"  style="height:40px; width:300px">
  </div>
  
 <div class="col-xs-6 col-md-6">
<p><strong>최대 참여 인원수</strong></p>
 <input type="number" class="form-control" id="offMax" name="offMax"  style="height:40px; width:300px">
 </div>
  
  
 <div class="col-xs-6 col-md-6">
<p><strong>참여비</strong></p>
 <input type="text" class="form-control" id="amount" name="amount"  style="height:40px; width:300px">
 </div> 

 </div>
 
<div class="container">
	
		<div>
			<h3>추천 업체 목록</h3>
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
				
						<input type="hidden" value="${business.businessId}"/>
					</span>
					
				</span>
			</span>
			
		</span>
		

		
		<div style="width:65%; float:right;">
			<div id="map" style="width:100%;height:650px;"></div>
			
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