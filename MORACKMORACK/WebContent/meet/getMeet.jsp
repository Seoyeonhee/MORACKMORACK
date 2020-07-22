<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ include file="/webSocket.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� �� ��ȸ</title>

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
<input type="button" value="���� ����"/>
<input type="button" value="���ϱ�"/> 

<input type="button" value="���� �ʴ�"/>
<input type="button" value="īī���� �ʴ�"/>
<input type="button" value="���� ����"/>
</div>

<label id="list-group"><span class="glyphicon glyphicon-align-justify"></span></label>
<div>
<ul class="nav nav-pills nav-stacked col-md-1">
<li role="presentation"><a href="#">���� ȸ�� ���</a></li>
<li role="presentation"><a href="#">Ŀ�´�Ƽ</a></li>
<li role="presentation"><a href="#">ä��</a></li>
<li role="presentation"><a href="#">��õ��ü ��ȸ</a></li>
<li role="presentation"><a href="#">������ ����</a></li>
<li role="presentation"><a href="#">���� ��û ȸ�� ���</a></li>
<li role="presentation"><a href="#">�Ű���� ȸ�� ���</a></li>
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
		<c:when test="${meet.category eq 1}">����</c:when>
		<c:when test="${meet.category eq 2}">����</c:when>
		<c:when test="${meet.category eq 3}">����</c:when>
		<c:when test="${meet.category eq 4}">��ȭ</c:when>
		<c:when test="${meet.category eq 5}">����</c:when>
		<c:when test="${meet.category eq 6}">����</c:when>
		<c:when test="${meet.category eq 7}">���/�ڱ���</c:when>
		<c:when test="${meet.category eq 8}">��Ƽ��Ƽ</c:when>
		<c:when test="${meet.category eq 9}">����/��ȭ</c:when>
		<c:when test="${meet.category eq 10}">��</c:when>
		<c:when test="${meet.category eq 11}">����</c:when>
		<c:when test="${meet.category eq 12}">�ݷ�����</c:when>
		<c:when test="${meet.category eq 13}">�丮</c:when>
		<c:when test="${meet.category eq 14}">��</c:when>
		<c:when test="${meet.category eq 15}">������</c:when>
		<c:when test="${meet.category eq 16}">����</c:when>
		<c:when test="${meet.category eq 17}">��Ÿ</c:when>
		</c:choose>
		<h3>${meet.sIntro}</h3>
		<h3>${meet.meetLoc}</h3>
		<h3>${meet.meetStar}</h3>
	</div>
	<div class="col-md-3" style="height:500px; background-color: #F08080; margin-left:30px">
	�������� ���� ����
	</div>
</div>

<div class="row" style="margin-left:120px; margin-top:100px"> <!-- �� �̹��� / ���̺� ��������� �ֱ� -->
 	<div class="col-xs-6 col-md-7">
    <a href="#" class="thumbnail">
      <img src="" alt="...">
    </a>
  </div>
  	<div class="col-md-4" style="height:500px; background-color: #CD5C5C">  <!-- �ı� / ���̺� ��������� �ֱ� -->
		<h3>�ı�</h3>  
		<h3></h3>  
	</div>
</div>


<a href="#">n�� �ı� ��� ����</a>
</body>
</html>