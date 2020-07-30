<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>�޴� ���</title>

	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
   
   <!-- jQuery UI toolTip ��� CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip ��� JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>



<style>


</style>



<script type="text/javascript">

	var count = 0;
	
	function addForm(){
	   	   
		var addedFormDiv = document.getElementById("addedFormDiv");
		var str="";
		
		str +=
				"<form name='form' class='form-horizontal' enctype='multipart/form-data'>" +
				"<br><div class='form-group'>" +
				"<label for='menu' class='col-sm-1' style='padding-top:9px; font-weight:700;'>�޴�  " +
				count +
				"</label>";

		str +=
			"<div>" +
			"<div class='row'>" +
			"<input type='button' value='-' onclick='delForm()'>" +
			/* "<img id='businessMenuImgList' name='businessMenuImgList' style='float:left; height:200px; width:200px; margin:5px' src='../../resources/images/down-arrow.png' alt='@@@@@@@@@@@@@@@@@@@@@@@@ �޴� �̹��� @@@@@@@@@@@@@@@@@@@@@@@@'>"; */
			"<div class='thumbnail' id='businessMenuImgThum' style='float:left; height:200px; width:300px; margin:5px;'>" +
			"<input multiple='multiple' type='file' name='file' id='businessMenuImg' multiple/>" +  
			"<div id='preview'></div>" +
			"</div>";

		str+=
			"<div class='col-xs-4'>" +
			"<input type='text' class='form-control' name='businessMenuList' placeholder=' �� �� �� '>" +
			"</div><br><br>";

		str +=
				"<div class='col-xs-3'>" +
				"<input type='text' class='form-control' name='businessMenuFeeList' placeholder=' �� �� '>" +
						/* "<input type='text' class='form-control' name='businessMenuImgList' placeholder='����(���� ÷�� ������� ������ ����)'>" + */
				"</div>";

		str +=
				"</div>" +
				"</div>" +
				"</div>" +
				"</form>";

		
		// �� ����
		var addedDiv = document.createElement("div");
		
		// �� Div�� ID �ο� (������ ����)
		addedDiv.id = "added_"+count;
		
		// �� Div�ȿ� HTML����
		addedDiv.innerHTML = str;
		
		
		// ������ DIV�� ������ �� ����
		addedFormDiv.appendChild(addedDiv);
		
		count++;
		// ���� �������� ��� ���� �ѱ���� �����ϱ� ���� ���� ���� ī��Ʈ ����
		document.baseForm.count.value=count;
	
	};
	
	
	function delForm(){
	
		var addedFormDiv = document.getElementById("addedFormDiv");
		
		// ���� ���� �ΰ� �̻��̸�
		if(count >1){
			// ���������� ������ ���� ID�� ���� Div��ü�� ������
			var addedDiv = document.getElementById("added_"+(--count));
			
			// �� ���� 
			addedFormDiv.removeChild(addedDiv);
		}else{ // ������ ���� �����ִٸ�
			// �� ���� ����
			document.baseForm.reset();
		}
	
	};
	    
	
	
	$(function() {
		
		
		
		
		$("input[type='file']").change(function(e){

		      //div ���� ����ֱ�
		      $('#preview').empty();

		      var files = e.target.files;
		      var arr =Array.prototype.slice.call(files);
		      
		      //���ε� ���� �������� üũ
		      for(var i=0;i<files.length;i++){
		        if(!checkExtension(files[i].name,files[i].size)){
		          return false;
		        }
		      }
		      
		      preview(arr);
		      
		      
		    });//file change
		    
		    function checkExtension(fileName,fileSize){

		      var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
		      var maxSize = 20971520;  //20MB
		      
		      if(fileSize >= maxSize){
		        alert('���� ������ �ʰ�');
		        $("input[type='file']").val("");  //���� �ʱ�ȭ
		        return false;
		      }
		      
		      if(regex.test(fileName)){
		        alert('���ε� �Ұ����� ������ �ֽ��ϴ�.');
		        $("input[type='file']").val("");  //���� �ʱ�ȭ
		        return false;
		      }
		      return true;
		    }
		    
		    function preview(arr){
		      arr.forEach(function(f){
		        
		        //���ϸ��� ��� ���ϸ�...���� ó��
		        var fileName = f.name;
		        if(fileName.length > 10){
		          fileName = fileName.substring(0,7)+"...";
		        }
		        
		        //div�� �̹��� �߰�
		        var str2 = '<div style="display: inline-flex; padding: 10px;"><li>';
		        str2 += '<span>'+fileName+'</span><br>';
		        
		        //�̹��� ���� �̸�����
		        if(f.type.match('image.*')){
		          var reader = new FileReader(); //������ �б� ���� FileReader��ü ����
		          reader.onload = function (e) { //���� �о���̱⸦ ���������� ȣ��Ǵ� �̺�Ʈ �ڵ鷯
		            //str2 += '<button type="button" class="delBtn" value="'+f.name+'" style="background: red">x</button><br>';
		            str2 += '<img src="'+e.target.result+'" title="'+f.name+'" width=100 height=100 />';
		            str2 += '</li></div>';
		            $(str2).appendTo('#preview');
		          } 
		          reader.readAsDataURL(f);
		        }else{
		          str2 += '<img src="/resources/img/fileImg.png" title="'+f.name+'" width=100 height=100 />';
		          $(str2).appendTo('#preview');
		        }
		      });//arr.forEach
		    };
		
		
		
		
		
	
		$("#addBusinessMenu").on("click", function() {
			$("form").attr("method", "POST").attr("action", "/business/addBusinessMenu").submit();
		});
	   	   
	});
           

</script>

</head>

<body onload="addForm();">

	<header>
		<jsp:include page="/toolbar.jsp" />
	</header>

	<div class="container">


		<div class="page-header text-info">
			<img id="businessImg" style="float:left; height:100px; width:100px; margin:5px" src="../../resources/images/down-arrow.png" alt="@@��ü ��ǥ �̹���@@">
			<h2 style="padding-top:10px;">${business.businessName}</h2>
			<h5>�޴� ���</h5>
	    </div>



		<div class="row">
			<div style="float:right">
				<input type="button" value="�߰�" class="btn btn-primary" onclick="addForm()">
				<input type="button" id="addBusinessMenu" name="addBusinessMenu" value="Ȯ��" class="btn btn-primary">
			</div>

		</div>


		<form name="baseForm" enctype="multipart/form-data">
		
			<input type="hidden" name="count" value="0">
			
			<!-- ���� ������ DIV -->
			<div id="addedFormDiv"></div><BR>
			
		</form>

	</div>

</body>

</html>