<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>찜 목록</title>

<jsp:include page="/common/listCdn.jsp" />

<script type ="text/javascript">

$(function(){
		
	$("a[id^=delWishMeet]").on("click", function(){
		var meetId = $(this).next().val();
		
		self.location("/meet/delWishMeet/"+meetId+"/wish");
	})
	
	$("p[id^=meetName]").on("click", function(){
		var meetId = $(this).next().val();
		
		self.location("/meet/getMeet/"+meetId);
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
     	 <img src="/resources/images/uploadFiles/meet/${wishMeet.meet.meetImg}" alt="MORACKMORACK" title="${wishMeet.meet.meetName}">
     	 <div class="caption">
        <h3></h3>
        <p id="meetName">${wishMeet.meet.meetName}</p>
        <input type="hidden" value="${wishMeet.meet.meetId}"/>
        <p>${wishMeet.meet.memNum}/${wishMeet.meet.maxNum}</p>
      	</div>
    	</div>
    	<img src="/resources/images/uploadFiles/heart.png" width="10px" height="10px"/>
    	<a id="delWishMeet"> &nbsp; 찜 리스트에서 지우기</a>
    	<input type="hidden" value="${wishMeet.meet.meetId}"/>
  </div>  
  </c:forEach>
  
</div>
</div>
</form>


</body>
</html>