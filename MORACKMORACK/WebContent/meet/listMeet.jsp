<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>모임 목록 조회</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


<style>
@font-face { font-family: 'InfinitySans-BoldA1'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/InfinitySans-BoldA1.woff') format('woff'); font-weight: normal; font-style: normal; }
@font-face { font-family: 'MapoGoldenPier'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/MapoGoldenPierA.woff') format('woff'); font-weight: normal; font-style: normal; }
:root {
  background: #f5f6fa;
  color: #9c9c9c;
  font: 1rem "PT Sans", sans-serif;
}


a {
  color: inherit;
}
a:hover {
  color: #7f8ff4;
}


.uppercase {
  text-transform: uppercase;
}

.btn {
  display: inline-block;
  background: transparent;
  color: inherit;
  font: inherit;
  border: 0;
  outline: 0;
  padding: 0;
  -webkit-transition: all 200ms ease-in;
  transition: all 200ms ease-in;
  cursor: pointer;
}
.btn--primary {
  background: #8cafb9;
  color: #fff;
  box-shadow: 0 0 10px 2px rgba(0, 0, 0, 0.1);
  border-radius: 2px;
  padding: 12px 36px;
}
.btn--primary:hover {
  font: #ffffff;
  background: #8cafb9;
}
.btn--primary:active {
  background: #8cafb9;
  box-shadow: inset 0 0 10px 2px rgba(0, 0, 0, 0.2);
}
.btn--inside {
  margin-left: -66px;
}

.form__field {
  width: 360px;
  background: #fff;
  color: #a3a3a3;
  font: inherit;
  box-shadow: 0 6px 10px 0 rgba(0, 0, 0, 0.1);
  border: 0;
  outline: 0;
  padding: 22px 18px;
}

@charset "UTF-8";
fieldset {
  border: none;
  padding: 40px;
}

.input-field {
  position: relative;
  padding: 30px 10px 0;
  box-sizing: border-box;
  overflow: hidden;
  margin: 20px 0;
}
.input-field.w50 {
  width: 50%;
  float: left;
}
.input-field input,
.input-field textarea {
  background-color: transparent;
  border: none;
  border-bottom: 1px solid #9e9e9e;
  border-radius: 0;
  outline: none;
  height: 40px;
  width: 100%;
  font-size: 20px;
  margin: 0 0 20px 0;
  padding: 0;
  box-shadow: none;
  box-sizing: border-box;
  -webkit-transition: all 0.3s;
  transition: all 0.3s;
}
.input-field input:focus,
.input-field textarea:focus {
  border-bottom: 3px solid #f00;
}
.input-field input:focus + label, .input-field input + label.active,
.input-field textarea:focus + label,
.input-field textarea + label.active {
  color: #c50;
  font-size: 15px;
  top: 10px;
}
.input-field label {
  color: #9e9e9e;
  position: relative;
  top: 35px;
  left: 10px;
  font-size: 20px;
  cursor: text;
  -webkit-transition: 0.2s ease-out;
  transition: 0.2s ease-out;
}
.input-field textarea {
  height: 80px;
}

.list-group {
  list-style: none;
  margin: 0 0 50px;
  padding: 0;
}
.list-group li {
  position: static;
  display: inline-block;
  margin-right: 100px;
}

.input + label {
  position: relative;
  font-size: 15px;
  padding-left: 40px;
  cursor: pointer;
}
.input[type="radio"]:not(:checked) + label, .input[type="checkbox"]:not(:checked) + label {
  color: #9e9e9e;
}
.input[type="radio"]:checked + label, .input[type="checkbox"]:checked + label {
  color: #2ac1bc;
}
.input[type="radio"]:not(:checked), .input[type="radio"]:checked, .input[type="checkbox"]:not(:checked), .input[type="checkbox"]:checked {
  position: absolute;
  left: -9999px;
  color: #888;
}
.input[type="radio"]:not(:checked) + label:before, .input[type="radio"]:checked + label:before {
  content: "";
  width: 16px;
  height: 16px;
  border: 3px solid #444;
  border-radius: 50%;
  position: absolute;
  left: 0;
  top: 0;
}
.input[type="radio"]:checked + label:before {
  border: 3px solid #2ac1bc;
  /*background: #2ac1bc;*/
}
.input[type="radio"]:checked + label:after {
  content: "";
  display: block;
  width: 8px;
  height: 8px;
  border-radius: 50%;
  background: #2ac1bc;
  position: absolute;
  top: 7px;
  left: 7px;
  -webkit-transition: all 0.2s;
  transition: all 0.2s;
}
.input[type="checkbox"]:not(:checked) + label:before, .input[type="checkbox"]:checked + label:before {
  content: "";
  width: 16px;
  height: 16px;
  border: 3px solid #444;
  position: absolute;
  left: 0;
  top: 0;
}
.input[type="radio"]:checked + label:before {
  border: 3px solid #2ac1bc;
}
.input[type="checkbox"]:checked + label:before {
  border: 3px solid #2ac1bc;
  /*background: #2ac1bc;*/
}
.input[type="checkbox"]:checked + label:after {
  content: "";
  display: block;
  width: 8px;
  height: 8px;
  background: #2ac1bc;
  position: absolute;
  top: 7px;
  left: 7px;
  -webkit-transition: all 0.2s;
  transition: all 0.2s;
}
.input[type="radio"]:not(:checked) + label:after, .input[type="checkbox"]:not(:checked) + label:after {
  opacity: 0;
  -webkit-transform: scale(0);
          transform: scale(0);
}
.input[type="radio"]:checked + label:after, .input[type="checkbox"]:checked + label:after {
  opacity: 1;
  -webkit-transform: scale(1);
          transform: scale(1);
}

#box {
  width: 100px;
  height: 100px;
  margin: 20px;
  background: #ff0;
  opacity: 0;
}

.category-li{
padding: 30px 30px 30px 30px;
}


.wrapper {
    max-width: 1000px;
    margin: 0 auto
}

.wrapper:before,
.wrapper:after {
    content: '';
    display: table;
    clear: both
}

.pic {
    position: relative;
    overflow: hidden;
    margin: 10px;
    display: inline-block;
    -webkit-animation: anima 2s;
    -moz-animation: anima 2s;
    -o-animation: anima 2s;
    -ms-animation: anima 2s;
    animation: anima 2s;
    -webkit-backface-visibility: hidden;
    -moz-backface-visibility: hidden;
    -o-backface-visibility: hidden;
    -ms-backface-visibility: hidden;
    backface-visibility: hidden;
	

}

.pic-3d {
    -webkit-perspective: 500;
    -moz-perspective: 500;
    -o-perspective: 500;
    -ms-perspective: 500;
    perspective: 500;
    -webkit-transform-style: preserve-3d;
    -moz-transform-style: preserve-3d;
    -o-transform-style: preserve-3d;
    -ms-transform-style: preserve-3d;
    transform-style: preserve-3d
}

.pic-caption {
    cursor: default;
    position: absolute;
    width: 100%;
    height: 100%;
    background: rgba(255, 255, 255, 0.5);
    padding: 10px;
    text-align: center;
    -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=($opacity * 100))";
    filter: alpha(opacity=0);
    -moz-opacity: 0;
    -khtml-opacity: 0;
    opacity: 0
}

