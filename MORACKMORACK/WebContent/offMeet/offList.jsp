<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<head>
	<meta charset="EUC-KR">

	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">

   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
<style>

</style>

<script type="text/javascript">
	$(function() {
		
		$(".thumbnail").on("click", function() {
			 var offNo = $(this).find($("input[name='offNo']")).val();
			self.location = "/offmeet/getInfoOff?offNo="+ offNo;
		});
	});
	
	
</script>
</head>

<body>	

<header>
<jsp:include page="/toolbar.jsp" />
</header>

<section style="float: left; margin-top:100px;">
<jsp:include page="/offMeet/offSidebar.jsp" />
</section>

<div class="container">





<input type="hidden" id="meetId" value="${param.meetId}"/>
<div class="page-header text-success">
   <h3>�������� ���� ����Ʈ</h3>
</div>

<div style="text-align:left; margin-top:100px">

   </div>
<div style="text-align:center; margin-top:100px">
<div class="row" style="display:inline-block">

	<c:forEach var="offMeet" items="${list}">
  		<div class="col-sm-6 col-md-4">
    	<div class="thumbnail">
    	<input type="hidden" name="offNo"value="${offMeet.offNo }" />
     	 <img src="/resources/images/uploadFiles/offmeet/${offMeet.imageFile}" style="width:300px; height:300px;"  onError="this.src='/resources/images/noImage.jpg'" alt="noImage">
     	 <div class="caption">
        <h3></h3>
        <p>�������� ���Ӹ�: ${offMeet.offName}</p>
        <p>�����ο�  : ${offMeet.offMem}/${offMeet.offMax}</p>
      	</div>
    	</div>
  </div>  
  </c:forEach>
  
</div>
</div>

</body>
</html>
  
  

