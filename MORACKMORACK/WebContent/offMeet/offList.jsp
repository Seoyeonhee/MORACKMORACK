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

var message = '${message}';


	$(function() {
		
	
		$(".thumbnail").on("click", function() {
			 var offNo = $(this).find($("input[name='offNo']")).val();
			 var meetId = $(this).find($("input[name='meetId']")).val();
			 window.location.href = "/offmeet/getInfoOff?offNo="+offNo+"&meetId="+meetId;
		});
	});
	
	if(message != null){
		if(message == "1"){
			alert("이미 참여한 오프라인 모임입니다.");
		}
	}
</script>
</head>

<body>	

<header>
<jsp:include page="/toolbar.jsp" />
</header>

<section style="float: left; margin-top:20px;">
<jsp:include page="../offMeet/offSidebar.jsp" />
</section>

<div class="container">

<input type ="hidden" id="message" name="message" value="${message}"/>


<div>
   <h3>오프라인 모임 리스트</h3>
</div>

<div style="text-align:left; margin-top:50px">

   </div>
<div style="text-align:center;">
<div class="row" style="display:inline-block">
	
	<c:forEach var="offMeet" items="${list}">
  		<div class="col-sm-6 col-md-4">
    	<div class="thumbnail">
    	 <input type="hidden" name="meetId" value="${meet.meetId}"/>
    	<input type="hidden" name="offNo"value="${offMeet.offNo }" />

     	 <img src="/resources/images/uploadFiles/offmeet/${offMeet.imageFile}" style="width:450px; height:300px;"  onError="this.src='/resources/images/logo.png'" alt="noImage">
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
  
  

