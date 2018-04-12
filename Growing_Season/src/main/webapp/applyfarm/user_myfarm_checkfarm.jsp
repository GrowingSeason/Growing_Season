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
	user-select:none;
}

.layer .content {
	display: inline-block;
	vertical-align: middle;
	user-select:none;
	height: 100%;
	overflow:auto
}

.layer .blank {
	display: inline-block;
	width: 0;
	height: 100%;
	vertical-align: middle;
	user-select:none;
}
</style>

<div class="mail">


	<div class="w3ls-heading">
		<h2 class="h-two">농장신청현황</h2>
		<p class="sub two">신청하신 농장의 정보와 구획을 확인하실 수 있습니다</p>
	</div>

	<div class="agileits_mail_grids">
		<div class="col-md-5 agileits_mail_grid_left">
			<div>

				<form class="inputboxes" action="#" method="post">
				<div class="alert alert-warning" role="alert">
					<h2><strong>지역 : </strong> ${MY_FARM_INFO[0].fglocation}</h2>
				</div>
				<div class="alert alert-warning" role="alert">
					<h2><strong>농장이름 : </strong> ${MY_FARM_INFO[0].fgname}</h2>
				</div>
				<div class="alert alert-warning" role="alert">
					<h2><strong>주소 : </strong> ${MY_FARM_INFO[0].fgaddress}</h2>
				</div>
				<div class="alert alert-warning" role="alert">
					<h2><strong>농장주 : </strong> ${MY_FARM_INFO[0].fgmanager}</h2>
				</div>
				<div class="alert alert-warning" role="alert">
					<h2><strong>연락처 : </strong> ${MY_FARM_INFO[0].fgphone}</h2>
				</div>
			

				</form>
			</div>
		</div>
		<div class="col-md-7 agileits_mail_grid_right">
		
			<div class="agile-map">
				<div class="map" id="map"></div>
			</div>
			
			<div class="left-agileits">
				<ul>
					<li><span class="glyphicon glyphicon-home" aria-hidden="true"></span>
						${MY_FARM_INFO[0].fgguide}</li>
					<li><span class="glyphicon glyphicon-info-sign"	aria-hidden="true"></span>
						${MY_FARM_INFO[0].fgfeature}</li>
				</ul>
			</div>
		</div>
	<div class="col-md-12" style="user-select:none">
		<div id = "layer" style="overflow:auto;display:inline-block;width:90%;min-height:20%;max-height:500px;">
		<div id = "layer" style="display:inline-block;width:90%">${year.thisyear}년 회원님께서 신청하신 구획은 ${MY_FARM_INFO[0].aseq}번 구획입니다</div>
		
				<table style="margin-left: auto; margin-right: auto;">
					
					<tbody class="farmsector" id ="farmsector" style="user-select:none;">
						
					</tbody>		
				</table>
			</div>
			<span class="blank"></span>
		</div>
	</div>
	<div class="w3agile-button">
		<form class="cancelForm" id="cancelForm" action="/myFarm/user/cancelFarm.do" method="post">
			<button class="btn btn-danger btn-lg" id="cancelBtn" type="button">신청취소</button>
			<input type="hidden" name = "aseq" value="${MY_FARM_INFO[0].aseq}">
			<input type="hidden" name = "fgseq" value="${MY_FARM_INFO[0].fgseq}">					
		</form>
		</div>
	<div class="clearfix"></div>
</div>



<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2df129d5c1a6d664029148b1657caaa3&libraries=services,clusterer,drawing"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e7fc9c44a5ac37faf4a780ad23f42331"></script>
<script>

$(window).load(function(){
	
		$("#farmsector").empty();
		var row = ${MY_FARM_INFO[0].fgcol};
		var col = ${MY_FARM_INFO[0].fgrow};
		var total = ${MY_FARM_INFO[0].fgtotalarea}
		console.log(total);
		var areanum = 1;
		
		for(var i=0;i<row;i++){
		
			$("#farmsector").append("<tr>");
			for(var j=0;j<col;j++){
				
					if(${MY_FARM_INFO[0].aseq} == areanum){
						$("#farmsector").append(
								"<td><div class='selectbox' id='${MY_FARM_INFO[0].aseq}'><input type='hidden' class='num' value='${MY_FARM_INFO[0].aseq}'></div></td>"
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
		geocoder.addressSearch("${MY_FARM_INFO[0].fgaddress}", function(result, status){
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


