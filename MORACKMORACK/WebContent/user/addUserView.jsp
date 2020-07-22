<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
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
			
			
			if(id == null || id.length <1){
				alert("아이디는 반드시 입력하셔야 합니다.");
				return;
			}
			if(pw == null || pw.length <1){
				alert("패스워드는  반드시 입력하셔야 합니다.");
				return;
			}
			if(pw_confirm == null || pw_confirm.length <1){
				alert("패스워드 확인은  반드시 입력하셔야 합니다.");
				return;
			}
			if(name == null || name.length <1){
				alert("이름은  반드시 입력하셔야 합니다.");
				return;
			}
			
			if( pw != pw_confirm ) {				
				alert("비밀번호 확인이 일치하지 않습니다.");
				$("input:text[name='password2']").focus();
				return;
			}
			
			var value = "";	
			if( $("input:text[name='phone2']").val() != ""  &&  $("input:text[name='phone3']").val() != "") {
				var value = $("option:selected").val() + "-" 
									+ $("input[name='phone2']").val() + "-" 
									+ $("input[name='phone3']").val();
			}

			$("input:hidden[name='phone']").val( value );
			
			$("form").attr("method" , "POST").attr("action" , "/user/addUser").submit();
		}
		

		//==>"이메일" 유효성Check  Event 처리 및 연결
		 $(function() {
			 
			 $("input[name='email']").on("change" , function() {
				
				 var email=$("input[name='email']").val();
			    
				 if(email != "" && (email.indexOf('@') < 1 || email.indexOf('.') == -1) ){
			    	alert("이메일 형식이 아닙니다.");
			     }
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
																result = "불"
															}
															
															var displayValue = "<h6>"
																+JSONData.userId+" 아이디는 사용 "
																+result
																+"가능합니다"
																+"</h6>";
																
															$("h6").remove();
															$("#helpBlock").html(displayValue);
															
															
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
		      <input type="text" class="form-control" id="nickName" name="nickName" placeholder="중복체크하세요"  >
		       <span id="helpBlock" class="help-block">
		      	<strong class="text-danger">입력후 중복체크 필수</strong>
		      </span>
		    </div>
		    <div class="col-sm-3">
		      <button type="button" id ="check" class="btn btn-info">중복체크</button>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="email" class="col-sm-offset-1 col-sm-3 control-label">이메일</label>
		    <div class="col-sm-4">
		      <input type="email" class="form-control" id="email" name="email" placeholder="이메일">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="phoneNumber" class="col-sm-offset-1 col-sm-3 control-label">휴대폰 번호</label>
		     <div class="col-sm-2">
				<input type="tel" class="form-control" id="phoneNumber" name="phoneNumber" placeholder="000-0000-0000"
					pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" required>		  	
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
			<input type="radio" id="male" name="gender" value="male">
  				<label for="male">남</label>
			<input type="radio" id="female" name="gender" value="female">
  				<label for="female">여</label><br><br>
  				
		<div class="form-group">
		    <label for="birthday" class="col-sm-offset-1 col-sm-3 control-label">생년월일</label>
		    <div class="col-sm-4">
		      <input type="date" class="form-control" id="birthday" name="birthday">
		    </div>
		 </div>
		  
		 <div class="form-group">
		    <label for="age" class="col-sm-offset-1 col-sm-3 control-label">나이</label>
		    <div class="col-sm-1">
		      <input type="number" class="form-control" id="age" name="age">
		    </div>
		  </div>
		  
		  <label for="certificationNumber" class="col-sm-offset-1 col-sm-3 control-label" name="category">관심 카테고리</label>
			<input type="checkbox" name="category1" value="Travel"> 여행
  			<input type="checkbox" name="category2" value="Game"> 게임
  			<input type="checkbox" name="category3" value="Music"> 음악
  			<input type="checkbox" name="category4" value="Movie"> 영화
  			<input type="checkbox" name="category5" value="Show"> 공연
  			<input type="checkbox" name="category6" value="Restaurant"> 맛집
  			<input type="checkbox" name="category7" value="Dev"> 취업/자기계발
  			<input type="checkbox" name="category8" value="Activity"> 액티비티<br>
  			<input type="checkbox" name="category9" value="Book"> 독서/만화
  			<input type="checkbox" name="category10" value="Dance"> 댄스
  			<input type="checkbox" name="category11" value="Picture"> 사진
  			<input type="checkbox" name="category12" value="Animal"> 반려동물
  			<input type="checkbox" name="category13" value="Food"> 요리
  			<input type="checkbox" name="category14" value="Car"> 차
  			<input type="checkbox" name="category15" value="Sport"> 스포츠
  			<input type="checkbox" name="category16" value="Crafts"> 공예
  			<input type="checkbox" name="category17" value="Ect"> 기타<br><br>	 					
  						  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label" >주소</label>
		    <div class="col-sm-4">
				<input type="text" class="form-control" id="sample4_roadAddress" placeholder="도로명주소">
				<span id="guide" style="color:#999;display:none"></span>
				<input type="text" class="form-control" id="sample4_detailAddress" placeholder="상세주소">
				
		    </div>
		    <div class="col-sm-3">
		      <button type="button" class="btn btn-info" onclick="sample4_execDaumPostcode()" value="주소검색">주소검색</button>
		    </div>
		  </div>
		  
		  <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
	
</body>

</html>