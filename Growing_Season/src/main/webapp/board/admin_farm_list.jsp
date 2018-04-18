<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- body부 sample입니다. 복사해서 이름 명명규칙에 맞춰 바꿔주시고 하단 코딩하시면 되겟습니다 -->
<!-- sample처럼 div class 하나 잡아주시면 되고, 스크립트 및 jquery, jstl 바로 사용하시면 됩니다-->
<!-- 별도 js가 필요한 경우 필요한 js파일이나 cdn경로를 주시고 test후 충돌없으면 반영하겟습니다 -->
<script src="https://code.jquery.com/jquery-3.3.1.js"
	type="text/javascript"></script>
<style>
.red {
	color : red;
	width:60pt; 
	height:30pt;
}

.black {
	color : black;
	width:60pt; 
	height:30pt;
}

.modal-login {
	width: 550px;
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

<div class="typo">
	<!---728x90--->
	<div class="container">
			<div class="page-header">
				<h3 class="bars">텃밭 신청자 리스트   신청서 : ${LVL_COUNT}개</h3>
			</div>
			<div class="row">
				<div class="span4">
					<div class="span1" style="padding:2px;">
						<input type="button" class="btn btn-default" value="농장관리" onClick="location.href='/manager.do'">
					</div>
					<div class="span1" style="padding:2px;">
						<input type="button" class="btn btn-default" value="당첨자 리스트" onClick="location.href='/lottolist.do'">
					</div>
				</div>
			</div>
		<div class="bs-docs-example">
			<table class="table table-bordered">
				<thead class="thead-dark">
					<tr>
						<th>유형</th>
						<th>회원번호</th>
						<th>이름</th>
						<th>생년월일</th>
						<th>성별</th>
						<th>주소</th>
						<th>전화번호</th>
						<th>이메일</th>
						<th>첨부서류</th>
						<th>반려여부</th>
					</tr>
				</thead>
				<tbody>
				
				<c:forEach items="${LVL_LIST}" var="vo"> 
					<tr>
						<td>${vo.avo.apdivision}</td>
						<td>${vo.mseq}</td>
						<td>${vo.avo.apname}</td>
						<td>${vo.avo.apbirth}</td>
						<td>${vo.mgender}</td>
						<td>${vo.maddress}</td>
						<td>${vo.avo.apphone}</td>
						<td>${vo.avo.apemail}</td>
						<td>
							<c:forEach items="${vo.dvoList}" var="dvo">
								${dvo.dfilename}<br>
							</c:forEach>
						</td>
						<td><input type="button" class="btn btn-warning return" id="${vo.avo.apseq}" style="width:60pt; height:30pt; color:black;" value="반려" ></td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
		<div align="center">
			<ul class="pagination">
				${LVL_PAGING}
			</ul>
		</div>
		<div style="text-align:center; margin:10px">
		<form class="lotto" action="/lotto.do" method="post">
		<div>
			<select class="form-control" id="loc" style="width:150px">
				<option value="">선택해주세요</option>
				<c:forEach items="${LVL_FLOC}" var="vo">
					<option value="${vo.fglocation}">${vo.fglocation}</option>
				</c:forEach>
			</select>
		</div>
		<div>
			<select class="form-control" id="name" style="width:150px">
			</select>
			<input type="hidden" id="fgseq" name="fgseq" value="">
		</div>
		</form>
		<div class="newsletter">
			<input type="button" class="btn btn-primary" id="lottogo" style="width:60pt; height:30pt; color:black;" value="추첨하기">
		</div>
		</div>
	</div>
</div>

<div id="myModal" class="modal fade">
	<div class="modal-dialog modal-login" style="margin-top:20px;">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">반려사유</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">×</button>
			</div>
			<div class="modal-body">
					<form class="dreturn" action="/returnUpdate.do" method="post">
					<div class="form-group">
						<textarea name="dreturncause" id="dreturncause" class="input-bloc-level" placeholder="반려사유"
							required="required" style="width:470px; height:150px;">
						</textarea>
						<input type="hidden" name="apseq" id="apseq" value="">
					</div>
					</form>
					<div class="form-group">
						<input type="button" class="btn btn-primary btn-block btn-lg" id="sendreturn" value="반려사유  보내기">
					</div>
			</div>
		</div>
	</div>
</div>

<script>
	
		  $('.return').click(function(){
			    var o = $(this).attr('id');
			    alert(o);
			    if($(this).attr('value') == '반려') {
			    	$(this).hide();
			    	$(this).attr('value','반려취소');
       			 	$("#myModal").modal();
			    	$('#apseq').attr('value', o);
			    } 
		  });
		  
		 $('#sendreturn').click(function(){
			 $('.dreturn').submit();
		 });
		 
		 $('#lottogo').click(function(){
				$('.lotto').submit();		
			});
			
			
			$('#loc').change(function(){
			  	
					alert($(this).val());
					var data = {"fglocation":$("#loc option:selected").val()};
					
					$.ajax({
					url:"/flist.do",
					dataType:"json",
					headers: {
			              "Content-Type" : "application/json"
			        },
					data: JSON.stringify(data),
					type:"post",
					success:function(result) {
						var htmlStr="";
						
						$("#name").empty();
						$("#name").append("<option>선택해주세요</option>");
						$.each(result.LVL_RLIST, function(i,v){
							$("#name").append("<option value="+ v.fgseq + ">"+ v.fgname + "</option>");
						});
					}
				});
			});
			
			$('#name').change(function() {
				$('#fgseq').attr('value',$('#name').val());
			});
		 
</script>
