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
}	.shadow {
	-webkit-box-shadow: 6px 10px 27px 7px rgba(194, 194, 194, 0.6);
	-moz-box-shadow: 6px 10px 27px 7px rgba(194, 194, 194, 0.6);
	box-shadow: 6px 10px 27px 7px rgba(194, 194, 194, 0.6);
	padding:2%;
	border: rgba(0, 0, 0, 0.2);
	background-color:#ffffff;
	}
    .farmback {
    background: url(/images/farmback.jpg)no-repeat center;
    background-size: 100% 100%;
  	
     }
</style>
	 <section id="inner-headline">
      <div class="container">
        <div class="row">
          <div class="span4">
            <div class="inner-heading">
              <h2>나의 농장정보</h2>
            </div>
          </div>
          <div class="span8">            
          </div>
        </div>
      </div>
    </section>
 <section id="content">
    <div class="container">
		<div class="row">
			<div class="page-header">
				<h2 class="h-two">농장신청현황<small> - 신청하신 농장의 정보와 구획을 확인하실 수 있습니다</small></h2>			
			</div>
		</div>
        <div class="row">
          <div class="span7">
            <h4>신청하신 농장의 정보입니다</h4>


			<div class="span6 farmback">
            <div id = "farmarea" style="overflow:auto;display:inline-block;width:80%;margin:10%;min-height:20%;max-height:500px;">
				<table style="margin-left: auto; margin-right: auto;background: rgba(0, 0, 0, 0.4);opacity:0.9">		
					<tbody class="farmsector" id ="farmsector">
						
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
             	<div id="map" style="width:auto;height:300px;"></div>
             	</div>
             	</div>
              
                <h5 class="widgetheading">농장정보<span></span></h5>

                <ul class="contact-info">
                  <li><label>지역 :</label>${MY_FARM_INFO[0].fglocation}</li>
                  <li><label>농장이름 :</label>${MY_FARM_INFO[0].fgname}</li>
                  <li><label>주소 :</label>${MY_FARM_INFO[0].fgaddress}</li>
                  <li><label>농장주 :</label>${MY_FARM_INFO[0].fgmanager}</li>
                  <li><label>연락처 :</label>${MY_FARM_INFO[0].fgphone}</li>
                </ul>

              </div>
            </aside>
          </div>
        </div>
		<form class="cancelForm" id="cancelForm" action="/myFarm/user/cancelFarm.do" method="post">
        <div class="row">
        	<div class="span12">
				<div class="pricing-box-plain">
					<div class="action">
						<button class="btn-large btn-danger" type="button"> 신청취소 </button>
						<input type="hidden" name = "aseq" value="${MY_FARM_INFO[0].aseq}">
						<input type="hidden" name = "fgseq" value="${MY_FARM_INFO[0].fgseq}">	
					</div>
				</div>
			</div>
		</div>
		</form>				
  	</div>
  
</section>
  


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


