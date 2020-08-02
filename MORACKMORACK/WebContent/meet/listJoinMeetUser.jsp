<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>가입 신청 회원 목록 조회</title>

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

<script type ="text/javascript">

$(function (){
	
	
	$("button[id^=okJoinMeetUser]").on("click", function(){
		var userId = $(this).next().val();
		var meetId = $(this).next().next().val();
		$("form").attr("method", "POST").attr("action", "/meet/mangJoinMeetUser/"+userId+"/1?meetId="+meetId).submit();
		
	})
	
	$("button[id^=refuseJoinMeetUser]").on("click", function(){
		var userId = $(this).next().val();
		var meetId = $(this).next().next().val();
		$("form").attr("method", "POST").attr("action", "/meet/mangJoinMeetUser/"+userId+"/0?meetId="+meetId).submit();
		
	})
})

</script>

</head>

<body>
<form>

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
        <h2>가입 신청 회원 목록</h2>
    </div>
    <table class="table table-hover">
        <tr>
        	<td>이미지</td>
            <td>닉네임</td>
            <td>성별</td>
            <td>생년월일</td>
            <td>회원 카테고리</td>
            <td>블랙리스트 이력</td>
            <td>가입 소개<td>
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
                <td><c:if test="${joinMeetUser.user.gender eq '남'}">남자</c:if><c:if test="${joinMeetUser.user.gender eq '여'}">여자</c:if></td>
                <td><fmt:formatDate value="${joinMeetUser.user.birthday}" pattern="yyyy.MM.dd" /></td>
                <td><c:forEach var="category" items="${joinMeetUser.user.category}"> ${category} </c:forEach></td>
                <td><c:forEach var="blacklist" items="${joinMeetUser.blackList}"> ${blacklist} </c:forEach></td> 
                <td>${joinMeetUser.intro}</td>
                <td><button type="button" id="okJoinMeetUser">가입 승인</button>
                <input type="hidden" value="${joinMeetUser.user.userId}"/>
                <input type="hidden" value="${joinMeetUser.meet.meetId}"/>
                 &nbsp; 
                <button type="button" id="refuseJoinMeetUser">가입 거절</button>
                <input type="hidden" value="${joinMeetUser.user.userId}"/>
                <input type="hidden" value="${joinMeetUser.meet.meetId}"/>
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