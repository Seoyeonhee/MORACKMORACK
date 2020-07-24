<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ include file="/webSocket.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>index</title>

<script src="https://code.jquery.com/jquery-3.1.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
<script type ="text/javascript">

</script>

</head>
<body>

        <div class="container">
        	<c:if test="${ ! empty sessionScope.business }">
        		<jsp:include page="/business/businessToolbar.jsp" />
        	</c:if>
        	<c:if test="${ empty sessionScope.business }">
        		<jsp:include page="toolbar.jsp" />
        	</c:if>
   		</div> 	

<div>	
	<a href="/meet/test">회원 데이터 INSERT</a> <br/><br/>
</div>
 
 <div id="carousel-example-generic" class="carousel slide" data-ride="carousel" style="margin-top:180px"> <!-- 모임 추천 -->
  <ol class="carousel-indicators">
    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
  </ol>


  <div class="carousel-inner" role="listbox">
    <div class="item active">
      <img src="..." alt="Image" style="height:500px; width:500px">
      <div class="carousel-caption">
      </div>
    </div>
    <div class="item">
      <img src="..." alt="Image" style="height:500px; width:500px">
      <div class="carousel-caption">
      </div>
    </div>
  </div>


  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
	

<div class="row" style="margin-top:180px"> <!-- 모임 순위 -->
  <div class="col-xs-6 col-md-4">
    <a href="#" class="thumbnail">
      <img src="..." alt="IMAGE">
    </a>
  </div>
  
  <div class="col-xs-6 col-md-4">
    <a href="#" class="thumbnail">
      <img src="..." alt="IMAGE">
    </a>
  </div>
  
  <div class="col-xs-6 col-md-4">
    <a href="#" class="thumbnail">
      <img src="..." alt="IMAGE">
    </a>
  </div>
 
</div>   

<div class="row" style="margin-top:180px"> <!-- 업체 추천 -->
  <div class="col-xs-6 col-md-3"> 
    <a href="#" class="thumbnail">
      <img src="..." alt="...">
    </a>
  </div>
  
  <div class="col-xs-6 col-md-3">
    <a href="#" class="thumbnail">
      <img src="..." alt="...">
    </a>
  </div>
  
  <div class="col-xs-6 col-md-3">
    <a href="#" class="thumbnail">
      <img src="..." alt="...">
    </a>
  </div>
  
  <div class="col-xs-6 col-md-3">
    <a href="#" class="thumbnail">
      <img src="..." alt="...">
    </a>
  </div>
</div> 

</body>
</html>