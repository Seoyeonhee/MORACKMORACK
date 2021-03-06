<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
<meta charset="EUC-KR">
<jsp:include page="/common/listCdn.jsp" />


	<style>
	
 
        
        div.h4  {
            font-family: 'NIXGONM-Vb';
            font-weight: bold;
            display: inline-block;
         
        }
        
        table  {
            font-size: 10pt;
        }
   
    </style>
    <script type="text/javascript">
    $(function() {
    	//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
    	$("a[href='#' ]").on("click" , function() {
    		var userId = $(this).next().val();
    		window.location.href="/offmeet/listBusinessPay?userId=${user.userId}"
    
    	});
    	
    });	

    </script>

</head>

<body>

<header>
<jsp:include page="/toolbar.jsp" />
</header>

<form>

<div class="container getOrder" >
<br/>

	
			<div class="row">
                    <div class="h4">예약 내역</div>
            </div>
				<br/>
				<table class="table">
					  <thead>
					    <tr>
					      <th scope="col">업체명</th>
					      <th scope="col">예약 날짜</th>
					      <th scope="col">예약 시작 시간</th>
					      <th scope="col">예약 끝 시간</th>
					      <th scope="col">예약 인원</th>
					    </tr>
					  </thead>
					  <tbody>
					    <tr>
					      <th scope="row">${pay.businessName}</th>
			     		  <td>${pay.reserveDate}</td>
					      <td>${pay.reserveStartTime}</td>
					      <td>${pay.reserveEndTime}</td>
 					      <td>${pay.reserveMemNum}명</td>
					    </tr>
					  </tbody>
				</table>
		
		<br/>
		
		<div class="row">
			<div class="h4" style="margin-top:80px;" >결제 완료 내역</div>
		</div>	
			<hr/>
	<div class="row">
	 	<div class="col-xs-4 col-md-2 "><strong>총 결제 금액</strong></div> 
		<div class="col-xs-8 col-md-4"><fmt:formatNumber value="${pay.totalAmount}" pattern="###,###" />원</div> 
 	 </div> 
 	  

	
	 <div class="row"> 
	  	<div class="col-xs-4 col-md-2" style="margin-top:20px;"><strong>결제날짜</strong></div> 
 		<div class="col-xs-8 col-md-4" style="margin-top:20px;">${pay.payDate}</div> 
	</div> 
	
				  
	<br/>			

	<div class="row">
	
	<div class="h4" style="margin-top:80px;" >예약자 내역</div>
	</div>	
			<hr/>
	<div class="row">
	  <div class="col-xs-4 col-md-2" ><strong>구매자</strong></div> 
		<div class="col-xs-8 col-md-4">${pay.user.userName}</div> 
 	</div> 
 	
	<div class="row">
	  <div class="col-xs-4 col-md-2" style="margin-top:20px;"><strong>구매자 연락처</strong></div> 
		<div class="col-xs-8 col-md-4" style="margin-top:20px;">${pay.user.phoneNumber}</div> 
 	 </div> 			
		
	
			</div>
		<hr/>
	
	   <div class="row"> 
 		<div class="col-md-12 text-center"> 
 		   <div class="col-sm-offset-4  col-sm-4 text-center">
		     <a class="btn btn-primary btn" href="#" role="button">확 &nbsp;인</a>
		     <input type="hidden" id="userId" value="${pay.user.userId}"/>
 		</div> 
	</div>
			
</div>
			
	</form>

</body>
</html>
