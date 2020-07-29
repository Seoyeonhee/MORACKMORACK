<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Modal -->
<div class="modal fade" id="myModal" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 id="modal-title" class="modal-title"></h4>
			</div>
			<div class="modal-body">
				<table class="table table-hover">
					<tr>
						<th align="center">친구</th>
						<th align="legt">친구 닉네임</th>
					</tr>
					<c:forEach var="friend" items="${friendList}" varStatus="status">
						<tr>
						<td>${friend.recvFriend.profileImg}</td>
						<td>${friend.recvFriend.nickName}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div class="modal-footer">
				<button id="modalSubmit" type="button" class="btn btn-success">Submit</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>