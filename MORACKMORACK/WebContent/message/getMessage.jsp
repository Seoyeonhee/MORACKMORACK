<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�߽� ���� �� ��ȸ</title>

<jsp:include page="/common/listCdn.jsp" />


<style>

</style>


<script type ="text/javascript">

$(function (){
	
	$("#ok").on("click", function(){
		window.history.back();
	})
})

</script>

</head>

<body>

<header>
<jsp:include page="/toolbar.jsp" />
</header>

<section style="float: left; margin-top:100px;">
<jsp:include page="/message/sidebar.jsp" />
</section>

<aside>
<strong>���� ����</strong> ${message.title} <br/><br/>
<strong>�޴� ���</strong><br/>
<strong>���Ӹ�</strong>${message.meetName} <br/>
<strong>������ ID</strong>  ${message.receiver.userId} / <strong>�߽��� ID</strong>  ${message.sender.userId} <br/>
<strong>������ �г���</strong> ${message.receiver.nickName} / <strong>�߽��� �г���</strong>  ${message.sender.nickName} <br/><br/>

<strong>���� ���</strong> ${message.sender.userId} / <strong>���� ���</strong> ${message.receiver.userId} <br/><br/>

<strong>���� ���� ��¥</strong> ${message.sendDate} <br/><br/>

${message.content} <br/><br/>

<button type="button" id="delMessage">����</button>
<button type="button" id="ok">Ȯ��</button>
</aside>

</body>
</html>