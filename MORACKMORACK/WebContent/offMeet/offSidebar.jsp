<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



<jsp:include page="/common/listCdn.jsp" />


<style>
@font-face { font-family: 'TmoneyRoundWindExtraBold'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/TmoneyRoundWindExtraBold.woff') format('woff'); font-weight: normal; font-style: normal; }
@font-face { font-family: 'BBTreeGB'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_nine_@1.1/BBTreeGB.woff') format('woff'); font-weight: normal; font-style: normal; }


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

#sideTool{
	font-family: 'TmoneyRoundWindExtraBold';
	font-size : 15px;
}

#sideNickName{
	font-family: 'BBTreeGB';
	font-size : 20px;
}
</style>


<ul class="nav nav-pills nav-stacked">
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
	
  <li class="sidebar-li" role="presentation"><a id="sideTool" class="glyphicon glyphicon-home" href="/meet/getMeet/${meet.meetId}" > Home</a></li>
	<ul class="nav nav-pills nav-stacked">
  <li class="sidebar-li" role="presentation"><a id="sideTool" class="glyphicon glyphicon-home" href="/offmeet/listOffPay" > 참여비 결제 리스트</a></li>
   <li class="sidebar-li" role="presentation"><a id="sideTool" class="glyphicon glyphicon-home" href="/offmeet/listBusinessPay?meetId=${meet.meetId}" >제휴업체 결제 리스트</a></li>
</ul>

