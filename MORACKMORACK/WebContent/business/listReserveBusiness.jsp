<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	
	<jsp:include page="/business/businessToolbar.jsp"/>
	

	<div class="container">
	
		<div class="page-header text-info">
			<img id="businessImg" style="float:left; height:100px; width:100px; margin:5px" src="../../resources/images/down-arrow.png" alt="@@업체 대표 이미지@@">
			<h2 style="padding-top:10px;">${business.businessName}</h2>
			<h5>예약 목록</h5>
	    </div>
	    


	    <div class="row">
	    
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
		    	</p>
		    </div>
		    
		    
		    <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
			    
					<div class="form-group">
				    	<select class="form-control" name="searchCondition" >
							<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>예약번호</option>
							<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>모임명</option>
							<option value="2"  ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>결제자명</option>
						</select>
					</div>
				  
					<div class="form-group">
				    	<label class="sr-only" for="searchKeyword">검색어</label>
				    	<input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="검색어"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
					</div>
				  
					<button type="button" class="btn btn-default">검색</button>
				  
					<!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
					<input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
	    	</div>
	    	
		</div>
		
		
      <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th align="center">예약No</th>
            <th align="left" >모임명</th>
            <th align="left">예약자명</th>
            <th align="left">예약일정</th>
            <th align="left">상세보기</th>
          </tr>
        </thead>
       
		<tbody>
		
		  <c:set var="i" value="0" />
		  <c:forEach var="pay" items="${list}">
			<tr>
			  <td align="center">${pay.payNo}</td>
			  <td align="left"  title="Click : 예약정보 확인">
			  	${pay.meet.meetName}
			  	<%-- <jsp:include page="/business/getReserveBusiness.jsp"/> --%>
			  	<%-- <i class="glyphicon glyphicon-ok" id= "${offMeet.offMeetId}"></i> --%>
			  </td>
			  <td align="left">${pay.user.userName}</td>
			  <td align="left">${pay.reserveDate}</td>
			  <td align="left">
			  	<jsp:include page="/business/getReserveBusiness.jsp"/>
			  </td>
			</tr>
          </c:forEach>
        
        </tbody>
      
      </table>
	  
 	</div>
 	
 	
 	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->
	
</body>
</html>