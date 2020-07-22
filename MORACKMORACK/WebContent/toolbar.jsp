<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  
			
		<div class="navbar  navbar-inverse navbar-fixed-top">
			<a href="/index.jsp">MORACKMORACK</a>
		<div class="collapse navbar-collapse" id="target" data-hover="dropdown" data-animations="fadeInDownNew fadeInRightNew fadeInUpNew fadeInLeftNew">	     
	             <ul class="nav navbar-nav" style="text-align: center">
	             
	              <li class="dropdown">
	                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
	                         <span>모임 검색</span>
	                         <span class="caret"></span>
	                     </a>
	                     <ul class="dropdown-menu">
	                         <li><a href="/meet/listMeet?listType=type">모임 유형 검색</a></li>
	                         <li><a href="/meet/listMeet?listType=hash">해시태그 검색</a></li>
	                         <li><a href="/meet/listMeetlistType=category">카테고리 검색</a></li>	                        
	                     </ul>
	                 </li>
	                 
	                 <li class="dropdown">
	                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
	                         <span>모임 관리</span>
	                         <span class="caret"></span>
	                     </a>
	                     <ul class="dropdown-menu">
	                         <li><a href="/meet/listMyMeet">내가 가입한 모임</a></li>
	                         <li><a href="/meet/addMeet">모임 생성</a></li>                      
	                     </ul>
	                 </li>
	                 
	                 <li class="dropdown">
	                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
	                         <span>소셜 네트워크</span>
	                         <span class="caret"></span>
	                     </a>
	                     <ul class="dropdown-menu">
	                         <li><a href="#">친구</a></li>
	                         <li><a href="#">쪽지함</a></li>                        
	                     </ul>
	                 </li>
	                 
	                 <li class="dropdown">
	                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
	                         <span>업체</span>
	                         <span class="caret"></span>
	                     </a>
	                     <ul class="dropdown-menu">
	                         <li><a href="#">추천 업체 목록</a></li>
	                         <li><a href="#">업체 이용 목록 조회</a></li>                                                 
	                     </ul>
	                 </li>
	                 
	                 <li class="dropdown">
	                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
	                         <span>후기 관리</span>
	                         <span class="caret"></span>
	                     </a>
	                     <ul class="dropdown-menu">
	                         <li><a href="#">모임 후기 조회</a></li>
	                         <li><a href="#">업체 후기 조회</a></li>                        
	                     </ul>
	                 </li>
	                 
	                 <li class="dropdown">
	                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
	                         <span>마이페이지</span>
	                         <span class="caret"></span>
	                     </a>
	                     <ul class="dropdown-menu">
	                         <li><a href="#">내 정보 조회</a></li>
	                         <li><a href="#">내 정보 변경</a></li>   
	                         <li><a href="#">회원 탈퇴</a></li>                      
	                     </ul>
	                 </li>	      
	                 </ul>                       	                        
		</div>         
	</div>