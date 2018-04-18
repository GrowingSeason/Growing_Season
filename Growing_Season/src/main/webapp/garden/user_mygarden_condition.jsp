<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- body부 sample입니다. 복사해서 이름 명명규칙에 맞춰 바꿔주시고 하단 코딩하시면 되겟습니다 -->
<!-- sample처럼 div class 하나 잡아주시면 되고, 스크립트 및 jquery, jstl 바로 사용하시면 됩니다-->
<!-- 별도 js가 필요한 경우 필요한 js파일이나 cdn경로를 주시고 test후 충돌없으면 반영하겟습니다 -->
<style>
.box {
	background: #228b22;
	border: 1px solid #ccc;
	height: 25px;
	width: 25px;
	display: inline-table;
	margin: 5px 5px 5px 5px;
}

.selectbox {
	background: #FF4500;
	border: 1px solid #ccc;
	height: 25px;
	width: 25px;
	display: inline-table;
	margin: 5px 5px 5px 5px;
}

.agile-map div {
	min-height: 370px;
	width: 100%;
}

.layer {
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	text-align: center;
	user-select: none;
}

.layer .content {
	display: inline-block;
	vertical-align: middle;
	user-select: none;
	height: 100%;
	overflow: auto
}

.layer .blank {
	display: inline-block;
	width: 0;
	height: 100%;
	vertical-align: middle;
	user-select: none;
}

.shadow {
	-webkit-box-shadow: 6px 10px 27px 7px rgba(194, 194, 194, 0.6);
	-moz-box-shadow: 6px 10px 27px 7px rgba(194, 194, 194, 0.6);
	box-shadow: 6px 10px 27px 7px rgba(194, 194, 194, 0.6);
	padding: 2%;
	border: rgba(0, 0, 0, 0.2);
	background-color: #ffffff;
}

.farmback {
	background: url(/images/farmback.jpg) no-repeat center;
	background-size: 100% 100%;
}
</style>
<section id="inner-headline">
	<div class="container">
		<div class="row">
			<div class="span4">
				<div class="inner-heading">
					<h2>나의 텃밭정보</h2>
				</div>
			</div>
			<div class="span8"></div>
		</div>
	</div>
