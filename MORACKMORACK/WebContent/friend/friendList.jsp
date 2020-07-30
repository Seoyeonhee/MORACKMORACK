<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script src="https://code.jquery.com/jquery-3.1.1.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


<script type ="text/javascript">
$(function(){

	$("button[id^='sendMessage']").on("click", function(){
		var userId = $(this).next().val();
		var meetId = $(this).next().next().val();
		
		//self.location="index.jsp"
		
		self.location="/message/sendMessage"
	});
});
</script>

</head>
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#staticBackdrop">
  친구 리스트
</button>

<!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">친구 리스트</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">x</span>
        </button>
      </div>
      <div class="modal-body">
       <c:forEach var="friend" items="${friendList}" varStatus="status">
						<tr>
						<td>${friend.recvFriend.profileImg}</td>
						<td>${friend.recvFriend.nickName}</td>
						<button type="button" id="sendMessage${status.count}">쪽지 보내기</button>
						<input type="hidden" value="${friend.recvFriend.userId}"/><br/>
						</tr>
					</c:forEach>
      </div>
      <div class="modal-footer">
		<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>
<body>
</div>

</body>
</html>