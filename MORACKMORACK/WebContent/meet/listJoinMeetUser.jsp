<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ��û ȸ�� ��� ��ȸ</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


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


</style>

<script type ="text/javascript">

$(function (){
	
	$("#okJoinMeetUser").on("click", function(){
		var userId = $(this).next().val();
		alert($("#meetId").val())
		$("form").attr("method", "POST").attr("action", "/meet/mangJoinMeetUser/"+userId+"/1");
		
	})
	
	$("#refuseJoinMeetUser").on("click", function(){
		var userId = $(this).next().val();
		
		$("form").attr("method", "POST").attr("action", "/meet/mangJoinMeetUser/"+userId+"/0");
		
	})
})

</script>

</head>
<body>

<header>
<jsp:include page="/toolbar.jsp" />
</header>

<section style="float: left; margin-top:100px;">
<jsp:include page="/meet/sidebar.jsp" />
</section>

<form>

<input type="hidden" id="meetId" name="meetId" value="${meetId}"/>

<div style="text-align: center;">
<section id="container" style="text-align: center;">
    <div id="title">
        <h2>���� ��û ȸ�� ���</h2>
    </div>
    <table class="table table-hover">
        <tr>
        	<td>�̹���</td>
            <td>�г���</td>
            <td>����</td>
            <td>�������</td>
            <td>ȸ�� ī�װ���</td>
            <td>��������Ʈ �̷�</td>
            <td>���� �Ұ�<td>
            <td></td>
        </tr>
        <c:forEach var="joinMeetUser" items="${listJoinMeetUser}">
            <tr>
                <td>            
                <c:if test="${! empty joinMeetUser.user.profileImg}">
				<img src="/resources/images/uploadFiles/meet/${joinMeetUser.user.profileImg}" alt="MORACK MORACK" class="img-circle" style="height:100px; width:100px"></c:if>
    			<input type="hidden" value="${joinMeetUser.user.profileImg}"/>
    			
    			<c:if test="${empty joinMeetUser.user.profileImg}">
    			<img src="/resources/images/uploadFiles/meet/empty_Img.png" alt="MORACK MORACK" class="img-circle" style="height:100px; width:100px"></c:if>
    			<input type="hidden" value="${joinMeetUser.user.profileImg}"/>
    			</td>
                
                <td>${joinMeetUser.user.nickName}(${joinMeetUser.user.userId})</td>
                <td><c:if test="${joinMeetUser.user.gender eq '0'}">����</c:if><c:if test="${joinMeetUser.user.gender eq '1'}">����</c:if></td>
                <td><fmt:formatDate value="${joinMeetUser.user.birthday}" pattern="yyyy.MM.dd" /></td>
                <td><c:forEach var="category" items="${joinMeetUser.user.category}"> ${category} </c:forEach></td>
                <td><c:forEach var="blacklist" items="${joinMeetUser.blackList}"> ${blacklist} </c:forEach></td> 
                <td>${joinMeetUser.intro}</td>
                <td><button id="okJoinMeetUser">���� ����</button><input type="hidden" value="${joinMeetUser.user.userId}"/> &nbsp; 
                <button id="refuseJoinMeetUser">���� ����</button><input type="hidden" value="${joinMeetUser.user.userId}"/></td>
            </tr>
        </c:forEach>
    </table>
    </section>
    </div>
</form>
</body>
</html>