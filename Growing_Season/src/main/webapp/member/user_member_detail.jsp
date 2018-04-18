<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
#page-wrap {
	margin: 50px;
}
p {
	margin: 20px 0; 
}

	/* 
	Generic Styling, for Desktops/Laptops 
	*/
	table { 
		width: 100%; 
		border-collapse: collapse; 
	}
	/* Zebra striping */
	tr:nth-of-type(odd) { 
		background: #eee; 
	}
	th { 
		background: #333; 
		color: white; 
		font-weight: bold; 
	}
	td, th { 
		padding: 6px; 
		border: 1px solid #ccc; 
		text-align: left; 
	}
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>
	<h2>상세보기</h2>
	<hr>
	<form name="myForm" class="myForm" action="/member/user/memberDetail.do"
		enctype="multipart/form-data">
		<table class="page-wrap">
			<tr>
				<td id="title">아이디</td>
				<td>${LVL_VO.mid} ${LVL_VO.mseq}</td>
			</tr>
			<tr>
				<td id="title">비밀번호</td>
				<td>${LVL_VO.mpw}</td>
			</tr>
			<tr>
				<td id="title">이름</td>
				<td>${LVL_VO.mname}</td>
			</tr>
			<tr>
				<td id="title">생년월일</td>
				<td>${LVL_VO.mbirth}</td>
			</tr>
			<tr>
				<td id="title">성별</td>
				<td>${LVL_VO.mgender}</td>
			</tr>
			<tr>
				<td id="title">전화번호</td>
				<td>${LVL_VO.mphone}</td>
			</tr>
			<tr>
				<td id="title">주소</td>
				<td>${LVL_VO.maddress}</td>
			</tr>
			<tr>
				<td id="title">이메일</td>
				<td>${LVL_VO.memail}</td>
			</tr>
			<tr>
				<td id="title">메일링 수신여부</td>
				<td>${LVL_VO.mmailreceive}</td>
			</tr>
		</table>
		</form>
		<br><a href="/member/user/memberUpdateForJSP.do?mseq=${LVL_VO.mseq}&currentPage=${LVL_VO.currentPage}">수정하러 가기</a>
		
		<form name="deleteForm" class="deleteForm" action="/member/user/memberDelete.do">
		<input type="hidden" id="mseq" name="mseq" value="110">
		</form>
		
		<div>
	<a href="#myModal" class="w3-button w3-black" data-toggle="modal">탈퇴하기</a>
</div>

<!-- Modal HTML -->
<div id="myModal" class="modal fade" style="margin-top: 20%;">
	<div class="modal-dialog modal-login" style="margin-top: 0px">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">×</button>
			</div>
			<div class="modal-body">
				<div>정말탈퇴?</div>
					<div class="form-group">
						<input type="button" class="btn btn-primary btn-block btn-lg"
							value="탈퇴" onClick="test()" >
					</div>
			</div>
		</div>
	</div>
</div>
		
		<script>
		function test() {
			alert("탈퇴완료");
			$(".deleteForm").submit();
		}
		</script>
</body>
</html>