.pic-image {
    -webkit-transform: scale(1.02);
    -moz-transform: scale(1.02);
    -o-transform: scale(1.02);
    -ms-transform: scale(1.02);
    transform: scale(1.02)
}

.pic:hover .pic-image {
    -webkit-transform: scale(1);
    -moz-transform: scale(1);
    -o-transform: scale(1);
    -ms-transform: scale(1);
    transform: scale(1)
}

.pic-title {
    font-size: 1.8em
}

a,
a:hover,
.pic .pic-image,
.pic-caption,
.pic:hover .pic-caption,
.pic:hover img {
    -webkit-transition: all 0.5s ease;
    -moz-transition: all 0.5s ease;
    -o-transition: all 0.5s ease;
    -ms-transition: all 0.5s ease;
    transition: all 0.5s ease
}

.pic:hover .bottom-to-top,
.pic:hover .top-to-bottom,
.pic:hover .left-to-right,
.pic:hover .right-to-left,
.pic:hover .rotate-in,
.pic:hover .rotate-out,
.pic:hover .open-up,
.pic:hover .open-down,
.pic:hover .open-left,
.pic:hover .open-right,
.pic:hover .come-left,
.pic:hover .come-right {
    -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=($opacity * 100))";
    filter: alpha(opacity=100);
    -moz-opacity: 1;
    -khtml-opacity: 1;
    opacity: 1;
    -webkit-user-select: none;
    -moz-user-select: none;
    -o-user-select: none;
    -ms-user-select: none;
    user-select: none;
    -webkit-touch-callout: none;
    -moz-touch-callout: none;
    -o-touch-callout: none;
    -ms-touch-callout: none;
    touch-callout: none;
    -webkit-tap-highlight-color: transparent;
    -moz-tap-highlight-color: transparent;
    -o-tap-highlight-color: transparent;
    -ms-tap-highlight-color: transparent;
    tap-highlight-color: transparent
}

