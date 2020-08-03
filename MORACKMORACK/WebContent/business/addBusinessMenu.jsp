<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> -->

<title>메뉴 등록</title>

<style>

</style>



<script type="text/javascript">

	var count = 0;
	var previewNo = 0;
	var appenNo=0;
	
	function addForm(){
	   	   
		var addedFormDiv = document.getElementById("addedFormDiv");
		var str="";

		str +=
				"<br><div class='form-group'>" +
				"<label for='menu' class='col-sm-1' style='padding-top:9px; font-weight:700;'>메뉴  " +
				count +
				"</label>";
		

		str +=
			"<div>" +
			"<div class='row'>" +
			"<input type='button' value='-' onclick='delForm()'>" +
			"<div class='thumbnail' name='businessMenuImgThum' style='float:left; height:200px; width:300px; margin:5px;'>" +
			"<input multiple='multiple' type='file' class='businessMenuImgList' name='businessMenuImgList' multiple/>" +
			"<div id='preview_"+count+"'></div>" +
			"</div>";

		str+=
			"<div class='col-xs-4'>" +
			"<input type='text' class='form-control' name='businessMenuList' placeholder=' 메 뉴 명 '>" +
			"</div><br><br>";

		str +=
				"<div class='col-xs-3'>" +
				"<input type='text' class='form-control' name='businessMenuFeeList' placeholder=' 가 격 '>" +
				"</div>";

		str +=
				"</div>" +
				"</div>" +
				"</div>";
		

		var addedDiv = document.createElement("div");

		addedDiv.id = "added_"+count;

		addedDiv.innerHTML = str;

		addedFormDiv.appendChild(addedDiv);
		
		count++;

		document.form.count.value=count;
	
	};
	
	
	function delForm(){
	
		var addedFormDiv = document.getElementById("addedFormDiv");

		if(count >1){

			var addedDiv = document.getElementById("added_"+(--count));

			addedFormDiv.removeChild(addedDiv);
		}else{
			document.form.reset();
		}
	
	};
	
	
	
	
	
	
	
	
	
	
	
	$(document).on("change", "input[type='file']", function(e) {
		
	
		console.log("이미지 선택함!!!!!!!");
	
		console.log(count);
	
		$("#preview_"+previewNo).empty();
		
		var files = e.target.files;
		var arr = Array.prototype.slice.call(files);
		
		// 업로드 가능 파일인지 체크
		for(var i=0 ; i<files.length ; i++) {
			if(!checkExtension(files[i].name, files[i].size)) {
				return false;
			}
		}
		
		preview(arr);
	
	
	
	});
	
	
	
	
	function checkExtension(fileName, fileSize) {
		
		var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
		var maxSize = 20971520;		// 20MB
		
		if(fileSize >= maxSize) {
			alert('파일 사이즈 초과');
			$("input[type='file']").val("");
			return false;
		}
		
		if(regex.test(fileName)) {
			alert('업로드 불가능한 파일이 있습니다.');
			$("input[type='file']").val("");
			return false;
		}
		return true;
		
	};
	
	function preview(arr) {
		
		console.log(arr);
		
		arr.forEach(function(f) {
			
			var fileName = f.name;
			if(fileName.lenfth > 10) {
				fileName = fileName.substring(0, 7) + "...";
			}
			
			// 이미지 추가
			var str2 = "<div style='display: inline-flex; padding: 10px;'><li>";
			str2 += "<span>" + fileName + "</span><br>";

			if(f.type.match('image.*')) {
				
				var reader = new FileReader();
				reader.onload = function(e) {
					str2 += "<img src='"+e.target.result+"' title='"+f.name+"' style='width:250px; height:100px;' />";
					str2 += "</li></div>";
					console.log("count = " + count);
					console.log("previewNo = " + previewNo);
					
					var appendNo = previewNo-1;
					
					console.log("appendNo = " + appendNo);
					
					$(str2).appendTo("#preview_"+appendNo);
					
					
				}
				reader.readAsDataURL(f);
				
			} else {
				str2 += "<img src='/resources/img/fileImg.png' title='"+f.name+"' style='width:250px; height:100px;' />";
				$(str2).appendTo("#preview"+appendNo);
			}

			
		});
		previewNo++;
	};

	
	$(function() {	
		
		$("#addBusinessMenu").on("click", function() {
			$("form").attr("method", "POST").attr("action", "/business/addBusinessMenu").submit();
		});
	   	   
	});
           

</script>

</head>

<body onload="addForm();">

	<header>
		<jsp:include page="/toolbar.jsp" />
	</header>

	<div class="container">


		<div class="page-header text-info">
			<!-- <img id="businessImg" style="float:left; height:100px; width:100px; margin:5px" src="../../resources/images/down-arrow.png" alt="@@업체 대표 이미지@@"> -->
			<h2 style="padding-top:10px;">${business.businessName}</h2>
			<h5>메뉴 등록</h5>
	    </div>



		<div class="row">
			<div style="float:right">
				<input type="button" value="추가" class="btn btn-primary" onclick="addForm()">
				<input type="button" id="addBusinessMenu" name="addBusinessMenu" value="확인" class="btn btn-primary">
			</div>

		</div>


		<form name="form" class="form-horizontal" enctype="multipart/form-data">
		
			<input type="hidden" name="count" value="0">
			
			<!-- 폼을 삽입할 DIV -->
			<div id="addedFormDiv">			
			
			</div>
			<BR>
			
		</form>

	</div>

</body>

</html>