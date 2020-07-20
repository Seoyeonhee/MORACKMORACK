<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ include file="/webSocket.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� �� ��ȸ</title>

<script src="https://code.jquery.com/jquery-3.1.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>

<script type ="text/javascript">

$(function (){
		
	var userId = $("#userId").val();
	var meetNo = $("#meetNo").val();
	var offMeetMessage = "ȯ���մϴ�";
	
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

<input type="button" value="���� ����"/> <hr/>
<input type="button" value="���ϱ�"/> <hr/>

<input type="button" value="���� �ʴ�"/> <hr/>
<input type="button" value="īī���� �ʴ�"/> <hr/>

<input type="button" id="addOffMeet" value="���� ����"/> <hr/>


<a href="#">���� ȸ�� ���</a> <hr/>
<a href="#">Ŀ�´�Ƽ</a> <hr/>
<a href="#">ä��</a> <hr/>
<a href="#">��õ��ü ��ȸ</a> <hr/>
<a href="#">������ ����</a> <hr/>
<a href="#">���� ��û ȸ�� ���</a> <hr/>
<a href="#">�Ű���� ȸ�� ���</a> <hr/>

<a href="#">n�� �ı� ��� ����</a>
</body>
</html>