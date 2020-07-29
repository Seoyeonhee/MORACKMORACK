<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<style>
@charset "UTF-8";
.navigation {
  height: 80px;
  background: #4d5f78;
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
  color: #ffffff;
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
  background: #4d5f78;
  color: #ffffff;
  text-decoration: none;
}
nav ul li a:hover,
nav ul li a:visited:hover {
  background: #4d5f78;
  color: #ffffff;
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
  background: #4d5f78;
  height: 70px;
  width: 70px;
}

@media only screen and (max-width: 798px) {
  .nav-mobile {
    display: #4d5f78;
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
  background: #ffffff;
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
  background-color: #4d5f78;
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
		})(jQuery); // end jQuery
</script>

<section class="navigation">
  <div class="nav-container">
    <div class="brand">
      <a href="/">MORACKMORACK</a>
    </div>
    <nav>
      <div class="nav-mobile"><a id="nav-toggle" href="#!"><span></span></a></div>
      <ul class="nav-list">
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
              <a href="/friend/friendList">친구</a>
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
              <a href="/business/listReserveBusiness">이용한 업체 목록</a>
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
              <a href="/business/login">업체 로그인</a>
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
          
     </ul>
    </nav>
  </div>
</section>