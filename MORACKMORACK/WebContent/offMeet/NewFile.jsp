<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <title>해당하는 페이지 이름</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</head>
<body>

<script>
$(function(){
	$("#addUserButton").on("click", function() {
        location.href = "/user/addUser";
    });
});
</script>


<button type="button"  align="center" class="btn btn-primary"  id="modal_show">
				   등록
				</button>

<div class="modal fade" id="reqOffModal" tabindex="-1" role="dialog" aria-labelledby="reqOffModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title">오프라인 모임 정보</h5>
	       <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
				      	<div class="modal-body">
				      		<div class="row">
				      			<div class="col-lg-6 justify-content-left">
				      				<table class="modalTable">
					      				<tbody>
					      					<tr>
					      						<th><b>오프라인명</b></th>
					      						<td>: ${offMeet.offName}</td>
					      					</tr>
					      					<tr>
					      						<th><b>모임장소</b></th>
					      						<td>: ${offMeet.offLoc}</td>
					      					</tr>
					      					<tr>
					      						<th><b>모임 날짜</b></th>
					      						<td>: ${offMeet.offDate}
					      					</tr>
					      					<tr>
					      						<th><b>모임 시간</b></th>
					      						<td>: ${offMeet.offTime}</td>
					      					</tr>
					      					<tr>
					      						<th><b>참여비</b></th>
					      						<td>: ${offMeet.amount}</td>
					      					</tr>
					      					<tr>
					      						<th><b>현재 인원 수</b></th>
					      						<td>: ${offMeet.offMem}</td>
					      					</tr>
					      					<tr>
					      						<th><b>최대 인원 수</b></th>
					      						<td>: ${offMeet.offMax}</td>
					      					</tr>

					      				</tbody>
				      				</table>
				      			</div>
				      		</div> 
				      	</div>
			      	
				      	<div class="modal-footer">
				      		<div class="col-lg-12">
			      			<button type="button" class="btn btn-primary" onclick="reqOff()">확인</button>
			      			  <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
				      		</div>
				      	</div>
			    	</div>
				</div>
	<script>
        $(document).ready(function() {
            $("#modal_show").click(function() {
                $("#reqOffModal").modal("show");
            });
 
            $("#close_modal").click(function() {
                $("#reqOffModal").modal("hide");
            });
        });
    </script>

	
	
</body>
</html>