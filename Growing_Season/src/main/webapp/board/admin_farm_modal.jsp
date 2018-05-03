<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>

.modal-login {
	width: 350px;
}

.modal-login .modal-content {
	padding: 20px;
	border-radius: 1px;
	border: none;
}

.modal-login .modal-header {
	border-bottom: none;
	position: relative;
	justify-content: center;
}

.modal-login h4 {
	text-align: center;
	font-size: 26px;
}

.modal-login .form-group {
	margin-bottom: 20px;
}

.modal-login .form-control, .modal-login .btn {
	min-height: 40px;
	border-radius: 30px;
	font-size: 15px;
	transition: all 0.5s;
}

.modal-login .form-control {
	font-size: 13px;
}

.modal-login .form-control:focus {
	border-color: #a177ff;
}

.modal-login .hint-text {
	text-align: center;
	padding-top: 10px;
}

.modal-login .close {
	position: absolute;
	top: -5px;
	right: -5px;
}

.modal-login .btn {
	background: #a177ff;
	border: none;
	line-height: normal;
}

.modal-login .btn:hover, .modal-login .btn:focus {
	background: #8753ff;
}

.modal-login .hint-text a {
	color: #999;
}

.trigger-btn {
	display: inline-block;
	margin: 100px auto;
}
</style>

 <script>
	function goPage() {
		/* location.href="/loginCheck.do"; */
		$("#login").submit();
		}
</script>

	<div>
		<a href="#myModal" class="trigger-btn" data-toggle="modal"> 모달</a>
	</div>
<!-- Modal HTML -->
<div id="myModal" class="modal fade">
	<div class="modal-dialog modal-login" style="margin-top: 250px">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">반려사유</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">×</button>
			</div>
			<div class="modal-body">
					<div class="form-group">
						<input type="text" name="mid" id="mid" class="form-control" placeholder="반려사유"
							required="required" style="width:300px; height:150px;">
					</div>
					<div class="form-group">
						<input type="button" class="btn btn-primary btn-block btn-lg"
							value="반려사유  보내기">
					</div>
			</div>
		</div>
	</div>
</div>