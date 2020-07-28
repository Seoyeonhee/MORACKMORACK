<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>찜 목록</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type ="text/javascript">

$(function(){
		
	$("a[id^=delWishMeet]").on("click", function(){
		var meetId = $(this).next().val();
		
		self.location("/meet/delWishMeet/"+meetId)
	})
	
})

</script>


</head>

<body>
<form>

<header>
<jsp:include page="/toolbar.jsp" />
</header>


찜한 모임 리스트
${wishCount}


<div style="text-align:center; margin-top:50px">
<div class="row" style="display:inline-block">

	<c:forEach var="wishMeet" items="${listWishMeet}">
  		<div class="col-sm-6 col-md-4" style="margin-top:50px">
    	<div class="thumbnail">
     	 <img src="resources/images/uploadFiles/${wishMeet.meet.meetImg}" alt="MORACKMORACK" title="${wishMeet.meet.meetName}">
     	 <div class="caption">
        <h3></h3>
        <p id="meetName">${wishMeet.meet.meetName}</p>
        <input type="hidden" value="${wishMeet.meet.meetId}"/>
        <p>${wishMeet.meet.memNum}/${wishMeet.meet.maxNum}</p>
      	</div>
    	</div>
    	<a class="glyphicon glyphicon-heart" id="delWishMeet"> 찜 리스트에서 지우기</a>
    	<input type="hidden" value="${wishMeet.meet.meetId}"/>
  </div>  
  </c:forEach>
  
</div>
</div>
</form>


</body>
</html>