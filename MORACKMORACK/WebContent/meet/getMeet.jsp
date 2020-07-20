<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ include file="/webSocket.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>모임 상세 조회</title>

<script src="https://code.jquery.com/jquery-3.1.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>

<script type ="text/javascript">

$(function (){
		
	var userId = $("#userId").val();
	var meetNo = $("#meetNo").val();
	var offMeetMessage = "환영합니다";
	
	if(userId == null || userId.length == 0){
		userId = "user01";
	}
	
	if(meetNo == null || meetNo.length == 0){
		meetNo = "1";
	}
	
	alert("userId : " + userId + " meetNo : "+ meetNo+" offMeetMessage : "+offMeetMessage);

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
<input type="hidden" id="userId" value="${user.userId}"/>
<input type="hidden" id="meetNo" value="${meet.meetNo}"/>

<input type="button" value="모임 가입"/> <hr/>
<input type="button" value="찜하기"/> <hr/>

<input type="button" value="쪽지 초대"/> <hr/>
<input type="button" value="카카오톡 초대"/> <hr/>

<input type="button" id="addOffMeet" value="모임 생성"/> <hr/>


<a href="#">모임 회원 목록</a> <hr/>
<a href="#">커뮤니티</a> <hr/>
<a href="#">채팅</a> <hr/>
<a href="#">추천업체 조회</a> <hr/>
<a href="#">참여비 내역</a> <hr/>
<a href="#">가입 신청 회원 목록</a> <hr/>
<a href="#">신고받은 회원 목록</a> <hr/>

<a href="#">n개 후기 모두 보기</a>
</body>
</html>