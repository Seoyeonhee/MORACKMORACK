<%@ page language="java"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@page import="java.util.*" %>

<html>

<head>
    <title>구매 목록조회</title>
    <meta charset="EUC-KR">
    <!-- 참조 : http://getbootstrap.com/css/   참조 -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <link rel="canonical" href="https://getbootstrap.com/docs/4.4/examples/carousel/">

    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <!--<script src="https://code.jquery.com/jquery-1.12.4.js"></script>-->
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>




    <!-- Bootstrap Dropdown Hover CSS -->
    <link href="/css/animate.min.css" rel="stylesheet">
    <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
    <script src="/javascript/bootstrap-dropdownhover.min.js"></script>


   
    <style>
    

		
		.page p {
			height:100px;
			line-height:100px;
		}

    </style>

    <!--  ///////////////////////// JavaScript ////////////////////////// -->
    <script type="text/javascript">

        function fncGetUserList(currentPage) {
            $("#currentPage").val(currentPage)
            $("form").attr("method", "POST").attr("action", "/offmeet/listOffPay").submit();
        }

        $(function() {
            $("button.btn.btn-default").on("click", function() {
                fncGetUserList(1);
            });
        });
        
        $(function() {
        	$(".ct_list_pop td:nth-child(4)" ).on("click" , function() {
        		self.location ="/offmeet/getOffPay?payNo="+$(this).attr("value")
        	});
        });
        

        	
    </script>

</head>

<body>

<header>
<jsp:include page="/toolbar.jsp" />
</header>
        <div class="container" style="width:70%;margin: auto;">
   	<form>
   	
            <div class="container">

            <div class="h4 offList" style="font-family:'NIXGONM-Vb';display:inline-block;font-weight: bold; margin-top: 30px;margin-bottom:20px; ">
        		   오프라인 참여 내역
            </div>
     
      </div>
       
<div class="row">
<div class="col-md-6 text-left">
<p class="text-primary">
전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
</p>
</div>

        <table class="table table-hover" id="offMeet">
            <thead>
                <tr>
                	 <th scope="col">모임명</th>
                    <th scope="col">오프라인 모임명</th>
                    <th scope="col">모임 장소</th>
                    <th scope="col">모임 날짜</th>
                    <th scope="col">모임 시간</th>
                    <th scope="col">참여비</th>
                    <th scope="col">인원수</th>
                </tr>
            </thead>

            <tbody>
					
                 <c:set var="i" value="0" /> 
                <c:forEach var="offMeet" items="${list}"> 
                    <c:set var="i" value="${i+1}" /> 
                        
               
                        <tr class="ct_list_pop">
			     <input type="hidden" name="offNo" id="offNo" value="${offMeet.offNo}" />
  				 <input type="hidden" name="payNo" id="payNo" value="${offMeet.payNo}" /> 
   			               
                    	<td>${offMeet.meetName}</td>
                        <td value ="${offMeet.payNo }">${offMeet.offName}</td>
                        <td>${offMeet.offLoc}</td>
                        <td>${offMeet.offDate}</td>   
                        <td>${offMeet.offTime}</td>   
                         <td>            
                         <fmt:formatNumber value="${offMeet.amount}" pattern="###,###" />원</td>
                        <td>${offMeet.offMem}/${offMeet.offMax}</td>     
                     </tr> 
                 </c:forEach>
            </tbody>
        </table>
          <input type="hidden" id="currentPage" name="currentPage" value=""/>
    </form>
    
    </div>
   		 <div class="">
			<p><jsp:include page="../common/pageNavigator_new.jsp"></jsp:include></p>		
		</div>
</body>

</html>
