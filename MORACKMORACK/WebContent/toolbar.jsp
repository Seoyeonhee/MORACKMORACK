<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
body {
	background: #ffffff; margin: 50px 0;
}
#menubar {
	width: 100%; height: 62px; background: #4D5F78;
}
#menubar-menus {
	width: 600px; margin: 0 auto; list-style: none; padding: 0; text-align: center; font-size: 0; display: table;
}
#menubar-menus > li {
	padding: 12px 0px; width: 200px; height: 40px; display: table-cell; vertical-align: middle; text-align: center; vertical-align: middle; font-size: 15px; 
}
#menubar-menus > li > a {
	 display: table-cell; vertical-align: middle; width: 200px; height: 40px; text-decoration: none; color: #FFF; 
	position: relative;
}
#menubar-menus li:hover {
	background: #FFF;
}
#menubar-menus > li > div {
	position: absolute; background: #FFF; color: #000; left: 0; width: 100%; top: auto; display: none;
	padding: 50px 0; z-index: 10;
}
</style>


<script>
$(function() {
	$("#menubar-menus li").mouseenter(function(event) {
		$(this).find("div").parent().css("background", "#FFF");
		$(this).find("div").parent().children("a").css("color", "#000").css("size", "15px");
		$(this).find("div").slideDown("fast");
	}).mouseleave(function() {
		$(this).find("div:visible").slideUp(50, function() {
			$(this).parent().css("background", "#4D5F78");
			$(this).parent().children("a").css("color", "#FFF");
		});
	});
});
</script>


<p style="text-align:left;"><a href="/index.jsp">MORACKMORACK</a>
    <span style="float:right;">
    <c:if test="${empty sessionScope.user}">
    <a href="/user/login">로그인</a>
    <a href="/user/addUserView" style="margin-left:10px">회원가입</a>
    <a href="#" style="margin-left:10px">업체 로그인</a>
    <a href="#" style="margin-left:10px">업체 회원가입</a>
    </c:if>
    <c:if test="${!empty sessionScope.user}">
     <a href="/meet/listWishMeet" style="margin-left:50px">찜목록</a>
     <a href="/user/logout" style="margin-left:10px">로그아웃</a>
     </c:if>
     </span>
</p>


<div id="menubar">
	<ul id="menubar-menus">
		<li>
			<a href="#">모임 검색</a>
			<div>
			<p><a href="/meet/listMeet/0">모임 유형 검색</a></p>			
			<p><a href="/meet/listMeet/1">카테고리 검색</a></p>
			<p><a href="/meet/listMeet/2">해시태그 검색</a></p>
			</div>		
		</li>
		<li>
			<a href="#">모임 관리</a>
			<div>
			<p><a href="/meet/listMyMeet">내가 가입한 모임</a></p>
                <p><a href="/meet/addMeet">모임 생성</a></p>
			</div>	
		</li>
		<li>
			<a href="#">소셜 네트워크</a>
			<div>
			<p><a href="/friend/listFriend">친구</a></p>
			<p><a href="/message/listRecMessage">쪽지함</a></p>
			</div>	
		</li>
		<li>
			<a href="#">업체</a>
			<div>
			<p><a href="/business/listBusiness">추천 업체 목록</a></p>
			<p><a href="/business/listReserveBusiness">업체 이용 목록 조회</a></p>
			</div>	
		</li>
		<li>
			<a href="#">후기 관리</a>
			<div>
			<p><a href="/community/getOffReviewList">모임 후기 조회</a></p>
			<p><a href="/community/getBusinessReviewList">업체 후기 조회</a></p>
			</div>		
		</li>
		<li>
			<a href="#">마이페이지</a>
			<div>
			<p><a href="/user/getUser?userId=${user.userId}">내 정보 조회</a></p>
			<p><a href="/user/updateUser?userId=${user.userId}">내 정보 변경</a></p>
			<p><a href="/user/delUser?userId=${userId}">회원 탈퇴</a></p>
			</div>	
		</li>
	</ul>
</div>
