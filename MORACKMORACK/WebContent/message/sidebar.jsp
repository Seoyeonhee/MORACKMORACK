<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/common/listCdn.jsp" />

<style>


.sidebar-image{
  width: 54px;
  height: 54px;
  margin: 16px;
  border-radius: 50%;
  -webkit-transition: all 0.2s ease-in-out;
  -o-transition: all 0.2s ease-in-out;
  transition: all 0.2s ease-in-out;
}

A:link {text-decoration:none; color:#000000;}
A:visited {text-decoration:none; color:#000000;}
A:active {text-decoration:none; color:#000000;}
A:hover {text-decoration:none; color:#000000;}

</style>

<ul class="nav nav-pills" style="float:center; margin-bottom:70px">
  <li class="sidebar-li" role="presentation"><a class="glyphicon glyphicon-envelope" href="/message/sendMessage.jsp" > 쪽지 보내기</a></li>
  <li class="sidebar-li" role="presentation"><a class="glyphicon glyphicon-triangle-bottom" href="/message/listSendMessage"> 보낸 쪽지함</a></li>
  <li class="sidebar-li" role="presentation"><a class="glyphicon glyphicon-triangle-bottom" href="/message/listRecvMessage"> 받은 쪽지함</a></li>
</ul>

