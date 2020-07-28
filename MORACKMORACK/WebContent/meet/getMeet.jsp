<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>모임 상세 조회</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script src="https://code.jquery.com/jquery-3.1.1.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<style>
.form__field {
  width: 300px;
  background: #fff;
  color: #a3a3a3;
  font: inherit;
  box-shadow: 0 6px 10px 0 rgba(0, 0, 0, 0.1);
  border: 0;
  outline: 0;
  padding: 22px 18px;
}

*, *:after, *:before {
  box-sizing: border-box;
}


/*=====================*/
.checkbox {
  position: relative;
  display: inline-block;
}
.checkbox:after, .checkbox:before {
  font-family: FontAwesome;
  font-feature-settings: normal;
  -webkit-font-kerning: auto;
          font-kerning: auto;
  font-language-override: normal;
  font-stretch: normal;
  font-style: normal;
  font-synthesis: weight style;
  font-variant: normal;
  font-weight: normal;
  text-rendering: auto;
}
.checkbox label {
  width: 90px;
  height: 42px;
  background: #ccc;
  position: relative;
  display: inline-block;
  border-radius: 46px;
  -webkit-transition: 0.4s;
  transition: 0.4s;
}
.checkbox label:after {
  content: '';
  position: absolute;
  width: 50px;
  height: 50px;
  border-radius: 100%;
  left: 0;
  top: -5px;
  z-index: 2;
  background: #fff;
  box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
  -webkit-transition: 0.4s;
  transition: 0.4s;
}
.checkbox input {
  position: absolute;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  z-index: 5;
  opacity: 0;
  cursor: pointer;
}
.checkbox input:hover + label:after {
  box-shadow: 0 2px 15px 0 rgba(0, 0, 0, 0.2), 0 3px 8px 0 rgba(0, 0, 0, 0.15);
}
.checkbox input:checked + label:after {
  left: 40px;
}

.model-4 .checkbox label {
  background: #bbb;
  height: 25px;
  width: 75px;
}
.model-4 .checkbox label:after {
  background: #fff;
  top: -8px;
  width: 38px;
  height: 38px;
}
.model-4 .checkbox input:checked + label {
  background: #77C2BB;
}
.model-4 .checkbox input:checked + label:after {
  background: #009688;
  left: 40px;
}

button {
  background: none;
  border: 0;
  box-sizing: border-box;
  margin: 1em;
  padding: 1em 2em;
  box-shadow: inset 0 0 0 2px #f45e61;
  color: #8CAFB9;
  font-size: inherit;
  font-weight: 700;
  position: relative;
  vertical-align: middle;
}
button::before, button::after {
  box-sizing: inherit;
  content: '';
  position: absolute;
  width: 100%;
  height: 100%;
}

.draw {
  -webkit-transition: color 0.25s;
  transition: color 0.25s;
}
.draw::before, .draw::after {
  border: 2px solid transparent;
  width: 0;
  height: 0;
}
.draw::before {
  top: 0;
  left: 0;
}
.draw::after {
  bottom: 0;
  right: 0;
}
.draw:hover {
  color: #60daaa;
}
.draw:hover::before, .draw:hover::after {
  width: 100%;
  height: 100%;
}
.draw:hover::before {
  border-top-color: #8CAFB9;
  border-right-color: #8CAFB9;
  -webkit-transition: width 0.25s ease-out, height 0.25s ease-out 0.25s;
  transition: width 0.25s ease-out, height 0.25s ease-out 0.25s;
}
.draw:hover::after {
  border-bottom-color: #60daaa;
  border-left-color: #60daaa;
  -webkit-transition: border-color 0s ease-out 0.5s, width 0.25s ease-out 0.5s, height 0.25s ease-out 0.75s;
  transition: border-color 0s ease-out 0.5s, width 0.25s ease-out 0.5s, height 0.25s ease-out 0.75s;
}

.meet:hover {
  color: #fbca67;
}
.meet::after {
  top: 0;
  left: 0;
}
.meet:hover::before {
  border-top-color: #fbca67;
  border-right-color: #fbca67;
}
.meet:hover::after {
  border-bottom-color: #fbca67;
  border-left-color: #fbca67;
  -webkit-transition: height 0.25s ease-out, width 0.25s ease-out 0.25s;
  transition: height 0.25s ease-out, width 0.25s ease-out 0.25s;
}

.buttons {
  isolation: isolate;
}

</style>


<script type ="text/javascript">