.open-down {
    -webkit-transform: rotateX(-180deg);
    -moz-transform: rotateX(-180deg);
    -o-transform: rotateX(-180deg);
    -ms-transform: rotateX(-180deg);
    transform: rotateX(-180deg);
    top: 0;
    left: 0
}

.pic:hover .open-down {
    -webkit-transform: rotateX(0);
    -moz-transform: rotateX(0);
    -o-transform: rotateX(0);
    -ms-transform: rotateX(0);
    transform: rotateX(0)
}

#meetDetail{
font-family: 'InfinitySans-BoldA1';
}

#meetDetail h4{
font-family: 'MapoGoldenPier'; 
}

br{
    font-family:initial;
}

</style>


<script type ="text/javascript">

$(function (){
	
	$("#meetDetail, #meetName").on("click", function(){
		var meetId = $(this).next().val();
		self.location="/meet/getMeet/"+meetId;
	})
	
	$("#searchMeet").on("click", function(){
		$("form").attr("method", "POST").attr("action", "/meet/listMeet").submit();
	})
	
	$("#searchKeyword").keydown(function(key) {
		if (key.keyCode == 13) {
			$("form").attr("method", "POST").attr("action", "/meet/listMeet").submit();
		}
	})
	
	$("#meetTypeisone").on("click", function(){
		$("#searchCondition").val('0');
		$("form").attr("method", "POST").attr("action", "/meet/listMeet").submit();
	})
	
	$("#meetTypeismul").on("click", function(){
		$("#searchCondition").val('1');
		$("form").attr("method", "POST").attr("action", "/meet/listMeet").submit();
	})
	
function myButton() {
  var aaa = document.getElementById("box")
  aaa.style.fontSize = "25px"; 
  aaa.style.backgroundColor = "red"; 
  aaa.style.opacity = "1.0";
}

})

</script>

</head>

<body>
<form>
<input type="hidden" id="searchType" name="searchType" value="${search.searchType}"/>
<input type="hidden" id="searchCondition" name="searchCondition" value="${search.searchCondition}"/>

<header>
<jsp:include page="/toolbar.jsp" />
</header>

<div class="container">
<c:if test="${search.searchType eq 0}">

<h4 style="text-align:right">유형 검색 목록</h4>
	<div style="text-align:center; margin-top:50px">
	<h4><a id="meetTypeismul">다수인 모임</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a id="meetTypeisone">2인 모임</a></h4>
	</div>
	
</c:if>

<c:if test="${search.searchType eq 1}">

