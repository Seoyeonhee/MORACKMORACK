<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


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
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
		//============= "����"  Event ���� =============
		 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "button.btn.btn-primary" ).on("click" , function() {
				fncAddUser();
			});
		});	
		
		
		//============= "���"  Event ó�� ��  ���� =============
		$(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("a[href='#' ]").on("click" , function() {
				$("form")[0].reset();
			});
		});	
	
		
		function fncAddUser() {
			
			var id=$("input[name='userId']").val();
			var pw=$("input[name='password']").val();
			var pw_confirm=$("input[name='password2']").val();
			var name=$("input[name='userName']").val();
			
			
			if(id == null || id.length <1){
				alert("���̵�� �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
			if(pw == null || pw.length <1){
				alert("�н������  �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
			if(pw_confirm == null || pw_confirm.length <1){
				alert("�н����� Ȯ����  �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
			if(name == null || name.length <1){
				alert("�̸���  �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
			
			if( pw != pw_confirm ) {				
				alert("��й�ȣ Ȯ���� ��ġ���� �ʽ��ϴ�.");
				$("input:text[name='password2']").focus();
				return;
			}
		}

		//==>"�̸���" ��ȿ��Check  Event ó�� �� ����
		 $(function() {
			 
			 $("input[name='email']").on("change" , function() {
				
				 var email=$("input[name='email']").val();
			    
				 if(email != "" && (email.indexOf('@') < 1 || email.indexOf('.') == -1) ){
			    	alert("�̸��� ������ �ƴմϴ�.");
			     }
			});
			 
		});	
	
<%-- //////////////////////////////////////////////////////////////////////////////// 
		//==>"ID�ߺ�üũ" Event ó�� �� ����
		 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $("button.btn.btn-info").on("click" , function() {
				popWin 
				= window.open("/user/checkDuplication.jsp",
											"popWin", 
											"left=300,top=200,width=780,height=130,marginwidth=0,marginheight=0,"+
											"scrollbars=no,scrolling=no,menubar=no,resizable=no");
			});
		});	
	////////////////////////////////////////////////////////////////////////// --%>
	
	
	$('#check').click(function(){
			$.ajax({
				url: "${pageContext.request.contextPath}/idCheck",
				type: "GET",
				data:{"userId":$('#userId').val()},
				success: function(data){
					if(data == 0 && $.trim($('#userId').val()) != '' ){
						id=true;
						$('#userId').attr("readonly",true);
						var html="<tr><td colspan='3' style='color: green'>��밡���� ���̵� �Դϴ�.</td></tr>";
						$('#idCheck').empty();
						$('#idCheck').append(html);
					}else{

						var html="<tr><td colspan='3' style='color: red'>���Ұ����� ���̵� �Դϴ�.</td></tr>";
						$('#idCheck').empty();
						$('#idCheck').append(html);
					}
				},
				error: function(){
					alert("��������");
				}
			});
		});

	

	</script>
    
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<div class="navbar  navbar-default">
        <div class="container">
        	<a class="navbar-brand" href="/index.jsp">Model2 MVC Shop</a>
   		</div>
   	</div>
   	<!-- ToolBar End /////////////////////////////////////-->

	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<h1 class="bg-primary text-center">ȸ �� �� ��</h1>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		
		  <div class="form-group">
		    <label for="userId" class="col-sm-offset-1 col-sm-3 control-label">ID</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userId" name="userId" placeholder="�ߺ�üũ�ϼ���"  >
		       <span id="helpBlock" class="help-block">
		      	<strong class="text-danger">�Է��� �ߺ�üũ �ʼ�</strong>
		      </span>
		    </div>
		    <div class="col-sm-3">
		      <button type="button" id ="check" class="btn btn-info">�ߺ�üũ</button>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="password" class="col-sm-offset-1 col-sm-3 control-label">��й�ȣ</label>
		    <div class="col-sm-4">
		      <input type="password" class="form-control" id="password" name="password" placeholder="��й�ȣ">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="password2" class="col-sm-offset-1 col-sm-3 control-label">��й�ȣ Ȯ��</label>
		    <div class="col-sm-4">
		      <input type="password" class="form-control" id="password2" name="password2" placeholder="��й�ȣ Ȯ��">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">ȸ����</label>
		    <div class="col-sm-2">
		      <input type="text" class="form-control" id="userName" name="userName" placeholder="ȸ���̸�">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="nickName" class="col-sm-offset-1 col-sm-3 control-label">�г���</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="nickName" name="nickName" placeholder="�ߺ�üũ�ϼ���"  >
		       <span id="helpBlock" class="help-block">
		      	<strong class="text-danger">�Է��� �ߺ�üũ �ʼ�</strong>
		      </span>
		    </div>
		    <div class="col-sm-3">
		      <button type="button" id ="check" class="btn btn-info">�ߺ�üũ</button>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="email" class="col-sm-offset-1 col-sm-3 control-label">�̸���</label>
		    <div class="col-sm-4">
		      <input type="email" class="form-control" id="email" name="email" placeholder="�̸���">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="phoneNumber" class="col-sm-offset-1 col-sm-3 control-label">�޴��� ��ȣ</label>
		     <div class="col-sm-2">
				<input type="tel" class="form-control" id="phoneNumber" name="phoneNumber" placeholder="000-0000-0000"
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
		  
		  <label for="certificationNumber" class="col-sm-offset-1 col-sm-3 control-label">����</label>
			<input type="radio" id="male" name="gender" value="male">
  				<label for="male">��</label>
			<input type="radio" id="female" name="gender" value="female">
  				<label for="female">��</label><br><br>
  				
		<div class="form-group">
		    <label for="birthday" class="col-sm-offset-1 col-sm-3 control-label">�������</label>
		    <div class="col-sm-4">
		      <input type="date" class="form-control" id="birthday" name="birthday">
		    </div>
		 </div>
		  
		 <div class="form-group">
		    <label for="age" class="col-sm-offset-1 col-sm-3 control-label">����</label>
		    <div class="col-sm-1">
		      <input type="number" class="form-control" id="age" name="age">
		    </div>
		  </div>
		  
		  <label for="certificationNumber" class="col-sm-offset-1 col-sm-3 control-label">���� ī�װ�</label>
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
		      <input type="text" class="form-control" id="addr" name="addr" placeholder="�ּ�">
		    </div>
		    <div class="col-sm-3">
		      <button type="button" id ="check" class="btn btn-info">�ּҰ˻�</button>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >�� &nbsp;��</button>
			  <a class="btn btn-primary btn" href="#" role="button">��&nbsp;��</a>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
		
 	</div>
	<!--  ȭ�鱸�� div end /////////////////////////////////////-->
	
</body>

</html>