<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>�޴� ���</title>
<script src="https://code.jquery.com/jquery-3.1.1.js"></script>
<script type="text/javascript">

	var count = 0;
	
	function addForm(){
	   	   
		var addedFormDiv = document.getElementById("addedFormDiv");
		var str1 = "";
		var str2 = "";
		var str3 = "";
		var str="";
		
		// �߰��� ��(�� �� HTML)
		/* str+="<br>�޴���-"+count+" <input type='text' name='businessMenu"+count+"'>";
		str+="<br>����-"+count+" <input type='text' name='businessMenuFee"+count+"'>";
		str+="<br>����-"+count+" <input type='text' name='businessMenuImg"+count+"'><BR>"; */
		
		str1+= "<br>�޴���-" +count+ " <input type='text' name='businessMenu[" +count+ "].businessMenu'>";
		str2+= "<br>����-" +count+ " <input type='text' name='businessMenu[" +count+ "].businessMenuFee'>";
		str3+= "<br>����-" +count+ " <input type='text' name='businessMenu[" +count+ "].businessMenuImg'>";
		
		// �� ����
		var addedDiv = document.createElement("div");
		
		// �� Div�� ID �ο� (������ ����)
		addedDiv.id = "added_"+count;
		
		str = str1+str2+str3;
		
		// �� Div�ȿ� HTML����
		addedDiv.innerHTML = str;
		
		
		// ������ DIV�� ������ �� ����
		addedFormDiv.appendChild(addedDiv);
		
		count++;
		// ���� �������� ��� ���� �ѱ���� �����ϱ� ���� ���� ���� ī��Ʈ ����
		document.baseForm.count.value=count;
	
	};
	
	
	function delForm(){
	
		var addedFormDiv = document.getElementById("addedFormDiv");
		
		// ���� ���� �ΰ� �̻��̸�
		if(count >1){
			// ���������� ������ ���� ID�� ���� Div��ü�� ������
			var addedDiv = document.getElementById("added_"+(--count));
			
			// �� ���� 
			addedFormDiv.removeChild(addedDiv);
		}else{ // ������ ���� �����ִٸ�
			// �� ���� ����
			document.baseForm.reset();
		}
	
	};
	    
	
	
	$(function() {
	
		$("#addBusinessMenu").on("click", function() {
			$("form").attr("method", "POST").attr("action", "/MORACKMORACK/business/addBusinessMenu").submit();
		})
	   	   
	});
           

</script>

</head>

<body onload="addForm();">

<center>

<!-- <form name="baseForm" action="/addBusinessMenu" method="POST"> -->
<form name="baseForm">

           <input type="hidden" name="count" value="0">

           <div id="addedFormDiv"></div><BR> <!-- ���� ������ DIV -->

           <input type="button" value="�߰�" onclick="addForm()">

           <input type="button" value="����" onclick="delForm()">

           <input type="button" id="addBusinessMenu" value="�Ϸ�">

</form>

</center>

</body>

</html>