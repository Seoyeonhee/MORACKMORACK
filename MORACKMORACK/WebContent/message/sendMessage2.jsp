<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>쪽지 발신</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script src="https://code.jquery.com/jquery-3.1.1.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="/resources/js/sockjs.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>

<jsp:useBean id="today" class="java.util.Date"/>

<style>
button {
    width:100px;
    background-color: #8cafb9;
    border: none;
    color:#fff;
    padding: 15px 0;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 15px;
    margin: 4px;
    cursor: pointer;
    border-radius:10px;

}
button:hover {
    background-color: #FFFFFF;
    color:#8cafb9;
}

A:link {text-decoration:none; color:#646464;}
A:visited {text-decoration:none; color:#646464;}
A:active {text-decoration:none; color:#646464;}
A:hover {text-decoration:none; color:#646464;}
</style>


<script type="text/javascript">

var ws;
var userId = "${sessionScope.user.userId}"; //sender

$(function (){
	connect();
	$("#btnSend").on("click", function(){
		var chat = $("#msgArea").val();
		chat = chat + "\나 : "+ $("#chatMsg").val();
		$("#msgArea").val(chat);
		sendMsg();
		$("#chatMsg").val("");
		
	})
})


function connect(){ 
	
	//웹소켓 객체 생성하는 부분
	//핸들러 등록(연결 생성, 메세지 수신, 연결 종료)
	
	//url 연결할 서버의 경로
	ws = new SockJS("<c:url value="/echo"/>");
	
	ws.onopen = function(){
		console.log('연결 생성');
	};
	ws.onmessage = function(e){
		console.log('메세지 받음');
		var data = e.data;
		alert("받은 메세지 : "+ data);
		addMsg(data);
	};
	ws.onclose = function(){
		console.log('연결 끊김');
	};
	
}

function addMsg(msg){ //원래 채팅 메세지에 방금 받은 메세지 더해서 set
	var chat = $("#msgArea").val();
	chat = chat + "\n 상대방 : "+ msg;
	$("#msgArea").val(chat);
}

function sender(){ //메세지 수신을 위한 서버에 id 등록
	var msg = {
			type : "senderId", //메세지 구분하는 구분자 - 상대방 아이디와 메세지 포함
			sendId : "${sessionScope.user.userId}"
	
	};
	
	ws.send(JSON.stringify(msg));
}

function sendMsg(){
	var msg = {
			type : "message", //메세지 구분하는 구분자 - 상대방 아이디와 메세지 포함
			sendId : "${sessionScope.user.userId}",
			recvId : $("#targetUser").val(),
			content : $("#chatMsg").val()
	};
	ws.send(JSON.stringify(msg));
};



</script>

</head>

<body>

<header>
<jsp:include page="/toolbar.jsp" />
</header>

<section style="float: left; margin-top:100px;">
<jsp:include page="/message/sidebar.jsp" />
</section>

<aside>
<div style="padding:40px; background-color:#dcdcdc; height:900px; width:1200px; margin-left:300px; margin-top:100px; padding:10px">
	쪽지 보내기
      <div style="padding:30px; background-color:#ffffff; height:25%; width:100%; opacity:0.6; display: inline-block; margin-top:20px">
     	 받는 사람<br/><br/>
      <span class="glyphicon glyphicon-user" style=" font-size: 60px; float:left;"></span>
	      	<div style="margin-left:100px; margin-botton:300px;">
	      	모임명 ${meet.meetName}<br/>
			수신자 ID ${user.userId}<br/>
			수신자 닉네임 ${user.nickName}<br/>
			</div>
			<br/><br/>
			쪽지 제목 <input type="text" id="title" name="title" value="" style="height:30px; width:500px; margin-left:10px;"/>		
      </div>

<div>
<textarea rows="30" cols="187" id="content" name="content" style="margin-top:30px;"></textarea>
</div>
<div style="float: right; padding:10px">
<button id="cancle" style="margin-right:30px">취소</button><button id="submit">전송</button>
</div>
</div>
</aside>
</body>
</html>