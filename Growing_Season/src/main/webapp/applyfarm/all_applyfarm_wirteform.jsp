<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- body부 sample입니다. 복사해서 이름 명명규칙에 맞춰 바꿔주시고 하단 코딩하시면 되겟습니다 -->
<!-- sample처럼 div class 하나 잡아주시면 되고, 스크립트 및 jquery, jstl 바로 사용하시면 됩니다-->
<!-- 별도 js가 필요한 경우 필요한 js파일이나 cdn경로를 주시고 test후 충돌없으면 반영하겟습니다 -->
<style>
.inputboxes input:hover {
    border-color: #ffae00;
}
.agile-map div {
	min-height: 370px;
	width: 100%;
}
</style>

<div class="mail">
		
			
				<div class="w3ls-heading">
					<h2 class="h-two">친환경농장 신청 Step2</h2>
					<p class="sub two">신청서를 작성해주세요</p>
				</div>
			
			<div class="agileits_mail_grids">
					<div class="col-md-7 agileits_mail_grid_left">
						<div>
						<form class="inputboxes" action="/paymentSelect.do" method="post">
							<h4>신청자명</h4>
							<input type="text" name="apname" placeholder="이름을 입력해주세요" required>
							<h4>연락처</h4>
							<input type="text" name="apphone" placeholder="연락처를 입력해주세요" required>
							<h4>주소</h4>
							<input type="text" name="addr" placeholder="주소를 입력해주세요" required>
							<h4>이메일</h4>
							<input type="text" name="apemail" placeholder="이메일을 입력해주세요" required>
							<h4>생년월일</h4>
							<input type="text" name="apbirth" placeholder="생일을 입력해주세요" required>
							<h4>비밀번호</h4>
							<input type="text" name="pw" placeholder="Phone..." required>
							<h4>비밀번호확인</h4>
							<input type="text" name="pwcheck" placeholder="Phone..." required>
							<input type="hidden" name="mseq" value="">
							<input type="hidden" name="aseq" value="">
							<input type="hidden" name="fgseq" value="">
							<input type="hidden" name="year" value="">
						</form>
						</div>
					</div>
					<div class="col-md-5 agileits_mail_grid_right">
						<div class="agile-map">
							<div class="map" id="map"></div>
						</div>
						<div class="left-agileits">
							<h3>Address</h3>
								<ul>
									<li><span class="glyphicon glyphicon-home" aria-hidden="true"></span>${FARM_INFO.fgaddress}</li>
									<li><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>농장주 : ${FARM_INFO.fgmanager}</li>
									<li><span class="glyphicon glyphicon-earphone" aria-hidden="true"></span>${FARM_INFO.fgphone}</li>
								</ul>
						</div>
					</div>
						<div class="clearfix"></div>
						
				<div class="w3agile-button">
					<button class="btn btn-primary btn-lg" id="select" type="submit"> 완료 </button>
					<button class="btn btn-danger btn-lg" type="button"> 취소 </button>
				</div>
				</div>
		
			
		</div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2df129d5c1a6d664029148b1657caaa3&libraries=services,clusterer,drawing"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e7fc9c44a5ac37faf4a780ad23f42331"></script>
<script>
$(window).load(function(){
	var geocoder = new daum.maps.services.Geocoder();
	geocoder.addressSearch("${FARM_INFO.fgaddress}", function(result, status){
		if (status === daum.maps.services.Status.OK) {
	        var coords = new daum.maps.LatLng(result[0].y, result[0].x);
	        var container = document.getElementById('map');
	        var options = {
	        		center : coords,
	        		level : 5
	        	};
	        map = new daum.maps.Map(container, options);
	        
	        var marker = new daum.maps.Marker({
	            map: map,
	            position: coords
	        });
		}
		
	});
	
});

</script>
