<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
</head>
<body>
	<div id="body" style="height: 1300px; margin: 20px; margin-right: 0px;" class="wthree_testimonials_grid_main">
		<h1 id="h1.-bootstrap-heading" style="color: green; margin-top: 50px;">
			서울시텃밭 신청<a class="anchorjs-link" href="#h1.-bootstrap-heading"><span
				class="anchorjs-icon"></span></a>
		</h1>
		
		<div style="align:center;"><img alt="applyLevel" src="/images/applygarden_step1.png">
		</div>
		<br>
		<form action="/applyGarden/user/applyGarden_step2.do" method="post">
		<input type="hidden" id="fgseq" name=fgseq />
		<input type="hidden" id="apdivision" name=apdivision />
				
		<table class="table table-striped"
			style="border-style: groove; width: 700px;">
			<tbody>
				<tr>
					<td align="center" style="width: 200px;"><h1>이름</h1></td>
					<td align="center" style="width: 500px;"><h1>${LVL_MVO.mname}</h1></td>					
				</tr>
				<tr>
					<td align="center" style="width: 200px;"><h1>전화번호</h1></td>
					<td align="center" style="width: 500px;"><h1>${LVL_MVO.mphone}</h1></td>
				</tr>
				<tr>
					<td align="center" style="width: 200px;"><h1>이메일</h1></td>
					<td align="center" style="width: 500px;"><h1>${LVL_MVO.memail}</h1></td>
				</tr>
				<tr>
					<td align="center" style="width: 200px;"><h1>생년월일</h1></td>
					<td align="center" style="width: 500px;"><h1>${LVL_MVO.mbirth}</h1></td>
				</tr>
				<tr>
				<td>유형
				</td>
					<td>
					<select name="fgDetailDiv" id="fgDetailDiv" style="width: 80px;">
						<option value="미선택">선택하세요</option>
						<option value="실버">실버</option>
						<option value="다둥이">다둥이</option>
						<option value="다문화">다문화</option>
					</select> 
					</td>
				</tr>
				<tr>
				<td>지역
				</td>
					<td>
					<select name="fgLocation" id="fgLocation" style="width: 80px;">
					</select> 
					</td>
				</tr>
				<tr>
					<td>농장명
					</td>
					<td>
					<select name="fgName" id="fgName" style="width: 80px;">
					</select>
					</td>
				</tr>
				<tr>
					<td>농장 주소</td>
					<td>
						<div id="fgAddress">
						
						</div>
					</td>
				</tr>

			</tbody>
			<tr>
			  <td colspan="2" align="right"><input type="submit" class="btn btn-default" value="다음단계로"></td>
			</tr>
		</table>
		
		</form>
	</div>

</body>
</html>