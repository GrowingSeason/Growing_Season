<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- body부 sample입니다. 복사해서 이름 명명규칙에 맞춰 바꿔주시고 하단 코딩하시면 되겟습니다 -->
<!-- sample처럼 div class 하나 잡아주시면 되고, 스크립트 및 jquery, jstl 바로 사용하시면 됩니다-->
<!-- 별도 js가 필요한 경우 필요한 js파일이나 cdn경로를 주시고 test후 충돌없으면 반영하겟습니다 -->
<style>
	.hidden{
		display:none;
	}
	.view{
		display:block;
	}
	.inputboxes input:hover {
    border-color: #ffae00;
    }

</style>

<form class="form-horizontal" style="margin-left:auto;margin-right:auto;width:75%;">
<div class="contanier">
	<div class="newsletter">
		<div class="w3ls-heading">
			<h2 class="h-two">비회원 휴대폰 인증</h2>
			<p class="sub two">친환경농장 비회원 신청은 휴대폰인증이 필요합니다</p>
		</div>
	</div>


  <div class="form-group">
    <label for="inputEmail3" class="col-sm-2 control-label">이름</label>
    <div class="col-sm-8">
      <input type="text" class="form-control" id="name" placeholder="이름을 입력해주세요">
    </div>
  </div>
  <div class="form-group">
    <label for="inputPassword3" class="col-sm-2 control-label">휴대폰 번호</label>
    <div class="col-sm-8">
      <input type="text" class="form-control" id="phoneNumber" placeholder="전화번호를 입력해 주세요" value=''>
    </div>
    <div class="col-sm-2">
    	 <div class="form-group">
 			<button type="button" class="btn btn-default" id="sendsmsauth">인증번호 발송</button>
  		</div>
    </div>
  </div>
  <div class="hidden form-group" id="hidden">
    <label for="inputEmail3" class="col-sm-2 control-label">인증번호</label>
    <div class="col-sm-8">
      <input type="text" class="form-control" id="authinput" placeholder="인증번호를 입력해주세요">
    </div>
    <div class="col-sm-2">
    	 <div class="form-group">
 			<button type="button" class="btn btn-default" id="smsauth">인증</button>
  		</div>
    </div>
  </div>
  

	
</div>

<div class="clearfix"></div>

<input type="hidden" class="authseq">
<div class="newsletter">
<div class="w3agile-button">
	<button class="btn btn-primary btn-lg" type="button">인증</button>
	<button class="btn btn-danger btn-lg" type="button">취소</button>
</div>
</div>
</form>



<script>

	$("#sendsmsauth").click(function() {
		alert("클릭");
		var test = $("#name").val();
		alert(test)
		
		if($("#name").val()==''){
			alert("이름을 입력해주세요");
			return;
		}
	
		$.ajax({
			url : "/applyFarm/all/smsauth.do",
			dataType : "json",
			data:{
				"phoneNumber":$("#phoneNumber").val()
			},
			type : "post",
			success : function(result) {
				if(result.authvalidate == 'y'){
					console(result.smsseq);
					$(".authseq").attr('value', result.smsseq);
					console($(".authseq").val());
				}
			}
		});
		
		$(".form-horizontal #hidden").attr("class", "view form-group");

	});
	
	$("#smsauth").click(function(){
		alert("클릭");
		var authNumber = $("#authinput").val();
		var phoneNumber = $("#phoneNumber").val();
		alert(authNumber);
		
		$.ajax({
			url : "/applyFarm/all/checkAuthNumber.do",
			dataType : "json",
			data:{
				"authNumber":authNumber,
				"phoneNumber":phoneNumber
			},
			type : "post",
			success : function(result) {
				if(result.authvalidate == 'y'){
					console.log(result.smsseq);
					$(".authseq").attr('value', result.smsseq);
					console.log($(".authseq").val());
					$(".form-horizontal :input").attr("disabled", true);
					
				}
			}
		});
	});
</script>
