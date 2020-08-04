<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
	<title>자유 게시판</title>
	<meta charset="EUC-KR">
	<jsp:include page="/common/listCdn.jsp"/>

<style>
  body {
            padding-top : 50px;
        }
</style>

<script type="text/javascript">
	
	$(function(){
		$("#addPost").on("click",function(){
			
			var meetId= $(this).next().val();
			
			self.location="/community/addPostView?meetId="+meetId;
			
		})
	})
</script>
	</head>
	
	<body>
	<header>
		<jsp:include page ="/toolbar.jsp"/>
	</header>
	
	<jsp:include page="../meet/sidebar.jsp"/>
	
	<div class ="container">
	
	<div class ="row">
		<div class="col-md-6 text-left">
			<p class = "text-primary">
				전체 ${resultPage.totalCount} 건수 , 현재 ${resultPage.currentPage} 페이지
			</p>
		</div>
		
		<div class="col-md-6 text-right">
			<form class="form-inline" name="detailForm">
			
				<div class="form-group">
					<select class="form-control" name="searchCondition">
						<option value="0" ${! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>글 제목</option> 
 						<option value="1" ${! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>작성자</option>  
 					</select>
 				</div>
			
				<div class="form-group">
 					<label class="sr-only" for="searchKeyword">검색어</label>
 					<input type="text" class="form-control" id="searchKeyword" name="searchKeyword" placeholder="검색어"
 								 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
 				</div>
 				
 				<button type="button" class="btn btn-default">검색</button>
 				<button type="button" class="btn btn-primary" id="addPost" name="addPost">글쓰기</button>
 				<input type="hidden" value="${param.meetId}"/>
 				
 	 			</form>
 		</div>
 	</div>
	
	<table class="table table-hover table-striped">
	
		<thead>
		<tr>
			<th align="center">No</th>
			<th align="left">글제목</th>
			<th align="left">작성자</th>
			<th align="left">작성일</th>
		</tr>
		</thead>
		
		<tbody>
		
		<c:set var="i" value="0"/>
		<c:forEach var="community" items="${list}">
			<c:set var="i" value="${i+1}"/>
			<tr>
			<td align="left">${i}</td>
			<td align="left">${community.title}<input type ="hidden" class="postNo" value="${community.postNo}"/></td>
			<td align="left">${community.user.userId}</td>
			<td align="left">${community.regDate}</td>
			</tr>
		</c:forEach>
		</tbody>
		</table>
		</div>
	</body>
	</html>