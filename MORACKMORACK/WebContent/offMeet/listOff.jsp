<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">

<head>
	<meta charset="EUC-KR">

<jsp:include page="/common/listCdn.jsp" />

   
	<style>
        body {
            padding-top : 70px;
        }
        
        .block{	        	
        	 border-bottom-style: solid;
        	 color : WhiteSmoke;      	        	         	          	 
        	 height: 320px;      	        	        	
        	 overflow: hidden;
        }
        
        .borad{
        	border : 1px solid;        	
        	color : WhiteSmoke;
        	margin: 10px 10px;
        	height: 400px;
        	text-align: center;
        }
        
   	</style>
   	
   	<script type="text/javascript">  
   	
   	
   	var page =1;
   	
   	function getOffList(page){
   		$.ajax(
   			{
   				url : "offmeet/json/listOff/"+page,
   				method : "GET" ,
   				dataType : "json",
   				cache : false,
   				headers : {
   					"Accept" : "application/json",
   					"Content-Type" : "application/json"
   				},
   				success : function(JSONData , status) {
					$.each(JSONData, function(index,offMeet) {
						var displayValue =	"<div class='col-md-6' >"													
							  + "<div class='borad' value='"+offMeet.offNo+"'>"
							  + "<div class = 'block'>"
							  + "<img src='/resources/images/uploadFiles/offmeet/"+offMeet.imageFile+"' style='width : 300px;'/>"	
				              +"</div>"
				              +"<h4 style='color:Black;'>"+offMeet.offName +"</h4>";
				              displayValue = displayValue
							  +"</div></div>";
							  $(".row:last").append(displayValue);
					});										
				}
		});
} 
   	
   	
   	$(function() {   			
   		getOffList(1);
			
			$(window).scroll(function() {
			    if ($(window).scrollTop() == $(document).height() - $(window).height()) {
			     page++;   			     
			     getOffList(page);
			    }
			});			   			
	});
   	
   	
   	</script>

</body>
</html>