<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.my_button {
	display: inline-block;
	width: 200px;
	text-align: center;
	padding: 10px;
	background-color: #006BCC;
	color: #fff;
	text-decoration: none;
	border-radius: 5px;
}
</style>

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


</head>
<body>
	<h1>텃밭신청현황확인</h1>
	<div id="all"
		style="width: 80%; margin-top: 100px; margin-bottom: 500px;">
	
	
		<table>
			<tr>
				<td>
				
					<c:if test="${LVL_AGVO.awinner=='N'|| LVL_AGVO.awinner=='n'}">
	    				<h1>아직 추첨이 진행되지 않았습니다.</h1>
	    				<c:if test="${LVL_DOCURETURN=='Y'}">
	    					반려된 서류가 있습니다. 서류를 다시 제출해주시기 바랍니다.<br>
	    					사유는,
	    					[${LVL_LVL_DRETURNCAUSE}] 입니다.
	    					<a href="/applyGarden/user/applyGarden_step2.do" class="my_button">다시 제출하기</a>
	    				</c:if>	    					    				
  					</c:if>
  					 
    				<c:if test="${LVL_AGVO.awinner=='W'|| LVL_AGVO.awinner=='y'}">
    					<c:if test="${LVL_AGVO.pcode==null||LVL_AGVO.pcode=='입금대기'}">
		    				<h1>서울시텃밭 대상자에 선정되셨습니다.<br>
		    				기간 내에 결제를 진행해주시기 바랍니다.</h1>
		    				<a href="/applyGarden/user/applyGarden_payment.do" class="my_button">결제하러 가기</a>
		    				
		    				<div class="mail">
							<div class="w3ls-heading">
								<p class="sub two">신청하신 농장의 정보와 구획을 확인하실 수 있습니다</p>
							</div>
						
							<div class="agileits_mail_grids">
								<div class="col-md-5 agileits_mail_grid_left">
									<div>
						
										<form class="inputboxes" action="#" method="post">
										<div class="alert alert-warning" role="alert">
											<h2><strong>지역 : </strong> ${LVL_FGVO.fglocation}</h2>
										</div>
										<div class="alert alert-warning" role="alert">
											<h2><strong>농장이름 : </strong> ${LVL_FGVO.fgname}</h2>
										</div>
										<div class="alert alert-warning" role="alert">
											<h2><strong>주소 : </strong> ${LVL_FGVO.fgaddress}</h2>
										</div>
										<div class="alert alert-warning" role="alert">
											<h2><strong>농장주 : </strong> ${LVL_FGVO.fgmanager}</h2>
										</div>
										<div class="alert alert-warning" role="alert">
											<h2><strong>연락처 : </strong> ${LVL_FGVO.fgphone}</h2>
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
												${LVL_FGVO.fgguide}</li>
											<li><span class="glyphicon glyphicon-info-sign"	aria-hidden="true"></span>
												${LVL_FGVO.fgfeature}</li>
										</ul>
									</div>
								</div>
							<div class="col-md-12" style="user-select:none">
								<div id = "layer" style="overflow:auto;display:inline-block;width:90%;min-height:20%;max-height:500px;">
									<div id = "layer" style="display:inline-block;width:90%">${LVL_AGVO.year}년 회원님께서 신청하신 구획은 ${LVL_AGVO.aseq}번 구획입니다</div>
										<table style="margin-left: auto; margin-right: auto;">									
											<tbody class="farmsector" id ="farmsector" style="user-select:none;">
												
											</tbody>		
										</table>
								</div>
									<span class="blank"></span>
								</div>
							</div>
							<div class="w3agile-button">
								<form class="cancelForm" id="cancelForm" action="/myGarden/user/cancelGarden.do" method="post">
									<button class="btn btn-danger btn-lg" id="cancelBtn" type="button">신청취소</button>
									<input type="hidden" name = "apseq" value="${LVL_AGVO.apseq}">
								</form>
								</div>
							<div class="clearfix"></div>
						</div>
		    				
	    				</c:if>
	    				<c:if test="${LVL_AGVO.awinner=='입금확인'}">
		    				<h1>서울시텃밭 대상자에 선정되셨습니다.<br>
		    				입금을 완료했습니다.</h1>
		    				<div class="mail">
							<div class="w3ls-heading">
								<p class="sub two">신청하신 농장의 정보와 구획을 확인하실 수 있습니다</p>
							</div>
						
							<div class="agileits_mail_grids">
								<div class="col-md-5 agileits_mail_grid_left">
									<div>
						
										<form class="inputboxes" action="#" method="post">
										<div class="alert alert-warning" role="alert">
											<h2><strong>지역 : </strong> ${LVL_FGVO.fglocation}</h2>
										</div>
										<div class="alert alert-warning" role="alert">
											<h2><strong>농장이름 : </strong> ${LVL_FGVO.fgname}</h2>
										</div>
										<div class="alert alert-warning" role="alert">
											<h2><strong>주소 : </strong> ${LVL_FGVO.fgaddress}</h2>
										</div>
										<div class="alert alert-warning" role="alert">
											<h2><strong>농장주 : </strong> ${LVL_FGVO.fgmanager}</h2>
										</div>
										<div class="alert alert-warning" role="alert">
											<h2><strong>연락처 : </strong> ${LVL_FGVO.fgphone}</h2>
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
												${LVL_FGVO.fgguide}</li>
											<li><span class="glyphicon glyphicon-info-sign"	aria-hidden="true"></span>
												${LVL_FGVO.fgfeature}</li>
										</ul>
									</div>
								</div>
							<div class="col-md-12" style="user-select:none">
								<div id = "layer" style="overflow:auto;display:inline-block;width:90%;min-height:20%;max-height:500px;">
									<div id = "layer" style="display:inline-block;width:90%">${LVL_AGVO.year}년 회원님께서 신청하신 구획은 ${LVL_AGVO.aseq}번 구획입니다</div>
										<table style="margin-left: auto; margin-right: auto;">									
											<tbody class="farmsector" id ="farmsector" style="user-select:none;">
												
											</tbody>		
										</table>
								</div>
									<span class="blank"></span>
								</div>
							</div>
	    				</c:if>
						  
    				</c:if>
    				
    				<c:if test="${LVL_AGVO.awinner=='L'||LVL_AGVO.awinner=='l'}">
	    				<h1>추첨 결과, 서울시텃밭 대상자에 선정되지 않으셨습니다.<br>
	    				내년에 다시 신청해주시기 바랍니다. 감사합니다.</h1>
	    				<a href="" class="my_button">메인으로</a>
    				</c:if>
				</td>
			<tr>
		</table>
	</div>



</body>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2df129d5c1a6d664029148b1657caaa3&libraries=services,clusterer,drawing"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e7fc9c44a5ac37faf4a780ad23f42331"></script>
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


</html>