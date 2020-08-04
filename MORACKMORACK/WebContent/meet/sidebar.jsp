<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<jsp:include page="/common/listCdn.jsp" />

<style>
@import url("//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css")
@font-face { font-family: 'BBTreeGB'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_nine_@1.1/BBTreeGB.woff') format('woff'); font-weight: normal; font-style: normal; }
@font-face {
font-family: 'Glyphicons Halflings';
src: url('https://netdna.bootstrapcdn.com/bootstrap/3.0.0/fonts/glyphicons-halflings-regular.eot');  src: url('https://netdna.bootstrapcdn.com/bootstrap/3.0.0/fonts/glyphicons-halflings-regular.eot?#iefix') format('embedded-opentype'), url('https://netdna.bootstrapcdn.com/bootstrap/3.0.0/fonts/glyphicons-halflings-regular.woff') format('woff'), url('https://netdna.bootstrapcdn.com/bootstrap/3.0.0/fonts/glyphicons-halflings-regular.ttf') format('truetype'), url('https://netdna.bootstrapcdn.com/bootstrap/3.0.0/fonts/glyphicons-halflings-regular.svg#glyphicons-halflingsregular') format('svg');
}


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
  padding-right: 46px;
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

#sideNickName{
	font-family: 'BBTreeGB';
	font-color: '#D2691E'
	font-size : 20px;
}
.glyphicon{
	font-size: 12px;
}
</style>


<ul class="nav nav-pills">
	<li>
	<c:if test="${empty sessionScope.user}">
       	<img class="sidebar-image" src="/resources/images/uploadFiles/meet/notUser.jpg">
       	</c:if>
       	<c:if test="${!empty sessionScope.user and !empty user.profileImg}">
       	<img class="sidebar-image" src="/resources/images/uploadFiles/user/${user.profileImg}">
       	</c:if>
       	<c:if test="${!empty sessionScope.user and empty user.profileImg and user.gender eq '남'}">
       	<img class="sidebar-image" src="/resources/images/uploadFiles/man.png">
       	</c:if>
       	<c:if test="${!empty sessionScope.user and empty user.profileImg and user.gender eq '여'}">
       	<img class="sidebar-image" src="/resources/images/uploadFiles/woman.png">
       	</c:if>
       	<strong id="sideNickName">
	<c:if test="${empty sessionScope.user}">비회원</c:if> <c:if test="${!empty sessionScope.user}">${user.nickName}</c:if>
		</strong>
	</li>
  <li class="sidebar-li" role="presentation"><a class="glyphicon glyphicon-home" href="/meet/getMeet/${meetId}" > Home</a></li>
  <c:if test="${!empty meetMem && meetMem.joinCode eq '1'.charAt(0)}">
  <li class="sidebar-li" role="presentation"><a class="glyphicon glyphicon-user" href="/meet/listMeetMem/${meetId}"> 모임 회원</a></li>
  <li class="sidebar-li" role="presentation"><a class="glyphicon glyphicon-send" href="#"> 채팅</a></li>
  <li class="sidebar-li" role="presentation"><a class="glyphicon glyphicon-book" href="/community/getPostList?meetId=${meetId}"> 모임 커뮤니티</a></li>
  <li class="sidebar-li" role="presentation"><a class="glyphicon glyphicon-calendar" href="/offmeet/getOffList?meetId=${meetId}"> 오프라인 모임 <span class="badge" style="background-color:#D2691E">4</span></a></li>
  </c:if>
  <c:if test="${!empty meetMem && meetMem.meetRole eq '0'.charAt(0)}">
  <li class="sidebar-li" role="presentation"><a class="glyphicon glyphicon-triangle-bottom" href="/meet/listJoinMeetUser/${meetId}"> 가입 신청 회원 <span class="badge" style="background-color:#D2691E">4</span></a></li>
  <li class="sidebar-li" role="presentation"><a class="glyphicon glyphicon-triangle-bottom" href="#"> 신고 관리</a></li>
  </c:if>
</ul>

