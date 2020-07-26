<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<div class="wrapper">
    <!-- Sidebar Constructor -->
    <div class="constructor">
    
<div style="float:right">

<input type="button" id="addWishMeet" value="찜하기"/> 
<input type="button" id="joinMeet" value="모임 가입"/> 

<input type="button" value="쪽지 초대"/>
<input type="button" value="카카오톡 초대"/>
<input type="button" id="addOffMeet" value="오프라인 모임 생성"/>
</div>

<div class="row" style="margin-left:300px">
 	<div class="col-xs-6 col-md-5">
    <a href="#" class="thumbnail">
    <c:if test="${! empty meet.meetImg}">
				<img src="/resources/images/uploadFiles/meet/${meet.meetImg}" alt="MORACK MORACK"></c:if>  			
    <c:if test="${empty meet.meetImg}">
    			<img src="/resources/images/uploadFiles/meet/empty_Img.png" alt="MORACK MORACK"></c:if>
    			</a>
  </div>
  	<div class="col-md-3" style="height:500px;">
	
		<div style="float:left;">
		<h4>${meet.meetName}</h4>
		${meet.memNum}/${meet.maxNum}</div> 	
		<br/><br/><br/><br/>
		
		<p><strong>해시태그</strong></p> 
		<c:forEach var="hashtag" items="${meet.hashtag}">  <c:set var="hashtagSplit" value="${fn:split(fn:split(hashtag,'=')[1],'}')[0]}" />
		<div style="float:left">#${hashtagSplit}</div>
		</c:forEach>
		<br/><br/>
		
		<p><strong>카테고리</strong></p> 
 		<c:choose>
		<c:when test="${meet.category eq 0}">여행</c:when>
		<c:when test="${meet.category eq 1}">게임</c:when>
		<c:when test="${meet.category eq 2}">음악</c:when>
		<c:when test="${meet.category eq 3}">영화</c:when>
		<c:when test="${meet.category eq 4}">공연</c:when>
		<c:when test="${meet.category eq 5}">맛집</c:when>
		<c:when test="${meet.category eq 6}">취업/자기계발</c:when>
		<c:when test="${meet.category eq 7}">액티비티</c:when>
		<c:when test="${meet.category eq 8}">독서/만화</c:when>
		<c:when test="${meet.category eq 9}">댄스</c:when>
		<c:when test="${meet.category eq 10}">사진</c:when>
		<c:when test="${meet.category eq 11}">반려동물</c:when>
		<c:when test="${meet.category eq 12}">요리</c:when>
		<c:when test="${meet.category eq 13}">차</c:when>
		<c:when test="${meet.category eq 14}">스포츠</c:when>
		<c:when test="${meet.category eq 15}">공예</c:when>
		<c:when test="${meet.category eq 16}">기타</c:when>
	</c:choose>	
	<br/><br/>
	
		<p><strong>모임 간략 소개</strong></p> 
		${meet.sIntro}
		<br/><br/>
		
		<p><strong>모임 간략 소개</strong></p>
		${meet.meetLoc}
		<br/><br/>
		
		<p><strong>모임 평점</strong></p>
		<c:if test="${!empty meet.meetStar}">
									<c:if test="${meet.meetStar == 0}"> </c:if>
									<c:if test="${meet.meetStar == 1}"> <span><img src="/images/sstar.png" style='display: inline-block; margin: 0px auto;  vertical-align: middle;'/></span></c:if>
									<c:if test="${meet.meetStar == 2}"> <span><c:forEach var="i" begin="1" end="2" step="1"><img src="/images/sstar.png" style='display: inline-block; margin: 0px auto;  vertical-align: middle;'/></c:forEach></span></c:if>
									<c:if test="${meet.meetStar == 3}"> <span><c:forEach var="i" begin="1" end="3" step="1"><img src="/images/sstar.png" style='display: inline-block; margin: 0px auto;  vertical-align: middle;'/></c:forEach></span></c:if>
									<c:if test="${meet.meetStar == 4}"> <span><c:forEach var="i" begin="1" end="4" step="1"><img src="/images/sstar.png" style='display: inline-block; margin: 0px auto;  vertical-align: middle;'/></c:forEach></span></c:if>
									<c:if test="${meet.meetStar == 5}"> <span><c:forEach var="i" begin="1" end="5" step="1"><img src="/images/sstar.png" style='display: inline-block; margin: 0px auto;  vertical-align: middle;'/></c:forEach></span></c:if>
								</c:if>
		
		
	</div>
	<div class="col-md-3" style="height:500px; border:1px solid red; margin-left:30px">
	오프라인 모임 정보
	</div>
</div>

<div class="row" style="margin-left:120px; margin-top:100px"> <!-- 상세 이미지 / 테이블 만들어지면 넣기 -->
 	<div class="col-xs-6 col-md-7">
    <a href="#" class="thumbnail">
      <img src="" alt="Image" style="height:500px; width:500px">
    </a>
  </div>
  	<div class="col-md-4" style="height:500px; border:1px solid red;">  <!-- 후기 / 테이블 만들어지면 넣기 -->
		<h3>후기</h3>  
		<h3></h3>  
	</div>
</div>


<a href="#">n개 후기 모두 보기</a>

<!-- 모달 영역 -->
<div id="modalBox" class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
<div class="modal-dialog" role="document">
<div class="modal-content">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
<h4 class="modal-title" id="myModalLabel">모임 가입 신청</h4>
</div>
<div class="modal-body">
    	<div class="col-xs-6 col-md-5">
    		<a href="#" class="thumbnail">
     		 <img src="/resources/images/uploadFiles/meet/${meet.meetImg}" alt="MORACK MORACK"/> 
    		</a>
 		 </div>
  		<strong>모임명</strong>
		${meet.meetName} <br/>
    	<c:if test="${meet.meetType=='0'}">2인모임</c:if><c:if test="${meet.meetType=='1'}">다수인모임</c:if> <br/>
    	<c:choose>
		<c:when test="${meet.category eq 0}">여행</c:when>
		<c:when test="${meet.category eq 1}">게임</c:when>
		<c:when test="${meet.category eq 2}">음악</c:when>
		<c:when test="${meet.category eq 3}">영화</c:when>
		<c:when test="${meet.category eq 4}">공연</c:when>
		<c:when test="${meet.category eq 5}">맛집</c:when>
		<c:when test="${meet.category eq 6}">취업/자기계발</c:when>
		<c:when test="${meet.category eq 7}">액티비티</c:when>
		<c:when test="${meet.category eq 8}">독서/만화</c:when>
		<c:when test="${meet.category eq 9}">댄스</c:when>
		<c:when test="${meet.category eq 10}">사진</c:when>
		<c:when test="${meet.category eq 11}">반려동물</c:when>
		<c:when test="${meet.category eq 12}">요리</c:when>
		<c:when test="${meet.category eq 13}">차</c:when>
		<c:when test="${meet.category eq 14}">스포츠</c:when>
		<c:when test="${meet.category eq 15}">공예</c:when>
		<c:when test="${meet.category eq 16}">기타</c:when>
	</c:choose> <br/>
		${meet.lIntro} <br/>
		<strong>한줄 자기소개</strong> <input type="text" id="intro" name="intro" class="form__field" placeholder="자기소개 입력" value=""/>
</div>
<div class="modal-footer">
<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
            <button type="button" class="btn btn-primary" id="inputIntro">가입</button>
</div>
</div>
</div>
</div>
</div>
</div>