<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- body부 sample입니다. 복사해서 이름 명명규칙에 맞춰 바꿔주시고 하단 코딩하시면 되겟습니다 -->
<!-- sample처럼 div class 하나 잡아주시면 되고, 스크립트 및 jquery, jstl 바로 사용하시면 됩니다-->
<!-- 별도 js가 필요한 경우 필요한 js파일이나 cdn경로를 주시고 test후 충돌없으면 반영하겟습니다 -->
<style>




 

  .box {
      background: #FFD700;
      border: 1px solid #ccc;
      border-radius: 15%;
      height: 25px;
      width: 25px;
      display:inline-table;
      margin: 5px 5px 5px 5px;
      cursor:pointer;
      opacity:1;
    }
   .selectbox {
      background: #FF4500;
      border: 1px solid #ccc;
      border-radius: 15%;
      height: 25px;
      width: 25px;
      display:inline-table;
      margin: 5px 5px 5px 5px;
      cursor:pointer;
      opacity:1;
    }
    
   .areadybox {
   
      background: #d2d2d2;
      border: 1px solid #ccc;
      border-radius: 15%;
      height: 25px;
      width: 25px;
      display:inline-table;
      margin: 5px 5px 5px 5px;
      opacity:1;
    }
   .farmsector div:hover{
    	background: #FF4500;
    }
    
    .farmback {
    background: url(/images/farmback.jpg)no-repeat center;
    background-size: 100% 100%;
  	
    }
    .farmarea {
    overflow:auto;
    display:inline-block;
    width:80%;
    margin-top:10%;
    margin-bottom:10%;
    min-height:20%;
    max-height:500px;
    background-color:#ffffff;
  
	} 
	
	.farmarea ::-webkit-scrollbar {
	    width: 12px;
	}

	/* Track */
	.farmarea ::-webkit-scrollbar-track {
	    -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3); 
	    -webkit-border-radius: 10px;
	    border-radius: 10px;
	}
	 
	/* Handle */
	.farmarea ::-webkit-scrollbar-thumb {
	    -webkit-border-radius: 10px;
	    border-radius: 10px;
	    background: rgba(255,0,0,0.8); 
	    -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.5); 
	}
	.farmarea ::-webkit-scrollbar-thumb:window-inactive {
		background: rgba(255,0,0,0.4); 
	}

    
     }

    
</style>

<div class="newsletter" style="min-height:600px">
		<div class="w3ls-heading">
			<h2 class="h-two">친환경농장 신청 Step1</h2>
			<p class="sub two">신청하실 농장과 구획을 선택해주세요</p>
		</div>
	
<div class = "col-md-5">
	
		<div class="row">
			<div class="col-md-12 ab-text"  style="margin-top:15%; margin-bottom:15%;">
				<p><h4>지역을 선택하세요</h4></p>
				<select class="form-control" id="farmlocation" name="farmlocation" onChange="getList()" required>
					<option value=''>선택해주세요</option>
					<c:forEach items="${FARM_LIST}" var="farmlocation">
						<option value="${farmlocation}">${farmlocation}</option>
					</c:forEach>
				</select>
			</div>
			<div class="col-md-12 ab-text">
				<p><h4>농장을 선택하세요</h4></p>
				<select class="form-control" id="farmlist" name="farmlist" onChange="getArea()" required>
					
				</select>
			</div>
		</div>
	</div>
		<div class="w3ls-heading">
			<h2 class="h-two"></h2>
			
		</div>
		<div class = "col-md-7">	
		<div class="row">
			<div class="col-md-12" id = "farmback">
			
				<div id = "farmarea" style="overflow:auto;display:inline-block;width:80%;margin-top:10%;margin-bottom:10%;min-height:20%;max-height:500px;">
				<table style="margin-left: auto; margin-right: auto;background-color:#ffffff;opacity:0.5">		
					<tbody class="farmsector" id ="farmsector">
						
					</tbody>		
				</table>
				</div>
			</div>
		</div>
		</div>
	
		<div class="row">
			<div class="col-md-12">
				<form id="areaform" action="/applyFarm/all/writeForm.do" method="post">
				<input type='hidden' class='fgseq-infrom' name = "fgseq" value=''>
				<input type='hidden' class='selectarea-infrom' name = "areaseq" value=''>
				<input type='hidden' name = "apname" value='${PHONENUMBER}'>
				<input type='hidden' name = "apphone" value='${NAME}'>
						<div class="w3agile-button">
							<button class="btn btn-primary btn-lg" id="select" type="submit"> 완료 </button>
							<button class="btn btn-danger btn-lg" type="button"> 취소 </button>
						</div>
				</form>
			</div>
		</div>
		
	
