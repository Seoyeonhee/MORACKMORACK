<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��ü �޴� ��� ��ȸ</title>


	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.js"></script>
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



<script type="text/javascript">
	
	$(function() {
	
		// �޴� ��� ȭ������ �̵�
		$("#addBusinessMenu").on("click", function() {
			self.location = "/business/addBusinessMenu.jsp"
		});
		
		// �ش� �޴� ����
		$("#businessMenuImg").on("click", function() {
			self.location = "/business/updateBusinessMenu?businessId=${business.businessId}"
		});
		
		// �޴� ���� �� �ٽ� �޴� ����Ʈ ���
		$("#delBusinessMenu").on("click", function() {
			alert("�޴� ����");
			/* var menuNo = $("#menuNo").val();
			alert(menuNO)
			var businessId = $("#businessId").val();
			alert(businessId)
			var url="/business/delBusinessMenu?businessId="+businessId+"&menuNo="+menuNo;
			alert(url); */
			/* self.location = "/business/delBusinessMenu?businessId="+businessId+"&menuNo="+menuNo */;
			delBusinessMenu();
		});
		
		$("#ok").on("click", function() {
			/* self.location = "/business/updateBusiness?businessId=${business.businessId}" */
			history.go(-1);
		});
	   	   
	});
	
	
	function delBusinessMenu(){
		alert("������")
		
		var menuNo = $("#menuNo").val();
		alert(menuNo)
		var businessId = $("#businessId").val();
		alert(businessId)
		var url="/business/delBusinessMenu?businessId="+businessId+"&menuNo="+menuNo;
		alert(url);
	};

</script>

</head>

<body>

	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
	
		<div class="row">
			<div class="col-md-12 text-center ">
				<button type="button" id="addBusinessMenu" name="addBusinessMenu" class="btn btn-primary">�߰�</button>
				<button type="button" id="ok" name="ok" class="btn btn-primary">Ȯ��</button>
			</div>
			
			<div class="col-md-12 text-center ">
				<!-- <button type="button" class="btn btn-primary">Ȯ��</button> -->
			</div>
		</div>
	
		<!--  table Start /////////////////////////////////////-->
		<table class="table table-hover table-striped" >
	      
			<thead>
				<tr>
					<th align="left">����</th>
					<th align="center" >����</th>
					<th align="center">�޴���</th>
					<th align="center">����</th>
				</tr>
			</thead>
		       
			<tbody>
			

				<c:forEach var="menu" items="${menuList}">
					<tr>
						<td align="left">
							<input type="hidden" id="menuNo" name="menuNo" value="${menu.menuNo}">
							<input type="hidden" id="businessId" name="businessId" value="${menu.businessId}">
							<button type="button" id="delBusinessMenu" name="delBusinessMenu" class="btn btn-primary">����</button>
						</td>
						<td align="center">
							${menu.businessMenuImg}
							<%-- <input type="hidden" value="${menu.businessId}"> --%>
						</td>
						<td align="center">${menu.businessMenu}</td>
						<td align="center">${menu.businessMenuFee}</td>
					</tr>
				</c:forEach>
			
			</tbody>
	      
		</table>
		<!--  table End /////////////////////////////////////-->
	  
	</div>
	<!--  ȭ�鱸�� div End /////////////////////////////////////-->

</body>
</html>