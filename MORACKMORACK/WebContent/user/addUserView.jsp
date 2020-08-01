<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="UTF-8">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
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
	
	
		//============= "가입"  Event 연결 =============
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "button.btn.btn-primary" ).on("click" , function() {
				fncAddUser();
			});
		});	
		
		
		//============= "취소"  Event 처리 및  연결 =============
		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("a[href='#' ]").on("click" , function() {
				$("form")[0].reset();
			});
		});	
	
		
		function fncAddUser() {
			
			var id=$("input[name='userId']").val();
			var pw=$("input[name='password']").val();
			var pw_confirm=$("input[name='password2']").val();
			var name=$("input[name='userName']").val();
			var nn=$("input[name='nickName']").val();
			var em=$("input[name='email']").val();
			var pn=$("input[name='phoneNumber']").val();
			var cn=$("input[name='certificationNumber']").val();
			$(':radio[name="gender"]:checked').val(); //체크값 확인
			var bd=$("input[name='birthday']").val();
			var addr=$("input[id='sample4_roadAddress']").val();
			var daddr=$("input[id='sample4_detailAddress']").val();
			
			var fullAddr=addr +" "+daddr;
			
			$("input[id='sample4_roadAddress']").val(fullAddr);
			
			
			
			
			if(id == null || id.length <1){
				alert("ID는 반드시 입력하셔야 합니다.");
				return;
			}
			////////////////////////////////////////
			if(!/^[a-z0-9_-]{5,20}$/.test(id)){
				alert("ID는 5-20자의 영문 소문자, 숫자와 특수문자 중 (_),(-)만 사용할 수 있다.")
            return;
        	}
			$.ajax(
					{
						url : "/user/json/checkDuplication/"+userId ,
						method : "GET" ,
						dataType : "json" ,
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						success : function(JSONData, status){
							alert("중복된 ID는 가입이 불가합니다.")
							//var JSONdata = JSON.stringify(JSONData);
							//alert(JSONdata);
							//alert(JSONData)
							//alert(JSONData.result)
						}	
					})
			////////////////////////////////////////
			if(pw == null || pw.length <1){
				alert("비밀번호는 반드시 입력하셔야 합니다.");
			return;
			}
			////////////////////////////////////////
			if(!/^(?=.*[a-zA-Z])(?=.*[!@#$%^~*+=-])(?=.*[0-9]).{8,16}$/.test(pw)){
				alert("비밀번호는 8-16자 영문 대소문자, 숫자, 특수문자만 사용할 수 있다.")
            return;
        	}
			////////////////////////////////////////
			if(pw_confirm == null || pw_confirm.length <1){
				alert("비밀번호 확인은  반드시 입력하셔야 합니다.");
				return;
			}
			if( pw != pw_confirm ) {				
				alert("비밀번호 확인이 일치하지 않습니다.");
				$("input:text[name='password2']").focus();
				return;
			}
			if(name == null || name.length <1){
				alert("회원명은 반드시 입력하셔야 합니다.");
				return;
			}
			///////////////////////////////////////////////////
			if(!/^[가-힣]{2,5}$/.test(name)){
				alert("회원명에 적합하지 않습니다.")
            return;
        	}
			////////////////////////////////////////////////////
			if(nn == null || nn.length <1){
				alert("닉네임은 반드시 입력하셔야 합니다.");
				return;
			}
			///////////////////////////////////////////////////
			if(!/^[a-zA-Z0-9가-힣]{1,10}$/.test(nn)){
				alert("닉네임이 너무 길어요 ㅠㅠ")
            return;
        	}
			$.ajax(
					{
						url : "/user/json/checkDuplication2/"+nickName ,
						method : "GET" ,
						dataType : "json" ,
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						success : function(JSONData, status){
							alert("중복된 닉네임은 가입이 불가합니다.")
							//var JSONdata = JSON.stringify(JSONData);
							//alert(JSONdata);
							//alert(JSONData)
							//alert(JSONData.result)
						}
					});
			////////////////////////////////////////////////////
			if(em == null || em.length <1){
				alert("이메일은 반드시 입력하셔야 합니다.");
				return;
			}
			////////////////////////////////////////
			if(!/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/.test(em)){
				alert("이메일 형식이 맞지않습니다.")
            return;
        	}
			////////////////////////////////////////
			if(pn == null || pn.length <1){
				alert("휴대폰 번호는 반드시 입력하셔야 합니다.");
				return;
			}
			////////////////////////////////////////
			if(!/^0[0-9]{2}-?[0-9]{3,4}-?[0-9]{4}$/.test(pn)){
				alert("휴대폰 번호 형식이 맞지않습니다.")
            return;
        	}
			////////////////////////////////////////
			if(cn == null || cn.length <1){
				alert("인증번호는 반드시 입력하셔야 합니다.");
				return;
			}
			//유효성검사
			if($(':radio[name="gender"]:checked').length < 1){
			    alert('성별을 선택해주세요.');
			    document.frm.test[0].focus();
			    return false;
			}
			if(bd == null || bd.length <1){
				alert("생년월일은 반드시 선택하셔야 합니다.");
				return;
			}
			if(addr == null || addr.length <1){
				alert("주소를 입력해주세요.");
				return;
			}
			if(daddr == null || daddr.length <1){
				alert("상세주소를 입력해주세요.");
				return;
			}
			
			$("form").attr("method" , "POST").attr("action" , "/user/addUser").submit();
		}
		

		//==>"이메일" 유효성Check  Event 처리 및 연결
		 $(function() {
			 
			 $("input[name='email']").on("change" , function() {
				
				 var email=$("input[name='email']").val();
			    
				 if(email != "" && (email.indexOf('@') < 1 || email.indexOf('.') == -1) ){
			    	alert("이메일 형식이 아닙니다.");
			     }
				 
				 return;
			});
			 
		});
		
		
		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		
		

			///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	

		//==>"ID중복확인" Event 처리 및 연결
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			/*  $("button.btn.btn-info").on("click" , function() {
				popWin 
				= window.open("/user/checkDuplication.jsp",
											"popWin", 
											"left=300,top=200,width=780,height=130,marginwidth=0,marginheight=0,"+
											"scrollbars=no,scrolling=no,menubar=no,resizable=no");
			}); */
			 $("input[name='userId']").on("keyup" , function() {
											var userId = $("input[name='userId']").val().trim()
											//alert(userId)
											$.ajax(
													{
														url : "/user/json/checkDuplication/"+userId ,
														method : "GET" ,
														dataType : "json" ,
														headers : {
															"Accept" : "application/json",
															"Content-Type" : "application/json"
														},
														success : function(JSONData, status){
															//alert(status)
															//var JSONdata = JSON.stringify(JSONData);
															//alert(JSONdata);
															//alert(JSONData)
															//alert(JSONData.result)
															
															var result = "";
															if(JSONData.result == false){
																result = " 중복된 ID입니다."
															}else {
																result = " 중복되지 않은 ID입니다."
															}
															
															var displayValue = "<h6>"
																+JSONData.userId
																+result
																+"</h6>";
																
															$("h6").remove();
															$("#helpBlock").html(displayValue);
															
															
														}
														
													});
			});
		});
		
		 $(function() {
				 $("input[name='nickName']").on("keyup" , function() {
												var nickName = $("input[name='nickName']").val().trim()
												//alert(nickName)
												$.ajax(
														{
															url : "/user/json/checkDuplication2/"+nickName ,
															method : "GET" ,
															dataType : "json" ,
															headers : {
																"Accept" : "application/json",
																"Content-Type" : "application/json"
															},
															success : function(JSONData, status){
																//alert(status)
																//var JSONdata = JSON.stringify(JSONData);
																//alert(JSONdata);
																//alert(JSONData)
																//alert(JSONData.result)
																
																var result = "";
																if(JSONData.result == false){
																	result = " 중복된 닉네임입니다."
																}else {
																	result = " 중복되지 않은 닉네임입니다."
																}
																
																var displayValue = "<h7>"
																	+JSONData.nickName
																	+result
																	+"</h7>";
																	
																$("h7").remove();
																$("#helpBlock2").html(displayValue);
																
																
															}
															
														});
				});
			});	

	</script>		
    
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<div class="navbar  navbar-default">
        <div class="container">
        	<a class="navbar-brand" href="/index.jsp">모락모락</a>
   		</div>
   	</div>
   	<!-- ToolBar End /////////////////////////////////////-->

	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<h1 class="bg-primary text-center">회 원 가 입</h1>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		
		  <div class="form-group">
		    <label for="userId" class="col-sm-offset-1 col-sm-3 control-label">ID</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userId" name="userId" placeholder="ID를 입력하세요"  >
		       <span id="helpBlock" class="help-block">
		      	<!-- <strong class="text-danger">입력전 중복확인 부터..</strong> -->
		      </span>
		    </div>
		    <!-- <div class="col-sm-3">
		      <button type="button" class="btn btn-info">중복확인</button>
		    </div> -->
		  </div>
		  
		  <div class="form-group">
		    <label for="password" class="col-sm-offset-1 col-sm-3 control-label">비밀번호</label>
		    <div class="col-sm-4">
		      <input type="password" class="form-control" id="password" name="password" placeholder="비밀번호">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="password2" class="col-sm-offset-1 col-sm-3 control-label">비밀번호 확인</label>
		    <div class="col-sm-4">
		      <input type="password" class="form-control" id="password2" name="password2" placeholder="비밀번호 확인">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">회원명</label>
		    <div class="col-sm-2">
		      <input type="text" class="form-control" id="userName" name="userName" placeholder="회원이름">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="nickName" class="col-sm-offset-1 col-sm-3 control-label">닉네임</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="nickName" name="nickName" placeholder="닉네임을 입력하세요"  >
		       <span id="helpBlock2" class="help-block">
		      	<!-- <strong class="text-danger">입력후 중복체크 필수</strong> -->
		      </span>
		    </div>
		    <!-- <div class="col-sm-3">
		      <button type="button" id ="check" class="btn btn-info">중복체크</button>
		    </div> -->
		  </div>
		  
		  <div class="form-group">
		    <label for="email" class="col-sm-offset-1 col-sm-3 control-label">이메일</label>
		    <div class="col-sm-4">
		      <input type="email" class="form-control" id="email" name="email" placeholder="이메일">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="phoneNumber" class="col-sm-offset-1 col-sm-3 control-label">휴대폰 번호</label>
		     <div class="col-sm-3">
				<input type="tel" class="form-control" id="phoneNumber" name="phoneNumber" placeholder="000-000(0)-0000"
					pattern="[0-9]{3}-[0-9]{3,4}-[0-9]{4}" required>		  	
		  </div>
		  <div class="col-sm-3">
		      <button type="button" id ="check" class="btn btn-info">인증</button>
		    </div>
		 </div>
		 
		 <div class="form-group">
		    <label for="certificationNumber" class="col-sm-offset-1 col-sm-3 control-label">인증번호</label>
		    <div class="col-sm-2">
		      <input type="text" class="form-control" id="certificationNumber" name="certificationNumber" placeholder="인증번호">
		    </div>
		  </div>
		  
		  <label for="certificationNumber" class="col-sm-offset-1 col-sm-3 control-label">성별</label>
			<input type="radio" id="male" name="gender" value="남">
  				<label for="male">남</label>
			<input type="radio" id="female" name="gender" value="여">
  				<label for="female">여</label><br><br>
  				
		<div class="form-group">
		    <label for="birthday" class="col-sm-offset-1 col-sm-3 control-label">생년월일</label>
		    <div class="col-sm-4">
		      <input type="date" class="form-control" id="birthday" name="birthday" value="yyyy-MM-dd">
		    </div>
		 </div>
		  
		  <label for="category" class="col-sm-offset-1 col-sm-3 control-label">관심 카테고리</label>
			<input type="checkbox" name="category" value="0"> 여행
  			<input type="checkbox" name="category" value="1"> 게임
  			<input type="checkbox" name="category" value="2"> 음악
  			<input type="checkbox" name="category" value="3"> 영화
  			<input type="checkbox" name="category" value="4"> 공연
  			<input type="checkbox" name="category" value="5"> 맛집
  			<input type="checkbox" name="category" value="6"> 취업/자기계발
  			<input type="checkbox" name="category" value="7"> 액티비티<br>
  			<input type="checkbox" name="category" value="8"> 독서/만화
  			<input type="checkbox" name="category" value="9"> 댄스
  			<input type="checkbox" name="category" value="10"> 사진
  			<input type="checkbox" name="category" value="11"> 반려동물
  			<input type="checkbox" name="category" value="12"> 요리
  			<input type="checkbox" name="category" value="13"> 차
  			<input type="checkbox" name="category" value="14"> 스포츠
  			<input type="checkbox" name="category" value="15"> 공예
  			<input type="checkbox" name="category" value="16"> 기타<br><br>					
  						  
		  <div class="form-group">
		    <label for="address" class="col-sm-offset-1 col-sm-3 control-label" >주소</label>
		    <div class="col-sm-4">
				<input type="text" class="form-control" id="sample4_roadAddress" placeholder="도로명주소" name="address">
				<span id="guide" style="color:#999;display:none"></span>
				<input type="text" class="form-control" id="sample4_detailAddress" placeholder="상세주소" name="daddress">
				
		    </div>
		    <div class="col-sm-3">
		      <button type="button" class="btn btn-info" onclick="sample4_execDaumPostcode()" value="주소검색">주소검색</button>
		    </div>
		  </div>
		  
		  <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script> 
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("sample4_roadAddress").value = roadAddr;    

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
 
            }
        }).open();
    }
</script>
		  
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >가 &nbsp;입</button>
			  <a class="btn btn-primary btn" href="#" role="button">취&nbsp;소</a>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
		
 	</div>
	<!--  화면구성 div end /////////////////////////////////////-->
	
	<% request.setCharacterEncoding("UTF-8"); %>
	
</body>

</html>