<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
		body {
            padding-top : 50px;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
		//============= "����"  Event ���� =============
		 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "button.btn.btn-primary" ).on("click" , function() {
				fncUpdateUser();
			});
		});	
		
		
		//============= "���"  Event ó�� ��  ���� =============
		$(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("a[href='#' ]").on("click" , function() {
				$("form")[0].reset();
			});
		});	
		
		//=============�̸���" ��ȿ��Check  Event ó�� =============
		 $(function() {
			 
			 $("input[name='email']").on("change" , function() {
					
				 var email=$("input[name='email']").val();
			    
				 if(email != "" && (email.indexOf('@') < 1 || email.indexOf('.') == -1) ){
			    	alert("�̸��� ������ �ƴմϴ�.");
			     }
			});
			 
		});	
		
		///////////////////////////////////////////////////////////////////////
		function fncUpdateUser() {
			var name=$("input[name='userName']").val();
			
			if(name == null || name.length <1){
				alert("�̸���  �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
				
			var value = "";	
			if( $("input[name='phone2']").val() != ""  &&  $("input[name='phone3']").val() != "") {
				var value = $("option:selected").val() + "-" 
									+ $("input[name='phone2']").val() + "-" 
									+ $("input[name='phone3']").val();
			}
			
			//Debug...
			//alert("phone : "+value);
			$("input:hidden[name='phone']").val( value );
				
			$("form").attr("method" , "POST").attr("action" , "/user/updateUser").submit();
		}
	
	</script>
	
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<%-- <jsp:include page="/layout/toolbar.jsp" /> --%>
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-center">
	       <h3 class=" text-info">ȸ����������</h3>
	       <h5 class="text-muted">�� ������ <strong class="text-danger">�ֽ������� ����</strong>�� �ּ���.</h5>
	    </div>
	    
	    <!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		
		<section id="wrapper">
    <!-- <header>
      <h1>File API (simple)</h1>
    </header> -->

<article>
  <!-- <p id="status">File API &amp; FileReader API not supported</p> -->
  <p id="status">
  <p><input type=file></p>
  <!-- <p>Select an image from your machine to read the contents of the file without using a server</p> -->
  <div id="holder"></div>
</article>
<script>
var upload = document.getElementsByTagName('input')[0],
    holder = document.getElementById('holder'),
    state = document.getElementById('status');

if (typeof window.FileReader === 'undefined') {
  state.className = 'fail';
} else {
  state.className = 'success';
  /* state.innerHTML = 'File API & FileReader available'; */
}
 
upload.onchange = function (e) {
  e.preventDefault();

  var file = upload.files[0],
      reader = new FileReader();
  reader.onload = function (event) {
    var img = new Image();
    img.src = event.target.result;
    // note: no onload required since we've got the dataurl...I think! :)
    if (img.width > 200) { // holder width
      img.width = 200;
    }
    holder.innerHTML = '';
    holder.appendChild(img);
  };
  reader.readAsDataURL(file);

  return false;
};
</script>
		
		  <div class="form-group">
		    <label for="userId" class="col-sm-offset-1 col-sm-3 control-label">ID</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userId" name="userId" value="${user.userId }" placeholder="�ߺ�Ȯ���ϼ���"  readonly>
		       <span id="helpBlock" class="help-block">
		      	<strong class="text-danger">���̵�� �����Ұ�</strong>
		      </span>
		    </div>
		  </div>
		
		  <div class="form-group">
		    <label for="password" class="col-sm-offset-1 col-sm-3 control-label">��й�ȣ</label>
		    <div class="col-sm-4">
		      <input type="password" class="form-control" id="password" name="password" placeholder="�����й�ȣ">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="password2" class="col-sm-offset-1 col-sm-3 control-label">��й�ȣ Ȯ��</label>
		    <div class="col-sm-4">
		      <input type="password" class="form-control" id="password2" name="password2" placeholder="�����й�ȣ Ȯ��">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">ȸ����</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userName" name="userName" value="${user.userName}" placeholder="����ȸ���̸�">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">�г���</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="nickName" name="nickName" value="${user.nickName}" placeholder="����г���">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">�̸���</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="email" name="email" value="${user.email}" placeholder="�����̸���">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="phoneNumber" class="col-sm-offset-1 col-sm-3 control-label">�޴��� ��ȣ</label>
		     <div class="col-sm-4">
				<input type="tel" class="form-control" id="phoneNumber" name="phoneNumber" value="${user.phoneNumber}" placeholder="�����޴�����ȣ 000-0000-0000"
					pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" required>		  	
		  </div>
		  <div class="col-sm-3">
		      <button type="button" id ="check" class="btn btn-info">����</button>
		    </div>
		 </div>
		 
		 <div class="form-group">
		    <label for="certificationNumber" class="col-sm-offset-1 col-sm-3 control-label">������ȣ</label>
		    <div class="col-sm-2">
		      <input type="text" class="form-control" id="certificationNumber" name="certificationNumber" placeholder="������ȣ">
		    </div>
		  </div>
		  
		  <label for="certificationNumber" class="col-sm-offset-1 col-sm-3 control-label" name="category" value="${user.category}">���� ī�װ�</label>
			<input type="checkbox" name="category1" value="Travel"> ����
  			<input type="checkbox" name="category2" value="Game"> ����
  			<input type="checkbox" name="category3" value="Music"> ����
  			<input type="checkbox" name="category4" value="Movie"> ��ȭ
  			<input type="checkbox" name="category5" value="Show"> ����
  			<input type="checkbox" name="category6" value="Restaurant"> ����
  			<input type="checkbox" name="category7" value="Dev"> ���/�ڱ���
  			<input type="checkbox" name="category8" value="Activity"> ��Ƽ��Ƽ<br>
  			<input type="checkbox" name="category9" value="Book"> ����/��ȭ
  			<input type="checkbox" name="category10" value="Dance"> ��
  			<input type="checkbox" name="category11" value="Picture"> ����
  			<input type="checkbox" name="category12" value="Animal"> �ݷ�����
  			<input type="checkbox" name="category13" value="Food"> �丮
  			<input type="checkbox" name="category14" value="Car"> ��
  			<input type="checkbox" name="category15" value="Sport"> ������
  			<input type="checkbox" name="category16" value="Crafts"> ����
  			<input type="checkbox" name="category17" value="Ect"> ��Ÿ<br><br>
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">�ּ�</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="address" name="address"  value="${user.address}" placeholder="�����ּ�">
		    </div>
		    <div class="col-sm-3">
		      <button type="button" id ="check" class="btn btn-info">�ּҰ˻�</button>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >�� &nbsp;��</button>
			  <a class="btn btn-primary btn" href="#" role="button">�� &nbsp;��</a>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
	    
 	</div>
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
 	
</body>

</html>