<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	
	<!-- Bootstrap Dropdown Hover CSS -->
	  <link href="/css/animate.min.css" rel="stylesheet">
	  <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
	   <!-- Bootstrap Dropdown Hover JS -->
	  <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	  
	  
	  <!-- jQuery UI toolTip ��� CSS-->
	 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	 <!-- jQuery UI toolTip ��� JS-->
	 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	
	<style>
	  body {
	           padding-top : 50px;
	       }
	</style>
	   
	<script type="text/javascript">
	
		var count = 0;
		
		function addForm(){
		   	   
			var addedFormDiv = document.getElementById("addedFormDiv");
			var str="";
			
			// �߰��� ��(�� �� HTML)
			str +=
					"<form name='form' class='form-horizontal'>" +
					"<br><div class='form-group'>" +
					"<label for='reserveAble' class='col-sm-3 control-label'>���� ���� �ð�  " +
					count +
					"</label>";
			

			str +=
					"<div>" +
					"<div class='row'>" +
					"<input type='button' value='-' onclick='delForm()'>" +
					"<div class='col-xs-3'>" +
					"<input type='text' class='form-control' name='reserveAbleStartTime' placeholder='���۽ð� (09:00 �������� �Է�)'>" +
					"</div>";
			

			str+=
					"<div class='col-xs-3'>" +
					"<input type='text' class='form-control' name='reserveAbleEndTime' placeholder='���ð� (11:00 �������� �Է�)'>" +
					"</div>" +
					"</div>" +
					"</div>" +
					"</div>" +
					"</form>";
			
			// �� ����
			var addedDiv = document.createElement("div");
			
			// �� Div�� ID �ο� (������ ����)
			addedDiv.id = "added_"+count;
			
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
				$("form").attr("method", "POST").attr("action", "/business/addReserveAbleTime").submit();
			})
		   	   
		});
	           
	
	</script>

</head>

<body onload="addForm();">

	<jsp:include page="/business/businessToolbar.jsp"/>

	<div class="container">

		<div class="page-header text-info">
			<img id="businessImg" style="float:left; height:100px; width:100px; margin:5px" src="../../resources/images/down-arrow.png" alt="@@��ü ��ǥ �̹���@@">
			<h2 style="padding-top:10px;">${business.businessName}</h2>
			<!-- <h2 style="padding-top:10px;">��ü��</h2> -->
			<h5>���� ���� �ð� ���</h5>
	    </div>
	    
	    
	    <div class="row">
			<div style="float:right">
				<input type="button" class="btn btn-primary" onclick="addForm()" value="�߰�"/>
				<input type="button" id="addBusinessMenu" class="btn btn-primary" value="����"/> 
			</div>
		</div>

		<br>

		<div>
			<form name="baseForm">
				<input type="hidden" name="count" value="0">

				<div id="addedFormDiv"></div><BR>
			
			</form>
		</div>

	</div>
	
</body>

</html>