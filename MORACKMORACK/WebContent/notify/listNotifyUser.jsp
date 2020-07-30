<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>신고 목록 조회</title>

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
	
	$("button[id^='prohibit']").on("click", function(){
		var notifyNo = $(this).next().val();
		self.location = "/notify/prohibit?notifyNo="+notifyNo;
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
    <div id="title">
        <h2>신고 목록</h2>
    </div>
    <table class="table table-hover">
        <tr>
        	
        	<td>신고 회원 이미지</td>
            <td>신고 회원 닉네임</td>
            <td>신고 날짜</td>
            <td>신고 유형</td>
            <td></td>
        </tr>
        <c:forEach var="notify" items="${listNotifyUser}" varStatus="status"> 
            <tr>
                <td>${notify.recvNotiUser.profileImg}</td>
                <td>${notify.recvNotiUser.nickName}(${notify.recvNotiUser.userId})</td>
                <td><fmt:formatDate value="${notify.notifyDate}" pattern="yyyy.MM.dd" /></td>
                <td>
					<c:if test="${notify.notiType eq '0'.charAt(0)}">선동</c:if>
					<c:if test="${notify.notiType eq '1'.charAt(0)}">절도</c:if>
					<c:if test="${notify.notiType eq '2'.charAt(0)}">폭행</c:if>
					<c:if test="${notify.notiType eq '3'.charAt(0)}">성범죄</c:if>
					<c:if test="${notify.notiType eq '4'.charAt(0)}">악플</c:if>
				</td>
				
			<td>
                <button type="button" id="prohibit${status.count}">영구 정지</button>
                <input type="hidden" value="${notify.notifyNo}"/>
                </td>
            </tr>
        </c:forEach>
    </table>
    </section>
    </div>
</section>
</form>
</body>
</html>