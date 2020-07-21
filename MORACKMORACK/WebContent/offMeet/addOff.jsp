<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>오프라인 모임 생성</title>


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
		alert("오프라인명은 반드시 입력하여야 합니다.");
		return;
	}
	if(date == null || date.length<1){
		alert("모임날짜는 반드시 입력하여야 합니다.");
		return;
	}
	if(time == null || time.length<1){
		alert("모임시간은 반드시 입력하셔야 합니다.");
		return;
	}
	if(max == null || max.length < 1){
		alert("모임최대인원은 반드시 입력하셔야 합니다.");
		return;
	}
	if(max > 21 ){
		alert("모임최대인원 최대 20명 입력하셔야 합니다.");
		return;
	}
	
	$("form").attr("method", "POST").attr("action", "/offmeet/addOff").submit();
	
	//document.detailForm.submit();
}

$(function() {
	//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	$( "button.btn.btn-primary" ).on("click" , function() {
		fncAddOffMeet();
	});
});	

	

$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
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
 <label for="offName" class="col-sm-offset-1 col-sm-3 control-label">오프라인 모임명</label>
	<div class="col-sm-4">
	   <input type="text" class="form-control" id="offName" name="offName" placeholder="오프라인 모임명 입력하세요">
   </div>
  </div>



 <div class="form-group">
 <label for="offDate" class="col-sm-offset-1 col-sm-3 control-label">모임장소</label>
	<div class="col-sm-4">
	   <input type="text" class="form-control" id="offLoc" name="offLoc">
   </div>
  </div>
  
  	
 <div class="form-group">
 <label for="offDate" class="col-sm-offset-1 col-sm-3 control-label">모임날짜</label>
	<div class="col-sm-4">
	   <input type="text" class="form-control" id="offDate" name="offDate" readonly="readonly">
   </div>
  </div>
		
 <div class="form-group">
 <label for="offTime" class="col-sm-offset-1 col-sm-3 control-label">모임시간</label>
	<div class="col-sm-4">
	   <input type="text" class="form-control" id="offTime" name="offTime">
   </div>
  </div>
  
  <div class="form-group">
 <label for="offMax" class="col-sm-offset-1 col-sm-3 control-label">최대참여인원수</label>
	<div class="col-sm-4">
	   <input type="number" class="form-control" id="offMax" name="offMax">
   </div>
  </div>
  
<div class="form-group">
 <label for="offFee" class="col-sm-offset-1 col-sm-3 control-label">참여비</label>
	<div class="col-sm-4">
	   <input type="text" class="form-control" id="offFee" name="offFee">
   </div>
  </div>
    	
 <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >등 &nbsp;록</button>
			  <a class="btn btn-primary btn" href="#" role="button">취 &nbsp;소</a>
		    </div>
		  </div>
		</form>
</div>

</body>
</html>