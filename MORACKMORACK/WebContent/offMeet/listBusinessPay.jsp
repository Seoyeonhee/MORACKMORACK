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

<jsp:include page="/common/listCdn.jsp" />

   
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
            $("form").attr("method", "POST").attr("action", "/offmeet/listBusinessPay").submit();
        }

        $(function() {
            $("button.btn.btn-default").on("click", function() {
                fncGetUserList(1);
            });
        });
        
        $(function() {
        	$(".ct_list_pop td:nth-child(3)" ).on("click" , function() {
        		window.location.href ="/offmeet/getBusinessPay?payNo="+$(this).attr("value")
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
        		제휴 업체 예약 내역
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
                	<th scope="col">예약번호</th>
                	<th scope="col">업체명</th>
                    <th scope="col">예약 날짜</th>
                    <th scope="col">예약 시간</th>
                    <th scope="col">예약 인원</th>
                    <th scope="col">총 금액</th>
                </tr>
            </thead>

            <tbody>
					
                 <c:set var="i" value="0" /> 
                <c:forEach var="pay" items="${list}"> 
                    <c:set var="i" value="${i+1}" /> 
                        
               
                  <tr class="ct_list_pop">
			     <input type="hidden" name="offNo" id="offNo" value="${pay.payNo}" />
  				  		<td>${pay.payNo}</td>
                    	<td value ="${pay.payNo}">${pay.businessName}</td>                
                        <td>${pay.reserveDate}</td>
                        <td>${pay.reserveStartTime}/${pay.reserveEndTime}</td>   
                        <td>${pay.reserveMemNum}</td>   
                         <td>            
                         <fmt:formatNumber value="${pay.totalAmount}" pattern="###,###" />원</td>     
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
