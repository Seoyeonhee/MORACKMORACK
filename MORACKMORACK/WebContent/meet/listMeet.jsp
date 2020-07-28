<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ��� ��ȸ</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


<style>
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

</style>


<script type ="text/javascript">

$(function (){
	
	$("#meetImg, #meetName").on("click", function(){
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
		alert($("#searchCondition").val())
		$("form").attr("method", "POST").attr("action", "/meet/listMeet").submit();
	})
	
	$("#meetTypeismul").on("click", function(){
		$("#searchCondition").val('1');
		alert($("#searchCondition").val())
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

<h4 style="text-align:right">���� �˻� ���</h4>
	<div style="text-align:center; margin-top:50px">
	<h4><a id="meetTypeismul">�ټ��� ����</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a id="meetTypeisone">2�� ����</a></h4>
	</div>
	
</c:if>

<c:if test="${search.searchType eq 1}">

<h4 style="text-align:right">ī�װ� �˻� ���</h4>

  <fieldset>
    <ul class="list-group">
      <li class="category-li">
        <input type="radio" name="group1" id="r1" class="input" checked>
        <label for="r1">����</label>
      </li>
      <li class="category-li">
        <input type="radio" name="group1" id="r2" class="input">
        <label for="r2">����</label>
      </li>
      <li class="category-li">
        <input type="radio" name="group1" id="r3" class="input">
        <label for="r3">����</label>
      </li>
      <li class="category-li">
        <input type="radio" name="group1" id="r4" class="input">
        <label for="r4">��ȭ</label>
      </li>
      <li class="category-li">
        <input type="radio" name="group1" id="r5" class="input">
        <label for="r5">����</label>
      </li>
      <li class="category-li">
        <input type="radio" name="group1" id="r6" class="input">
        <label for="r6">����</label>
      </li>
      <li class="category-li">
        <input type="radio" name="group1" id="r7" class="input">
        <label for="r7">�ڱ���</label>
      </li>
      <li class="category-li">
        <input type="radio" name="group1" id="r8" class="input">
        <label for="r8">��Ƽ��Ƽ</label>
      </li>
      <li class="category-li">
        <input type="radio" name="group1" id="r9" class="input">
        <label for="r9">����/��ȭ</label>
      </li>
      <li class="category-li">
        <input type="radio" name="group1" id="r10" class="input">
        <label for="r10">��</label>
      </li>
      <li class="category-li">
        <input type="radio" name="group1" id="r11" class="input">
        <label for="r11">����</label>
      </li>
      <li class="category-li">
        <input type="radio" name="group1" id="r12" class="input">
        <label for="r12">�ݷ�����</label>
      </li>
      <li class="category-li">
        <input type="radio" name="group1" id="r13" class="input">
        <label for="r13">�丮</label>
      </li>
      <li class="category-li">
        <input type="radio" name="group1" id="r14" class="input">
        <label for="r14">��</label>
      </li>
      <li class="category-li">
        <input type="radio" name="group1" id="r15" class="input">
        <label for="r15">������</label>
      </li>
      <li class="category-li">
        <input type="radio" name="group1" id="r16" class="input">
        <label for="r16">����</label>
      </li>
      <li class="category-li">
        <input type="radio" name="group1" id="r17" class="input">
        <label for="r17">��Ÿ</label>
      </li>
    </ul>
    </fieldset>

</c:if>

<c:if test="${search.searchType eq 2}">

<h4 style="text-align:right">�ؽ��±� �˻� ���</h4>

</c:if>


	<div class="container__item">
		<form class="form">
			<input type="text" id="searchKeyword" name="searchKeyword" class="form__field" placeholder="${search.searchType eq 0 or search.searchType eq 1? '���Ӹ� �˻�' :'�ؽ��±� �˻�'}" value="${! empty search.searchKeyword ? search.searchKeyword : '' }"/>
			<button type="button" id="searchMeet" class="btn btn--primary btn--inside uppercase">�˻�</button>
		</form>
	</div>
</div>


<div style="text-align:center; margin-top:50px">
<div class="row" style="display:inline-block">

	<c:forEach var="meet" items="${listMeet}">
  		<div class="col-sm-6 col-md-4">
    	<div class="thumbnail"> 
     	 <img src="/resources/images/uploadFiles/meet/${meet.meetImg}" alt="MORACK MORACK" title="${meet.meetName}" style="hight:500px; width:500px">
     	 <div class="caption">
        <h3></h3>
        <p id="meetName">${meet.meetName}</p><input type="hidden" value="${meet.meetId}"/>
        <p>${meet.memNum}/${meet.maxNum}</p>
      	</div>
    	</div>
  </div>  
  </c:forEach>
  
</div>
</div>
</form>
</body>
</html>