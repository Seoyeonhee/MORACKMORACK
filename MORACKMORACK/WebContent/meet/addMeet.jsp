<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ����</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


<style>
.selectbox {

    position: relative;
    width: 200px;  /* �ʺ��� */
    border: 1px solid #999;  /* �׵θ� ���� */
    z-index: 1;
}

/* ���� �����ڸ� Ȱ�� ȭ��ǥ ��ü */
.selectbox:before {
    content: "";
    position: absolute;
    top: 50%;
    right: 15px;
    width: 0;
    height: 0;
    margin-top: -1px;
    border-left: 5px solid transparent;
    border-right: 5px solid transparent;
    border-top: 5px solid #333;
}

.selectbox label {
    position: absolute;
    top: 1px;  /* ��ġ���� */
    left: 5px;  /* ��ġ���� */
    padding: .8em .5em;  /* select�� ���� ũ�� ��ŭ */
    color: #999;
    z-index: -1;  /* IE8���� label�� ��ġ�� ���� Ŭ������ �ʴ� �� �ذ� */
}

.selectbox select {
    width: 100%;
    height: auto;  /* ���� �ʱ�ȭ */
    line-height: normal;  /* line-height �ʱ�ȭ */
    font-family: inherit;  /* ��Ʈ ��� */
    padding: .8em .5em;  /* ����� ���� ���� */
    border: 0;
    opacity: 0;  /* ����� */
    filter:alpha(opacity=0);  /* IE8 ����� */
    -webkit-appearance: none; /* ����Ƽ�� ���� ���߱� */
    -moz-appearance: none;
    appearance: none;
}
    
.selectbox {
    -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
    box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
    -webkit-transition: border-color ease-in-out .15s, -webkit-box-shadow ease-in-out .15s;
    -o-transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
    transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
}


</style>


<script type ="text/javascript">

$(function(){
	
	 $("input[type='file']").change(function(e){//div ���� ����ֱ�
	      $('#meetImgPrev').empty();

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
	        var str = '<div style="display: inline-flex; padding: 10px;">';
	        
	        
	        //�̹��� ���� �̸�����
	        if(f.type.match('image.*')){
	          var reader = new FileReader(); //������ �б� ���� FileReader��ü ����
	          reader.onload = function (e) { //���� �о���̱⸦ ���������� ȣ��Ǵ� �̺�Ʈ �ڵ鷯
	            //str += '<button type="button" class="delBtn" value="'+f.name+'" style="background: red">x</button><br>';
	            str += '<img src="'+e.target.result+'" title="'+f.name+'" width=480px height=280px />';
	            str += '</li></div>';
	            $(str).appendTo('#meetImgPrev');
	          } 
	          reader.readAsDataURL(f);
	        }else{
	          str += '<img src="/resources/images/uploadFiles/fileImg.png" title="'+f.name+'" width=100 height=100 />';
	          $(str).appendTo('#meetImgPrev');
	        }
	      });//arr.forEach
	    }
	
	var selectTarget = $('.selectbox select');

    selectTarget.change(function(){
        var select_name = $(this).children('option:selected').text();
        $(this).siblings('label').text(select_name);
    });
	    
	selectTarget.on({
	    'focus' : function () {
	        $(this).parent().addClass('focus');
	    },
	    'blur' : function () {
	        $(this).parent().removeClass('focus');
	    }
	})
	
	$("#meetType").on("change", function(){
		var meetType = $("#meetType").val();
		
		if(meetType == 0){
			$("#max").val(2);
			$("#max").attr("readonly",true);
		}else{
			$("#max").attr("readonly",false);
			$("#max").focus();
		}
	})
	
	$("#meetImgThum").on("click", function(e){
		document.all.meetImg.click();
		
		var aa = $(this).next.id();
		alert(aa);
	})
	
	$("#lImgThum").on("click", function(e){						
		document.all.lImg1.click();
	})
	
	$("#addMeet").on("click", function(){
		
		var maxNum = $("#max").val();
		alert(maxNum);
	
		$("form").attr("method", "POST").attr("action", "/meet/addMeet/"+maxNum).submit();
	})
	
	});
</script>
</head>
<body>

<header>
<jsp:include page="/toolbar.jsp" />
</header>

