<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
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
	  
	  
	  <!-- jQuery UI toolTip 사용 CSS-->
	 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	 <!-- jQuery UI toolTip 사용 JS-->
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
			
			// 추가할 폼(에 들어갈 HTML)
			str +=
					"<form name='form' class='form-horizontal'>" +
					"<br><div class='form-group'>" +
					"<label for='reserveAble' class='col-sm-3 control-label'>예약 가능 시간  " +
					count +
					"</label>";
			

			str +=
					"<div>" +
					"<div class='row'>" +
					"<input type='button' value='-' onclick='delForm()'>" +
					"<div class='col-xs-3'>" +
					"<input type='text' class='form-control' name='reserveAbleStartTime' placeholder='시작시간 (09:00 형식으로 입력)'>" +
					"</div>";
			

			str+=
					"<div class='col-xs-3'>" +
					"<input type='text' class='form-control' name='reserveAbleEndTime' placeholder='끝시간 (11:00 형식으로 입력)'>" +
					"</div>" +
					"</div>" +
					"</div>" +
					"</div>" +
					"</form>";
			
			// 폼 생성
			var addedDiv = document.createElement("div");
			
			// 폼 Div에 ID 부여 (삭제를 위해)
			addedDiv.id = "added_"+count;
			
			// 폼 Div안에 HTML삽입
			addedDiv.innerHTML = str;
			
			
			// 삽입할 DIV에 생성한 폼 삽입
			addedFormDiv.appendChild(addedDiv);
			
			count++;
			// 다음 페이지에 몇개의 폼을 넘기는지 전달하기 위해 히든 폼에 카운트 저장
			document.baseForm.count.value=count;
		
		};
		
		
		function delForm(){
		
			var addedFormDiv = document.getElementById("addedFormDiv");
			
			// 현재 폼이 두개 이상이면
			if(count >1){
				// 마지막으로 생성된 폼의 ID를 통해 Div객체를 가져옴
				var addedDiv = document.getElementById("added_"+(--count));
				
				// 폼 삭제 
				addedFormDiv.removeChild(addedDiv);
			}else{ // 마지막 폼만 남아있다면
				// 폼 내용 삭제
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
			<img id="businessImg" style="float:left; height:100px; width:100px; margin:5px" src="../../resources/images/down-arrow.png" alt="@@업체 대표 이미지@@">
			<h2 style="padding-top:10px;">${business.businessName}</h2>
			<!-- <h2 style="padding-top:10px;">업체명</h2> -->
			<h5>예약 가능 시간 등록</h5>
	    </div>
	    
	    
	    <div class="row">
			<div style="float:right">
				<input type="button" class="btn btn-primary" onclick="addForm()" value="추가"/>
				<input type="button" id="addBusinessMenu" class="btn btn-primary" value="저장"/> 
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