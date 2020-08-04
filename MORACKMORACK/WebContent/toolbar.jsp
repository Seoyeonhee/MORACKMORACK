<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<jsp:include page="/common/listCdn.jsp" />
<script src="/resources/js/sockjs.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>

<style>
@charset "UTF-8";
@font-face { font-family: 'TmoneyRoundWindExtraBold'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/TmoneyRoundWindExtraBold.woff') format('woff'); font-weight: normal; font-style: normal; }

#logo{
	font-family: 'TmoneyRoundWindExtraBold';
	font-size : 28px;
}

.navigation {
  height: 80px;
  background: #FAEBD7;
}

.brand {
  position: absolute;
  padding-left: 0px;
  float: left;
  line-height: 70px;
  text-transform: uppercase;
  font-size: 1.4em;
}
.brand a,
.brand a:visited {
  color: #D2691E;
  text-decoration: none;
}

.nav-container {
  max-width: 1000px !important;
  margin: 0 auto !important;
}

nav {
  float: right;
}
nav ul {
  list-style: none;
  margin: 0;
  padding: 0;
}
nav ul li {
  float: left;
  position: relative;
}
nav ul li a,
nav ul li a:visited {
  display: block;
  padding: 0 20px;
  line-height: 70px;
  background: #FAEBD7;
  color: #D2691E;
  text-decoration: none;
}
nav ul li a:hover,
nav ul li a:visited:hover {
  background: #FAEBD7;
  color: #D2691E;
}
nav ul li a:not(:only-child):after,
nav ul li a:visited:not(:only-child):after {
  padding-left: 4px;

}
nav ul li ul li {
  min-width: 190px;
}
nav ul li ul li a {
  padding: 14px;
  line-height: 20px;
}

.nav-dropdown {
  position: absolute;
  display: none;
  z-index: 1;
  box-shadow: 0 3px 12px rgba(0, 0, 0, 0.15);
}

/* Mobile navigation */
.nav-mobile {
  display: none;
  position: absolute;
  top: 0;
  right: 0;
  background: #FAEBD7;
  height: 70px;
  width: 70px;
}

@media only screen and (max-width: 798px) {
  .nav-mobile {
    display: #FAEBD7;
  }

  nav {
    width: 100%;
    padding: 70px 0 15px;
  }
  nav ul {
    display: none;
  }
  nav ul li {
    float: none;
  }
  nav ul li a {
    padding: 15px;
    line-height: 20px;
  }
  nav ul li ul li a {
    padding-left: 30px;
  }

  .nav-dropdown {
    position: static;
  }
}
@media screen and (min-width: 799px) {
  .nav-list {
    display: block important;
  }
}
#nav-toggle {
  position: absolute;
  left: 18px;
  top: 22px;
  cursor: pointer;
  padding: 10px 35px 16px 0px;
}
#nav-toggle span,
#nav-toggle span:before,
#nav-toggle span:after {
  cursor: pointer;
  border-radius: 1px;
  height: 5px;
  width: 35px;
  background: #D2691E;
  position: absolute;
  display: #8cafb9
  content: '';
  transition: all 300ms ease-in-out;
}
#nav-toggle span:before {
  top: -10px;
}
#nav-toggle span:after {
  bottom: -10px;
}
#nav-toggle.active span {
  background-color: #FAEBD7;
}
#nav-toggle.active span:before, #nav-toggle.active span:after {
  top: 0;
}
#nav-toggle.active span:before {
  transform: rotate(45deg);
}
#nav-toggle.active span:after {
  transform: rotate(-45deg);
}

article {
  max-width: 1000px;
  margin: 0 auto;
  padding: 10px;
}

.home {
    background-color: darkorange;
    width: 100px;
    text-align: center;
    font-weight: bold;
    float: right;
}

.home a {
    display: block;
    text-decoration: none;
    color: white;
    padding: 16px 16px;
}


</style>

<script type ="text/javascript">