<div class="container" style="margin-top:150px">
<form class="form-horizontal" enctype="multipart/form-data">
	
   	 	
<div class="col-xs-6 col-md-6">
  		
	<div class="form-group">
		<label for="meetImg">���� ��ǥ �̹��� ����</label>
			<a href="#" class="thumbnail" id="meetImgThum" style="height:300px; width:500px">
			<input type="file" name="file" id="meetImg" style="display: none;" multiple/>  
			<div id="meetImgPrev"></div>
			</a>
  
	<div>
		<p style="text-align:left;">
		<label for="exampleInputFile" style="text-align:left">���� �� �Ұ� �Է�</label>   
		<span style="float:right;">
		<input class="btn btn-default" type="button" id="addImg" name="addImg" value="�̹��� �߰�" style="margin-right:50px"> </span>
	</div>
	
	<div id="addDiv">
	<div class="row">
		<div class="col-xs-6 col-md-3">
    		<a href="#" class="thumbnail" id="lImgThum" style="height:220px; width:220px">
			<input type="file" name="file" id="lImg1" style="display: none;" multiple/>  
			<div id="preview"></div>
			</a>
		</div>
  		
  		<div class="col-xs-6 col-md-3" style="margin-left:120px">
    		<a href="#" class="thumbnail" id="lImgThum" style="height:220px; width:220px">
			<input type="file" name="file" id="lImg2" style="display: none;" multiple/>  
			<div id="preview"></div>
			</a>
		</div>
	</div>
	</div>
	
		<textarea form="inform" cols="10" rows="20" wrap="soft" id="lIntro" name="lIntro" class="form-control"></textarea>
		
	</div>
</div>
    	
<div class="col-xs-6 col-md-6">

	<p><strong>���Ӹ�</strong></p>
	<input type="text" class="form-control" id="meetName" name="meetName" placeholder="���Ӹ�" style="height:50px; width:300px" />

	<p style="margin-top:20px"><strong>���� ����</strong></p>
	<div class="selectbox">
		<label for="select">����</label>
		<select id="bank" name="bank">
		<option value="">����</option>
		<option value="���">�������</option>
		<option value="����">��������</option>
		<option value="����">��������</option>
		<option value="�츮">�츮����</option>
		<option value="SC����">SC��������</option>
		<option value="�ѱ���Ƽ">�ѱ���Ƽ����</option>
		<option value="����">��������</option>
		</select>
	</div>
   		 
	<p style="margin-top:20px"><strong>ī�װ� ����</strong></p>
	<div class="selectbox">
    	<label for="select">ī�װ�</label>
		<select id="category" name="category">	
		<option value="">ī�װ�</option>
        <option value="0">����</option>
        <option value="1">����</option>
        <option value="2">����</option>
        <option value="3">��ȭ</option>
        <option value="4">����</option>
        <option value="5">����</option>
        <option value="6">���/�ڱ���</option>
        <option value="7">��Ƽ��Ƽ</option>
        <option value="8">����/��ȭ</option>
        <option value="9">��</option>
        <option value="10">����</option>
        <option value="11">�ݷ�����</option>
        <option value="12">�丮</option>
        <option value="13">��</option>
        <option value="14">������</option>
        <option value="15">����</option>
        <option value="16">��Ÿ</option>
		</select>
	</div>
		
		
    <p style="margin-top:20px"><strong>���� ���� ����</strong></p>
    <div class="selectbox">
    	<label for="select">���� ����</label>
		<select id="meetType" name="meetType">
		<option value="">���� ����</option>
       	 <option value="0">2�� ����</option>
      	 <option value="1">�ټ��� ����</option>
      	 </select>
	</div>
      	 
	<p style="margin-top:20px"><strong>���� ����</strong></p>
	<input type="number" id="max" name="max" class="form-control" style="height:30px; width:80px"/>
      	  
    <p style="margin-top:20px"><strong>���� ���� �ʿ� ����</strong></p>
    <label class="radio-inline">
		<input type="radio" id="meetAppr" name="meetAppr" value="1" checked />�ʿ� <br><br/>
		<input type="radio" id="meetAppr" name="meetAppr" value="0" />���ʿ�<br/><br/>
	</label>
      	  
	<p style="margin-top:20px"><strong>�ֿ� Ȱ�� ��ġ ����</strong></p>
     	  
      	  
 
	<p style="margin-top:20px"><strong>���� ���� �Ұ�</strong></p>
	<input type="text" id="sIntro" name="sIntro" class="form-control" style="height:100px; width:500px"/><br/>


	<p style="margin-top:20px"><strong>�ؽ��±� �Է�</strong></p>
	<textarea form="inform" cols="40" rows="10" wrap="hard" id="hash" name="hash" class="form-control"></textarea>
	
 </div>    
  	  
</form>
</div>

<div class="text-center" style="margin-top:30px">
	<input class="btn btn-default" type="button" id="addMeet" name="addMeet" value="���� ����">
</div>
</body>
</html>