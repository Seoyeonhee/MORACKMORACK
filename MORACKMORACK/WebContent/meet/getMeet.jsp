<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ include file="/webSocket.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>모임 상세 조회</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


<style>

    
ul{
   list-style:none;
   padding-left:10px;
   }
   
li{
	color: #FFF; 
}

</style>


<script type ="text/javascript">

$(function (){
	
        $("#list-group").click(function(){
            var submenu = $(this).next("div");
 
            if( submenu.is(":visible") ){
                submenu.slideUp();
            }else{
                submenu.slideDown();
            }
        }).mouseover(function(){
            $(this).next("div").slideDown();
       
        });




	$("#addOffMeet").on("click", function(){
		
		//var jbResult = prompt( 'Lorem ipsum dolor', '' );
	      //document.write( jbResult );	 
  		
		var AlarmData = {
				"alarm_meetNo" : meetNo,
				"alarm_maker" : userId,
				"alarm_message" : offMeetMessage
		}
		
		$.ajax({
			type : 'post',
			url : '/meet/json/saveAlarm',
			data : JSON.stringify(AlarmData),
			contentType : "application/json; charset=EUC-KR",
			dataType : 'text',
			success : function(data){
				if(socket){
					//var socketMsg = meetNo+','+userId+','+offMeetMessage;
					//console.log("msg : "+socketMsg);
					socket.send($("#meetNo").val()+","+$("#meetNo").val()+","+$("#meetNo").val());
				}
			}, 
			error : function(err){
				console.log(err);
			}
		})
	})	
})

</script>

</head>
<body>

<div class="navbar  navbar-warning">
        <div class="container">
        	<jsp:include page="/toolbar2.jsp" />
   		</div>
</div>

<div style="float:right">
<input type="button" value="모임 가입"/>
<input type="button" value="찜하기"/> 

<input type="button" value="쪽지 초대"/>
<input type="button" value="카카오톡 초대"/>
<input type="button" value="모임 생성"/>
</div>

<label id="list-group"><span class="glyphicon glyphicon-align-justify"></span></label>
<div>
<ul class="nav nav-pills nav-stacked col-md-1">
<li role="presentation"><a href="#">모임 회원 목록</a></li>
<li role="presentation"><a href="#">커뮤니티</a></li>
<li role="presentation"><a href="#">채팅</a></li>
<li role="presentation"><a href="#">추천업체 조회</a></li>
<li role="presentation"><a href="#">참여비 내역</a></li>
<li role="presentation"><a href="#">가입 신청 회원 목록</a></li>
<li role="presentation"><a href="#">신고받은 회원 목록</a></li>
</ul>
</div>

<div class="row" style="margin-left:150px">
 	<div class="col-xs-6 col-md-5">
    <a href="#" class="thumbnail">
      <img src="${meetImg}" alt="...">
    </a>
  </div>
  	<div class="col-md-3" style="height:500px; background-color: #FFA07A">
		<h3>${meet.meetName}</h3><h5>${meet.memNum}/${meet.maxNum}</h5>   
		<c:forEach var="hashtag" items="${meet.hashtag}">
		<h3>#${hashtag} </h3>
		</c:forEach>
 		<c:choose>
		<c:when test="${meet.category eq 1}">여행</c:when>
		<c:when test="${meet.category eq 2}">게임</c:when>
		<c:when test="${meet.category eq 3}">음악</c:when>
		<c:when test="${meet.category eq 4}">영화</c:when>
		<c:when test="${meet.category eq 5}">공연</c:when>
		<c:when test="${meet.category eq 6}">맛집</c:when>
		<c:when test="${meet.category eq 7}">취업/자기계발</c:when>
		<c:when test="${meet.category eq 8}">액티비티</c:when>
		<c:when test="${meet.category eq 9}">독서/만화</c:when>
		<c:when test="${meet.category eq 10}">댄스</c:when>
		<c:when test="${meet.category eq 11}">사진</c:when>
		<c:when test="${meet.category eq 12}">반려동물</c:when>
		<c:when test="${meet.category eq 13}">요리</c:when>
		<c:when test="${meet.category eq 14}">차</c:when>
		<c:when test="${meet.category eq 15}">스포츠</c:when>
		<c:when test="${meet.category eq 16}">공예</c:when>
		<c:when test="${meet.category eq 17}">기타</c:when>
		</c:choose>
		<h3>${meet.sIntro}</h3>
		<h3>${meet.meetLoc}</h3>
		<h3>${meet.meetStar}</h3>
	</div>
	<div class="col-md-3" style="height:500px; background-color: #F08080; margin-left:30px">
	오프라인 모임 정보
	</div>
</div>

<div class="row" style="margin-left:120px; margin-top:100px"> <!-- 상세 이미지 / 테이블 만들어지면 넣기 -->
 	<div class="col-xs-6 col-md-7">
    <a href="#" class="thumbnail">
      <img src="" alt="...">
    </a>
  </div>
  	<div class="col-md-4" style="height:500px; background-color: #CD5C5C">  <!-- 후기 / 테이블 만들어지면 넣기 -->
		<h3>후기</h3>  
		<h3></h3>  
	</div>
</div>


<a href="#">n개 후기 모두 보기</a>
</body>
</html>