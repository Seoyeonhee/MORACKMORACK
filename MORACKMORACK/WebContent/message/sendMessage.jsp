<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>쪽지 발신</title>

<jsp:useBean id="today" class="java.util.Date"/>
<jsp:include page="/common/listCdn.jsp" />

<style>
@font-face { font-family: 'MapoGoldenPier'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/MapoGoldenPierA.woff') format('woff'); font-weight: normal; font-style: normal; }
button {
    width:100px;
    background-color: #E7D5BD;
    border: none;
    color:#E7D5BD;
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
    background-color: #ffffff;
     border: 2px #E7D5BD;
    color:#000000;
}

#messageDetail{
font-family: 'MapoGoldenPier'; 
}
</style>


<script type="text/javascript">

$(function(){
	
	var isModal = $('#isModal').val();
	if(isModal == '1'){
		
		$('#modalBox').modal('show');
	}
	
	$("#ok").on("click", function(){
		window.history.back();
	})
	
	$("#submitMessage").on("click", function(){
		$("form").attr("method", "POST").attr("action", "/message/sendMessage").submit();
	});
	
	$("#listFriendOn").on("click", function(){
		window.location.href = "/friend/listFriend/1?isModal=1";
	})	
			
	
	$('#myModal').on('show.bs.modal', function (event) { // myModal 윈도우가 오픈할때 아래의 옵션을 적용
		  var button = $(event.relatedTarget) // 모달 윈도우를 오픈하는 버튼
		  var titleTxt = button.data('title') // 버튼에서 data-title 값을 titleTxt 변수에 저장
		  var modal = $(this)
		  modal.find('.modal-title').text('Title : ' + titleTxt) // 모달위도우에서 .modal-title을 찾아 titleTxt 값을 치환
		});
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

<input type="hidden" id="isModal" value="${isModal}"/>

<form>
<aside>
<div style="padding:40px; background-color:#E7D5BD; height:900px; width:1200px; margin-left:300px; margin-top:150px; padding:10px">
      <div id="messageDetail" style="padding:30px; background-color:#ffffff; height:25%; width:100%; opacity:0.8; display: inline-block; margin-top:20px">
     	 받는 사람<br/><br/>
      <span id="listFriendOn" class="glyphicon glyphicon-user" style=" font-size: 60px; float:left;"></span>
	      	<div id="messageDetail" style="margin-left:100px; margin-botton:300px;">
	      	모임명 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${meet.meetName}<br/> 
	      	<input type="hidden" id="meetId" name="meetId" value="${meet.meetId}"/>
	      	<input type="hidden" id="meetName" name="meetName" value="${meet.meetName}"/>
			수신자 ID &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${recvUser.userId}<br/>	
			<input type="hidden" id="recvId" name="recvId" value="${recvUser.userId}"/>
			수신자 닉네임 &nbsp; ${recvUser.nickName}<br/>	
			</div>
			<br/><br/>
			쪽지 제목 <input type="text" id="title" name="title" value="" style="height:30px; width:500px; margin-left:10px;"/>		
      </div>

<div>
<textarea rows="25" cols="160" id="content" name="content" style="margin-top:30px; opacity:0.8;"></textarea>
</div>
<div style="float: right; padding:10px">
<button type="button" id="ok" style="margin-right:30px">취소</button>
<button type="button" id="submitMessage">전송</button>
</div>
</div>


<!-- 모달 영역 -->
<div id="modalBox" class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
<div class="modal-dialog" role="document">
<div class="modal-content">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
<h4 class="modal-title" id="myModalLabel">친구 리스트</h4>
</div>
<div class="modal-body">
    	<div class="col-xs-6 col-md-5">
    		쪽지 보내고 싶은 사람 선택<br/><br/>
    		<c:forEach var="friend" items="${listFriend}">
			<c:if test="${user.userId eq friend.reqFriend.userId}"><a href="/message/sendMessage?userId=${friend.recvFriend.userId}"> ${friend.recvFriend.userId}</c:if> 
			<c:if test="${user.userId eq friend.recvFriend.userId}"><a href="/message/sendMessage?userId=${friend.reqFriend.userId}"> ${friend.reqFriend.userId}</c:if>
			<input type="hidden" value="${friend.friendNo}"/>
			</a><br/>
			</c:forEach>
</div>
<div class="modal-footer">

</div>
</div>
</div>
</div>
</div>

</aside>
</form>
</body>
</html>