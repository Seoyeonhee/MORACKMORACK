<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../common/listCdn.jsp"/>

<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<link href="/css/summernote/summernote-lite.css" rel="stylesheet">
<script src="/js/summernote/summernote-lite.js"></script>
<script src="/js/summernote/lang/summernote-ko-KR.min.js"></script>


<title>Insert title here</title>
</head>


<script type="text/javascript">


	$(function(){
		$("#summernote").summernote({
			height:300,
			minHeight:300,
			maxHeight:300,
			focus: true,
			lang:"ko-KR",
			placeholder:'내용을 입력하세요',
			toolbar: [
 			    ['fontname', ['fontname']],
 			    ['fontsize', ['fontsize']],
 			    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
 			    ['color', ['forecolor','color']],
 			    ['table', ['table']],
 			    ['para', ['ul', 'ol', 'paragraph']],
 			    ['height', ['height']],
 			    ['insert',['picture','link','video']],
 			    ['view', ['fullscreen', 'help']]
 			  ],
 			fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
 			fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
		});
	});
	
</script>

<body>
	<jsp:include page="/toolbar.jsp"/>
	
	<div class="container">
	
	<form class="form-group my-5 py-5">
		<h1>게시글 작성</h1>
		<div class="form-row my-3">
			<div class="input-group col-lg-2">
				<input type="text" class="form-control" name="postName" placeholder="제목">
			</div>
		</div>
		<div>
			<textarea id="content" name="content" class="summernote"></textarea>
			<div id="summernote"></div>
		</div>
		<div class="form-row justify-content-center my-5">
		
			<button type="button" class="btn btn-outline-info waves-effect" href="javascript:history.back();" role="button">취소</button>
			<button type="button" class="btn btn-cyan">등록</button>
		</div>
		</form>
	</div>
</body>
</html>