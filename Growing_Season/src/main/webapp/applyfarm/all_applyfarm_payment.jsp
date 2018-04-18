<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- body부 sample입니다. 복사해서 이름 명명규칙에 맞춰 바꿔주시고 하단 코딩하시면 되겟습니다 -->
<!-- sample처럼 div class 하나 잡아주시면 되고, 스크립트 및 jquery, jstl 바로 사용하시면 됩니다-->
<!-- 별도 js가 필요한 경우 필요한 js파일이나 cdn경로를 주시고 test후 충돌없으면 반영하겟습니다 -->
<style>
.hidden {
	display: none;
}

.view {
	display: block;
}

.inputboxes input:hover {
	border-color: #ffae00;
}

.shadow {
	-webkit-box-shadow: 6px 10px 27px 7px rgba(194, 194, 194, 0.6);
	-moz-box-shadow: 6px 10px 27px 7px rgba(194, 194, 194, 0.6);
	box-shadow: 6px 10px 27px 7px rgba(194, 194, 194, 0.6);
	padding: 5%;
	border: rgba(0, 0, 0, 0.2);
	background-color:#ffffff;
}
</style>
<section id="inner-headline">
	<div class="container">
		<div class="row">
			<div class="span4">
				<div class="inner-heading">
					<h2>결제</h2>
				</div>
			</div>
			<div class="span8"></div>
		</div>
	</div>
</section>
<section id="content">
	<div class="container">
		<div class="row">
			<div class="span11 shadow">
			 <form id="contactform" action="" method="post" role="form" class="contactForm">

				<div class="row">					
					<div class="span11">
					<div class="post-image">
						<div class="post-heading">
							<h3>결제페이지입니다. 결제수단을 선택해주세요</h3>
						<img src="/images/payments.png" alt="" width="100%"/>
						</div>
					</div>
					</div>
				</div>

				<div class="row">
					<div class="span11">
						<div class="pricing-box-plain">
							<div class="heading">
								<h4>아래의 결제수단 중 1개를 선택해주세요</h4>
							</div>
							<div class="desc">
								
								<div class="form-group">
									<div class="row">
										<label for="inputname" class="span2 control-label">이름</label>
										<div class="span7">
											<select class="form-control input-lg" id="payselect" name="payselect" onChange="payList()" required style="width:70%">
												<option value=''>선택해주세요</option>
												<option value=''>카드결제</option>
												<option value='kakao'>카카오페이</option>
												<option value=''>페이코</option>
												<option value=''>무통장입금</option>
											</select>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					</div>


					<div class="clearfix"></div>

				</form>
				
				<div class="row paybtn" style="display:none">
					<div class="span11">
						<div class="pricing-box-plain">
							<div class="action">
						
							<button class="btn-large btn-info paymentbtn" id="" type="button">결제</button>
							<button class="btn-large btn-danger" type="button">취소</button>
							</div>
						</div>
					</div>
				
				</div>
				
			</div>
		</div>
	</div>
</section>


<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script>
function payList(){
	
	if($("#payselect option:selected").val()=='kakao'){
		$(".paybtn").show(); 
		$(".paymentbtn").attr('id', 'payment');		
		console.log($(".paymentbtn").attr('id'));
	}
}
</script>

<script type='text/javascript'>
//카카오페이 결제 스크립트
//kakao 스크립트 코드입력

$(".paymentbtn").click(function(){
	console.log('클릭되나');
	Kakao.init("30062fa3725e52ec70fe45415dcbe2ea");
	Kakao.Auth.login({
		/* container : "#payment", */ 
		success : function(authObj) {
			console.log("들어왔다.");
			console.log(JSON.stringify(authObj));
			var access_token = "";
			$.map(authObj, function(v, i) {
				if (i == "access_token") {
					access_token = v;
					console.log(access_token);
				}
			});
			var obj = new Object();
			obj.access_token = access_token;

			$.ajax({
				url : "/kakaoForFarmNonJoinMember.do",
				headers : {
					'Content-Type' : 'application/json',
				},
				method : "post",
				data : JSON.stringify(obj),
				success : function(resMap) {
					$.each(JSON.parse(resMap), function(i, v) {
						if (i == "next_redirect_pc_url") {
							console.log("++++++++++" + v);
							window.location.href = v;
						}
					});
				}
			});
		},
		fail : function(err) {
			console.log(JSON.stringify(err));
			alert("실패");
		}
	});
});

</script>
