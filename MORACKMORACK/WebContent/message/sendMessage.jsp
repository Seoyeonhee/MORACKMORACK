<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   

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

$(function(){
	$("#submitMessage").on("click", function(){
		$("form").attr("method", "POST").attr("action", "/message/sendMessage").submit();
	});
	
	$("#friendList").on("click", function(){
		self.location="/friend/friendList";
	})
})

</script>

</head>

<body>

<header>
<jsp:include page="/toolbar.jsp" />
</header>

<section style="float: left; margin-top:100px;">
<jsp:include page="/message/sidebar.jsp" />
</section>
<form>
<aside>
<div style="padding:40px; background-color:#dcdcdc; height:900px; width:1200px; margin-left:300px; margin-top:100px; padding:10px">
	쪽지 보내기
      <div style="padding:30px; background-color:#ffffff; height:25%; width:100%; opacity:0.6; display: inline-block; margin-top:20px">
     	 받는 사람<br/><br/>
      <span id="friendList" class="glyphicon glyphicon-user" style=" font-size: 60px; float:left;"></span>
	      	<div style="margin-left:100px; margin-botton:300px;">
	      	모임명 ${meet.meetName}<br/> 
	      	<input type="hidden" id="meetId" name="meetId" value="${meet.meetId}"/>
	      	<input type="hidden" id="meetName" name="meetName" value="${meet.meetName}"/>
			수신자 ID ${recvUser.userId}<br/>	
			<input type="hidden" id="recvId" name="recvId" value="${recvUser.userId}"/>
			수신자 닉네임 ${recvUser.nickName}<br/>	
			</div>
			<br/><br/>
			쪽지 제목 <input type="text" id="title" name="title" value="" style="height:30px; width:500px; margin-left:10px;"/>		
      </div>

<div>
<textarea rows="30" cols="187" id="content" name="content" style="margin-top:30px;"></textarea>
</div>
<div style="float: right; padding:10px">
<button type="button" id="cancle" style="margin-right:30px">취소</button>
<button type="button" id="submitMessage">전송</button>
</div>
</div>
</aside>
</form>
</body>
</html>