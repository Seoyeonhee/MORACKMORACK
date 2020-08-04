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
			 var businessId = $(this).find($("input[name='businessId']")).val();
			 window.location.href = "/business/getBusiness?businessId="+businessId;
		});
	});
	
</script>
</head>

<body>	

<header>
<jsp:include page="/toolbar.jsp" />
</header>

<div class="container">


<div>
   <h3>업체 리스트</h3>
</div>

<div style="text-align:left; margin-top:50px">

   </div>
<div style="text-align:center;">
<div class="row" style="display:inline-block">
	
	<c:forEach var="business" items="${businessList}">
  		<div class="col-sm-6 col-md-4">
    	<div class="thumbnail">
    	<input type="hidden" name="businessId"value="${business.businessId }" />
     	 <img src="/resources/images/uploadFiles/business/${business.businessImg}" style="width:450px; height:300px;"  onError="this.src='/resources/images/logo.png'" alt="noImage">
     	 <div class="caption">
        <h3></h3>
        <p>업체명 : ${business.businessName}</p>
      	</div>
    	</div>
  </div>  
  </c:forEach>
  
</div>
</div>

</body>
</html>
  
  

