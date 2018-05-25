<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.inputboxes input:hover {
	border-color: #ffae00;
}
.label:hover{
	cursor:default;
}
.shadow {
	-webkit-box-shadow: 6px 10px 27px 7px rgba(194, 194, 194, 0.6);
	-moz-box-shadow: 6px 10px 27px 7px rgba(194, 194, 194, 0.6);
	box-shadow: 6px 10px 27px 7px rgba(194, 194, 194, 0.6);
	padding: 5%;
	border: rgba(0, 0, 0, 0.2);
	background-color: #ffffff;
}

.aqua_btn {
	padding: 4px 15px 4px 15px;
	-webkit-border-radius: 16px;
	-moz-border-radius: 16px;
	background-color: rgb(60, 132, 198);
	background-image: -webkit-gradient(linear, 0% 0%, 0% 90%, from(rgba(28, 91, 155, 0.8)),
		to(rgba(108, 191, 255, .9)));
	border: 1px solid #ccc;
	border-top-color: #8ba2c1;
	border-right-color: #5890bf;
	border-bottom-color: #4f93ca;
	border-left-color: #768fa5;
	font-family: 나눔고딕, "맑은 고딕";
	font-weight: 800;
	color: #fff;
	text-shadow: rgba(10, 10, 10, 0.5) 1px 2px 2px;
	text-align: center;
}

.tatle {
	font-size: 1.8em;
}

.textstyle {
	width: 50%;
	line-height: 25px;
	height: 65px;
	padding: 5px;
	font: 15px;
}
.margintop10 {
	width: 100%;
	margin-left: 0px;
}
</style>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	// 취소 버튼 클릭시 로그인 화면으로 이동
	function goPage() {
		location.href = "/common.do";
	}
</script>

<script type="text/javascript">
	//아이디 중복체크 버튼
	function openIdChk() {
		///에이작스 위치
		var userID = $('#Mid').val();
		if ($('#Mid').val() == "") {
			alert("아이디를 입력해주세요.");
		} else {
			$.ajax({
				type : 'POST',
				url : '/member/user/UserRegisterCheck.do',
				data : {
					mid : userID
				},
				dataType : "json",
				success : function(result) {
					if (result == 0) {
						alert("사용할 수 있는 아이디입니다.");
					} else {
						alert("사용할 수 없는 아이디입니다.");
					}

				}

			})

		}

	}
</script>

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


<section id="inner-headline">
	<div class="container">
		<div class="row">
			<div class="span4">
				<div class="inner-heading">
					<h2>회원가입</h2>
				</div>
			</div>
			<div class="span8"></div>
		</div>
	</div>
</section>
<section id="content" style="/* text-align:center; */">
	<form name="userInfo" class="contactForm"
		action="/member/user/memberInsert.do" enctype="multipart/form-data">
		<div class="container">
			<div class="span12" style="margin-left:0px;padding-left: 20%; width : 90%;">
				<div class="span6 margintop10 field form-group">
					<label for="exampleInputEmail1" class="tatle" style="display:block">아이디</label> 
					<input type="text" name="mid" id="Mid" class="textstyle" value="final" required /> 
					<input class="aqua_btn" onclick="openIdChk()" type="button" value="중복체크" />
					<div class="validation"></div>
				</div>
				
				<div class="span6 margintop10 field form-group">
					<label for="exampleInputEmail1" class="tatle">비밀번호</label> 
					<input type="password" name="mpw" maxlength="50" class="textstyle" value="1111" required />
					<div class="validation"></div>
				</div>
				
				<div class="span6 margintop10 field form-group">
					<label for="exampleInputEmail1" class="tatle">이름</label> 
					<input type="text" name="mname" maxlength="15" class="textstyle" value="파이널시연용" required />
					<div class="validation"></div>
				</div>
				
				<div class="span6 margintop10 field form-group">
					<label for="exampleInputEmail1" class="tatle">생년월일</label>
					<input type="text" name="mbirth" maxlength="8"
						placeholder="'-'없이 입력해주세요!" class="textstyle" value="19501212"required />
					<div class="validation"></div>
				</div>
				
				<div class="span6 margintop10 field form-group">
					<label for="exampleInputEmail1" class="tatle">성별</label> 
						<input type="radio" name="mgender" value="M" checked>남 
						<input type="radio" name="mgender" value="F">여
					<div class="validation"></div>
				</div>
				
				<div class="span6 margintop10 field form-group">
					<label for="exampleInputEmail1" class="tatle">전화번호</label> 
					<input type="text" style="width: 100px" name="mphone" maxlength="4"
						placeholder="010" value="010" required> - 
					<input type="text" style="width: 100px" name="mphone1" maxlength="4"
						placeholder="1234" value="1212" required> - 
					<input type="text" style="width: 100px" name="mphone2" maxlength="4"
						placeholder="1234" value="1212" required>
					<div class="validation"></div>
				</div>
			
				<div class="span6 margintop10 field form-group">
					<label for="exampleInputEmail1" class="tatle">주소</label> 
					<input style="width: 100px" type="text" id="sample6_postcode"
						placeholder="우편번호" value="08793"> 
					<input class="aqua_btn" type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
					<input type="text" id="sample6_address" name="maddress" placeholder="주소" class="textstyle" value="서울 관악구 남부순환로244가길 9 (봉천동, 파이치치22)" required><br>
					<input type="text" id="sample6_address2" name="maddress2" placeholder="상세주소" value="1층" class="textstyle">
					<div class="validation"></div>
				</div>
				
				<div class="span6 margintop10 field form-group">
					<label for="exampleInputEmail1" class="tatle">이메일</label> 
					<input type="text" name="memail" maxlength="50" value="final" required> @ 
					<select id="url" name="memail2">
						<option>naver.com</option>
						<option>daum.net</option>
						<option>gmail.com</option>
					</select>
					<div class="validation"></div>
				</div>
				
				<div class="span6 margintop10 field form-group">
					<label for="exampleInputEmail1" class="tatle">메일링 수신여부</label>
					 <input type="radio" name="mmailreceive" value="Y" checked>예 
					 <input type="radio" name="mmailreceive" value="N">아니오
					<div class="validation"></div>
				</div>
			</div>
		</div>

		<div class="row" >
			<div class="span12" style="width: 100%;">
				<div class="pricing-box-plain">
					<div class="action">
						<button class="btn-large btn-info" id="select" type="submit">완료</button>
						<button class="btn-large btn-danger" type="button">취소</button>
					</div>
				</div>
			</div>
		</div>
	</form>
</section>