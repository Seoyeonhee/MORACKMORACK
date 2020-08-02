<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>나의 모임 목록 조회</title>

<jsp:include page="/common/listCdn.jsp" />

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
		self.location="/meet/delMeet/0?meetId="+meetId;
	})
	
	$("button[id^='delMeet']").on("click", function(){
		var meetId = $(this).next().val();
		self.location="/meet/delMeet/1?meetId="+meetId;
	})
	
	if(message != null){
		if(message == "0"){
			alert("모임장은 모임 탈퇴 불가능합니다. 위임 후 탈퇴하세요.");
		}else if(message == "1"){
			alert("현재 모임원이 존재하므로 삭제하실 수 없습니다.");
		}else if(message == "2"){
			alert("가입하실 수 있는 모임의 개수는 최대 5개 입니다.");
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
        <h2>내가 가입한 모임</h2>
    </div>
    <table class="table table-hover">
        <tr>
        	<td></td>
            <td>모임명</td>
            <td>가입 날짜</td>
            <td>현재 인원/모임 정원</td>
            <td>모임 카테고리</td>
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
                ${category.categoryName}
                </td>
                <td>
                <button type="button" id="outMeet${status.count}">모임 탈퇴</button> 
                <input type="hidden" value="${meetMem.meet.meetId}"/>
                &nbsp; 
                <button type="button" id="delMeet${status.count}">모임 삭제</button>
                <input type="hidden" value="${meetMem.meet.meetId}"/>
                </td>
            </tr>
        </c:forEach>
    </table>
    </section>
    </div>

</body>
</html>