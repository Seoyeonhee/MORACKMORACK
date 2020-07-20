<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!DOCTYPE html>

<meta charset="EUC-KR">

<script src="https://code.jquery.com/jquery-3.1.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>

<script type ="text/javascript">

var socket = null;

sock = new SockJS("<c:url value="/echo"/>");
socket = sock;

sock.onopen = function(){
	console.log("info : connection opened");
};

sock.onmessage = function(evt){
	var data = evt.data;
	console.log("ReceiverMessage : "+data+"\n");
	
	var toastTop = app.toast.create({
		text : "알림 : "+data+"\n",
		position : 'top',
		closeButton : true,
	});
	toastTop.open();
};

sock.onclose = function(){
	console.log('connect close');
};
sock.onerror = function(err){
	console.log('Errors : ', err);
}; 
   
 </script>
