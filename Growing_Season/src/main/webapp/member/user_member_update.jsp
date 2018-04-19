<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<section id="inner-headline">
	<div class="container">
		<div class="row">
			<div class="span12">
				<div class="inner-heading">
					<h2>
						<font color="#008000">회원 정보 수정하기</font>
					</h2>
				</div>
			</div>
			<div class="span8"></div>
		</div>
	</div>
</section>
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
<title>Insert title here</title>
<link rel="stylesheet" href="/css/my.css">

<script>
	function goPage() {
		location.href = "/common.do";
	}
</script>
<script type="text/javascript" src="/js/jquery-3.3.1.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var fullAddr = ''; // 최종 주소 변수
						var extraAddr = ''; // 조합형 주소 변수

						// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							fullAddr = data.roadAddress;

						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							fullAddr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
						if (data.userSelectedType === 'R') {
							//법정동명이 있을 경우 추가한다.
							if (data.bname !== '') {
								extraAddr += data.bname;
							}
							// 건물명이 있을 경우 추가한다.
							if (data.buildingName !== '') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
							fullAddr += (extraAddr !== '' ? ' (' + extraAddr
									+ ')' : '');
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
						document.getElementById('sample6_address').value = fullAddr;

						// 커서를 상세주소 필드로 이동한다.
						document.getElementById('sample6_address2').focus();
					}
				}).open();
	}
</script>
</head>
<section id="content">
	<div class="container">
		<div class="row">
			<div class="span12">
				<body>
					<form name="myForm" class="myForm" id="myForm"
						action="/member/user/memberUpdate.do" method="post">
						<input type="hidden" name="mseq" value="${LVL_VO.mseq}"> <input
							type="hidden" name="currentPage" value="${LVL_VO.currentPage}">
						<table class="page-wrap">
							<tr>
								<td id="title">아이디</td>
								<td>${LVL_VO.mid}</td>
							</tr>
							<tr>
								<td id="title">비밀번호</td>
								<td><input type="password" name="mpw" value="${LVL_VO.mpw}"></td>
							</tr>
							<tr>
								<td id="title">이름</td>
								<td><input type="text" name="mname" value="${LVL_VO.mname}"></td>
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
								<td>
									<input type="text" name="mphone" value="${LVL_VO.mphone}">
								</td>
							</tr>
							<tr>
								<td id="title">주소</td>
								<td><input style="width: 100px" type="text" id="sample6_postcode" placeholder="우편번호"> 
									<input class="aqua_btn" type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
									<br>
									<input type="text" id="sample6_address" name="maddress"placeholder="주소" style="width: 370px;" required>
									<br>
									<input type="text" id="sample6_address2" name="maddress2" placeholder="상세주소" style="width: 370px;" required>
								</td>
							</tr>
							<tr>
								<td id="title">이메일</td>
								<td>
									<input type="text" name="memail" maxlength="50" required> @
									<select id="url" name="memail2">
											<option>naver.com</option>
											<option>daum.net</option>
											<option>gmail.com</option>
									</select>
								</td>
							</tr>
							<tr>
								<td id="title">메일링 수신여부</td>
								<td>
									<input type="radio" name="mmailreceive" value="Y" checked>예 
									<input type="radio" name="mmailreceive" value="N">아니오
								</td>
							</tr>
						</table>
						<input type="submit" value="저장"> <input type="button" value="취소" onclick="goPage()">
					</form>
				</body>
			</div>
		</div>
	</div>
</section>
</html>