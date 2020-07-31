<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>쪽지 발신</title>

<jsp:useBean id="today" class="java.util.Date"/>
<jsp:include page="/common/listCdn.jsp" />

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
	
	$("#listFriend").on("click", function(){
		window.location.href = "/friend/listFriend/1?isModal=true";
	})
	
	var isModal = $('#isModal').val();
	
	if(isModal == '1'){
		
		$('#modalBox').modal('show');
	}
	
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
<div style="padding:40px; background-color:#dcdcdc; height:900px; width:1200px; margin-left:300px; margin-top:100px; padding:10px">
	쪽지 보내기
      <div style="padding:30px; background-color:#ffffff; height:25%; width:100%; opacity:0.6; display: inline-block; margin-top:20px">
     	 받는 사람<br/><br/>
      <span id="listFriend" class="glyphicon glyphicon-user" style=" font-size: 60px; float:left;"></span>
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
    		<c:forEach var="friend" items="${listFriend}">
			친구 이름 : 
			<c:if test="${user.userId eq friend.reqFriend.userId}">${friend.recvFriend.userId}</c:if> 
			<c:if test="${user.userId eq friend.recvFriend.userId}">${friend.reqFriend.userId}</c:if>
			<input type="hidden" value="${friend.friendNo}"/>
			</c:forEach>
</div>
<div class="modal-footer">
<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
            <button type="button" class="btn btn-primary" id="inputIntro">가입</button>
</div>
</div>
</div>
</div>
</div>

</aside>
</form>
</body>
</html>