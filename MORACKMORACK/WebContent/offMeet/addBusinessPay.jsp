<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ��ü ����</title>

<jsp:include page="/common/listCdn.jsp" />
<script src="http://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<style>


 
 div.h4  {
            font-family: 'NIXGONM-Vb';
            font-weight: bold;
            display: inline-block;
            background-color: #3e7eff;
       }
       

.button {
  background-color: #3e7eff; /* Green */
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
}


</style>


<script type ="text/javascript">

$( function () {
	$("#reserveBusiness").on("click",function(){
		

var buyerName = '${user.userName}';
var buyerNumber ='${user.phoneNumber}';
var businessName = '${business.businessName}';

if (pay == '0') {
	pay = 'vbank';
} else {
	pay = 'card';
} 

	IMP.init('imp45686118'); 

	IMP.request_pay({
	    pg : 'inicis',
	    pay_method : pay,
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : businessName,
	    amount : amount,
	    buyer_email : 'iamport@siot.do',
	    buyer_name : buyerName,
	    }, function(rsp) {
		    if ( rsp.success ) { 
		        var msg = '������ �Ϸ�Ǿ����ϴ�.';
		        msg += '����ID : ' + rsp.imp_uid;
		        msg += '���� �ŷ�ID : ' + rsp.merchant_uid;
		        msg += '���� �ݾ� : ' + rsp.paid_amount;
		        msg += 'ī�� ���ι�ȣ : ' + rsp.apply_num;
	   
	    } else {
	        var msg = '������ �����Ͽ����ϴ�.';
	        window.location.reload(true);
	        return;
	    }
		    $("form").attr("method" , "POST").attr("action" , "/offmeet/payOkBusiness?businessId=${business.businessId}").submit();
		
	    });	
	}); 
}); 

</script>
</head>
<body>

<header>
<jsp:include page="/toolbar.jsp" />
</header>

<div class="container" style="margin-top:150px">

<div class="page-header">
	    <h3 class=" text">���޾�ü ����</h3>     
</div>
	
<form class="form-horizontal">


<div class="col-xs-6 col-md-6">
	
<!-- 	<div class="form-group"> -->
<!-- 		<a href="#" class="thumbnail" id="businessImg" style="height:300px; width:500px"> -->
<%-- 		 <img src="resources/images/uploadFiles/${business.businessImg}" style="width:300px; height:300px;"  onError="this.src='/resources/images/logo.png'" alt="noImage"> --%>
<!-- 			</a> -->
			
<!-- 	<div> -->
<!-- 		<p sstyle="margin-top:20px;"> -->
<%-- 		<label for="exampleInputFile" style="text-align:left; font-size:2em;">${business.businessName}</label>    --%>
<!-- 		<span style="float:right;"></span> </br> -->
<!-- 	</div> -->
	
	
<!-- 	<div> -->
<!-- 		<p style="margin-top:20px;"> -->
<!-- 		<label for="exampleInputFile" style="text-align:left ">��ü ��ġ</label>    -->
<!-- 		<span style="float:right;"></span>  </br> -->
<%-- 			${business.businessName} --%>
<!-- 	</div> -->
	
	
<!-- 	<div> -->
<!-- 		<p style="margin-top:20px;"> -->
<!-- 		<label for="exampleInputFile" style="text-align:left">��ü ��ȣ</label>    -->
<!-- 		<span style="float:right;"></span>  </br> -->
<%--   			${business.businessPhone} --%>
<!-- 	</div> -->
<!-- 	</div> -->
<!-- </div>	 -->

<div class="col-xs-6 col-md-6">
<div class="h4">������ ����</div>


	<div class="row" style="margin-bottom: 15px" >
		<div class="col-md-3" >�����ڸ�</div>
		<div class="col-md-9">${user.userName}</div>
	</div>		
	
	
	<div class="row" style="margin-bottom: 15px" >
	  <div class="col-md-3">����ó</div>
	  <div class="col-md-9">${user.phoneNumber}</div>
	</div>			
	
</div>


<div class="col-xs-6 col-md-6">
<div class="h4" style="margin-top:30px">���� ����</div>
	<div class="row" style="margin-bottom: 15px" >
		<div class="col-md-3">���೯¥</div>
		<div class="col-md-9">${business.reserveDate}
		<input type="hidden" name="reserveDate" value= "${business.reserveDate}"/>
		</div>
	</div>		
	
	
	<div class="row" style="margin-bottom: 15px"  >
	  <div class="col-md-3">���� ���� �ð�</div>
	  <div class="col-md-9">${business.reserveStartTime}
	  	<input type="hidden" name="reserveStartTime" value= "${business.reserveStartTime}"/>
	  </div>
	</div>		
	
	

	<div class="row" style="margin-bottom: 15px" >
	  <div class="col-md-3">���� �� �ð�</div>
	  <div class="col-md-9">${business.reserveEndTime}
	  <input type="hidden" name="reserveEndTime" value= "${business.reserveEndTime}"/>
	  </div>
	</div>		
	
	
	<div class="row" style="margin-bottom: 15px" >
	  <div class="col-md-3">���� �ο�</div>
	  <div class="col-md-9">
	   <input type="number" style= "width:50px; height:30px;" class="form-control" id="reserveMemNum" name="reserveMemNum">
	</div>
	</div>		
	
	<div class="h4" style="margin-top:50px">���� ����</div>
    <div class="input-group input-group-sm">
			  <div class="input-group-prepend">
			      	<input type="radio"  checked="checked" id="pay" value="0" name="payMethod" style="margin-top:10px;margin-right:10px;">������ü &nbsp;&nbsp;
 					<input type="radio" name="payMethod" id="card"  value="1" style="margin-top:5px;margin-right:10px;">ī�� ����
			  </div>
			</div>

<!--     <div class="row">  -->
<!-- 	  	 <div class="col-md-3" style="margin-top:80px; font-size:1.5em;">���� �ݾ�</div>  -->
<%-- 	  	 <input type="hidden" name="totalAmount" value= "${totalAmount}"/> --%>
<%-- 	     <div class="col-md-9" style="margin-top:80px; font-size:1.5em;">${totalAmount}</div>  --%>
<!--  	</div>  -->
 	
 	
 	</div>	
 
 	</form>
	</div>
 	<div class="text-center" style="margin-top:30px; ">
	<input class="button" type="button" id="reserveBusiness" name="reserveBusiness" value="�����ϱ�">
	<input type="hidden" name="businessId" value="${businessId}"/> 
	</div>
</body>
</html>