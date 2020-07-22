<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>�������� ���� ���� ��û</title>



<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 <link rel="stylesheet" href="/resources/demos/style.css">
<script src="http://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<script src="/javascript/bootstrap-dropdownhover.min.js"></script>
<style>
 body > div.container{
           padding-top : 50px;
 }
</style> 

<script type="text/javascript">

function fncreqOk() {
	
	var meetMemName = '${user.name}';
	var offName = '${offMeet.offName}';
	var pay = $("select[name='payMethod']").val();
	var amount ='${offMeet.amount}';
	
	if (pay == '0') {
		pay = 'trans';
	} else if (pay =='1') {
		pay = 'card';
	} else if (pay =='2') {
		pay = 'vbank';
	}
	
		IMP.init('imp45686118'); 
	
		IMP.request_pay({
		    pg : 'inicis',
		    pay_method : pay,
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : offName,
		    amount : amount,
		    buyer_email : 'iamport@siot.do',
		    buyer_name : meetMemName,
		}, function(rsp) {
		    if ( rsp.success ) {
		    	var sendData = JSON.stringify({
                	"impUid" : rsp.imp_uid,
                    "merchantUid" : rsp.merchant_uid,
		 			"amount" : rsp.paid_amount,
		 			"payMethod" : rsp.pay_method
		    	})
		 			jQuery.ajax({
		 				url:'/offmeet/json/addOffPay',
		 				type : 'POST',
		 				dataType : 'json',
		 				contentType : 'application/json',
		 				data :sendData	
		 		}).done(function(data,status) {
		    	
		    		 if ( status === 'success') {
		    			var msg = '������ �Ϸ�Ǿ����ϴ�.';
		    			msg += '\n����ID : ' + data.imp_uid;
		    			msg += '\n���� �ŷ�ID : ' + data.merchant_uid;
		    			msg += '\���� �ݾ� : ' + data.paid_amount;
		    			msg += '\n�ŷ���� : ' + data.pay_method;
		    			alert(msg);
		    		 }
		   
		    	});
		    } else {
		        var msg = '������ �����Ͽ����ϴ�.';
		        window.location.reload(true);
		        return;
		    }
// 		    $("form").attr("method" , "POST").attr("action" , "/offmeet/addOffPay?offNo=${offMeet.offNo}").submit();
 		  $("form").attr("method" , "POST").attr("action" , "/offmeet/addOffPay?offNo=10002").submit();	 
		});
		
}

$(function() {
	//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	$( "button.btn.btn-primary" ).on("click" , function() {
		fncreqOk();
	});
});	

	
$(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("a[href='#' ]").on("click" , function() {
				$("form")[0].reset();
			});
		});	
			
$( function() {
    $("#dlvyDate").datepicker({
    	dateFormat: 'yy-mm-dd'
  });  
});		

</script>
</head>

<body>

<div class="container"> 
 	<div class="page-header text-center"> 
 		<h3 class="text-info">�������� ���� ���� ��û</h3> 
</div> 

	<form class="form-horizontal">
	<input type="hidden" name="offNo" value="${offMeet.offNo}" />
		
		
			<div class="form-group"> 
 			<label class="col-sm-offset-1 col-sm-3 control-label">ȸ�� ID</label> 
 			<div class="col-sm-4"> 
 				${user.userId}
 			</div> 
 		</div> 

	<div class="form-group"> 
 			<label class="col-sm-offset-1 col-sm-3 control-label">�̸�</label> 
			<div class="col-sm-4"> 
 				${user.name} 
 			</div> 
		</div> 
 		 
 		 
 		<div class="form-group"> 
 			<label class="col-sm-offset-1 col-sm-3 control-label">����</label> 
 			<div class="col-sm-4"> 
 				${user.gender =='0' ? "��":"��"} 

 			</div> 
 		</div> 
 		 
 		<div class="form-group"> 
 			<label class="col-sm-offset-1 col-sm-3 control-label">�������</label> 
 			<div class="col-sm-4"> 
			${user.birthday}
 			</div> 
 		</div> 
		 
		<div class="form-group"> 
 			<label class="col-sm-offset-1 col-sm-3 control-label">�г���</label> 
			<div class="col-sm-4"> 
 			${user.nickName}
 			</div> 
 		</div> 
 		 
 		<div class="form-group"> 
 			<label class="col-sm-offset-1 col-sm-3 control-label">�������θ��Ӹ�</label> 
 			<div class="col-sm-4"> 
			${offMeet.offName}
 			</div> 
		</div> 
 		 
 		<div class="form-group"> 
 			<label class="col-sm-offset-1 col-sm-3 control-label">�������� ���� ���</label> 
 			<div class="col-sm-4"> 
 			${offMeet.offLoc}
 			</div> 
 		</div> 
 		 
 		<div class="form-group"> 
 			<label class="col-sm-offset-1 col-sm-3 control-label">�������� ���� �ð�</label> 
 			<div class="col-sm-4"> 
 			${offMeet.offTime }
 			</div> 
 		</div> 
 		 	
 		<div class="form-group"> 
 			<label class="col-sm-offset-1 col-sm-3 control-label">���� �ο� �� </label> 
 			<div class="col-sm-4"> 
 			${offMeet.offMem}
 			</div> 
 		</div> 
 		
			<div class="form-group"> 
 			<label class="col-sm-offset-1 col-sm-3 control-label">�ִ� �ο� �� </label> 
 			<div class="col-sm-4"> 
 			${offMeet.offMax}
 			</div> 
 		</div> 
 		
 		 		
 		<div class="form-group"> 
 			<label class="col-sm-offset-1 col-sm-3 control-label">�������� ���� ������</label> 
 			<div class="col-sm-4" > 
 			<input type="hidden" name="amount" value= "	${offMeet.amount}"/>
 			${offMeet.amount}
 			</div> 
 		</div> 
 		
 		<div class="form-group"> 
 			<label for="payMethod" class="col-sm-offset-1 col-sm-3 control-label">���Ź��</label> 
 			<div class="col-sm-4"> 
 				<select name="payMethod" class="form-control"> 
 					<option value="0" selected="selected">������ü</option> 
					<option value="1">�ſ�ī��</option> 
					<option value="2">�������</option> 
 				</select> 
 			</div> 
 		</div> 
 		
 		
 
 		

	 <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >������ ����</button>
			  <a class="btn btn-primary btn" href="#" role="button">�� &nbsp;��</a>
		    </div>
		  </div>
		</form>
				
</div>

</body>
</html>