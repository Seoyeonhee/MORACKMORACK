<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/webSocket.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� �� ��ȸ</title>

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
		alert("��!") //�� ���â �����
	})
	
	$("#inputIntro").on("click", function(){
			var intro = $("#intro").val();
			alert(intro)
			alert(meetId)
			$("form").attr("method", "POST").attr("action", "/meet/joinMeet").submit();
	})
	

	$('#myModal').on('show.bs.modal', function (event) { // myModal �����찡 �����Ҷ� �Ʒ��� �ɼ��� ����
	  var button = $(event.relatedTarget) // ��� �����츦 �����ϴ� ��ư
	  var titleTxt = button.data('title') // ��ư���� data-title ���� titleTxt ������ ����
	  var modal = $(this)
	  modal.find('.modal-title').text('Title : ' + titleTxt) // ��������쿡�� .modal-title�� ã�� titleTxt ���� ġȯ
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

<input type="button" id="addWishMeet" value="���ϱ�"/> 
<input type="button" id="joinMeet" value="���� ����"/> 

<input type="button" value="���� �ʴ�"/>
<input type="button" value="īī���� �ʴ�"/>
<input type="button" id="addOffMeet" value="�������� ���� ����"/>
</div>

</section>

</form>

</body>
<script>
</script>
</html>