</section>
<section id="content">
	<div class="container">
		<div class="row">
			<div class="page-header">
				<h2 class="h-two">
					텃밭신청현황<small> - 신청하신 텃밭의 정보와 구획을 확인하실 수 있습니다</small>
				</h2>
			</div>
		</div>
		<c:if test="${LVL_AGVO.awinner=='N'|| LVL_AGVO.awinner=='n'}">
			<h3>아직 추첨이 진행되지 않았습니다.</h3>
			<c:if test="${LVL_DOCURETURN=='Y'}">
	    					<h3><br><br>반려된 서류가 있습니다.<br>기간 내에 서류를 다시 제출해주시기 바랍니다.<br>
	    					사유는 [${LVL_DRETURNCAUSE}] 입니다.</h3>
	    					<div align="right" style="margin-right: 230px;">
	    					<form action="/applyGarden/user/applyGarden_step2.do" method="post">
	    					<input type="hidden" name="fgseq" value="${LVL_AGVO.fgseq}"/>
	    					<input type="hidden" name="apdivision" value="${LVL_AGVO.apdivision}"/>
	    					<input type="submit"class="btn-large btn-danger" value="다시 제출하기"/>
	    					</form>
	    					</div>
			</c:if>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			
		</c:if>
		<c:if test="${LVL_AGVO.awinner=='W'|| LVL_AGVO.awinner=='w'}">
			
			<div class="row">
				<div class="span7">
				<c:if test="${LVL_AGVO.pcode==null||LVL_AGVO.pcode=='입금대기'}">
				<h4 align="center">
					*서울시텃밭 대상자에 선정되셨습니다.<br> 기간 내에 결제를 진행해주시기 바랍니다.<br><br>
					<div align="center">
						<a id="kakao-login-btn"></a>
						<a href="http://alpha-developers.kakao.com/logout"></a>
					</div>
				</h4>
			</c:if>
			<c:if test="${LVL_AGVO.pcode=='입금확인'}">
				<h4 align="center">
					*서울시텃밭 대상자에 선정되셨습니다.<br> 입금이 완료되어 텃밭 이용이 가능합니다.
				</h4>
			</c:if>
					<h4 align="center">신청하신 텃밭의 정보입니다. 구획번호 : ${LVL_AGVO.aseq}</h4>
					<div class="span6 farmback">
						<div id="farmarea"
							style="overflow: auto; display: inline-block; width: 80%; margin: 10%; min-height: 20%; max-height: 500px;">
							<table
								style="margin-left: auto; margin-right: auto; background: rgba(0, 0, 0, 0.4); opacity: 0.9">
								<tbody class="farmsector" id="farmsector">

								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="span4">
					<div class="clearfix"></div>
					<aside class="right-sidebar">

						<div class="widget">
							<div class="row">
								<div class="span4">
									<div id="map" style="width: auto; height: 300px;"></div>
								</div>
							</div>

							<h5 class="widgetheading">
								농장정보<span></span>
							</h5>

							<ul class="contact-info">
								<li><label>지역 :</label>${LVL_FGVO.fglocation}</li>
								<li><label>농장이름 :</label>${LVL_FGVO.fgname}</li>
								<li><label>주소 :</label>${LVL_FGVO.fgaddress}</li>
								<li><label>농장주 :</label>${LVL_FGVO.fgmanager}</li>
								<li><label>연락처 :</label>${LVL_FGVO.fgphone}</li>
							</ul>

						</div>
					</aside>
				</div>
			</div>
			<form class="cancelForm" id="cancelForm"
				action="/myGarden/user/cancelGarden.do" method="post">
				<div class="row">
					<div class="span12">
						<div class="pricing-box-plain">
							<div class="action">
								<button class="btn-large btn-danger" id="cancelBtn">신청취소
								</button>
								<input type="hidden" name="apseq" value="${LVL_AGVO.apseq}">
							</div>
						</div>
					</div>
				</div>
			</form>

		</c:if>

		<c:if test="${LVL_AGVO.awinner=='L'||LVL_AGVO.awinner=='l'}">
			<h3>
				추첨 결과, 서울시텃밭 대상자에 선정되지 않으셨습니다.<br> 내년에 다시 신청해주시기 바랍니다. 감사합니다.
			</h3>
			<a href="" class="my_button">메인으로</a>
		</c:if>
	

	</div>

</section>


<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>


<script type='text/javascript'>
		//카카오페이 결제 스크립트
		//kakao 스크립트 코드입력
		Kakao.init("d0f737f6979d3541fe696ca5b369fa91");
		Kakao.Auth.createLoginButton({
			container : "#kakao-login-btn",
			success : function(authObj) {
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
					url : "/kakaoForGarden.do",
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
			}
		})
	</script>

<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2df129d5c1a6d664029148b1657caaa3&libraries=services,clusterer,drawing"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e7fc9c44a5ac37faf4a780ad23f42331"></script>
<script>

$(window).load(function(){
	
		$("#farmsector").empty();
		var row = ${LVL_FGVO.fgcol};
		var col = ${LVL_FGVO.fgrow};
		var total = ${LVL_FGVO.fgtotalarea}
		console.log(total);
		var areanum = 1;
		
		for(var i=0;i<row;i++){
		
			$("#farmsector").append("<tr>");
			for(var j=0;j<col;j++){
				
					if(${LVL_AGVO.aseq} == areanum){
						$("#farmsector").append(
								"<td><div class='selectbox' id='${LVL_AGVO.aseq}'><input type='hidden' class='num' value='${LVL_AGVO.aseq}'></div></td>"
								);
						
						if(areanum == total){
							break;
						}
						
					}else{
						$("#farmsector").append(
								"<td><div class='box'></div></td>"
								);
						if(areanum == total){
							break;
						}
					}
					
					areanum++;
				
					
				}
			$("#farmsector").append("</tr>");
		
		}
		
		var geocoder = new daum.maps.services.Geocoder();
		geocoder.addressSearch("${LVL_FGVO.fgaddress}", function(result, status){
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

$(".cancelForm #cancelBtn").click(function(){
	$(".cancelForm").submit();
})

</script>


