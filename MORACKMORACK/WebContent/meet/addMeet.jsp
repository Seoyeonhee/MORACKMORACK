<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ����</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type ="text/javascript">

$(function (){
	
	var checkMeetCount = ${checkMeetCount};
	if(checkMeetCount == false){
		alert("���� ���� ���� 5�� �̻�");
		slef.location = "/index.jsp";
	}
	
	
	$("#addMeet").on("click", function(){
		$("form").attr("method", "POST").attr("action", "/meet/addMeet").submit();
	})
});
</script>
</head>
<body>

<div class="navbar  navbar-warning">
        <div class="container">
        	<jsp:include page="/toolbar2.jsp" />
   		</div>
</div>

<form>
���� ��ǥ �̹��� ����
<input type="file" id="meetImg" name="fileUpload"/> <br/><br/>

���� �� �Ұ� �Է�
<input type="file" id="lImg" name="fileUpload"/> 
<input type="textarea" id="lIntro" name="lIntro"/> <br/><br/>

���Ӹ�
<input type="text" id="meetName" name="meetName"/> <br/><br/>

ī�װ� ����
 <select name="category">
        <option value="1">����</option>
        <option value="2">����</option>
        <option value="3">����</option>
        <option value="4">��ȭ</option>
        <option value="5">����</option>
        <option value="6">����</option>
        <option value="7">���/�ڱ���</option>
        <option value="8">��Ƽ��Ƽ</option>
        <option value="9">����/��ȭ</option>
        <option value="10">��</option>
        <option value="11">����</option>
        <option value="12">�ݷ�����</option>
        <option value="13">�丮</option>
        <option value="14">��</option>
        <option value="15">������</option>
        <option value="16">����</option>
        <option value="17">��Ÿ</option>
</select><br/><br/>

���� ���� ����
<select name="meetType">
        <option value="0">2�� ����</option>
        <option value="1">�ټ��� ����</option>
</select><br/><br/>

���� ����
<input type="text" id="maxNum" name="maxNum"/><br/><br/>

���� ���� �ʿ� ����
<input type="radio" id="meetAppr" name="meetAppr" value="true" checked/>�ʿ�
<input type="radio" id="meetAppr" name="meetAppr" value="false" />���ʿ�<br/><br/>

�ֿ� Ȱ�� ��ġ ����<br/><br/>

���� ���� �Ұ�
<input type="text" id="sIntro" name="sIntro"/><br/><br/>

�ؽ��±� �Է�
<input type="textarea" id="hash" name="hash"/><br/><br/>

���� ����
<select name="bank">
        <option value="���">�������</option>
        <option value="����">��������</option>
        <option value="����">��������</option>
        <option value="�츮">�츮����</option>
        <option value="SC����">SC��������</option>
        <option value="�ѱ���Ƽ">�ѱ���Ƽ����</option>
        <option value="����">��������</option>
</select><br/><br/>

<input type="button" id="addMeet" value="���� ����"/>
</form>
</body>
</html>