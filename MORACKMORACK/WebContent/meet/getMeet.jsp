<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>모임 상세 조회</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>

<style>
@font-face { font-family: 'yg-jalnan'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.2/JalnanOTF00.woff') format('woff'); font-weight: normal; font-style: normal; }
@font-face { font-family: 'MapoGoldenPier'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/MapoGoldenPierA.woff') format('woff'); font-weight: normal; font-style: normal; }

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
.grid12-6{
     position:relative;
     padding: 30px 30px 30px 30px;
     margin-top : 30px;
}
.grid12-6 .inner_box{
     position:absolute;
     background:rgba(255,255,255,0.7);
     width: 40%;
     height: 40%;
     top:50%;
     left:50%;
     transform:translate(-50%,-50%);
     padding:35px;
     text-align:center;
}
.grid12-6 .inner_box h2{
     font-family: 'yg-jalnan';
     text-align:center;
     text-size : 50px;
     font-weight:normal;
     color:#777;
}

#mainCart{
	width: 360px;
	height: 72px;
	margin: auto;
	background: #ececec;
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	display: block;
	-moz-border-radius: 6px;
	-webkit-border-radius: 6px;
	border-radius: 6px;
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
	-moz-box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
	-webkit-box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12),
		0 1px 2px rgba(0, 0, 0, 0.24);
}

a.add-to-cart {
	width: 216px;
	height: 48px;
	background: #ffab00;
	font-size: 18px;
	line-height: 48px;
	letter-spacing: 2px;
	color: rgb(255, 255, 255);
	text-transform: uppercase;
	-moz-border-radius: 24px;
	-webkit-border-radius: 24px;
	border-radius: 24px;
	text-decoration: none;
	text-align: center;
	left: 24px;
	position: absolute;
	top: 48px;
	display: block;
	box-shadow: 0 3px 6px rgba(255, 171, 0, 0.16),
		0 3px 6px rgba(255, 171, 0, 0.23);
	-moz-box-shadow: 0 3px 6px rgba(255, 171, 0, 0.16),
		0 3px 6px rgba(255, 171, 0, 0.23);
	-webkit-box-shadow: 0 3px 6px rgba(255, 171, 0, 0.16),
		0 3px 6px rgba(255, 171, 0, 0.23);
}

a.add-to-cart.size {
	width: 48px;
	left: 108px;
	font-size: 0;
	color: #e7bb45;
	letter-spacing: 0;
	-webkit-transition: 0.2s linear;
	-moz-transition: 0.2s linear;
	-ms-transition: 0.2s linear;
	-o-transition: 0.2s linear;
	transition: 0.2s linear;
}

a.add-to-cart.hover {
	-webkit-transition: 0.2s linear;
	-moz-transition: 0.2s linear;
	-ms-transition: 0.2s linear;
	-o-transition: 0.2s linear;
	transition: 0.2s linear;
	-webkit-transform: rotate(180deg);
	-moz-transform: rotate(180deg);
	-ms-transform: rotate(180deg);
	-o-transform: rotate(180deg);
	transform: rotate(180deg);
	-webkit-transform-origin: 108px 24px;
	-moz-transform-origin: 108px 24px;
	-o-transform-origin: 108px 24px;
	-ms-transform-origin: 108px 24px;
	transform-origin: 108px 24px;
}

a.cart {
	width: 72px;
	height: 72px;
	-moz-border-radius: 36px;
	-webkit-border-radius: 36px;
	border-radius: 36px;
	font-size: 18px;
	text-align: center;
	color: #616161;
	text-decoration: none;
	position: absolute;
	right: 24px;
	top: 36px;
	display: block;
	background: #535558
		url(http://images.vfl.ru/ii/1484930184/14435803/15757225.png) center no-repeat;
	background-size: 36px;
	box-shadow: 0 3px 6px rgba(97, 97, 97 0.16), 0 3px 6px rgba(97, 97, 97 0.23);
	-moz-box-shadow: 0 3px 6px rgba(97, 97, 97 0.16),
		0 3px 6px rgba(97, 97, 97 0.23);
	-webkit-box-shadow: 0 3px 6px rgba(97, 97, 97 0.16),
		0 3px 6px rgba(97, 97, 97 0.23);
}
a.cart > span {
	width: 24px;
	height: 24px;
	font-size: 16px;
	color: #fff;
	line-height: 24px;
	position: absolute;
	-moz-border-radius: 12px;
	-webkit-border-radius: 12px;
	border-radius: 12px;
	display: block;
	transform: scale(0);
	-o-transform: scale(0);
	-ms-transform: scale(0);
	-moz-transform: scale(0);
	-webkit-transform: scale(0);
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	margin: auto;
	background: #ffab00;
	box-shadow: 0 3px 6px rgba(255, 171, 0, 0.16),
		0 3px 6px rgba(255, 171, 0, 0.23);
	-moz-box-shadow: 0 3px 6px rgba(255, 171, 0, 0.16),
		0 3px 6px rgba(255, 171, 0, 0.23);
	-webkit-box-shadow: 0 3px 6px rgba(255, 171, 0, 0.16),
		0 3px 6px rgba(255, 171, 0, 0.23);
}
a.cart > span.counter {
	left: 48px;
	bottom: 48px;
	-webkit-transition: 0.2s linear;
	-moz-transition: 0.2s linear;
	-ms-transition: 0.2s linear;
	-o-transition: 0.2s linear;
	transition: 0.2s linear;
	transform: scale(1);
	-o-transform: scale(1);
	-ms-transform: scale(1);
	-moz-transform: scale(1);
	-webkit-transform: scale(1);
}

#mainMeetName{
font-family: 'yg-jalnan';
text-size : 50px;
}

