<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>친구 신청 수신 목록</title>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<jsp:useBean id="today" class="java.util.Date"/>

<style>
button {
    width:100px;
    background-color: #FFA69E;
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
    color:#FFA69E;
}

A:link {text-decoration:none; color:#646464;}
A:visited {text-decoration:none; color:#646464;}
A:active {text-decoration:none; color:#646464;}
A:hover {text-decoration:none; color:#646464;}
</style>

<script type ="text/javascript">
$(function(){
	
	$("button[id^='okFriend']").on("click", function(){
		var userId = $(this).next().val();
		self.location = "/friend/okFriend?friendNo="+friendNo;
	});
	
	$("button[id^='denyFriend']").on("click", function(){		
		var userId = $(this).next().val();
		self.location = "/friend/denyFriend?userId="+userId;
				
	});
	
	$("button[id^='getRecvFriend']").on("click", function(){		
		var userId = $(this).next().val();
		self.location = "/friend/denyFriend?friendNo="+friendNo;
				
	});

});


</script>

</head>
<body>
<form>

<header>
<jsp:include page="/toolbar.jsp" />
</header>

<section style="float: center; margin-left:100px">
<div style="text-align: center;">
<section id="container" style="text-align: center;">
    <div id="title" >
        <h2>친구 수신 목록</h2>
    </div>
    <table class="table table-hover">
        <c:forEach var="friend" items="${listRecvFriend}" varStatus="status"> 
            <tr>
                <td>${friend.reqFriend.profileImg}</td>
                <td>${friend.reqFriend.nickName}(${friend.reqFriend.userId})</td>
                <td><fmt:formatDate value="${friend.reqFriendDate}" pattern="yyyy.MM.dd" /></td>
                <td>${friend.reqFriend.gender}</td>
                <td>
             	<button type="button" id="getRecvFriend${status.count}">상세보기</button>
             	<input type="hidden" value="${friend.friendNo}">
				 상세정보
				 </button>
				 </td>
				 <td>
            	<button type="button" id="okFriend${status.count}">수락</button>
            	<input type="hidden" value="${friend.friendNo}"><br/>
            	</td>
            	<td>
            	<button type="button" id="denyFriend${status.count}">거절</button>
            	<input type="hidden" value="${friend.reqFriend.userId}"><br/>
                </td>
            </tr>
        </c:forEach>
    </table>
     <div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
 					 <div class="modal-dialog">
    				<div class="modal-content">
      				<div class="modal-header">
        				<h5 class="modal-title" id="staticBackdropLabel">상세정보</h5>
        				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          					<span aria-hidden="true">x</span></button>
      				</div>
      				<div class="modal-body">
      				<tr>
						<td>${friend.recvFriend.profileImg}</td>
						<td>${friend.recvFriend.nickName}</td>
						</tr>				
      				</div>
				    </div>
				  </div>
				</div>
    </section>
    </div>
</section>
</form>
</body>
</html>