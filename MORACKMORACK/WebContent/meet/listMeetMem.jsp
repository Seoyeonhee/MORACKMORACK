<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ȸ�� ��� ��ȸ</title>

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

	$("button[id^='sendMessage']").on("click", function(){
		var userId = $(this).next().val();
		var meetId = $(this).next().next().val();
		
		//self.location="index.jsp"
		
		self.location="/message/sendMessage/"+userId+"/"+meetId;
	});
	
	$("button[id^='reqFriend']").on("click", function(){
		var userId = $(this).next().val();
		var meetId = $(this).next().next().val();
		alert(userId);
		self.location = "/friend/reqFriend?userId="+userId+"&"+"meetId="+meetId;
	});
	
	$("button[id^='notifyUserView']").on("click", function(){
		var userId = $(this).next().val();
		var meetId = $(this).next().next().val();
		self.location = "/notify/notifyUserView?userId="+userId;
	});
	
	$("button[id^='provideStaff']").on("click", function(){		
		var userId = $(this).next().val();
		var meetId  = $(this).next().val();
		$("form").attr("method", "POST").attr("action", "/meet/providePstn/1/"+userId+"/"+meetId).submit();
				
	});
	
	$("button[id^='provideLeader']").on("click", function(){
		var userId = $(this).next().val();
		var meetId  = $(this).next().next().val();
		$("form").attr("method", "POST").attr("action", "/meet/providePstn/0/"+userId+"/"+meetId).submit();
	});
	
});


</script>

</head>
<body>
<form>

<input type="hidden" id="joinMessage" value="${joinMessage}"/>
<input type="hidden" id="meetId" name="meetId" value="${meet.meetId}"/>


<header>
<jsp:include page="/toolbar.jsp" />
</header>

<section style="float: left; margin-top:100px;">
<jsp:include page="/meet/sidebar.jsp" />
</section>

<section style="float: left; margin-left:100px">
<div style="text-align: center;">
<section id="container" style="text-align: center;">
    <div id="title">
        <h2>���� ȸ�� ���</h2>
    </div>
    <table class="table table-hover">
        <tr>
        	<td></td>
        	<td>�̹���</td>
            <td>�г���</td>
            <td>���� ���� ��¥</td>
            <td>����</td>
            <td>����</td>
            <td>ȸ�� ���� ī�װ�</td>
            <td>������Ʈ �̷�(�����常 �� �� ����)</td>
            <td></td>
        </tr>
        <c:forEach var="meetMem" items="${listMeetMem}" varStatus="status"> 
            <tr>
            	<td>
            	<c:if test="${meetMem.meetRole eq '0'.charAt(0)}">������</c:if>
            	<c:if test="${meetMem.meetRole eq '1'.charAt(0)}">������</c:if>
            	<c:if test="${meetMem.meetRole eq '2'.charAt(0)}">���ӿ�</c:if>
            	</td>
                <td>${meetMem.user.profileImg}</td>
                <td>${meetMem.user.nickName}(${meetMem.user.userId})</td>
                <td><fmt:formatDate value="${meetMem.joinDate}" pattern="yyyy.MM.dd" /></td>
                <td>${meetMem.user.gender}</td>             
                <td>${meetMem.user.birthday}</td>              
                <td><c:forEach var="category" items="${meetMem.user.category}"> ${category} </c:forEach></td>
                <td><c:forEach var="blacklist" items="${meetMem.blackList}"> ${blacklist} </c:forEach></td> 
                <td>
                <button type="button" id="sendMessage${status.count}">���� ������</button>
                <input type="hidden" value="${meetMem.user.userId}"/>
                <input type="hidden" value="${meetMem.meet.meetId}"/><br/>
                
                <button type="button" id="reqFriend${status.count}">ģ�� ��û</button>
                <input type="hidden" value="${meetMem.user.userId}"/><input type="hidden" value="${meetMem.meet.meetId}"/><br/> 
                
                <button type="button" id="notifyUserView${status.count}">ȸ�� �Ű�</button>
                <input type="hidden" value="${meetMem.user.userId}"/><input type="hidden" value="${meetMem.meet.meetId}"/><br/> 
                
                <button type="button" id="provideStaff${status.count}">������ �Ӹ�</button><br/>
                <input type="hidden" value="${meetMem.user.userId}"/><input type="hidden" value="${meetMem.meet.meetId}"/>
                <button type="button" id="provideLeader${status.count}">������ ����</button><br/>
                <input type="hidden" value="${meetMem.user.userId}"/><input type="hidden" value="${meetMem.meet.meetId}"/>          
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