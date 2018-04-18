<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- body부 sample입니다. 복사해서 이름 명명규칙에 맞춰 바꿔주시고 하단 코딩하시면 되겟습니다 -->
<!-- sample처럼 div class 하나 잡아주시면 되고, 스크립트 및 jquery, jstl 바로 사용하시면 됩니다-->
<!-- 별도 js가 필요한 경우 필요한 js파일이나 cdn경로를 주시고 test후 충돌없으면 반영하겟습니다 -->
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
				<h2 class="h-two">서울시텃밭 신청 Step2 - <small>서류를 첨부해주세요</small></h2>			
			</div>
		</div>
        <div class="row">
          <div class="span6 shadow">
            <h4>파일을 선택해주세요.</h4>
            <div align="center"><img alt="applyLevel" src="/images/applygarden_step2.png"></div>
            <form action="/applyGarden/user/documentInsert.do" enctype="multipart/form-data" method="post"  role="form" class="contactForm">
				<input type="hidden" name="mseq" value="${LVL_SESS_MSEQ}">
					<!--  -->
					<input type="hidden" name="fgseq" value="${LVL_FGSEQ}">
					<input type="hidden" name="apname" value="${LVL_MVO.mname}">
					<input type="hidden" name="apphone" value="${LVL_MVO.mphone}">
					<input type="hidden" name="apemail" value="${LVL_MVO.memail}">
					<input type="hidden" name="apbirth" value="${LVL_MVO.mbirth}">
					<input type="hidden" name="apdivision" value="${LVL_APDIVISION}">
					<!--  -->
		
					<input id="input_imgs" multiple="multiple" type="file" name="files" />
					<table>										
						<tr>
							<td>
								<div class="imgs_wrap"></div>
								
							</td>
						</tr>
		
						<tr>
							<td>
								<div class="input_wrap"></div>
							</td>
						</tr>
						
						<tr>
							<td>
							<a href="javascript:" onclick="fileUploadAction();"
										class="btn-large btn-info">파일찾기</a>
						
							</td>
						</tr>
						
						<tr>
							<td>
								<div id="nextButton" align="right">
									<!-- <input type="submit" class="my_button" value="다음단계로"> -->
								</div>
							</td>
						</tr>
					</table>
			    <div class="row">
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
              
                <h5 class="widgetheading" align="center">농장정보<span></span></h5>

                <ul class="contact-info">
                  <li><label style="font-size: 18px;">농장 주소 :</label>${LVL_FGVO.fgaddress}</li>
                  <li><label style="font-size: 18px;">농장주 :</label>${LVL_FGVO.fgmanager}</li>
                  <li><label style="font-size: 18px;">농장주 연락처 :</label>${LVL_FGVO.fgphone}</li>
                  <li><label style="font-size: 18px;">찾아오시는길 :</label>${LVL_FGVO.fgguide}</li>
                  <li><label style="font-size: 18px;">농장특징 :</label>${LVL_FGVO.fgfeature}</li>
                </ul>

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

</script>
