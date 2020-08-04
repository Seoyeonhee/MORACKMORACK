<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
<meta charset="EUC-KR">
<jsp:include page="/common/listCdn.jsp" />
<script src="http://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>

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
<script type ="text/javascript">

function reserveBusiness() {
		

var buyerName = '${user.userName}';
var buyerNumber ='${user.phoneNumber}';
var businessName = '${business.businessName}';
var reserveDate = '${reserveDate}';
var reserveStartTime = '${reserveStartTime}';
var reserveEndTime ='${reserveEndTime}'; 
var amount = '${menu.businessMenuFee* businessMenuCnt}';
	IMP.init('imp45686118'); 

	IMP.request_pay({
	    pg : 'inicis',
	    pay_method : 'vbank',
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : businessName,
	    amount : amount,
	    buyer_email : 'iamport@siot.do',
	    buyer_name : buyerName,
	    }, function(rsp) {
		    if ( rsp.success ) { 
		        var msg = '결제가 완료되었습니다.';
		        msg += '고유ID : ' + rsp.imp_uid;
		        msg += '상점 거래ID : ' + rsp.merchant_uid;
		        msg += '결제 금액 : ' + rsp.paid_amount;
		        msg += '카드 승인번호 : ' + rsp.apply_num;
	   
	    } else {
	        var msg = '결제에 실패하였습니다.';
	        window.location.reload(true);
	        return;
	    }
		    $("form").attr("method" , "POST").attr("action" , "/offmeet/payOkBusiness?businessId=${business.businessId}").submit();
		
		});
}


$(function() {
	$( "button.btn.btn-primary" ).on("click" , function() {
		reserveBusiness();
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
                    <div class="h4">업체 정보</div>
            </div>
				<br/>
				<table class="table">
					  <thead>
					    <tr>
					      <th scope="col">업체명</th>
					      <th scope="col">업체 위치</th>
					      <th scope="col">업체 번호</th>
					      <th scope="col">업체 운영 시간</th>
					    </tr>
					  </thead>
					  <tbody>
					    <tr>
					      <th scope="row">${business.businessName}</th>
			     		  <td>${business.businessLoc}</td>
					      <td>${business.businessPhone}</td>
					      <td>${business.businessStartTime}/${business.businessEndTime}</td>
					    </tr>
					  </tbody>
				</table>
		
		<br/>
		
		<div class="row">
			<div class="h4" style="margin-top:80px;" >예약 정보</div>
		</div>	
			<hr/>
			
			
	<div class="row">

	 	<div class="col-xs-4 col-md-2 "><strong>예약 날짜</strong></div> 
		<div class="col-xs-8 col-md-4">${reserveDate}</div> 
 	 </div> 
 
 
	 <div class="row"> 
	 <div class="col-xs-4 col-md-2" style="margin-top:20px;"><strong>예약 시작 시간</strong></div> 
		<c:set var="i" value="${ i+1 }" />
		<c:forEach var="reserveStartTime" items= "${reserveStartTime}" >
 		<div class="col-xs-8 col-md-4" style="margin-top:20px;">${reserveStartTime} </div> 
		</c:forEach>
	</div> 
	
	
	  <div class="row"> 
	 <div class="col-xs-4 col-md-2" style="margin-top:20px;"><strong>예약 끝 시간</strong></div> 
	  	<c:set var="i" value="${ i+1 }" />
		<c:forEach var="reserveEndTime" items= "${reserveEndTime}" >
 		<div class="col-xs-8 col-md-4" style="margin-top:20px;">${reserveEndTime}</div> 
	  </c:forEach> 
	</div> 
	
	<div class="row"> 
	  	<div class="col-xs-4 col-md-2" style="margin-top:20px;"><strong>예약 인원</strong></div> 
 		<div class="col-xs-8 col-md-4" style="margin-top:20px;">${businessMenuCnt}</div> 
	</div>  

	
	 <div class="row"> 
	  	<div class="col-xs-4 col-md-2" style="margin-top:20px;"><strong>총 금액</strong></div> 
 		<div class="col-xs-8 col-md-4" style="margin-top:20px;"><fmt:formatNumber value="${menu.businessMenuFee* businessMenuCnt}" pattern="###,###" />원</div> 
	</div>  

	
	
	
				  
	<br/>			

	<div class="row">
	
	<div class="h4" style="margin-top:80px;" >예약자 내역</div>
	</div>	
			<hr/>
	<div class="row">
	  <div class="col-xs-4 col-md-2" ><strong>구매자</strong></div> 
		<div class="col-xs-8 col-md-4">${user.userName}</div> 
 	</div> 
 	
	<div class="row">
	  <div class="col-xs-4 col-md-2" style="margin-top:20px;"><strong>구매자 연락처</strong></div> 
		<div class="col-xs-8 col-md-4" style="margin-top:20px;">${user.phoneNumber}</div> 
 	 </div> 			
		
	
			</div>
		<hr/>
	
			<div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary" > 결 &nbsp;제</button>
		    <input type="hidden" id="businessId" value="${business.businessId}"/>
		    <input type="hidden" name="reserveDate" value= "${reserveDate}"/>
		     <input type="hidden" name="reserveStartTime" value= "${reserveStartTime}"/>
		    <input type="hidden" name="reserveEndTime" value= "${reserveEndTime}"/>
			<input type="hidden" name="amount" value="${menu.businessMenuFee* businessMenuCnt}" />
 			<input type="hidden" name="businessMenuCnt" value= "${businessMenuCnt}"/>	   
		    </div>
		  </div>
			
</div>
			
	</form>

</body>
</html>
