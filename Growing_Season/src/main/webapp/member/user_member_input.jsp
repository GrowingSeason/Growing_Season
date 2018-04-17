<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
// 취소 버튼 클릭시 로그인 화면으로 이동
function goPage() {
	location.href="/common.do";
}
</script>

<script type="text/javascript">
//아이디 중복체크 화면open
function openIdChk(){
	
  ///에이작스 위치
  var userID = $('#Mid').val();
  if($('#Mid').val() == "") {
	  alert("아이디를 입력해주세요.");
  }else {
  			$.ajax({
  					type:'POST',
  					url:'/member/user/UserRegisterCheck.do',
  					data:{mid: userID},
  					dataType: "json",
  					success: function(result){
  						if(result == 0){  							
  							alert("사용할 수 있는 아이디입니다.");						
  						}
  						else{
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
        new daum.Postcode({
            oncomplete: function(data) {
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
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
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
<body>
	<h2>회원가입</h2>
	<hr>
	<form name="userInfo" class="myForm" action="/member/user/memberInsert.do"
		enctype="multipart/form-data" method="POST">
		<table class="demo-table">
			<tr>
				<td id="title">아이디</td>
				<td>
					<input type="text" name="mid" id="Mid" maxlength="50" required /> 
					<input class="btn1" onclick="openIdChk()" type="button" value="중복체크"> 
				</td>
			</tr>

			<tr>
				<td id="title">비밀번호</td>
				<td>
					<input type="password" name="mpw" maxlength="50" required>
				</td>
			</tr>

			<tr>
				<td id="title">이름</td>
				<td><input type="text" name="mname" maxlength="20" required></td>
			</tr>

			<tr>
				<td id="title">생년월일</td>
				<td>
					<input type="text" name="mbirth" maxlength="8" placeholder="'-'없이 입력해주세요!" required>
				</td>
			</tr>

			<tr>
				<td id="title">성별</td>
				<td>
					<input type="radio" name="mgender" value="M">남 
					<input type="radio" name="mgender" value="F">여
				</td>
			</tr>

			<tr>
				<td id="title">전화번호</td>
				<td>
					<input type="text" style="width: 50px" name="mphone" maxlength="4" placeholder="010" required>-
					<input type="text" style="width: 50px" name="mphone1" maxlength="4" placeholder="1234" required>-
					<input type="text" style="width: 50px" name="mphone2" maxlength="4" placeholder="1234" required>
				</td>
			</tr>

			<tr>
				<td id="title">주소</td>
				<td>
					<input style="width: 100px" type="text" id="sample6_postcode" placeholder="우편번호"> 
					<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
					<br>
					<input style="width: 300px" type="text" id="sample6_address" name="maddress" placeholder="주소" required> 
					<input style="width: 500px" type="text" id="sample6_address2" name="maddress2" placeholder="상세주소">
				</td>
			</tr>

			<tr>
				<td id="title">이메일</td>
				<td>
					<input type="text" name="memail" maxlength="50" required> @ <select
						id="url" name="memail2">
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
		<br> 
		<input type="submit" value="가입"> 
		<input type="button" value="취소" onclick="goPage()">
	</form>

	<a id="kakao-login-btn"></a>
	<a href="http://alpha-developers.kakao.com/logout"></a>
	<script type='text/javascript'>
	//카카오페이 결제 스크립트
	//kakao 스크립트 코드입력
	Kakao.init("30062fa3725e52ec70fe45415dcbe2ea");
	Kakao.Auth.createLoginButton({
		container: "#kakao-login-btn",
		success : function(authObj){
			console.log(JSON.stringify(authObj));
			var access_token = "";
			$.map(authObj, function(v,i){
				if(i == "access_token"){
					access_token = v;
				console.log(access_token);
				}
			});
			var obj = new Object();
			obj.access_token = access_token;
			
 		 	 $.ajax({
		 		url : "/kakao.do",
				headers : {
				'Content-Type' : 'application/json',
							},
				method : "post",
				data : JSON.stringify(obj),
				success : function(resMap) {
					$.each(JSON.parse(resMap), function(i,v){
						if(i == "next_redirect_pc_url"){
						console.log("++++++++++"+v);
						window.location.href = v;
						}
					});
				}
			});  
		},
		fail: function(err) {
			console.log(JSON.stringify(err));
		}
	})
</script>
</body>
</html>
