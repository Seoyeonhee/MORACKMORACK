<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<style>


.sidebar-image{
  width: 54px;
  height: 54px;
  margin: 16px;
  border-radius: 50%;
  -webkit-transition: all 0.2s ease-in-out;
  -o-transition: all 0.2s ease-in-out;
  transition: all 0.2s ease-in-out;
}


.sidebar-li{
  position: relative;
  cursor: pointer;
  user-select: none;
  display: block;
  height: 80px;
  line-height: 48px;
  padding: 0;
  padding-left: 16px;
  padding-right: 56px;
  text-decoration: none;
  clear: both;
  font-weight: 500;
  overflow: hidden;
  -o-text-overflow: ellipsis;
  text-overflow: ellipsis;
  white-space: nowrap;
  -webkit-transition: all 0.2s ease-in-out;
  -o-transition: all 0.2s ease-in-out;
  transition: all 0.2s ease-in-out;
  position: absolute;
  right: 16px;
  top: 0px;
  background-color: #fff !important;
  text-align : left;
  font-color:#000000;
  font-size:15px;
}

</style>


<ul class="nav nav-pills nav-stacked">
	<li>
	<c:if test="${empty sessionScope.user}">
       	<img class="sidebar-image" src="/resources/images/uploadFiles/meet/notUser.jpg">
       	</c:if>
       	<c:if test="${!empty sessionScope.user and !empty user.profileImg}">
       	<img class="sidebar-image" src="resources/images/uploadFiles/user/${user.profileImg}">
       	</c:if>
       	<c:if test="${!empty sessionScope.user and empty user.profileImg}">
       	<img class="sidebar-image" src="resources/images/uploadFiles/user/empty_Img.png">
       	</c:if>
	<c:if test="${empty sessionScope.user}">비회원</c:if> <c:if test="${!empty sessionScope.user}">${user.nickName}</c:if>
	</li>
  <li class="sidebar-li" role="presentation"><a class="glyphicon glyphicon-home" href="/meet/getMeet/${meetId}" > Home</a></li>
  <li class="sidebar-li" role="presentation"><a class="glyphicon glyphicon-user" href="/meet/listMeetMem/${meetId}"> 모임 회원</a></li>
  <li class="sidebar-li" role="presentation"><a class="glyphicon glyphicon-send" href="#"> 채팅</a></li>
  <li class="sidebar-li" role="presentation"><a class="glyphicon glyphicon-book" href="#"> 모임 커뮤니티</a></li>
  <li class="sidebar-li" role="presentation"><a class="glyphicon glyphicon-calendar" href="/offmeet/getOffList?meetId=${meetId}"> 오프라인 모임 <span class="badge" style="background-color:#FFD835">4</span></a></li>
  <li class="sidebar-li" role="presentation"><a class="glyphicon glyphicon-triangle-bottom" href="/meet/listJoinMeetUser/${meetId}"> 가입 신청 회원 <span class="badge" style="background-color:#FFD835">4</span></a></li>
  <li class="sidebar-li" role="presentation"><a class="glyphicon glyphicon-triangle-bottom" href="#"> 신고 관리</a></li>
</ul>