$(function (){
	var meetId = $("#meetId").val();
	var joinMessage = $("#joinMessage").val();
	
	if(joinMessage == '1'){
		$('#modalBox').modal('show');
		console.log("click open");
	}else if(joinMessage == '0'){
		alert("모임 인원 초과")
	}else if(joinMessage == '3'){
		alert("가입 가능한 모임은 5개")
	}
	
	
	$("button[name='joinMeet']").on("click", function(){	
		self.location("/meet/joinMeet?meetId="+meetId)		
	});
	
	$("button[id='addWishMeet']").on("click", function(){		
		self.location("/meet/addWishMeet?meetId="+meetId)		
		alert("찜!") //찜 모달창 만들기
	});
	
	$("#addOffMeet").on("click", function(){		
		self.location("/offmeet/addOffView?meetId="+meetId)		
	})
	
	
	$("#inputIntro").on("click", function(){
			var intro = $("#intro").val();
			alert(intro)
			alert(meetId)
			$("form").attr("method", "POST").attr("action", "/meet/joinMeet").submit();
	});
	

	$('#myModal').on('show.bs.modal', function (event) { // myModal 윈도우가 오픈할때 아래의 옵션을 적용
	  var button = $(event.relatedTarget) // 모달 윈도우를 오픈하는 버튼
	  var titleTxt = button.data('title') // 버튼에서 data-title 값을 titleTxt 변수에 저장
	  var modal = $(this)
	  modal.find('.modal-title').text('Title : ' + titleTxt) // 모달위도우에서 .modal-title을 찾아 titleTxt 값을 치환
	});
	
	$("#addOffMeet").on("click", function(){
		self.location("/offmeet/addOffView?meetId="+meetId);
	});
})

</script>

</head>

<body>
<form>

<header>
<jsp:include page="/toolbar.jsp" />
</header>

<section style="float: left; margin-top:100px;">
<jsp:include page="/meet/sidebar.jsp" />
</section>




<input type="hidden" id="joinMessage" value="${joinMessage}"/>
<input type="hidden" id="meetId" name="meetId" value="${meet.meetId}"/>


<section style="float: right; margin-left:100px">

<section class="model-4">
  <div class="model-4 checkbox">
    <input type="checkbox" id="addWishMeet"/>
    <label></label>
  </div>
</section>

<!-- <button class="draw meet" id="joinMeet">모임 가입</button> -->
<button type="button" class="draw meet" name="joinMeet">모임가입</button>
<button type="button" class="draw meet">쪽지 초대</button>
<button type="button" class="draw meet">카카오톡 초대</button>
<button type="button" class="draw meet" id="addOffMeet">오프라인 모임 생성</button>


<a href="/meet/joinMeet?meetId=${meet.meetId}">dddd</a>

</section>

<!-- 모달 영역 -->
<div id="modalBox" class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
<div class="modal-dialog" role="document">
<div class="modal-content">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
<h4 class="modal-title" id="myModalLabel">모임 가입 신청</h4>
</div>
<div class="modal-body">
    	<div class="col-xs-6 col-md-5">
    		<a href="#" class="thumbnail">
     		 <img src="/resources/images/uploadFiles/meet/${meet.meetImg}" alt="MORACK MORACK"/> 
    		</a>
 		 </div>
  		<strong>모임명</strong>
		${meet.meetName} <br/>
    	<c:if test="${meet.meetType=='0'}">2인모임</c:if><c:if test="${meet.meetType=='1'}">다수인모임</c:if> <br/>
    	<c:choose>
		<c:when test="${meet.category eq 0}">여행</c:when>
		<c:when test="${meet.category eq 1}">게임</c:when>
		<c:when test="${meet.category eq 2}">음악</c:when>
		<c:when test="${meet.category eq 3}">영화</c:when>
		<c:when test="${meet.category eq 4}">공연</c:when>
		<c:when test="${meet.category eq 5}">맛집</c:when>
		<c:when test="${meet.category eq 6}">취업/자기계발</c:when>
		<c:when test="${meet.category eq 7}">액티비티</c:when>
		<c:when test="${meet.category eq 8}">독서/만화</c:when>
		<c:when test="${meet.category eq 9}">댄스</c:when>
		<c:when test="${meet.category eq 10}">사진</c:when>
		<c:when test="${meet.category eq 11}">반려동물</c:when>
		<c:when test="${meet.category eq 12}">요리</c:when>
		<c:when test="${meet.category eq 13}">차</c:when>
		<c:when test="${meet.category eq 14}">스포츠</c:when>
		<c:when test="${meet.category eq 15}">공예</c:when>
		<c:when test="${meet.category eq 16}">기타</c:when>
	</c:choose> <br/>
		${meet.lIntro} <br/>
		<strong>한줄 자기소개</strong> <input type="text" id="intro" name="intro" class="form__field" placeholder="자기소개 입력" value=""/>
</div>
<div class="modal-footer">
<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
            <button type="button" class="btn btn-primary" id="inputIntro">가입</button>
</div>
</div>
</div>
</div>


</form>

</body>
</html>