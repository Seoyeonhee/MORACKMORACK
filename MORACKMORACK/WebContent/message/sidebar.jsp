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


.sidebar-li{
  position: relative;
  cursor: pointer;
  user-select: none;
  display: block;
  height: 80px;
  line-height: 48px;
  padding: 0;
  padding-left: 16px;
  padding-right: 56px;
  text-decoration: none;
  clear: both;
  font-weight: 500;
  overflow: hidden;
  -o-text-overflow: ellipsis;
  text-overflow: ellipsis;
  white-space: nowrap;
  -webkit-transition: all 0.2s ease-in-out;
  -o-transition: all 0.2s ease-in-out;
  transition: all 0.2s ease-in-out;
  position: absolute;
  right: 16px;
  top: 0px;
  background-color: #fff !important;
  text-align : left;
  font-color:#000000;
  font-size:15px;
}

</style>


<ul class="nav nav-pills nav-stacked">
  <li class="sidebar-li" role="presentation"><a class="glyphicon glyphicon-envelope" href="/message/sendMessage.jsp" > 쪽지 보내기</a></li>
  <li class="sidebar-li" role="presentation"><a class="glyphicon glyphicon-triangle-bottom" href="/message/listSendMessage"> 보낸 쪽지함</a></li>
  <li class="sidebar-li" role="presentation"><a class="glyphicon glyphicon-triangle-bottom" href="/message/listRecvMessage"> 받은 쪽지함</a></li>
</ul>

