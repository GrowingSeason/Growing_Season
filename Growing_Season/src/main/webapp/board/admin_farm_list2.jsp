<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- body부 sample입니다. 복사해서 이름 명명규칙에 맞춰 바꿔주시고 하단 코딩하시면 되겟습니다 -->
<!-- sample처럼 div class 하나 잡아주시면 되고, 스크립트 및 jquery, jstl 바로 사용하시면 됩니다-->
<!-- 별도 js가 필요한 경우 필요한 js파일이나 cdn경로를 주시고 test후 충돌없으면 반영하겟습니다 -->
<script src="https://code.jquery.com/jquery-3.3.1.js" type="text/javascript"></script>
<script type="text/javascript" src="/js/preview/jquery.gdocsviewer.min.js"></script>

<style>
.red {
	color : red;
	width:60pt; 
	height:30pt;
}

.black {
	color : black;
	width:60pt; 
	height:30pt;
}

 #preview_thumb{
                z-index: 9999;
                position:absolute;
                border:0px solid #ccc;
                background:#333;
                padding:1px;
                display:none;
                color:#fff;
            }
</style>
<script>
	
	$(function(){
		  $('.fbtn').click(function(){
		    var o = $(this).attr('id');
		  	alert(o);
		    if($(this).attr('value') == '반려') {
		    	$(this).attr('value','반려취소');
		    	$(this).css('color','red')
		    	$(this).css('width','60pt')
		    	$(this).css('height','30pt')
		    } else {
		    	$(this).attr('value','반려');
		    	$(this).css('color','black')
		    	$(this).css('width','60pt')
		    	$(this).css('height','30pt')
		    }
		  });
	});
	
	var xOffset = 10;
    var yOffset = 30;

    $(document).on("mouseover","a.thumbnail_test",function(e){ //마우스 오버시

    var thumbnailURL =  e.target.id;
    console.log(thumbnailURL);
 	  $("body").append("<p id='preview_thumb'><img src="+thumbnailURL+" width='400px' /></p>"); //보여줄 이미지를 선언                       
        $("#preview_thumb")
            .css("top",(e.pageY - xOffset) + "px")
            .css("left",(e.pageX + yOffset) + "px")
            .fadeIn("fast"); //미리보기 화면 설정 셋팅
    });
     
    $(document).on("mousemove","a.thumbnail_test",function(e){ //마우스 이동시
        $("#preview_thumb")
            .css("top",(e.pageY - xOffset) + "px")
            .css("left",(e.pageX + yOffset) + "px");
    });
     
    $(document).on("mouseout","a.thumbnail_test",function(){ //마우스 아웃시
        $("#preview_thumb").remove();
    });
	
	function preview(){
/* 		xOffset = 10;
		yOffset = 30;

		$("a.preview").hover(function(e){
			var thumbnailURL =  $(this).attr('id');	//첨부파일명
			$("div.bs-docs-example").append("<img id='preview' src='"+ thumbnailURL+"' alt='Image preview' width='400px' height='400px' />");
			$("#pdfPreview").css("top",(e.pageY - xOffset) + "px").css("left",(e.pageX + yOffset) + "px").fadeIn("fast");
		},
		function(){
			$("#preview").remove();
		}); */
		
		
		
		
		
	};
	
	
	/* $(document).ready(function() {
		preview();
	}); */
	
</script>
<div class="typo">
	<!---728x90--->
	<div class="container">

		<div class="page-header">
			<h3 class="bars">텃밭 신청자 리스트   신청서 : ${LVL_COUNT}개</h3>
		</div>

		<div class="bs-docs-example">
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>유형</th>
						<th>회원번호</th>
						<th>이름</th>
						<th>생년월일</th>
						<th>성별</th>
						<th>주소</th>
						<th>전화번호</th>
						<th>이메일</th>
						<th>첨부서류</th>
						<th>반려여부</th>
					</tr>
				</thead>
				<tbody>
				
				<c:forEach items="${LVL_LIST}" var="vo"> 
					<tr>
						<td>${vo.avo.apdivision}</td>
						<td>${vo.mseq}</td>
						<td>${vo.avo.apname}</td>
						<td>${vo.avo.apbirth}</td>
						<td>${vo.mgender}</td>
						<td>${vo.maddress}</td>
						<td>${vo.avo.apphone}</td>
						<td>${vo.avo.apemail}</td>
						<td>
							<c:forEach items="${vo.dvoList}" var="dvo">
						<%-- 		<a href="/uploads/${dvo.dfilename}" id="/uploads/thumbnail/${dvo.dfilename}.png" class="preview_thumb" >${dvo.dfilename}</a><br>
					 --%>		
							<a class="thumbnail_test" id="/uploads/thumbnail/${dvo.dfilename}.png" href="/uploads/${dvo.dfilename}">${dvo.dfilename}</a>
				</c:forEach>
						</td>
						<td><input type="button" class="fbtn" id="bbtn${vo.mseq}" style="width:60pt; height:30pt; color:black;" value="반려" ></td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="newsletter" style="height:50px;">
		${LVL_PAGING}<br>
		</div>
		<div class="newsletter">
			<input type="button" id="lotto" style="width:60pt; height:30pt; color:black;" value="추첨하기" onClick="location.href='/lotto.do'">
		</div>
	</div>
</div>