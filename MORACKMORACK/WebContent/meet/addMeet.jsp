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


<style>
.selectbox {

    position: relative;
    width: 200px;  /* 너비설정 */
    border: 1px solid #999;  /* 테두리 설정 */
    z-index: 1;
}

/* 가상 선택자를 활용 화살표 대체 */
.selectbox:before {
    content: "";
    position: absolute;
    top: 50%;
    right: 15px;
    width: 0;
    height: 0;
    margin-top: -1px;
    border-left: 5px solid transparent;
    border-right: 5px solid transparent;
    border-top: 5px solid #333;
}

.selectbox label {
    position: absolute;
    top: 1px;  /* 위치정렬 */
    left: 5px;  /* 위치정렬 */
    padding: .8em .5em;  /* select의 여백 크기 만큼 */
    color: #999;
    z-index: -1;  /* IE8에서 label이 위치한 곳이 클릭되지 않는 것 해결 */
}

.selectbox select {
    width: 100%;
    height: auto;  /* 높이 초기화 */
    line-height: normal;  /* line-height 초기화 */
    font-family: inherit;  /* 폰트 상속 */
    padding: .8em .5em;  /* 여백과 높이 결정 */
    border: 0;
    opacity: 0;  /* 숨기기 */
    filter:alpha(opacity=0);  /* IE8 숨기기 */
    -webkit-appearance: none; /* 네이티브 외형 감추기 */
    -moz-appearance: none;
    appearance: none;
}
    
.selectbox {
    -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
    box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
    -webkit-transition: border-color ease-in-out .15s, -webkit-box-shadow ease-in-out .15s;
    -o-transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
    transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
}


</style>


<script type ="text/javascript">

$(function(){
	
	var selectTarget = $('.selectbox select');

    selectTarget.change(function(){
        var select_name = $(this).children('option:selected').text();
        $(this).siblings('label').text(select_name);
    });
	    
	selectTarget.on({
	    'focus' : function () {
	        $(this).parent().addClass('focus');
	    },
	    'blur' : function () {
	        $(this).parent().removeClass('focus');
	    }
	})
	
	$("#meetType").on("change", function(){
		var meetType = $("#meetType").val();
		
		if(meetType == 0){
			$("#max").val(2);
			$("#max").attr("readonly",true);
		}else{
			$("#max").attr("readonly",false);
			$("#max").focus();
		}
	})
	
	$("#meetImg").on("click", function(){
		document.all.file.click();
	})
	
	$("#lImg").on("click", function(){
		document.all.file.click();
	})

	
	$("#addMeet").on("click", function(){
		
		var maxNum = $("#max").val();
		alert(maxNum);
	
		$("form").attr("method", "POST").attr("action", "/meet/addMeet/"+maxNum).submit();
	})
	
	});
</script>
</head>
<body>

<div class="container">
	<jsp:include page="/toolbar.jsp"/>
</div>

<div class="container" style="margin-top:150px">
<form class="form-horizontal">
	
   	 	
<div class="col-xs-6 col-md-6">
  		
	<div class="form-group">
		<label for="meetImg">모임 대표 이미지 선택</label>
			<a href="#" class="thumbnail" id="meetImg" style="height:300px; width:500px">
			<!-- <img src="..." alt="...">  -->
			</a>
  
	<div>
		<p style="text-align:left;">
		<label for="exampleInputFile" style="text-align:left">모임 상세 소개 입력</label>   
		<span style="float:right;">
		<input class="btn btn-default" type="button" id="addImg" name="addImg" value="이미지 추가" style="margin-right:50px"> </span>
	</div>
	
	<div class="row">
		<div class="col-xs-6 col-md-3">
			<a href="#" class="thumbnail" id="lImg" style="height:220px; width:220px">
			<!-- <img src="..." alt="..."> -->
    		</a>
		</div>
  		
  		<div class="col-xs-6 col-md-3" style="margin-left:120px">
    		<a href="#" class="thumbnail" id="lImg" style="height:220px; width:220px">
     		 <!-- <img src="..." alt="..."> -->
   			</a>
		</div>
	</div>
	
		<textarea form="inform" cols="10" rows="20" wrap="soft" id="lIntro" name="lIntro" class="form-control"></textarea>
		
	</div>
</div>
    	
<div class="col-xs-6 col-md-6">

	<p><strong>모임명</strong></p>
	<input type="text" class="form-control" id="meetName" name="meetName" placeholder="모임명" style="height:50px; width:300px" />

	<p style="margin-top:20px"><strong>은행 선택</strong></p>
	<div class="selectbox">
		<label for="select">은행</label>
		<select id="bank" name="bank">
		<option value="기업">기업은행</option>
		<option value="농협">농협은행</option>
		<option value="국민">국민은행</option>
		<option value="우리">우리은행</option>
		<option value="SC제일">SC제일은행</option>
		<option value="한국씨티">한국씨티은행</option>
		<option value="신한">신한은행</option>
		</select>
	</div>
   		 
	<p style="margin-top:20px"><strong>카테고리 선택</strong></p>
	<div class="selectbox">
    	<label for="select">카테고리</label>
		<select id="category" name="category">	
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
		</select>
	</div>
		
		
    <p style="margin-top:20px"><strong>모임 유형 선택</strong></p>
    <div class="selectbox">
    	<label for="select">모임 유형</label>
		<select id="meetType" name="meetType">
       	 <option value="0">2인 모임</option>
      	 <option value="1">다수인 모임</option>
      	 </select>
	</div>
      	 
	<p style="margin-top:20px"><strong>모임 정원</strong></p>
	<input type="number" id="max" name="max" class="form-control" style="height:30px; width:80px"/>
      	  
    <p style="margin-top:20px"><strong>가입 승인 필요 여부</strong></p>
    <label class="radio-inline">
		<input type="radio" id="meetAppr" name="meetAppr" value="1" checked />필요 <br><br/>
		<input type="radio" id="meetAppr" name="meetAppr" value="0" />불필요<br/><br/>
	</label>
      	  
	<p style="margin-top:20px"><strong>주요 활동 위치 선택</strong></p>
     	  
      	  
 
	<p style="margin-top:20px"><strong>모임 간략 소개</strong></p>
	<input type="text" id="sIntro" name="sIntro" class="form-control" style="height:100px; width:500px"/><br/>


	<p style="margin-top:20px"><strong>해시태그 입력</strong></p>
	<textarea form="inform" cols="40" rows="10" wrap="hard" id="hash" name="hash" class="form-control"></textarea>
	
 </div>    
  	  
</form>
</div>

<div class="text-center" style="margin-top:30px">
	<input class="btn btn-default" type="button" id="addMeet" name="addMeet" value="모임 생성">
</div>

<input type="file" name="file" id="file" style="display: none;"/>  

</body>
</html>