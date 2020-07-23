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
<li role="presentation"><a id="listMeetMem">모임 회원 목록</a></li>
<li role="presentation"><a href="#">커뮤니티</a></li>
<li role="presentation"><a href="#">채팅</a></li>
<li role="presentation"><a href="#">추천업체 조회</a></li>
<li role="presentation"><a href="#">참여비 내역</a></li>
<li role="presentation"><a href="/offmeet/getOffList?meetId=${meetId}">오프라인 모임 목록</a></li>
<li role="presentation"><a id="listJoinMeetUser">가입 신청 회원 목록</a></li>
<li role="presentation"><a href="#">신고받은 회원 목록</a></li>

</ul>
</div>
