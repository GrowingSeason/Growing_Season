<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- body부 sample입니다. 복사해서 이름 명명규칙에 맞춰 바꿔주시고 하단 코딩하시면 되겟습니다 -->
<!-- sample처럼 div class 하나 잡아주시면 되고, 스크립트 및 jquery, jstl 바로 사용하시면 됩니다-->
<!-- 별도 js가 필요한 경우 필요한 js파일이나 cdn경로를 주시고 test후 충돌없으면 반영하겟습니다 -->
<style>

select {
	width: 100%;
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
</style>
<script>
$(document)
		.ready(
				function() {
					$("#fgDivision")
							.change(
									function() {

										$
												.ajax({
													url : "/findFarmAddress1.do",
													type : "POST",
													header : {
														"dataType" : "json",
													},
													data : {
														"fgDivision" : $(
																"#fgDivision")
																.val()
													},
													success : function(
															result) {
														console.log("성공했음");
														console.log(result);
														$("#fgDetailDiv")
																.empty();
														$("#fgLocation")
																.empty();
														$("#fgName")
																.empty();
														$("#fgAddress")
																.empty();
														$("#fgDetailDiv")
																.append(
																		"<option value='미선택'>선택하세요</option>");
														$
																.each(
																		result,
																		function(
																				i,
																				v) {
																			$(
																					"#fgDetailDiv")
																					.append(
																							"<option value='"+v+"'>"
																									+ v
																									+ "</option>");
																		});
													}
												});
									});
				});

$(document)
		.ready(
				function() {
					$("#fgDetailDiv")
							.change(
									function() {

										$
												.ajax({
													url : "/findFarmAddress2.do",
													type : "POST",
													header : {
														"dataType" : "json",
													},
													data : {
														"fgDetailDiv" : $(
																"#fgDetailDiv")
																.val()
													},
													success : function(
															result) {
														console.log("성공했음");
														console.log(result);
														$("#fgLocation")
																.empty();
														$("#fgAddress")
																.empty();
														$("#fgName")
																.empty();
														$("#fgLocation")
																.append(
																		"<option value='미선택'>선택하세요</option>");
														$
																.each(
																		result,
																		function(
																				i,
																				v) {
																			$(
																					"#fgLocation")
																					.append(
																							"<option value='"+v+"'>"
																									+ v
																									+ "</option>");
																		});
													}
												});
									});
				});

$(document)
		.ready(
				function() {
					$("#fgLocation")
							.change(
									function() {

										$
												.ajax({
													url : "/findFarmAddress3.do",
													type : "POST",
													header : {
														"dataType" : "json",
													},
													data : {
														"fgDivision" : $(
																"#fgDivision")
																.val(),
														"fgDetailDiv" : $(
																"#fgDetailDiv")
																.val(),
														"fgLocation" : $(
																"#fgLocation")
																.val()
													},
													success : function(
															result) {
														console.log("성공했음");
														console.log(result);
														$("#fgName")
																.empty();
														$("#fgAddress")
																.empty();
														$("#fgName")
																.append(
																		"<option value='미선택'>선택하세요</option>");
														$
																.each(
																		result,
																		function(
																				i,
																				v) {
																			$(
																					"#fgName")
																					.append(
																							"<option value='"+v+"'>"
																									+ v
																									+ "</option>");
																		});
													}
												});
									});
				});

$(document)
		.ready(
				function() {
					$("#fgName")
							.change(
									function() {

										$
												.ajax({
													url : "/findFarmAddress4.do",
													type : "POST",
													header : {
														"dataType" : "json",
													},
													data : {
														"fgDivision" : $(
																"#fgDivision")
																.val(),
														"fgDetailDiv" : $(
																"#fgDetailDiv")
																.val(),
														"fgLocation" : $(
																"#fgLocation")
																.val(),
														"fgName" : $(
																"#fgName")
																.val()
													},
													success : function(result){
														console.log(result.fgaddress);
														var geocoder = new daum.maps.services.Geocoder();
														var address = result.fgaddress;
														
														geocoder.addressSearch(address, function(result, status){
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
														$("#fgaddress").empty();
														$("#fgmanager").empty();
														$("#fgphone").empty();
														$("#fgguide").empty();
														$("#fgfeature").empty();
														
														
														$("#fgaddress").val(result.fgaddress);
														$("#fgmanager").val(result.fgmanager);
														$("#fgphone").val(result.fgphone);
														$("#fgguide").val(result.fgguide);
														$("#fgfeature").val(result.fgfeature);
														
														
													}
												});
									});
				});
</script>


<style>

.contact-info{
	font-size: 19px;

}


input[type=file] {
	display: none;
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
	
	
<style type="text/css">
input[type=file] {
	display: none;
}

.imgs_wrap {
	width: 560px;
	border: 2px solid #A8A8A8;
	margin-top: 30px;
	margin-bottom: 30px;
	padding-top: 10px;
	padding-bottom: 10px;
}

.imgs_wrap img {
	width: 160px;
	margin: 10px;
	
}
</style>

<script type="text/javascript">
	// 이미지 정보들을 담을 배열
	var sel_files = [];

	$(document).ready(function() {
		$("#input_imgs").on("change", handleImgFileSelect);
	});

	function handleImgFileSelect(e) {

		// 이미지 정보들을 초기화
		sel_files = [];
		//$(".imgs_wrap").empty();

		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);

		var index = 0;
		filesArr
				.forEach(function(f) {

					sel_files.push(f);

					var reader = new FileReader();
					reader.onload = function(e) {
						var html = "<a href=\"javascript:void(0);\" onclick=\"deleteImageAction("
								+ index
								+ ")\" id=\"img_id_"
								+ index
								+ "\"><img src=\"" + e.target.result + "\" data-file='"+f.name+"' class='selProductFile' title='"+f.name+"'></a>";
						$(".imgs_wrap").append(html);
						index++;

					}
					reader.readAsDataURL(f);

				});

		var html2 = "<input type=\"submit\" class=\"btn-large btn-danger\" value=\"신청서 제출\">";
		$("#nextButton").empty();
		$("#nextButton").append(html2);

	}

	function deleteImageAction(index) {
		console.log("index : " + index);
		console.log("sel length : " + sel_files.length);

		sel_files.splice(index, 1);

		var img_id = "#img_id_" + index;
		$(img_id).remove();
	}

	function zoomImageAction(index) {

	}

	function fileUploadAction() {
		console.log("fileUploadAction");
		$("#input_imgs").trigger('click');
	}

</script>

	

	 <section id="inner-headline">
      <div class="container">
        <div class="row">
          <div class="span4">
            <div class="inner-heading">
              <h2>농장정보 확인</h2>
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
				<h2 class="h-two">농장정보 확인 - <small>각 농장의 정보를 확인할 수 있습니다.</small></h2>			
			</div>
		</div>
        <div class="row">
          <div class="span4 shadow">
            <h4>농장을 선택해주세요.</h4>
            <div align="center">
					<label>유형</label> <select name="fgDivision" id="fgDivision">
						<option value="미선택">선택하세요</option>
						<c:forEach items="${LVL_FGDIVLIST}" var="fgdl">
							<option value="${fgdl}">${fgdl}</option>
						</c:forEach>

					</select>
				</div>

				<div align="center">
					<label>상세유형</label> <select name="fgDetailDiv" id="fgDetailDiv">
					</select>
					<div class="validation"></div>
				</div>
				<div align="center">
					<label for="exampleInputEmail1">지역</label> <select
						name="fgLocation" id="fgLocation">
					</select>
					<div class="validation"></div>
				</div>
				<div align="center">
					<label for="exampleInputEmail1">농장명</label> <select name="fgName"
						id="fgName">
					</select>
					<div class="validation"></div>
				</div>
            
          </div>
          <div class="span6">
            <div class="clearfix"></div>
            <aside class="right-sidebar">

              <div class="widget">
              	<div class="row">
              	<div class="span8">
             	<div id="map" style="width:auto;height:500px;"></div>
             	<br><br><br>
             	<h5 class="widgetheading" align="center">농장정보<span></span></h5>
                <ul class="contact-info" style="">
                  <li><label style="font-size: 18px;">농장 주소 : </label><input type="text" id="fgaddress" readonly="readonly" style="background-color: white; width: 100%"/> </li>
                  <li><label style="font-size: 18px;">농장주 : </label><input type="text" id="fgmanager" readonly="readonly" style="background-color: white;width: 100%"/></li>
                  <li><label style="font-size: 18px;">농장주 연락처 : </label><input type="text" id="fgphone"readonly="readonly" style="background-color: white;width: 100%"/></li>
                  <li><label style="font-size: 18px;">찾아오시는길 : </label><input type="text" id="fgguide"readonly="readonly" style="background-color: white;width: 100%"/></li>
                  <li><label style="font-size: 18px;">농장특징 : </label><input type="text" id="fgfeature"readonly="readonly" style="background-color: white;width: 100%"/></li>
                </ul>
             	</div>
             	</div>
              
                
				

              </div>
            </aside>
          </div>
        </div>
  	</div>
</section>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2df129d5c1a6d664029148b1657caaa3&libraries=services,clusterer,drawing"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e7fc9c44a5ac37faf4a780ad23f42331"></script>
<script>
$(window).load(function(){
	var geocoder = new daum.maps.services.Geocoder();
	geocoder.addressSearch("서울특별시", function(result, status){
		if (status === daum.maps.services.Status.OK) {
	        var coords = new daum.maps.LatLng(result[0].y, result[0].x);
	        console.log(result[0].y+","+ result[0].x);
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
