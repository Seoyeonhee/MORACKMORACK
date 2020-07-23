<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<style>

    
ul{
   list-style:none;
   padding-left:10px;
   }
   
li{
	color: #FFF; 
}

</style>

<script type ="text/javascript">
$(function (){
var meetId = $("#meetId").val();

$("#list-group").click(function(){
    var submenu = $(this).next("div");

    if( submenu.is(":visible") ){
        submenu.slideUp();
    }else{
        submenu.slideDown();
    }
}).mouseover(function(){
    $(this).next("div").slideDown();

});

  $("#addOffMeet").on("click", function(){
   self.location="/offmeet/addOffView";
})

 $("#listMeetMem").on("click", function(){
	self.location="/meet/listMeetMem/"+meetId;
})

 $("#listJoinMeetUser").on("click", function(){
	self.location="/meet/listJoinMeetUser/"+meetId;
})
})
</script>


<label id="list-group"><span class="glyphicon glyphicon-align-justify"></span></label>
<div>
<ul class="nav nav-pills nav-stacked col-md-2">
<li role="presentation"><a id="listMeetMem">���� ȸ�� ���</a></li>
<li role="presentation"><a href="#">Ŀ�´�Ƽ</a></li>
<li role="presentation"><a href="#">ä��</a></li>
<li role="presentation"><a href="#">��õ��ü ��ȸ</a></li>
<li role="presentation"><a href="#">������ ����</a></li>
<li role="presentation"><a href="/offmeet/getOffList?meetId=${meetId}">�������� ���� ���</a></li>
<li role="presentation"><a id="listJoinMeetUser">���� ��û ȸ�� ���</a></li>
<li role="presentation"><a href="#">�Ű���� ȸ�� ���</a></li>

</ul>
</div>
