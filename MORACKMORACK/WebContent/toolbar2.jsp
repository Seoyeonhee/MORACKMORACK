<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

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

<a href="/index.jsp">MORACKMORACK</a>

<div id="menubar">
	<ul id="menubar-menus">
		<li>
			<a href="#">���� �˻�</a>
			<div>
			<p><a href="/meet/listMeet?listType=type">���� ���� �˻�</a></p>
			<p><a href="/meet/listMeet?listType=hashtag">�ؽ��±� �˻�</a></p>
			<p><a href="/meet/listMeet?listType=category">ī�װ� �˻�</a></p>
			</div>		
		</li>
		<li>
			<a href="#">���� ����</a>
			<div>
			<p><a href="/meet/listMyMeet">���� ������ ����</a></p>
			<p><a href="/meet/addMeet">���� ����</a></
			</div>	
		</li>
		<li>
			<a href="#">�Ҽ� ��Ʈ��ũ</a>
			<div>
			<p><a href="#">ģ��</a></p>
			<p><a href="#">������</a></p>
			</div>	
		</li>
		<li>
			<a href="#">��ü</a>
			<div>
			<p><a href="#">��õ ��ü ���</a></p>
			<p><a href="#">��ü �̿� ��� ��ȸ</a></p>
			</div>	
		</li>
		<li>
			<a href="#">�ı� ����</a>
			<div>
			<p><a href="#">���� �ı� ��ȸ</a></p>
			<p><a href="#">��ü �ı� ��ȸ</a></p>
			</div>		
		</li>
		<li>
			<a href="#">����������</a>
			<div>
			<p><a href="#">�� ���� ��ȸ</a></p>
			<p><a href="#">�� ���� ����</a></p>
			<p><a href="#">ȸ�� Ż��</a></p>
			</div>	
		</li>
	</ul>
</div>