<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.fit {
	    width: 100% !important;
}
</style>
<script>


function listOffMem(){
	
	$.ajax({
		url: "/meet/json/listOffMem/"+offNo,
		method: "GET",
		dataType: "json",
		headers : {
			"Accept" : "application/json",
			"Content-Type" : "application/json"
		},	
		success:function(JSONData){
			console.log(JSONData);
			$('.totalCount').empty();
			$(".totalCount").append("<sub>총 참여자 수 "+JSONData.totalCount+"명</sub>");
									
			for(var i=0; i<JSONData.totalCount; i++){
				
				$(".userIdContainer").append('<tr onclick="javascript:trClick(this);"><td><input type="hidden" class="member" value="'+returnData.list[i].user.userId+'"><a href="#none" class="joinMemberId" data-container="body" data-toggle="popover">'+returnData.list[i].user.userId+'</a></td></tr>');
				console.log( returnData.list[i].user.userId == '${user.userId}' )
				}
		
			}
			
			$('[data-toggle="popover"]').popover({ 
				html: true,
				container: 'body',
				content: '<a href="#none" class="message" onclick="javascript:clickMessage1()"><span class="fas fa-envelope"></span> 쪽지 보내기 </a>',
				placement: 'bottom',
			});	
			
			$("a[name='join']").on("click", function(){
				addJoin();
			});	
			
			if('${loginUser.userId}' == '${group.join.user.userId}'){
				$('.joinButtonContainer').empty();
				$(".joinButtonContainer").append('<a href="#none" class="button fit delete" name="cancel" style="float: right">cancel</a>');
			}
	});	
}
</script>
</head>
<body>
	<table class="default">

		<thead>
			<tr>
				<th><span class="fas fa-users"></span>&nbsp;&nbsp;참여자 목록 <div class="totalCount" style="position: relative; float: right;"></div></th>
			</tr>
		</thead>
		
		<tbody class="userIdContainer"></tbody>
		
		<tfoot>
			<tr>
				<td class="joinButtonContainer" style="padding: 1em 2em 1em 2em;"></td>
			</tr>
		</tfoot>

	</table>
</body>
</html>