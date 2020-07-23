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

	<div class="container">

		<form name="updateBusinessForm">
			<input type="hidden" name="menuNo" value="${menu.menuNo}"/>
			
			<div>
				<label for="businessMenu">메뉴명</label>
				<input type="text" id="businessMenu" name="businessMenu" value="${menu.businessMenu}">
			</div>
			
			<div>
				<label for="businessMenuFee">가격</label>
				<input type="text" id="businessMenuFee" name="businessMenuFee" value="${menu.businessMenuFee}">
			</div>
			
			<div>
				<label for="businessMenuImg">사진</label>
				<input type="text" id="businessMenuImg" name="businessMenuImg" value="${menu.businessMenuImg}">
			</div>

			<button type="button" id="updateBusinessMenu" name="updateBusinessMenu">수  정</button>
			<button type="button" id="cancel" name="cancel">취  소</button>

		</form>
		<!-- form Start /////////////////////////////////////-->
	    
 	</div>
	<!--  화면구성 div Start /////////////////////////////////////-->
 	
</body>

</html>