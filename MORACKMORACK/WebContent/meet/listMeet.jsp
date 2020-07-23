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
	
})

</script>

</head>

<body>

<div class="container">
	<jsp:include page="/toolbar.jsp"/>
</div>

<div class="container">
<c:if test="${search.searchCondition eq 0}">

<h2 style="margin-left:300px">유형 검색 목록</h2>
	<div style="text-align:center; margin-top:50px">
	<h2><a href="">다수인 모임</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="">2인 모임</a></h2>
	</div>
	
</c:if>

<c:if test="${search.searchCondition eq 1}">

<h2 style="margin-left:300px">카테고리 검색 목록</h2>
</c:if>

<c:if test="${search.searchCondition eq 2}">

<h2 style="margin-left:300px">해시태그 검색 목록</h2>

</c:if>


	<div class="container__item">
		<form class="form">
			<input type="email" class="form__field" placeholder="${search.searchCondition eq 0 or search.searchCondition eq 1? '모임명 검색' :'해시태그 검색'}"/>
			<button type="button" class="btn btn--primary btn--inside uppercase">검색</button>
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
        <p>${meet.meetName}</p>
        <p>${meet.memNum}/${meet.maxNum}</p>
      	</div>
    	</div>
  </div>  
  </c:forEach>
  
</div>
</div>

</body>
</html>