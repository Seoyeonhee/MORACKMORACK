<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<head>
	<meta charset="EUC-KR">
<jsp:include page="/common/listCdn.jsp" />

<style>

</style>

<script type="text/javascript">
	$(function() {
		
		$(".thumbnail").on("click", function() {
			 var offNo = $(this).find($("input[name='offNo']")).val();
			 window.location.href = "/offmeet/getInfoOff?offNo="+ offNo;
		});
	});
	
	
</script>
</head>

<body>	

<header>
<jsp:include page="/toolbar.jsp" />
</header>

<section style="float: left; margin-top:100px;">
<jsp:include page="../offMeet/offSidebar.jsp" />
</section>

<div class="container">





<input type="hidden" id="meetId" value="${param.meetId}"/>
<div class="page-header text-success">
   <h3>오프라인 모임 리스트</h3>
</div>

<div style="text-align:left; margin-top:100px">

   </div>
<div style="text-align:center; margin-top:100px">
<div class="row" style="display:inline-block">

	<c:forEach var="offMeet" items="${list}">
  		<div class="col-sm-6 col-md-4">
    	<div class="thumbnail">
    	<input type="hidden" name="offNo"value="${offMeet.offNo }" />
     	 <img src="/resources/images/uploadFiles/offmeet/${offMeet.imageFile}" style="width:300px; height:300px;"  onError="this.src='/resources/images/logo.png'" alt="noImage">
     	 <div class="caption">
        <h3></h3>
        <p>오프라인 모임명: ${offMeet.offName}</p>
        <p>참여인원  : ${offMeet.offMem}/${offMeet.offMax}</p>
      	</div>
    	</div>
  </div>  
  </c:forEach>
  
</div>
</div>

</body>
</html>
  
  