<h4 style="text-align:right">카테고리 검색 목록</h4>

  <fieldset>
    <ul class="list-group">
      <li class="category-li">
        <input type="radio" name="group1" id="r1" class="input" checked>
        <label for="r1">여행</label>
      </li>
      <li class="category-li">
        <input type="radio" name="group1" id="r2" class="input">
        <label for="r2">게임</label>
      </li>
      <li class="category-li">
        <input type="radio" name="group1" id="r3" class="input">
        <label for="r3">음악</label>
      </li>
      <li class="category-li">
        <input type="radio" name="group1" id="r4" class="input">
        <label for="r4">영화</label>
      </li>
      <li class="category-li">
        <input type="radio" name="group1" id="r5" class="input">
        <label for="r5">공연</label>
      </li>
      <li class="category-li">
        <input type="radio" name="group1" id="r6" class="input">
        <label for="r6">맛집</label>
      </li>
      <li class="category-li">
        <input type="radio" name="group1" id="r7" class="input">
        <label for="r7">자기계발</label>
      </li>
      <li class="category-li">
        <input type="radio" name="group1" id="r8" class="input">
        <label for="r8">액티비티</label>
      </li>
      <li class="category-li">
        <input type="radio" name="group1" id="r9" class="input">
        <label for="r9">독서/만화</label>
      </li>
      <li class="category-li">
        <input type="radio" name="group1" id="r10" class="input">
        <label for="r10">댄스</label>
      </li>
      <li class="category-li">
        <input type="radio" name="group1" id="r11" class="input">
        <label for="r11">사진</label>
      </li>
      <li class="category-li">
        <input type="radio" name="group1" id="r12" class="input">
        <label for="r12">반려동물</label>
      </li>
      <li class="category-li">
        <input type="radio" name="group1" id="r13" class="input">
        <label for="r13">요리</label>
      </li>
      <li class="category-li">
        <input type="radio" name="group1" id="r14" class="input">
        <label for="r14">차</label>
      </li>
      <li class="category-li">
        <input type="radio" name="group1" id="r15" class="input">
        <label for="r15">스포츠</label>
      </li>
      <li class="category-li">
        <input type="radio" name="group1" id="r16" class="input">
        <label for="r16">공예</label>
      </li>
      <li class="category-li">
        <input type="radio" name="group1" id="r17" class="input">
        <label for="r17">기타</label>
      </li>
    </ul>
    </fieldset>

</c:if>

<c:if test="${search.searchType eq 2}">

<h4 style="text-align:right">해시태그 검색 목록</h4>

</c:if>


	<div class="container__item">
		<form class="form">
			<input type="text" id="searchKeyword" name="searchKeyword" class="form__field" placeholder="${search.searchType eq 0 or search.searchType eq 1? '모임명 검색' :'해시태그 검색'}" value="${! empty search.searchKeyword ? search.searchKeyword : '' }"/>
			<button type="button" id="searchMeet" class="btn btn--primary btn--inside uppercase">검색</button>
		</form>
	</div>
</div>


<div style="text-align:center; margin-top:50px">
<div class="row" style="display:inline-block">

	<c:forEach var="meet" items="${listMeet}">
  		<div class="col-sm-6 col-md-4">
     	<%-- <img id="listMeetImg" src="/resources/images/uploadFiles/meet/${meet.meetImg}" alt="MORACK MORACK" title="${meet.meetName}" style="hight:500px; width:500px">
     	 <div class="caption">
        <h3></h3>
        <p id="meetName">${meet.meetName}</p><input type="hidden" value="${meet.meetId}"/>
        <p>${meet.memNum}/${meet.maxNum}</p>
      	</div>
    	</div> --%>
    	 <!--Effect: Open Down -->
            <div class="pic pic-3d">
                <img src="/resources/images/uploadFiles/meet/${meet.meetImg}" class="pic-image" style="hight:550px; width:550px">
                 <div class="caption">
                 
                 <br/><p id="meetName">${meet.meetName}</p>
                 <p>${meet.memNum}/${meet.maxNum}</p>
                 </div>
                <span class="pic-caption open-down" id="meetDetail">
                
               <br/><h1 class="pic-title">${meet.meetName}</h1><br/><br/>


		        <h4>${meet.memNum}/${meet.maxNum}</h4>
		        <h4>${meet.meetLoc}</h4>
		        <h4>${meet.sIntro}</h4>
		        <h4>
		        <c:if test="${meet.meetType eq '0'.charAt(0)}">2인 모임</c:if>
		        <c:if test="${meet.meetType eq '1'.charAt(0)}">다수인 모임</c:if>
		        </h4>
            </span>
            <input type="hidden" value="${meet.meetId}"/>
            </div>
  </div>  
  </c:forEach>
  
</div>
</div>
</form>
</body>
</html>


