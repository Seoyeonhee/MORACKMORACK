<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ���� ��� ��ȸ</title>

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

<script type="text/javascript">
$(function(){

	var message = $("#message").val();
			
	$("#meetImg, #meetName").on("click", function(){
		var meetId = $(this).next().val();
		self.location="/meet/getMeet/"+meetId;
	})
	
	$("button[id^='outMeet']").on("click", function(){
		var meetId = $(this).next().val();
		alert("as")
		self.location="/meet/delMeet/0?meetId="+meetId;
	})
	
	$("button[id^='delMeet']").on("click", function(){
		var meetId = $(this).next().val();
		alert("as")
		self.location="/meet/delMeet/1?meetId="+meetId;
	})
	
	if(message != null){
		if(message == "0"){
			alert("�������� ���� Ż�� �Ұ����մϴ�. ���� �� Ż���ϼ���.");
		}else if(message == "1"){
			alert("���� ���ӿ��� �����ϹǷ� �����Ͻ� �� �����ϴ�.");
		}else if(message == "2"){
			alert("�����Ͻ� �� �ִ� ������ ������ �ִ� 5�� �Դϴ�.");
		}
	}
})

</script>

</head>
<body>

<header>
<jsp:include page="/toolbar.jsp" />
</header>


<input type="hidden" id="message" value="${message}"/>
 
<div style="text-align: center;">
<section id="container" style="text-align: center;">
    <div id="title">
        <h2>���� ������ ����</h2>
    </div>
    <table class="table table-hover">
        <tr>
        	<td></td>
            <td>���Ӹ�</td>
            <td>���� ��¥</td>
            <td>���� �ο�/���� ����</td>
            <td>���� ī�װ�</td>
            <td></td>
        </tr>
        <c:forEach var="meetMem" items="${listMyMeet}" varStatus="status">
            <tr>
            	<td>
            	<c:if test="${! empty meetMem.meet.meetImg}">
				<img src="/resources/images/uploadFiles/meet/${meetMem.meet.meetImg}" alt="MORACK MORACK" class="img-circle" style="height:100px; width:100px" id="meetImg"></c:if>
    			<input type="hidden" value="${meetMem.meet.meetId}"/>
    			
    			<c:if test="${empty meetMem.meet.meetImg}">
    			<img src="/resources/images/uploadFiles/meet/empty_Img.png" alt="MORACK MORACK" class="img-circle" style="height:100px; width:100px" id="meetImg"></c:if>
    			<input type="hidden" value="${meetMem.meet.meetId}"/>
    			
    			</td>
                <td><a id="meetName">${meetMem.meet.meetName}</a>
                <input type="hidden" value="${meetMem.meet.meetId}"/>
                </td>             
                <td><fmt:formatDate value="${meetMem.joinDate}" pattern="yyyy.MM.dd" /></td>
                <td>${meetMem.meet.memNum}/${meetMem.meet.maxNum}</td>
                <td>
                <c:choose>
					<c:when test="${meetMem.meet.category eq 0}">����</c:when>
					<c:when test="${meetMem.meet.category eq 1}">����</c:when>
					<c:when test="${meetMem.meet.category eq 2}">����</c:when>
					<c:when test="${meetMem.meet.category eq 3}">��ȭ</c:when>
					<c:when test="${meetMem.meet.category eq 4}">����</c:when>
					<c:when test="${meetMem.meet.category eq 5}">����</c:when>
					<c:when test="${meetMem.meet.category eq 6}">���/�ڱ���</c:when>
					<c:when test="${meetMem.meet.category eq 7}">��Ƽ��Ƽ</c:when>
					<c:when test="${meetMem.meet.category eq 8}">����/��ȭ</c:when>
					<c:when test="${meetMem.meet.category eq 9}">��</c:when>
					<c:when test="${meetMem.meet.category eq 10}">����</c:when>
					<c:when test="${meetMem.meet.category eq 11}">�ݷ�����</c:when>
					<c:when test="${meetMem.meet.category eq 12}">�丮</c:when>
					<c:when test="${meetMem.meet.category eq 13}">��</c:when>
					<c:when test="${meetMem.meet.category eq 14}">������</c:when>
					<c:when test="${meetMem.meet.category eq 15}">����</c:when>
					<c:when test="${meetMem.meet.category eq 16}">��Ÿ</c:when>
				</c:choose>
                </td>
                <td>
                <button type="button" id="outMeet${status.count}">���� Ż��</button> 
                <input type="hidden" value="${meetMem.meet.meetId}"/>
                &nbsp; 
                <button type="button" id="delMeet${status.count}">���� ����</button>
                <input type="hidden" value="${meetMem.meet.meetId}"/>
                </td>
            </tr>
        </c:forEach>
    </table>
    </section>
    </div>

</body>
</html>