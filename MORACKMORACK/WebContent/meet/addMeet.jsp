<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>모임 생성</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type ="text/javascript">

$(function (){
	
	var checkMeetCount = ${checkMeetCount};
	if(checkMeetCount == false){
		alert("모임 가입 갯수 5개 이상");
		slef.location = "/index.jsp";
	}
	
	
	$("#addMeet").on("click", function(){
		$("form").attr("method", "POST").attr("action", "/meet/addMeet").submit();
	})
});
</script>
</head>
<body>

<div class="navbar  navbar-warning">
        <div class="container">
        	<jsp:include page="/toolbar2.jsp" />
   		</div>
</div>

<form>
모임 대표 이미지 선택
<input type="file" id="meetImg" name="fileUpload"/> <br/><br/>

모임 상세 소개 입력
<input type="file" id="lImg" name="fileUpload"/> 
<input type="textarea" id="lIntro" name="lIntro"/> <br/><br/>

모임명
<input type="text" id="meetName" name="meetName"/> <br/><br/>

카테고리 선택
 <select name="category">
        <option value="1">여행</option>
        <option value="2">게임</option>
        <option value="3">음악</option>
        <option value="4">영화</option>
        <option value="5">공연</option>
        <option value="6">맛집</option>
        <option value="7">취업/자기계발</option>
        <option value="8">액티비티</option>
        <option value="9">독서/만화</option>
        <option value="10">댄스</option>
        <option value="11">사진</option>
        <option value="12">반려동물</option>
        <option value="13">요리</option>
        <option value="14">차</option>
        <option value="15">스포츠</option>
        <option value="16">공예</option>
        <option value="17">기타</option>
</select><br/><br/>

모임 유형 선택
<select name="meetType">
        <option value="0">2인 모임</option>
        <option value="1">다수인 모임</option>
</select><br/><br/>

모임 정원
<input type="text" id="maxNum" name="maxNum"/><br/><br/>

가입 승인 필요 여부
<input type="radio" id="meetAppr" name="meetAppr" value="true" checked/>필요
<input type="radio" id="meetAppr" name="meetAppr" value="false" />불필요<br/><br/>

주요 활동 위치 선택<br/><br/>

모임 간략 소개
<input type="text" id="sIntro" name="sIntro"/><br/><br/>

해시태그 입력
<input type="textarea" id="hash" name="hash"/><br/><br/>

은행 선택
<select name="bank">
        <option value="기업">기업은행</option>
        <option value="농협">농협은행</option>
        <option value="국민">국민은행</option>
        <option value="우리">우리은행</option>
        <option value="SC제일">SC제일은행</option>
        <option value="한국씨티">한국씨티은행</option>
        <option value="신한">신한은행</option>
</select><br/><br/>

<input type="button" id="addMeet" value="모임 생성"/>
</form>
</body>
</html>