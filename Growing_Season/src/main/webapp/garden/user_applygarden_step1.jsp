<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- body부 sample입니다. 복사해서 이름 명명규칙에 맞춰 바꿔주시고 하단 코딩하시면 되겟습니다 -->
<!-- sample처럼 div class 하나 잡아주시면 되고, 스크립트 및 jquery, jstl 바로 사용하시면 됩니다-->
<!-- 별도 js가 필요한 경우 필요한 js파일이나 cdn경로를 주시고 test후 충돌없으면 반영하겟습니다 -->
<style>

select{
    width: 350px;
    height: 40px;
    padding-left: 10px;
    font-size: 18px;
    color: black;
    border: 1px solid gray;
    border-radius: 3px;
    background: url(/img/selectbox.png) 180px center no-repeat;
    /*-webkit-appearance: none; 
   -moz-appearance: none;     
   appearance: none;*/          
}
select::-ms-expand {
   /*display: none;             화살표 없애기 for IE10, 11*/
}

	label{
		font-size: 15px;
	
	}
	
	.inputboxes input:hover {
	    border-color: #ffae00;
	}
	
	.agile-map div {
		min-height: 370px;
		width: 100%;
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
<script>
$(document).ready(function(){
	$("#fgDetailDiv").change(function() {
		
		$.ajax({
			url : "/findFarmAddress2.do",
			type : "POST",
			header: {
				"dataType" : "json",
			},
			data : {
				"fgDetailDiv" : $("#fgDetailDiv").val()
			},
			success : function(result) {
				console.log("성공했음");
				console.log(result);
				$("#fgLocation").empty();
				$("#fgAddress").empty();
				$("#fgName").empty();
				$("#fgLocation").append("<option value='미선택'>선택하세요</option>");
				$.each(result, function(i,v) {
					 $("#fgLocation").append("<option value='"+v+"'>"+v+"</option>");
	            });
			}
		});
	});
});

$(document).ready(function(){
	$("#fgLocation").change(function() {
		
		$.ajax({
			url : "/findFarmAddress3.do",
			type : "POST",
			header: {
				"dataType" : "json",
			},
			data : {
				"fgDivision" : "텃밭",
				"fgDetailDiv" : $("#fgDetailDiv").val(),
				"fgLocation" : $("#fgLocation").val()
			},
			success : function(result) {
				console.log("성공했음");
				console.log(result);
				$("#fgName").empty();
				$("#fgAddress").empty();
				$("#fgName").append("<option value='미선택'>선택하세요</option>");
				$.each(result, function(i,v) {
					 $("#fgName").append("<option value='"+v+"'>"+v+"</option>");
	            });
			}
		});
	});
});


$(document).ready(function(){
	$("#fgName").change(function() {
		
		$.ajax({
			url : "/findFarmAddress4.do",
			type : "POST",
			header: {
				"dataType" : "json",
			},
			data : {
				"fgDivision" : "텃밭",
				"fgDetailDiv" : $("#fgDetailDiv").val(),
				"fgLocation" : $("#fgLocation").val(),
				"fgName" : $("#fgName").val()
			},
			success : function(result) {
				console.log("성공했음");
				console.log(result);
				$("#fgAddress").empty();
				$("#openMap").empty();
				$("#fgAddress").append(result.fgaddress);
				$("#fgseq").val(result.fgseq);
				
				$("#apdivision").val(result.fgdetaildiv);
			}
		});
	});
});
</script>



	 <section id="inner-headline">
      <div class="container">
        <div class="row">
          <div class="span4">
            <div class="inner-heading">
              <h2>서울시텃밭 신청</h2>
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
				<h2 class="h-two">서울시텃밭 신청 Step1 - <small>신청서를 작성해주세요</small></h2>			
			</div>
		</div>
        <div class="row">
        
          <div class="span6 shadow">
            <h4>양식을 입력해주세요</h4>
            <form id="contactform" action="" method="post" role="form" class="contactForm">
            <div align="center"><img alt="applyLevel" src="/images/applygarden_step1.png"></div>
              <div class="row">
                <div class="span6 margintop10 field form-group">
                  <label>신청자명</label>	
                  <input type="text" name="apname" placeholder="이름을 입력해주세요" value='${LVL_MVO.mname}' required readonly>
                  <div class="validation"></div>
                </div>
                <div class="span6 margintop10 field form-group">
                  <label for="exampleInputEmail1">연락처</label>	
                  <input type="text" name="apphone" placeholder="연락처를 입력해주세요"  value='${LVL_MVO.mphone}' required readonly>
                  <div class="validation"></div>
                </div>
                <div class="span6 margintop10 field form-group">
                  <label for="exampleInputEmail1">주소</label>	
                  <input type="text" name="apaddress" placeholder="주소를 입력해주세요" value='${LVL_MVO.maddress}' required readonly>
                  <div class="validation"></div>
                </div>
                <div class="span6 margintop10 field form-group">
                  <label for="exampleInputEmail1">이메일</label>	
                  <input type="text" name="apemail" placeholder="이메일을 입력해주세요" value='${LVL_MVO.memail}'required readonly>
                  <div class="validation"></div>
                </div>
                <div class="span6 margintop10 field form-group">
                  <label for="exampleInputEmail1">생년월일</label>	
                  <input type="text" name="apbirth" placeholder="생일을 입력해주세요" value='${LVL_MVO.mbirth}'required readonly>
                  <div class="validation"></div>
                </div>
              </div>
            </form>
          </div>
          <div class="span4">
            <div class="clearfix"></div>
            <aside class="right-sidebar">
              <div class="widget">
              	<div class="row">
              	  <div class="span4 shadow">
              		<h6><br></h6>
              		<h4>텃밭을 선택해주세요</h4>
              		
		              <div class="row">
		                <div class="span6 margintop10 field form-group">
		                  <label for="exampleInputEmail1">유형</label>	
		                  <select name="fgDetailDiv" id="fgDetailDiv">
						<option value="미선택">선택하세요</option>
						<option value="실버">실버</option>
						<option value="다둥이">다둥이</option>
						<option value="다문화">다문화</option>
					</select> 
		                  <div class="validation"></div>
		                </div>
		                <div class="span6 margintop10 field form-group">
		                  <label for="exampleInputEmail1">지역</label>	
		                  	<select name="fgLocation" id="fgLocation">
							</select> 
		                  <div class="validation"></div>
		                </div>
		                <div class="span6 margintop10 field form-group">
		                  <label for="exampleInputEmail1">농장명</label>	
		                  	<select name="fgName" id="fgName" style="">
							</select>
		                  <div class="validation"></div>
		                </div>
		                <div class="span6 margintop10 field form-group">
		                  <label for="exampleInputEmail1">농장 주소</label>	
		                  	<h4><div id="fgAddress">
		                  		
							</div></h4>
		                  <div class="validation"></div>
		                </div>
		              </div>
		          </div>
             	</div>
             </div>
            </aside>
          </div>
        </div>
        <div class="row">
        	<div class="span12">
				<div class="pricing-box-plain">
					<div class="action">
						<form action="/applyGarden/user/applyGarden_step2.do" method="post">
						<input type="hidden" id="fgseq" name="fgseq" />
						<input type="hidden" id="apdivision" name="apdivision" />
						<button class="btn-large btn-info" id="select" type="submit"> 다음단계로 </button>
						<button class="btn-large btn-danger" type="button"> 취소 </button>
						</form>
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

</script>
