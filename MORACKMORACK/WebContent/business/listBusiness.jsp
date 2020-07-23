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
			/* self.location = "/business/updateBusinessMenu?businessId=${business.businessId}" */
			popWin 
			= window.open("/business/updateBusinessMenu?businessId=${business.businessId}",
										"popWin", 
										"left=300,top=200,width=780,height=130,marginwidth=0,marginheight=0,"+
										"scrollbars=no,scrolling=no,menubar=no,resizable=no");
		});
		
		// �޴� ���� �� �ٽ� �޴� ����Ʈ ���
		$("#delBusinessMenu").on("click", function() {
			self.location = "/business/updateBusinessMenu?businessId=${business.businessId}"
		});
		
		$("#ok").on("click", function() {
			/* self.location = "/business/updateBusiness?businessId=${business.businessId}" */
			history.go(-1);
		});
	   	   
	});     

</script>

</head>

<body>

	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
	<!--  table Start /////////////////////////////////////-->
	<table class="table table-hover table-striped" >
      
	<thead>
		<tr>
			<th align="center" >����</th>
			<th align="center">�޴���</th>
			<th align="center">����</th>
		</tr>
	</thead>
       
	<tbody>
	
		<c:set var="i" value="0" />
		<c:forEach var="menu" items="${list}">
		<c:set var="i" value="${ i+1 }" />
			<tr>
				<td align="center">${menu.businessMenuImg}
					<input type="hidden" value="${menu.businessId}">
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