</div>





<script>
function getList(){
	
	var location = {fglocation:$("#farmlocation option:selected").val()};
	$.ajax({
		url:"/applyFarm/all/selectFarm.do",
		dataType:"json",
		data:location,
		type:"post",
		success:function(result){
			
			$("#farmlist").empty();
			$("#farmlist").append("<option value=''>선택해주세요</option>");
			$.each(result, function(i,v){
				$("#farmlist").append("<option value='"+v.fgseq+"'>"+v.fgname+"</option>");
			});
		}
	});
}

function getArea(){

	var farm = {fgseq:$("#farmlist option:selected").val()};
	var farmseq = $("#farmlist option:selected").val();
	$(".fgseq-infrom").attr('value', farmseq);
	$("#farmback").attr('class', 'col-md-12 farmback')
	console.log(farm);
	$.ajax({
		url:"/applyFarm/all/selectArea.do",
		dataType:"json",
		data:farm,
		type:"post",
		success:function(result){
			console.log(result);
			console.log(result.fgcol);
			console.log(result.fgrow);
			console.log(result.fgtotalarea);
			
			var col = parseInt(result.fgcol);
			var row = parseInt(result.fgrow);
			var total = parseInt(result.fgtotalarea);
			var areanum = 1;
		
			$("#farmsector").empty()
			$.each(result.aready, function(i,v){
				if(i==0){
					if(v.areservation=='n'){
						$("#farmsector").append("<tr>");
						$("#farmsector").append(
								"<td><div class='areadybox'><input type='hidden' class='num' id='"+v.aseq+"' value='"+v.aseq+"'></div></td>"
							);
						}else{
						$("#farmsector").append(
								"<td><div class='box'><input type='hidden' class='num' id='"+v.aseq+"' value='"+v.aseq+"'></div></td>"
								);
						}
				}else{
					if(v.aseq % col != 0){
						if(v.aseq == total){
							if(v.areservation=='n'){
								console.log(v.areservation);
								$("#farmsector").append(
										"<td><div class='areadybox'><input type='hidden' class='num' id='"+v.aseq+"' value='"+v.aseq+"'></div></td>"
										);
								$("#farmsector").append("</tr>");
								return;
							}else{
								console.log(v.areservation);
								$("#farmsector").append(
										"<td><div class='box'><input type='hidden' class='num' id='"+v.aseq+"' value='"+v.aseq+"'></div></td>"
										);
								$("#farmsector").append("</tr>");
								return;
							}
						}else{
							if(v.areservation=='n'){
								console.log(v.areservation);
								$("#farmsector").append(
										"<td><div class='areadybox'><input type='hidden' class='num' id='"+v.aseq+"' value='"+v.aseq+"'></div></td>"
										);
							}else{
								console.log(v.areservation);
								$("#farmsector").append(										
										"<td><div class='box'><input type='hidden' class='num' id='"+v.aseq+"' value='"+v.aseq+"'></div></td>"
										);
							}
						}
					}else{
						if((v.areservation=='n')){
							console.log(v.areservation);
							$("#farmsector").append("</tr>");
							$("#farmsector").append(
									"<td><div class='areadybox'><input type='hidden' class='num' id='"+v.aseq+"' value='"+v.aseq+"'></div></td>"
									);
							$("#farmsector").append("<tr>");
						}else{
							console.log(v.areservation);
							$("#farmsector").append("</tr>");
							$("#farmsector").append(
									"<td><div class='box'><input type='hidden' class='num' id='"+v.aseq+"' value='"+v.aseq+"'></div></td>"
									);
							$("#farmsector").append("<tr>");							
						}
					}
					
				}
			});
		}
	});
}
$(".farmsector").on( "click" , "div", function() {              
    alert("클릭");
    if($(this).attr('class')=='box'){
    	$(".selectbox").attr('class', 'box');
    	$(this).attr('class','selectbox');
    	var number = $(".selectbox").find(".num").attr('value');
    	$(".selectarea-infrom").attr('value', number);
    	var test = $(".selectarea-infrom").attr('value');
    	var test2 = $(".fgseq-infrom").attr('value');
    	alert(test);
    	alert(test2);
    }else if($(this).attr('class')=='selectbox'){
    	$(this).attr('class','box')
    	$(".selectarea-infrom").attr('value', '');
    }else if($(this).attr('class')=='areadybox'){
    	alert("이미 예약된 구획입니다. 다른구획을 선택해주세요");
    }

});       

$("#select").click(function(){
	var number = $(".selectbox").find(".num").attr('value');
	alert(number);
	
});

</script>