var ws;
var userId = "${sessionScope.user.userId}"; //sender


(function($) { // Begin jQuery
	  $(function() { // DOM ready
		    // If a link has a dropdown, add sub menu toggle.
		    $('nav ul li a:not(:only-child)').click(function(e) {
		      $(this).siblings('.nav-dropdown').toggle();
		      // Close one dropdown when selecting another
		      $('.nav-dropdown').not($(this).siblings()).hide();
		      e.stopPropagation();
		    });
		    // Clicking away from dropdown will remove the dropdown class
		    $('html').click(function() {
		      $('.nav-dropdown').hide();
		    });
		    // Toggle open and close nav styles on click
		    $('#nav-toggle').click(function() {
		      $('nav ul').slideToggle();
		    });
		    // Hamburger to X toggle
		    $('#nav-toggle').on('click', function() {
		      this.classList.toggle('active');
		    });
		  }); // end DOM ready
		  
		  connect();
			$("#btnSend").on("click", function(){
				var chat = $("#msgArea").val();
				chat = chat + "\나 : "+ $("#chatMsg").val();
				$("#msgArea").val(chat);
				sendMsg();
				$("#chatMsg").val("");
				
			})
			
		})(jQuery); // end jQuery
		
		function connect(){ 
			
			//웹소켓 객체 생성하는 부분
			//핸들러 등록(연결 생성, 메세지 수신, 연결 종료)
			
			//url 연결할 서버의 경로
			ws = new SockJS("<c:url value="/echo"/>");
			
			ws.onopen = function(){
				console.log('연결 생성');
			};
			ws.onmessage = function(e){
				console.log('메세지 받음');
				var data = e.data;
				alert("받은 메세지 : "+ data);
				addMsg(data);
			};
			ws.onclose = function(){
				console.log('연결 끊김');
			};
			
		}

		function addMsg(msg){ //원래 채팅 메세지에 방금 받은 메세지 더해서 set
			var chat = $("#msgArea").val();
			chat = chat + "\n 상대방 : "+ msg;
			$("#msgArea").val(chat);
		}

		function sender(){ //메세지 수신을 위한 서버에 id 등록
			var msg = {
					type : "senderId", //메세지 구분하는 구분자 - 상대방 아이디와 메세지 포함
					sendId : "${sessionScope.user.userId}"
			
			};
			
			ws.send(JSON.stringify(msg));
		}

		function sendMsg(){
			var msg = {
					type : "message", //메세지 구분하는 구분자 - 상대방 아이디와 메세지 포함
					sendId : "${sessionScope.user.userId}",
					recvId : $("#targetUser").val(),
					content : $("#chatMsg").val()
			};
			ws.send(JSON.stringify(msg));
		};
		
</script>

