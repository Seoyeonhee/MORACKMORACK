<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

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

<header>
<c:if test="${ ! empty sessionScope.business }">
<jsp:include page="/business/businessToolbar.jsp" />
</c:if>
<c:if test="${ empty sessionScope.business }">
<jsp:include page="/toolbar.jsp" />
</c:if>
</header>

<article>
  <h2>Navigation</h2>
  <p><a href="/meet/test">ȸ�� ������ INSERT</a></p>
  <p><a href="/message/sendMessage.jsp">�޼��� send</a></p>
 	

<div class="row" style="margin-top:180px"> <!-- ���� ���� -->
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

<div class="row" style="margin-top:180px"> <!-- ��ü ��õ -->
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
</article>
</body>
</html>