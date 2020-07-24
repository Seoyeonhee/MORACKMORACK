<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ include file="/webSocket.jsp" %>

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
  background: #7f8ff4;
  color: #fff;
  box-shadow: 0 0 10px 2px rgba(0, 0, 0, 0.1);
  border-radius: 2px;
  padding: 12px 36px;
}
.btn--primary:hover {
  background: #6c7ff2;
}
.btn--primary:active {
  background: #7f8ff4;
  box-shadow: inset 0 0 10px 2px rgba(0, 0, 0, 0.2);
}
.btn--inside {
  margin-left: -96px;
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

})

</script>

</head>

<body>
<form>
<input type="hidden" id="searchType" name="searchType" value="${search.searchType}"/>
<input type="hidden" id="searchCondition" name="searchCondition" value="${search.searchCondition}"/>

<div class="container">
	<jsp:include page="/toolbar.jsp"/>
</div>

<div class="container">
<c:if test="${search.searchType eq 0}">

<h4 style="text-align:right">유형 검색 목록</h4>
	<div style="text-align:center; margin-top:50px">
	<h4><a id="multiMeet">다수인 모임</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a id="twoMeet">2인 모임<a></h4>
	</div>
	
</c:if>

<c:if test="${search.searchType eq 1}">

<h4 style="text-align:right">카테고리 검색 목록</h4>
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
    	<div class="thumbnail">
     	 <img src="resources/images/uploadFiles/${meet.meetImg}" alt="MORACKMORACK" title="${meet.meetName}">
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