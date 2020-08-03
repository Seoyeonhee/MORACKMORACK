<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>�޴� ���</title>
<script src="https://code.jquery.com/jquery-3.1.1.js"></script>
<script type="text/javascript">
	
	$(function() {
	
		$("#updateBusinessMenu").on("click", function() {
			$("form").attr("method", "POST").attr("action", "/business/updateBusinessMenu").submit();
		})
		
		$("#cancel").on("click", function() {
			history.go(-1);
		});
	   	   
	});

</script>

</head>

<body>
	
	<header>
		<jsp:include page="/toolbar.jsp" />
	</header>
	
	<div class="container">
	
		<div class="page-header text-info">
			<!-- <img id="businessImg" style="float:left; height:100px; width:100px; margin:5px" src="../../resources/images/down-arrow.png" alt="@@��ü ��ǥ �̹���@@"> -->
			<h2 style="padding-top:10px;">${business.businessName}</h2>z
			<h5>�޴� ���</h5>
	    </div>
	    
	    
	    
	    
	    	<form name='form' class='form-horizontal'>
				<div class='form-group'>
					<div class='page-header text-info'>
						<input type="hidden" class="menuNo" value="${menu.menuNo}">
						<input type="hidden" class="businessId" value="${menu.businessId}">

						<img class='businessMenuImg' style='float:left; height:200px; width:200px; margin:5px' src='/resources/images/uploadFiles/business/${menu.businessMenuImg}' alt='@@@@@ �޴� �̹��� @@@@@'>
				  		
				  		
						<div class="form-group">
							<label for="businessMenu" class="col-sm-offset-1 col-sm-3 control-label">�޴���</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="businessMenu" name="businessMenu" value="${menu.businessMenu}">
						    </div>
						    
						    
							<label for="businessMenuFee" class="col-sm-offset-1 col-sm-3 control-label">�޴� ����</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="businessMenuFee" name="businessMenuFee" value="${menu.businessMenuFee}">
						    </div>
						</div>

				  	</div>
				</div>
				
				
				<div style="float:right;">
					<button type="button" id="updateBusinessMenu" name="updateBusinessMenu" class="btn btn-primary">��  ��</button>
					<button type="button" id="cancel" name="cancel" class="btn btn-primary">��  ��</button>
				</div>
			</form>
	    

	    
 	</div>
 	
</body>

</html>