<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/webSocket.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>모임 상세 조회</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script src="https://code.jquery.com/jquery-3.1.1.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="/resources/js/includeHTML.js"></script>

<style>
.form__field {
  width: 300px;
  background: #fff;
  color: #a3a3a3;
  font: inherit;
  box-shadow: 0 6px 10px 0 rgba(0, 0, 0, 0.1);
  border: 0;
  outline: 0;
  padding: 22px 18px;
}
</style>


<script type ="text/javascript">

$(function (){
	var meetId = $("#meetId").val();
	var joinMessage = $("#joinMessage").val();
	
	if(joinMessage == '1'){
		$('#modalBox').modal('show');
		console.log("click open");
	}
	
	
	$("#joinMeet").on("click", function(){		
		self.location("/meet/joinMeet?meetId="+meetId)		
	})
	
	$("#addWishMeet").on("click", function(){		
		self.location("/meet/addWishMeet?meetId="+meetId)		
		alert("찜!") //찜 모달창 만들기
	})
	
	$("#inputIntro").on("click", function(){
			var intro = $("#intro").val();
			alert(intro)
			alert(meetId)
			$("form").attr("method", "POST").attr("action", "/meet/joinMeet").submit();
	})
	

	$('#myModal').on('show.bs.modal', function (event) { // myModal 윈도우가 오픈할때 아래의 옵션을 적용
	  var button = $(event.relatedTarget) // 모달 윈도우를 오픈하는 버튼
	  var titleTxt = button.data('title') // 버튼에서 data-title 값을 titleTxt 변수에 저장
	  var modal = $(this)
	  modal.find('.modal-title').text('Title : ' + titleTxt) // 모달위도우에서 .modal-title을 찾아 titleTxt 값을 치환
	})
		
	/* $("#addOffMeet").on("click", function(){
		
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
	}) */	
})

</script>

</head>

<body>
<form>

<header>
<jsp:include page="/toolbar.jsp" />
</header>

<section style="float: left; margin-top:100px;">
<jsp:include page="/meet/sidebar.jsp" />
</section>







<input type="hidden" id="joinMessage" value="${joinMessage}"/>
<input type="hidden" id="meetId" name="meetId" value="${meet.meetId}"/>


<section style="float: left; margin-left:100px">
<div>

<input type="button" id="addWishMeet" value="찜하기"/> 
<input type="button" id="joinMeet" value="모임 가입"/> 

<input type="button" value="쪽지 초대"/>
<input type="button" value="카카오톡 초대"/>
<input type="button" id="addOffMeet" value="오프라인 모임 생성"/>
</div>

</section>

</form>

</body>
<script>
</script>
</html>