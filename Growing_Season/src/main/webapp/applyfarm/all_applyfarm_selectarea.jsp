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
      display:inline-table;
      margin: 5px 5px 5px 5px;
      cursor:pointer;
    }
    .farmsector div:hover{
    	background: #FF4500;
    }
    .selectbox {
      background: #FF4500;
      border: 1px solid #ccc;
      height: 25px;
      width: 25px;
      display:inline-table;
      margin: 5px 5px 5px 5px;
      cursor:pointer;
    }
</style>
<div class="newsletter">
	
		<div class="row">
			<div class="col-md-6 ab-text">
				<p><h4>지역을 선택하세요</h4></p>
				<select class="form-control" id="farmlocation" name="farmlocation" onChange="getList()" required>
					<option value=''>선택해주세요</option>
					<c:forEach items="${FARM_LIST}" var="farmlocation">
						<option value="${farmlocation}">${farmlocation}</option>
					</c:forEach>
				</select>
			</div>
			<div class="col-md-6 ab-text">
				<p><h4>농장을 선택하세요</h4></p>
				<select class="form-control" id="farmlist" name="farmlist" onChange="getArea()" required>
					
				</select>
			</div>
		</div>
		
		<form id="areaform"  method="post">
		<input type='hidden' class='fgseq-infrom' value=''>
		<input type='hidden' class='selectarea-infrom' value=''>
		</form>
			<div class="col-md-12">
				<div id = "farmarea" style="overflow:auto;display:inline-block;width:80%;">
				<table>		
					<tbody class="farmsector" id ="farmsector">
						
					</tbody>		
				</table>
				</div>
			</div>
			<div class="col-md-12">
				<div class="w3agile-button">
					<button class="btn btn-primary btn-lg" id="select" type="button"> 완료 </button>
					<button class="btn btn-danger btn-lg" type="button"> 취소 </button>
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
			for(var i=0;i<row;i++){
				console.log(areanum);
				$("#farmsector").append("<tr>");
				for(var j=0;j<col;j++){
					console.log(areanum);
					$("#farmsector").append(
							"<td><div class='box'><input type='hidden' class='num' id='"+areanum+"' value='"+areanum+"'></div></td>"
							);
					areanum++;
					}
				$("#farmsector").append("</tr>");
				}
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
    }

});       

$("#select").click(function(){
	var number = $(".selectbox").find(".num").attr('value');
	alert(number);
	
});

</script>