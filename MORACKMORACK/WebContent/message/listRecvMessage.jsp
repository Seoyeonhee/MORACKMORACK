<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>수신 쪽지 목록</title>

<jsp:include page="/common/listCdn.jsp" />


<style>
@font-face { font-family: 'InfinitySans-BoldA1'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/InfinitySans-BoldA1.woff') format('woff'); font-weight: normal; font-style: normal; }
@font-face { font-family: 'MapoGoldenPier'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/MapoGoldenPierA.woff') format('woff'); font-weight: normal; font-style: normal; }
.pic {
    position: relative;
    margin: 10px;
    display: inline-block;
}

.pic-caption {
    cursor: default;
    position: absolute;
    width: 100%;
    height: 100%;
    background: rgba(255, 255, 255, 0);
    padding: 10px;
    text-align: center;
    filter: alpha(opacity=0);
    -moz-opacity: 1;
    -khtml-opacity: 1;
    opacity: 1;
}
.pic-title {
    font-size: 1.8em
}


.open-down {
    top: 0;
    left: 0
}

#getMessage{
font-family: 'InfinitySans-BoldA1';
}

#getMessage h4{
font-family: 'MapoGoldenPier'; 
}

br{
    font-family:initial;
}
</style>


<script type ="text/javascript">

$(function(){
	
	$("span[id^='getMessage']").on("click", function(){
		var messageNo = $(this).next().val();
		self.location="/message/getMessage/"+ messageNo;
	});
	
})

</script>

</head>

<body>

<header>
<jsp:include page="/toolbar.jsp" />
</header>

<section style="float: left; margin-top:100px;">
<jsp:include page="/message/sidebar.jsp" />
</section>

<aside>

<div style="text-align:center; margin-top:50px;">
<div class="row" style="display:inline-block; background-color:#E7D5BD">

	<c:forEach var="message" items="${listRecvMessage}">
  		<div class="col-sm-6 col-md-3.5">
    	 <!--Effect: Open Down -->
            <div class="pic pic-3d" style="padding: 10px 10px 10px 10px;">
                <img src="/resources/images/uploadFiles/message/message.jpg" class="pic-image" style="hight:500px; width:500px;">
                <span class="pic-caption open-down" id="getMessage">
                
               <br/><h1 class="pic-title">${message.title}</h1><br/><br/>


		        <h4></h4>
		        <h4><fmt:formatDate value="${message.sendDate}" pattern="yyyy.MM.dd" /></h4>
		        <h4>${message.meetName}</h4>
		        <c:if test="${!empty message.sender.profileImg}">
       	<img class="sidebar-image" src="/resources/images/uploadFiles/user/${message.sender.profileImg}">
       	</c:if>
       	<c:if test="${empty message.sender.profileImg and message.sender.gender eq '남'}">
       	<img class="sidebar-image" src="/resources/images/uploadFiles/man.png">
       	</c:if>
       	<c:if test="${empty message.sender.profileImg and message.sender.gender eq '여'}">
       	<img class="sidebar-image" src="/resources/images/uploadFiles/woman.png">
       	</c:if>
		        <h4>${message.sender.userId}</h4>
		        <h4>${message.sender.nickName}</h4>
            </span>
            <input type="hidden" value="${message.messageNo}"/>
            </div>
  </div>  
  </c:forEach>
  
</div>
</div>

</aside>

</body>
</html>