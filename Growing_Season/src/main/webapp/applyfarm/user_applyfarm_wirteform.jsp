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
	}.shadow {
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
              <h2>사이드바없는 예제입니니다</h2>
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
				<h2 class="h-two">친환경농장 신청 Step2 - <small>신청서를 작성해주세요</small></h2>			
			</div>
		</div>
        <div class="row">
          <div class="span6 shadow">
            <h4>아래 양식에 맞게 빈칸없이 입력해주세요</h4>



            <form id="contactform" action="/applyFarm/user/payment.do" method="post" role="form" class="contactForm">

              <div id="sendmessage">Your message has been sent. Thank you!</div>
              <div id="errormessage"></div>

              <div class="row">
                <div class="span6 margintop10 field form-group">
                  <label for="apname">신청자명</label>	
                  <input type="text" name="apname" placeholder="이름을 입력해주세요" value='${MEMBER_DETAIL.mname}' required>
                  <div class="validation"></div>
                </div>
                <div class="span6 margintop10 field form-group">
                  <label for="apphone">연락처</label>	
                  <input type="text" name="apphone" placeholder="연락처를 입력해주세요" value='${MEMBER_DETAIL.mphone}'required>
                  <div class="validation"></div>
                </div>
                <div class="span6 margintop10 field form-group">
                  <label for="apaddr">주소</label>	
                  <input type="text" name="apaddr" placeholder="주소를 입력해주세요" value='${MEMBER_DETAIL.maddress}'required>
                  <div class="validation"></div>
                </div>
                <div class="span6 margintop10 field form-group">
                  <label for="apemail">이메일</label>	
                  <input type="text" name="apemail" placeholder="이메일을 입력해주세요" value='${MEMBER_DETAIL.memail}' required>
                  <div class="validation"></div>
                </div>
                <div class="span6 margintop10 field form-group">
                  <label for="apbirth">생년월일</label>	
                  <input type="text" name="apbirth" placeholder="생일을 입력해주세요" value='${MEMBER_DETAIL.mbirth}' required>
                  <div class="validation"></div>
                </div>
                	<input type='hidden' class='fgseq-infrom' name = "fgseq" value='${APPLY_FARM_VO.fgseq}'>
					<input type='hidden' class='selectarea-infrom' name = "aseq" value='${APPLY_FARM_VO.aseq}'>
              </div>
            </form>
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
                  <li><label>Address :</label>${FARM_INFO.fgaddress}</li>
                  <li><label>Phone :</label>${FARM_INFO.fgphone}</li>
                  <li><label>농장주 :</label>${FARM_INFO.fgmanager}</li>
                  <li><label>찾아오시는길 :</label>${FARM_INFO.fgguide}</li>
                  <li><label>농장소개 :</label>${FARM_INFO.fgfeature}</li>
                </ul>

              </div>
            </aside>
          </div>
        </div>
        <div class="row">
        	<div class="span12">
				<div class="pricing-box-plain">
					<div class="action">
						<button class="btn-large btn-info" id="select" type="button"> 완료 </button>
						<button onClick="location.href='/index.do'" class="btn-large btn-danger" type="button">취소</button>
					</div>
				</div>
			</div>
		</div>
  	</div>
  
</section>

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

var valuecheck = function(){
	
	var size = $(".forms div").children("input").size();
	var check = 0;
	
	$('.forms div').each(function(i){		
		if($(this).children("input").val()==''){
			check++;
			return false;
		}
	});

	return check;
} 

$("#select").click(function(){
	var chcek = valuecheck();
	if(chcek>0){
		console.log("공백이있어요");
	}else{
		console.log("공백이없어요");
		$(".contactForm").submit();
	}
});


</script>
