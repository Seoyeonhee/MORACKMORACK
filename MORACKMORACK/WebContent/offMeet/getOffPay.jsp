<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>

<html lang="ko">

<head>
	<meta charset="EUC-KR">
	<jsp:include page="/common/listCdn.jsp" />

	<style>
 		body {
            padding-top : 50px;
        }
     </style>
     
<script type="text/javascript">


$(function() {
	//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	$("a[href='#' ]").on("click" , function() {
		var meetId = $(this).next().val();
		window.location.href="/meet/getMeet/"+meetId
		});	
	});
$(function() {
	$($("a:contains('참여비목록')")[0]).on("click" , function() {
		history.go(-1);
		});
	$($("a:contains('참여비목록')")[1]).on("click" , function() {
		window.location.href = "/offmeet/getPayList";
		});
});	



</script>

</head>

<body>

<header>
<jsp:include page="/toolbar.jsp" />
</header>


<div class="container getOrder" >
		
 	 
 	 			

	<div class="row">
	
	<div class="h3" style="margin-top:80px;" >참여자 정보</div>
	</div>	
			<hr/>
			
	<div class="row">
	  <div class="col-xs-4 col-md-2"style="margin-top:10px;" ><strong>참여자 ID</strong></div> 
		<div class="col-xs-8 col-md-4" style="margin-top:10px;">${user.userId}</div> 
 	</div> 
 	
	<div class="row">
	  <div class="col-xs-4 col-md-2" style="margin-top:20px;"><strong>참여자 이름</strong></div> 
		<div class="col-xs-8 col-md-4" style="margin-top:20px;">${user.userName}</div> 
 	</div> 
 	
 		<div class="row">
	  <div class="col-xs-4 col-md-2" style="margin-top:20px;"><strong>참여자 닉네임</strong></div> 
		<div class="col-xs-8 col-md-4" style="margin-top:20px;">${user.nickName}</div> 
 	 </div> 			
 	 
	<div class="row">
	  <div class="col-xs-4 col-md-2" style="margin-top:20px;"><strong>참여자 성별</strong></div> 
		<div class="col-xs-8 col-md-4" style="margin-top:20px;">${user.gender} </div> 
 	 </div> 			
		
		
			</br>
			</br>
			</br>
			
		<div class="row">
			<div class="h3">오프라인 모임 참여비 결제 내역</div>
		</div>	
		
			<hr/>
			
			</br>
			
	<div class="row">
	 	<div class="col-xs-4 col-md-2" style="margin-top:10px;"><strong>모임 은행명</strong></div> 
		<div class="col-xs-8 col-md-4" style="margin-top:10px;">${pay.bank }</div> 
 	 </div> 

	<div class="row">
	 	<div class="col-xs-4 col-md-2" style="margin-top:20px;"><strong>모임 가상계좌번호</strong></div> 
		<div class="col-xs-8 col-md-4" style="margin-top:20px;">${pay.accNum}</div> 
 	 </div> 
			
	<div class="row">
	 	<div class="col-xs-4 col-md-2" style="margin-top:20px;"><strong>참여비</strong></div> 
		<input type="hidden" name="amount" value= "	${pay.totalAmount}"/>
		<div class="col-xs-8 col-md-4" style="margin-top:20px;"> <fmt:formatNumber value="${pay.totalAmount}" pattern="###,###" />원</div> 
 	 </div>
	
	<div class="row">
	 	<div class="col-xs-4 col-md-2" style="margin-top:20px;"><strong>결제 일자</strong></div> 
		<input type="hidden" name="amount" value= "	${pay.payDate}"/>
		<div class="col-xs-8 col-md-4" style="margin-top:20px;">${pay.payDate}</div> 
 	 </div> 
	
	
	
			</div>
	
	
	</br>
	</br>
	</br>
	
	
		
<div class="row"> 
 		<div class="col-md-12 text-center"> 
 		 	  <div class="col-sm-offset-4  col-sm-4 text-center">
		         <a class="btn btn-primary btn" href="#" role="button">확 &nbsp;인</a>
		      <input type="hidden" id="meetId" value="${pay.meet.meetId}"/> 
		    	<c:if test="${!empty param.currentPage }">
				  <a class="btn btn-primary btn" href="#" role="button">확인</a>
				</c:if>
				<c:if test="${empty param.currentPage }">
				<a class="btn btn-primary btn" href="#" role="button">참여비목록</a>
				</c:if>
 		</div> 
	</div>
</div>
</form>
</body>
</html>