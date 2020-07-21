<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>�������� ���� ����</title>


<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 <link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>



<style>
 body > div.container{
           padding-top : 50px;
 }
</style> 

<script type="text/javascript">


function fncAddOffMeet(){

	
	
	var name = $("input[name='offName']").val();
	var date =$("input[name='offDate']").val();
	var time = $("input[name='offTime']").val();
	var max = $("input[name='offMax']").val();

	
	if(name == null || name.length<1){
		alert("�������θ��� �ݵ�� �Է��Ͽ��� �մϴ�.");
		return;
	}
	if(date == null || date.length<1){
		alert("���ӳ�¥�� �ݵ�� �Է��Ͽ��� �մϴ�.");
		return;
	}
	if(time == null || time.length<1){
		alert("���ӽð��� �ݵ�� �Է��ϼž� �մϴ�.");
		return;
	}
	if(max == null || max.length < 1){
		alert("�����ִ��ο��� �ݵ�� �Է��ϼž� �մϴ�.");
		return;
	}
	if(max > 21 ){
		alert("�����ִ��ο� �ִ� 20�� �Է��ϼž� �մϴ�.");
		return;
	}
	
	$("form").attr("method", "POST").attr("action", "/offmeet/addOff").submit();
	
	//document.detailForm.submit();
}

$(function() {
	//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	$( "button.btn.btn-primary" ).on("click" , function() {
		fncAddOffMeet();
	});
});	

	

$(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("a[href='#' ]").on("click" , function() {
				$("form")[0].reset();
			});
		});	


$( function() {
    $("#offDate").datepicker({
    	dateFormat: 'yy-mm-dd'
  });  
});

</script>
</head>

<body>

<div class="container">	


<form class="form-horizontal">

 <div class="form-group">
 <label for="offName" class="col-sm-offset-1 col-sm-3 control-label">�������� ���Ӹ�</label>
	<div class="col-sm-4">
	   <input type="text" class="form-control" id="offName" name="offName" placeholder="�������� ���Ӹ� �Է��ϼ���">
   </div>
  </div>



 <div class="form-group">
 <label for="offDate" class="col-sm-offset-1 col-sm-3 control-label">�������</label>
	<div class="col-sm-4">
	   <input type="text" class="form-control" id="offLoc" name="offLoc">
   </div>
  </div>
  
  	
 <div class="form-group">
 <label for="offDate" class="col-sm-offset-1 col-sm-3 control-label">���ӳ�¥</label>
	<div class="col-sm-4">
	   <input type="text" class="form-control" id="offDate" name="offDate" readonly="readonly">
   </div>
  </div>
		
 <div class="form-group">
 <label for="offTime" class="col-sm-offset-1 col-sm-3 control-label">���ӽð�</label>
	<div class="col-sm-4">
	   <input type="text" class="form-control" id="offTime" name="offTime">
   </div>
  </div>
  
  <div class="form-group">
 <label for="offMax" class="col-sm-offset-1 col-sm-3 control-label">�ִ������ο���</label>
	<div class="col-sm-4">
	   <input type="number" class="form-control" id="offMax" name="offMax">
   </div>
  </div>
  
<div class="form-group">
 <label for="offFee" class="col-sm-offset-1 col-sm-3 control-label">������</label>
	<div class="col-sm-4">
	   <input type="text" class="form-control" id="offFee" name="offFee">
   </div>
  </div>
    	
 <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >�� &nbsp;��</button>
			  <a class="btn btn-primary btn" href="#" role="button">�� &nbsp;��</a>
		    </div>
		  </div>
		</form>
</div>

</body>
</html>