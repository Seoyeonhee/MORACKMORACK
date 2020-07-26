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
	
	 $("input[type='file']").change(function(e){//div 내용 비워주기
	      $('#meetImgPrev').empty();

	      var files = e.target.files;
	      var arr =Array.prototype.slice.call(files);
	      
	      //업로드 가능 파일인지 체크
	      for(var i=0;i<files.length;i++){
	        if(!checkExtension(files[i].name,files[i].size)){
	          return false;
	        }
	      }
	      
	      preview(arr);
	      
	      
	    });//file change
	    
	    function checkExtension(fileName,fileSize){

	      var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	      var maxSize = 20971520;  //20MB
	      
	      if(fileSize >= maxSize){
	        alert('파일 사이즈 초과');
	        $("input[type='file']").val("");  //파일 초기화
	        return false;
	      }
	      
	      if(regex.test(fileName)){
	        alert('업로드 불가능한 파일이 있습니다.');
	        $("input[type='file']").val("");  //파일 초기화
	        return false;
	      }
	      return true;
	    }
	    
	    function preview(arr){
	      arr.forEach(function(f){
	        
	        //파일명이 길면 파일명...으로 처리
	        var fileName = f.name;
	        if(fileName.length > 10){
	          fileName = fileName.substring(0,7)+"...";
	        }
	        
	        //div에 이미지 추가
	        var str = '<div style="display: inline-flex; padding: 10px;">';
	        
	        
	        //이미지 파일 미리보기
	        if(f.type.match('image.*')){
	          var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
	          reader.onload = function (e) { //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
	            //str += '<button type="button" class="delBtn" value="'+f.name+'" style="background: red">x</button><br>';
	            str += '<img src="'+e.target.result+'" title="'+f.name+'" width=480px height=280px />';
	            str += '</li></div>';
	            $(str).appendTo('#meetImgPrev');
	          } 
	          reader.readAsDataURL(f);
	        }else{
	          str += '<img src="/resources/images/uploadFiles/fileImg.png" title="'+f.name+'" width=100 height=100 />';
	          $(str).appendTo('#meetImgPrev');
	        }
	      });//arr.forEach
	    }
	
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
	
	$("#meetImgThum").on("click", function(e){
		document.all.meetImg.click();
		
		var aa = $(this).next.id();
		alert(aa);
	})
	
	$("#lImgThum").on("click", function(e){						
		document.all.lImg1.click();
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

<header>
<jsp:include page="/toolbar.jsp" />
</header>

<div class="container" style="margin-top:150px">
<form class="form-horizontal" enctype="multipart/form-data">
	
   	 	
<div class="col-xs-6 col-md-6">
  		
	<div class="form-group">
		<label for="meetImg">모임 대표 이미지 선택</label>
			<a href="#" class="thumbnail" id="meetImgThum" style="height:300px; width:500px">
			<input type="file" name="file" id="meetImg" style="display: none;" multiple/>  
			<div id="meetImgPrev"></div>
			</a>
  
	<div>
		<p style="text-align:left;">
		<label for="exampleInputFile" style="text-align:left">모임 상세 소개 입력</label>   
		<span style="float:right;">
		<input class="btn btn-default" type="button" id="addImg" name="addImg" value="이미지 추가" style="margin-right:50px"> </span>
	</div>
	
	<div id="addDiv">
	<div class="row">
		<div class="col-xs-6 col-md-3">
    		<a href="#" class="thumbnail" id="lImgThum" style="height:220px; width:220px">
			<input type="file" name="file" id="lImg1" style="display: none;" multiple/>  
			<div id="preview"></div>
			</a>
		</div>
  		
  		<div class="col-xs-6 col-md-3" style="margin-left:120px">
    		<a href="#" class="thumbnail" id="lImgThum" style="height:220px; width:220px">
			<input type="file" name="file" id="lImg2" style="display: none;" multiple/>  
			<div id="preview"></div>
			</a>
		</div>
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
		<option value="">은행</option>
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
		<option value="">카테고리</option>
        <option value="0">여행</option>
        <option value="1">게임</option>
        <option value="2">음악</option>
        <option value="3">영화</option>
        <option value="4">공연</option>
        <option value="5">맛집</option>
        <option value="6">취업/자기계발</option>
        <option value="7">액티비티</option>
        <option value="8">독서/만화</option>
        <option value="9">댄스</option>
        <option value="10">사진</option>
        <option value="11">반려동물</option>
        <option value="12">요리</option>
        <option value="13">차</option>
        <option value="14">스포츠</option>
        <option value="15">공예</option>
        <option value="16">기타</option>
		</select>
	</div>
		
		
    <p style="margin-top:20px"><strong>모임 유형 선택</strong></p>
    <div class="selectbox">
    	<label for="select">모임 유형</label>
		<select id="meetType" name="meetType">
		<option value="">모임 유형</option>
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
</body>
</html>