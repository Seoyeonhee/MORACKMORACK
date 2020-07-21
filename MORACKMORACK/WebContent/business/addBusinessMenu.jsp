<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>메뉴 등록</title>
<script src="https://code.jquery.com/jquery-3.1.1.js"></script>
<script type="text/javascript">

	var count = 0;
	
	function addForm(){
	   	   
		var addedFormDiv = document.getElementById("addedFormDiv");
		var str1 = "";
		var str2 = "";
		var str3 = "";
		var str="";
		
		// 추가할 폼(에 들어갈 HTML)
		/* str+="<br>메뉴명-"+count+" <input type='text' name='businessMenu"+count+"'>";
		str+="<br>가격-"+count+" <input type='text' name='businessMenuFee"+count+"'>";
		str+="<br>사진-"+count+" <input type='text' name='businessMenuImg"+count+"'><BR>"; */
		
		str1+= "<br>메뉴명-" +count+ " <input type='text' name='businessMenu[" +count+ "].businessMenu'>";
		str2+= "<br>가격-" +count+ " <input type='text' name='businessMenu[" +count+ "].businessMenuFee'>";
		str3+= "<br>사진-" +count+ " <input type='text' name='businessMenu[" +count+ "].businessMenuImg'>";
		
		// 폼 생성
		var addedDiv = document.createElement("div");
		
		// 폼 Div에 ID 부여 (삭제를 위해)
		addedDiv.id = "added_"+count;
		
		str = str1+str2+str3;
		
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

           <div id="addedFormDiv"></div><BR> <!-- 폼을 삽입할 DIV -->

           <input type="button" value="추가" onclick="addForm()">

           <input type="button" value="삭제" onclick="delForm()">

           <input type="button" id="addBusinessMenu" value="완료">

</form>

</center>

</body>

</html>