<section class="navigation">
  <div class="nav-container">
    <div class="brand">
      <a href="/" id="logo">MORACKMORACK</a>
    </div>
    <nav>
      <div class="nav-mobile"><a id="nav-toggle" href="#!"><span></span></a></div>
      <ul class="nav-list">
      
      
      	<!-- 일반 유저 / 비회원 -->
      	<c:if test="${empty sessionScope.business}">
     	 <li>
          <a href="#!">MEET</a>
          <ul class="nav-dropdown">
            <li>
              <a href="/meet/listMyMeet">가입한 모임</a>
            </li>
            <li>
              <a href="/meet/addMeet">모임 생성</a>
            </li>
          </ul>
        </li>
        <li>
          <a href="#!">SEARCH</a>
          <ul class="nav-dropdown">
            <li>
              <a href="/meet/listMeet?searchType2=0">유형 검색</a>
            </li>
            <li>
              <a href="/meet/listMeet?searchType2=1">카테고리 검색</a>
            </li>
            <li>
              <a href="/meet/listMeet?searchType2=2">해시태그 검색</a>
            </li>
          </ul>
        </li>
        <li>
          <a href="#!">SOCIAL</a>
          <ul class="nav-dropdown">
            <li>
              <a href="/friend/listFriend/0">친구</a>
            </li>
            <li>
              <a href="/message/listRecvMessage">쪽지함</a>
            </li>
          </ul>
        </li>
        <li>
          <a href="#!">BUSINESS</a>
          <ul class="nav-dropdown">
            <li>
              <a href="/business/listBusiness">업체 목록</a>
            </li>
            <li>
              <a href="/business/listUsedBusiness">이용한 업체 목록</a>
            </li>
          </ul>
        </li>
        <li>
          <a href="#!">MY PAGE</a>
          <ul class="nav-dropdown">
          <li>
              <a href="/offmeet/addBusinessPay">모임 후기</a>
            </li>
            <li>
              <a href="/community/getBusinessReviewList">업체 후기</a>
            </li>         
            <div class="dropdown-divider" style="border-color:white;"></div>
              <li>
              <a href="/user/getUser?userId=${user.userId}">내 정보 조회</a>
            </li>
            <li>
              <a href="/user/updateUser?userId=${user.userId}">내 정보 변경</a>
            </li>
            <li>
              <a href="/user/delUser?userId=${user.userId}">회원 탈퇴</a>
            </li>
          </ul>
        </li>
        
         <c:if test="${empty sessionScope.user}">
         <li>
		<a href="#!">로그인</a>
          <ul class="nav-dropdown">
            <li>
              <a href="/user/login">회원 로그인</a>
            </li>
            <li>
             <a href="/business/BusinessTestURL.jsp">업체 로그인</a>
              <%-- <jsp:include page="/business/loginBusiness2.jsp"/> --%>
            </li>
          </ul>
          </li>
          
         <li>
          <a href="#!">회원가입</a>
           <ul class="nav-dropdown">
            <li>
              <a href="/user/addUser">회원가입</a>
            </li>
            <li>
              <a href="/business/addBusiness">업체 회원가입</a>
            </li>
          </ul>
          </li>
          </c:if>
          
           <c:if test="${!empty sessionScope.user}">
           <li>
				<a href="/meet/listWishMeet">찜한 모임</a>
			</li>
			<li>
         		<a href="/user/logout">로그아웃</a>
         	</li>
          </c:if>
         </c:if> 
         
         <!-- 업체 -->
         <c:if test="${!empty sessionScope.business}">
         <li>
          <a href="/business/listBusiness">업체목록</a>
          <ul class="nav-dropdown">
          </ul>
        </li>
        <li>
          <a href="/business/listBusinessMenu">업체 메뉴 목록</a>
          <ul class="nav-dropdown">
          </ul>
        </li>
        <li>
          <a href="/business/listReserveAbleTime">업체 예약 가능 시간 목록</a>
        </li>
        <li>
          <a href="#!">업체 후기 조회</a>
        </li>
        <li>
          <a href="/business/listReserveBusiness">예약 목록 조회</a>
        </li>
        
         <c:if test="${empty sessionScope.user && empty sessionScope.business}">
         <li>
		<a href="#!">로그인</a>
          <ul class="nav-dropdown">
            <li>
              <a href="/user/login">회원 로그인</a>
            </li>
            <li>
              <a href="/business/BusinessTestURL.jsp">업체 로그인</a>
              <%-- <jsp:include page="/business/loginBusiness2.jsp"/> --%>
            </li>
          </ul>
          </li>
          
         <li>
          <a href="#!">회원가입</a>
           <ul class="nav-dropdown">
            <li>
              <a href="/user/addUser">회원가입</a>
            </li>
            <li>
              <a href="/business/addBusiness">업체 회원가입</a>
            </li>
          </ul>
          </li>
          </c:if>
 
 		  <c:if test="${!empty sessionScope.business}">
			<li>
         		<a href="/business/logout">로그아웃</a>
         	</li>
          </c:if>
        </c:if>  
          
     </ul>
    </nav>
  </div>
</section>