#mainHashtag{
font-family: 'MapoGoldenPier'
}

</style>


<script type ="text/javascript">

$(function(){
	
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
	
	$("#joinMeet").on("click", function(){	
		self.location("/meet/joinMeet?meetId="+meetId)		
	});
	
	$("#addWishMeet").on("click", function(){		
		self.location("/meet/addWishMeet?meetId="+meetId)		
		alert("찜!") //찜 모달창 만들기
	});
	
	$("#addOffMeet").on("click", function(){		
		self.location("/offmeet/addOffView?meetId="+meetId)		
	})
	
	
	$("#inputIntro").on("click", function(){
			var intro = $("#intro").val();
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
	
	//var count = 0;
	var count = $("#wishCount").val();
	$("a.cart > span").addClass("counter");
	$("a.cart > span.counter").text(count);
	
	$("a.add-to-cart").click(function(event) {
		if($("#wishMeet").val() == ''){
		$("a.add-to-cart").addClass("size");
		setTimeout(function() {
			$("a.add-to-cart").addClass("hover");
		}, 200);
		setTimeout(function() {
			$("a.cart > span").addClass("counter");
			$("a.cart > span.counter").text(count);
		}, 400);
		setTimeout(function() {
			$("a.add-to-cart").removeClass("hover");
			$("a.add-to-cart").removeClass("size");
		}, 600);
		event.preventDefault();
		self.location("/meet/addWishMeet?meetId="+meetId);
		}else if($("#wishMeet").val() != ''){
			$("a.add-to-cart").addClass("size");
			setTimeout(function() {
				$("a.add-to-cart").addClass("hover");
			}, 200);
			setTimeout(function() {
				$("a.cart > span").addClass("counter");
				$("a.cart > span.counter").text(count);
			}, 400);
			setTimeout(function() {
				$("a.add-to-cart").removeClass("hover");
				$("a.add-to-cart").removeClass("size");
			}, 600);
			event.preventDefault();
			self.location("/meet/delWishMeet/"+meetId+"/get");
		}
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
<input type="hidden" id="meetMem" name="meetMem" value="${meetMem}"/>
<input type="hidden" id="meetId" name="meetId" value="${meet.meetId}"/>
<input type="hidden" id="wishMeet" name="wishMeet" value="${wishMeet}"/>
<input type="hidden" id="wishCount" name="wishCount" value="${wishCount}"/>

<aside>
<section style="float: right; margin-bottom:10px;">

  <div id="mainCart" style="float:right; margin-top:100px;">
  <c:if test="${empty wishMeet}">
	<a href="#" class="add-to-cart">add to cart</a>
	</c:if>
	<c:if test="${!empty wishMeet}">
	<a href="#" class="add-to-cart">Delete to cart</a>
	</c:if>
	<a href="#" class="cart"><span></span></a>
</div>

<c:if test="${empty meetMem}">
<button type="button" class="draw meet" id="joinMeet">모임가입</button>
</c:if>
<c:if test="${!empty meetMem}">
<button type="button" class="draw meet">쪽지 초대</button>
<button type="button" class="draw meet">카카오톡 초대</button>
<c:if test="${meetMem.meetRole eq '0'.charAt(0) or meetMem.meetRole eq '1'.charAt(0)}">
<button type="button" class="draw meet" id="addOffMeet">오프라인 모임 생성</button>
</c:if>
</c:if>
</section>

<section style="float: left; margin-bottom:10px;">
<div class="grid12-6">
<img src="/resources/images/uploadFiles/meet/${meet.meetImg}" width="1200" height="1200">
<div class="inner_box">
     <h2 id="mainMeetName">${meet.meetName}</h2>
     <br/><br/>
     <h4 id="mainHashtag"><c:forEach var="hashtag" items="${meet.hashtag}">#${hashtag.HASH_NAME} </c:forEach></h4>
     <!-- <button>See More</button> -->
</div>

</div>
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
     		 <img src="/resources/images/uploadFiles/meet/${meet.meetImg}" width="100" height="100" alt="MORACK MORACK"/> 
    		</a>
 		 </div>
  		<strong>모임명</strong>
		${meet.meetName} <br/>
		<strong>모임유형</strong>
    	<c:if test="${meet.meetType eq '0'.charAt(0)}">2인모임</c:if><c:if test="${meet.meetType eq '1'.charAt(0)}">다수인모임</c:if> <br/>
    	<strong>모임명</strong>
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
<button class="btn btn-default" data-dismiss="modal">취소</button>
            <button class="btn btn-primary" id="inputIntro">가입</button>
</div>
</div>
</div>
</div>

</aside>
</form>

</body>
</html>