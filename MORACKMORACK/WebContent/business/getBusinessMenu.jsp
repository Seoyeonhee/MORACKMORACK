<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>메뉴 등록</title>
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
	
	<jsp:include page="/business/businessToolbar.jsp"/>
	
	<div class="container">
	
		<div class="page-header text-info">
			<img id="businessImg" style="float:left; height:100px; width:100px; margin:5px" src="../../resources/images/down-arrow.png" alt="@@업체 대표 이미지@@">
			<h2 style="padding-top:10px;">${business.businessName}</h2>
			<!-- <h2 style="padding-top:10px;">업체명</h2> -->
			<h5>메뉴 등록</h5>
	    </div>
	    
	    

		<form name="updateBusinessForm">
			<input type="hidden" name="menuNo" value="${menu.menuNo}"/>
			
			<div class="form-group">
				<label for="businessMenu" class="col-sm-offset-1 col-sm-3 control-label">메뉴명</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="businessMenu" name="businessMenu" value="${menu.businessMenu}">
			    </div>
			</div>
			
			<div class="form-group">
				<label for="businessMenuFee" class="col-sm-offset-1 col-sm-3 control-label">메뉴 가격</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="businessMenuFee" name="businessMenuFee" value="${menu.businessMenuFee}">
			    </div>
			</div>
			
			<div class="form-group">
				<label for="businessMenuImg" class="col-sm-offset-1 col-sm-3 control-label">메뉴 이미지</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="businessMenuImg" name="businessMenuImg" value="${menu.businessMenuImg}">
			    </div>
			</div>

			<button type="button" id="updateBusinessMenu" name="updateBusinessMenu">수  정</button>
			<button type="button" id="cancel" name="cancel">취  소</button>

		</form>
		<!-- form Start /////////////////////////////////////-->
	    
 	</div>
	<!--  화면구성 div Start /////////////////////////////////////-->
 	
</body>

</html>