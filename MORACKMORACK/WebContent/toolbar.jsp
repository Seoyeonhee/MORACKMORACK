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
    <a href="/user/login">�α���</a>
    <a href="/user/addUserView" style="margin-left:10px">ȸ������</a>
    <a href="#" style="margin-left:10px">��ü �α���</a>
    <a href="#" style="margin-left:10px">��ü ȸ������</a>
    </c:if>
    <c:if test="${!empty sessionScope.user}">
     <a href="/meet/listWishMeet" style="margin-left:50px">����</a>
     <a href="/user/logout" style="margin-left:10px">�α׾ƿ�</a>
     </c:if>
     </span>
</p>


<div id="menubar">
	<ul id="menubar-menus">
		<li>
			<a href="#">���� �˻�</a>
			<div>
			<p><a href="/meet/listMeet/0">���� ���� �˻�</a></p>			
			<p><a href="/meet/listMeet/1">ī�װ� �˻�</a></p>
			<p><a href="/meet/listMeet/2">�ؽ��±� �˻�</a></p>
			</div>		
		</li>
		<li>
			<a href="#">���� ����</a>
			<div>
			<p><a href="/meet/listMyMeet">���� ������ ����</a></p>
                <p><a href="/meet/addMeet">���� ����</a></p>
			</div>	
		</li>
		<li>
			<a href="#">�Ҽ� ��Ʈ��ũ</a>
			<div>
			<p><a href="/friend/listFriend">ģ��</a></p>
			<p><a href="/message/listRecMessage">������</a></p>
			</div>	
		</li>
		<li>
			<a href="#">��ü</a>
			<div>
			<p><a href="/business/listBusiness">��õ ��ü ���</a></p>
			<p><a href="/business/listReserveBusiness">��ü �̿� ��� ��ȸ</a></p>
			</div>	
		</li>
		<li>
			<a href="#">�ı� ����</a>
			<div>
			<p><a href="/community/getOffReviewList">���� �ı� ��ȸ</a></p>
			<p><a href="/community/getBusinessReviewList">��ü �ı� ��ȸ</a></p>
			</div>		
		</li>
		<li>
			<a href="#">����������</a>
			<div>
			<p><a href="/user/getUser?userId=${user.userId}">�� ���� ��ȸ</a></p>
			<p><a href="/user/updateUser?userId=${user.userId}">�� ���� ����</a></p>
			<p><a href="/user/delUser?userId=${userId}">ȸ�� Ż��</a></p>
			</div>	
		</li>
	</ul>
</div>
