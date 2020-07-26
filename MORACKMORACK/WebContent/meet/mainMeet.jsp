<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<div class="wrapper">
    <!-- Sidebar Constructor -->
    <div class="constructor">
    
<div style="float:right">

<input type="button" id="addWishMeet" value="���ϱ�"/> 
<input type="button" id="joinMeet" value="���� ����"/> 

<input type="button" value="���� �ʴ�"/>
<input type="button" value="īī���� �ʴ�"/>
<input type="button" id="addOffMeet" value="�������� ���� ����"/>
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
		
		<p><strong>�ؽ��±�</strong></p> 
		<c:forEach var="hashtag" items="${meet.hashtag}">  <c:set var="hashtagSplit" value="${fn:split(fn:split(hashtag,'=')[1],'}')[0]}" />
		<div style="float:left">#${hashtagSplit}</div>
		</c:forEach>
		<br/><br/>
		
		<p><strong>ī�װ�</strong></p> 
 		<c:choose>
		<c:when test="${meet.category eq 0}">����</c:when>
		<c:when test="${meet.category eq 1}">����</c:when>
		<c:when test="${meet.category eq 2}">����</c:when>
		<c:when test="${meet.category eq 3}">��ȭ</c:when>
		<c:when test="${meet.category eq 4}">����</c:when>
		<c:when test="${meet.category eq 5}">����</c:when>
		<c:when test="${meet.category eq 6}">���/�ڱ���</c:when>
		<c:when test="${meet.category eq 7}">��Ƽ��Ƽ</c:when>
		<c:when test="${meet.category eq 8}">����/��ȭ</c:when>
		<c:when test="${meet.category eq 9}">��</c:when>
		<c:when test="${meet.category eq 10}">����</c:when>
		<c:when test="${meet.category eq 11}">�ݷ�����</c:when>
		<c:when test="${meet.category eq 12}">�丮</c:when>
		<c:when test="${meet.category eq 13}">��</c:when>
		<c:when test="${meet.category eq 14}">������</c:when>
		<c:when test="${meet.category eq 15}">����</c:when>
		<c:when test="${meet.category eq 16}">��Ÿ</c:when>
	</c:choose>	
	<br/><br/>
	
		<p><strong>���� ���� �Ұ�</strong></p> 
		${meet.sIntro}
		<br/><br/>
		
		<p><strong>���� ���� �Ұ�</strong></p>
		${meet.meetLoc}
		<br/><br/>
		
		<p><strong>���� ����</strong></p>
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
	�������� ���� ����
	</div>
</div>

<div class="row" style="margin-left:120px; margin-top:100px"> <!-- �� �̹��� / ���̺� ��������� �ֱ� -->
 	<div class="col-xs-6 col-md-7">
    <a href="#" class="thumbnail">
      <img src="" alt="Image" style="height:500px; width:500px">
    </a>
  </div>
  	<div class="col-md-4" style="height:500px; border:1px solid red;">  <!-- �ı� / ���̺� ��������� �ֱ� -->
		<h3>�ı�</h3>  
		<h3></h3>  
	</div>
</div>


<a href="#">n�� �ı� ��� ����</a>

<!-- ��� ���� -->
<div id="modalBox" class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
<div class="modal-dialog" role="document">
<div class="modal-content">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">��</span></button>
<h4 class="modal-title" id="myModalLabel">���� ���� ��û</h4>
</div>
<div class="modal-body">
    	<div class="col-xs-6 col-md-5">
    		<a href="#" class="thumbnail">
     		 <img src="/resources/images/uploadFiles/meet/${meet.meetImg}" alt="MORACK MORACK"/> 
    		</a>
 		 </div>
  		<strong>���Ӹ�</strong>
		${meet.meetName} <br/>
    	<c:if test="${meet.meetType=='0'}">2�θ���</c:if><c:if test="${meet.meetType=='1'}">�ټ��θ���</c:if> <br/>
    	<c:choose>
		<c:when test="${meet.category eq 0}">����</c:when>
		<c:when test="${meet.category eq 1}">����</c:when>
		<c:when test="${meet.category eq 2}">����</c:when>
		<c:when test="${meet.category eq 3}">��ȭ</c:when>
		<c:when test="${meet.category eq 4}">����</c:when>
		<c:when test="${meet.category eq 5}">����</c:when>
		<c:when test="${meet.category eq 6}">���/�ڱ���</c:when>
		<c:when test="${meet.category eq 7}">��Ƽ��Ƽ</c:when>
		<c:when test="${meet.category eq 8}">����/��ȭ</c:when>
		<c:when test="${meet.category eq 9}">��</c:when>
		<c:when test="${meet.category eq 10}">����</c:when>
		<c:when test="${meet.category eq 11}">�ݷ�����</c:when>
		<c:when test="${meet.category eq 12}">�丮</c:when>
		<c:when test="${meet.category eq 13}">��</c:when>
		<c:when test="${meet.category eq 14}">������</c:when>
		<c:when test="${meet.category eq 15}">����</c:when>
		<c:when test="${meet.category eq 16}">��Ÿ</c:when>
	</c:choose> <br/>
		${meet.lIntro} <br/>
		<strong>���� �ڱ�Ұ�</strong> <input type="text" id="intro" name="intro" class="form__field" placeholder="�ڱ�Ұ� �Է�" value=""/>
</div>
<div class="modal-footer">
<button type="button" class="btn btn-default" data-dismiss="modal">���</button>
            <button type="button" class="btn btn-primary" id="inputIntro">����</button>
</div>
</div>
</div>
</div>
</div>
</div>