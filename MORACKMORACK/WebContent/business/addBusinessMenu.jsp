<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>메뉴 등록</title>

	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
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
   
   
   <!-- jQuery UI toolTip 사용 CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip 사용 JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>



<style>


</style>



<script type="text/javascript">

	var count = 0;
	
	function addForm(){
	   	   
		var addedFormDiv = document.getElementById("addedFormDiv");
		var str="";
		
		// 추가할 폼(에 들어갈 HTML)
		/* str += 
				"<form name='form' class='form-horizontal'>" +
				"<br>" +
				"<div class='form-group'>"; */
		str +=
				"<form name='form' class='form-horizontal'>" +
				"<br><div class='form-group'>" +
				"<label for='menu' class='col-sm-1' style='padding-top:9px; font-weight:700;'>메뉴  " +
				count +
				"</label>";
		
		
		
		
		/* str+="<br>사진-"+count+" <input type='text' name='businessMenuImgList'><BR>"; */
		/* str +=
				"<div class='page-header text-info'>" +
				"<span>" +
				"<label for='menu' class='col-sm-2' style='float:left;'>메뉴 " +
				count +
				"&nbsp;&nbsp;<input type='button' value='-' onclick='delForm()'>" +
				"</label>" +
				"</span>" +
				"<img id='businessMenuImgList' style='float:left; height:200px; width:200px; margin:5px' src='../../resources/images/down-arrow.png' alt='메뉴 이미지'>"; */
		str +=
			"<div>" +
			"<div class='row'>" +
			"<input type='button' value='-' onclick='delForm()'>" +
			/* "<div class='col-xs-3'>" + */
			/* "<input type='text' class='form-control' name='businessMenuImgList' placeholder='시작시간 (09:00 형식으로 입력)'>" + */
			"<img id='businessMenuImgList' name='businessMenuImgList' style='float:left; height:200px; width:200px; margin:5px' src='../../resources/images/down-arrow.png' alt='@@@@@@@@@@@@@@@@@@@@@@@@ 메뉴 이미지 @@@@@@@@@@@@@@@@@@@@@@@@'>";
			/* "</div>"; */
		
		
		
		
		
		
		
		/* str+="<br>메뉴명-"+count+" <input type='text' name='businessMenuList'>"; */
		<%-- str +=
				<h2>${business.businessName}</h2>
				"<h1> 메뉴명 </h1>"; --%>
		str+=
			"<div class='col-xs-4'>" +
			"<input type='text' class='form-control' name='businessMenuList' placeholder=' 메 뉴 명 '>" +
			"</div><br><br>";
		
		
		
		
		
		
		
		
		
		/* str+="<br>가격-"+count+" <input type='text' name='businessMenuFeeList'>"; */
		/* str +=
				"<p> </p>" +
				"<h3> 가격 </h3>"
				"<br><br>"; */
		str +=
				"<div class='col-xs-3'>" +
				"<input type='text' class='form-control' name='businessMenuFeeList' placeholder=' 가 격 '>" +
						"<input type='text' class='form-control' name='businessMenuImgList' placeholder='사진(사진 첨부 기능으로 수정할 예정)'>" +
				"</div>";
				
				
				
				
		/* str +=
				"<p> ~~~~~~~~~~~~~~~~~~~~~~~~~~~메뉴 간략 소개~~~~~~~~~~~~~~~~~~~~~ </p>" +
				"</div>" +
				"</form>"; */
				
		/* str +=
				"<div class='col-xs-3'>" +
				"<input type='text' class='form-control' name='businessMenuFeeList'>" +
				"</div>"; */
		
		
		
		str +=
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
			$("form").attr("method", "POST").attr("action", "/business/addBusinessMenu").submit();
		})
	   	   
	});
           

</script>

</head>

<body onload="addForm();">

	<header>
		<jsp:include page="/toolbar.jsp" />
	</header>

	<div class="container">


		<div class="page-header text-info">
			<img id="businessImg" style="float:left; height:100px; width:100px; margin:5px" src="../../resources/images/down-arrow.png" alt="@@업체 대표 이미지@@">
			<h2 style="padding-top:10px;">${business.businessName}</h2>
			<!-- <h2 style="padding-top:10px;">업체명</h2> -->
			<h5>메뉴 등록</h5>
	    </div>



		<div class="row">
			<div style="float:right">
				<input type="button" value="추가" class="btn btn-primary" onclick="addForm()">
				<input type="button" id="addBusinessMenu" name="addBusinessMenu" value="확인" class="btn btn-primary">
			</div>

		</div>


		<form name="baseForm">
		
			<input type="hidden" name="count" value="0">
			
			<!-- 폼을 삽입할 DIV -->
			<div id="addedFormDiv"></div><BR>
			
		</form>

	</div>

</body>

</html>