<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/my.css">

<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
function checkValue()
        {
            if(!document.userInfo.mid.value){
                alert("아이디를 입력하세요.");
                return false;
            }
            
            if(!document.userInfo.mpw.value){
                alert("비밀번호를 입력하세요.");
                return false;
            }
            
            // 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
            if(document.userInfo.mpw.value != document.userInfo.mpwcheck.value ){
                alert("비밀번호를 동일하게 입력하세요.");
                return false;
            }
        }
        
        // 취소 버튼 클릭시 로그인 화면으로 이동
        function goPage() {
            location.href="/common.do";
        }
     </script>

<script type="text/javascript">
$(document).ready(function(){ 
	$("#id_check").click(function(){//중복체크 아이디 클릭이벤트
		$.ajax({
			url:"idcheck.jsp",//아이디 중복체크 할 페이지
			data:({
				mid:$("input[name=mid]").val()//파라메터로 userid이름으로 값은 사용자가 입력한 사용자 아이디를 저장
			}),
			success:function(data){//중복 확인후의 값은 data로 들어온다.
				if(jQuery.trim(data)=='YES'){
					$('#idmessage').html("<font color=red>사용가능 합니다.</font>");
					$('#idmessage').show();
					$('input[name=pwd]').focus();//비밀번호 입력칸으로 자동이동
				}else{
					$('#idmessage').html("<font color=red>이미 사용중인 아이디입니다.</font>");
					$('#idmessage').show();
				}
			}});
	});
});
</script>

</head>
<body>
	<h2>회원가입</h2>
	<hr>

	<form name="myForm" id="myForm" class="myForm"
		action="/memberInsert.do" enctype="multipart/form-data">
		<input type="hidden" id="ACTIONSTR" name="ACTIONSTR" value="INSERT">
		<table class="demo-table">
			<tr>
				<td id="title">아이디</td>
				<td><input type="text" name="mid" maxlength="50"> 
				<input type="button" value="중복검사">
				<a onclick="window.open('idcheck.jsp','win','width=450,height=200,
					menubar=no,scrollbars=yes');return false"></a>
				<div id="idmessage" style="display: none;"></div>
			</tr>

			<tr>
				<td id="title">비밀번호</td>
				<td><input type="password" name="mpw" maxlength="50"></td>
			</tr>

			<!-- <tr>
				<td id="title">비밀번호 확인</td>
				<td><input type="password" name="mpwcheck" maxlength="50">
				</td>
			</tr> -->

			<tr>
				<td id="title">이름</td>
				<td><input type="text" name="mname" maxlength="50"></td>
			</tr>

			<tr>
				<td id="title">생년월일</td>
				<td><input type="text" name="mbirth" maxlength="8"></td>
			</tr>

			<tr>
				<td id="title">성별</td>
				<td><input type="radio" name="mgender" value="M">남 <input
					type="radio" name="mgender" value="F">여</td>
			</tr>

			<tr>
				<td id="title">전화번호</td>
				<td><input type="text" name="mphone" /></td>
			</tr>

			<tr>
				<td id="title">주소</td>
				<td><input type="text" size="50" name="maddress" /></td>
			</tr>

			<tr>
				<td id="title">이메일</td>
				<td><input type="text" name="memail" maxlength="50">
			</tr>

			<tr>
				<td id="title">메일링 수신여부</td>
				<td><input type="radio" name="mmailreceive" value="Y" checked>예
					<input type="radio" name="mmailreceive" value="N">아니오</td>
			</tr>
		</table>
		<br> <input type="submit" value="가입"> <input
			type="button" value="취소" onclick="goPage()">
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
