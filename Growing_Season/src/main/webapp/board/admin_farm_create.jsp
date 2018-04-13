<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
  .box {
      background: #228b22;
      border: 1px solid #ccc;
      border-radius: 15%;
      height: 25px;
      width: 25px;
      display:inline-table;
      margin: 5px 5px 5px 5px;
      cursor:pointer;
    }
</style>

	<br/>
		<div class="col-md-6">
			<h1 id="h1.-bootstrap-heading">친환경농장관리생성</h1>
		</div>
	<br/>
	<br/>
	<br/>
	<br/>
	<br/>
	<div class="total" style="border:1px solid black; float:left; margin:10px; width:100%; height:100%;">
		<div class="left" style="text-align:center; border:1px solid blue; float:left; margin:10px; width:400px; height:600px;">
		<form class="qwer" action="/farminsert.do" method="post">
			<div class="row">
				<div class="col-md-6" style="float:left;">
					<select class="form-control" id="division" name="fgdivision" style="width:150px">
						<option value="">선택해주세요</option>
						<option value="텃밭">텃밭</option>
						<option value="농장">농장</option>
					</select>
				</div>
				<div class="col-md-6">
					<select class="form-control" id="detaildiv" name="fgdetaildiv" style="width:150px">
					
					</select>
				</div>
			<br/>
			<br/>
			<br/>
			<br/>
				<div class="col-md-4">
					<div  style="float:right;">
						지역
					</div>
				</div>
				<div class="col-md-8">
					<div style="float:left;">
						<input type="text" name="fglocation">
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-4">
					<div  style="float:right;">
						농장이름
					</div>
				</div>
				<div class="col-md-8">
					<div style="float:left;">
						<input type="text" name="fgname">
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-4">
					<div style="float:right;">
						농장주소
					</div>
				</div>
				<div class="col-md-8">
					<div style="float:left;">
						<input type="text" name="fgaddress">
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-4">
					<div style="float:right;">
						관리인명
					</div>
				</div>
				<div class="col-md-8">
					<div style="float:left;">
						<input type="text" name="fgmanager">
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-4">
					<div style="float:right;">
						관리인 연락처
					</div>
				</div>
				<div class="col-md-8">
					<div style="float:left;">
						<input type="text" name="fgphone">
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-4">
					<div style="float:right;">
						농장특징
					</div>
				</div>
				<div class="col-md-8">
					<div style="float:left;">
						<input type="text" name="fgfeature">
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-4">
					<div style="float:right;">
						찾아가는길
					</div>
				</div>
				<div class="col-md-8">
					<div style="float:left;" >
						<input type="text" name="fgguide" style="width:200px; height:100px;">
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-2" >
					<div style="width:40px">
						농장
					</div>
				</div>
				<div class="col-md-2" >
					<div id="dadmin" >
						<input type="text" id="row" name="fgrow" style="width:40px">
					</div>
				</div>
				<div class="col-md-2">
					<div style="width:40px">
						행 
					</div>
				</div>
				<div class="col-md-2">
					<div id="dadmin" >
						<input type="text" id="col" name="fgcol" style="width:40px">
					</div>
				</div>
				<div class="col-md-2"> 
					<div style="width:40px">
						열 총 
					</div>
				</div>
				<div class="col-md-2">
					<div id="dadmin" >
						<input type="text" id="total" name="fgtotalarea" style="width:40px">
					</div>
				</div>
			</div>
			</form>
				
			<br/>
			<br/>
			<br/>
			<br/>
			
			<div class="row">
				<div class="col-md-6">
					<div>
						<input type="button" id="insert" style="width:60pt; height:30pt; color:black" value="농장생성" >
					</div>
				</div>
				<div class="col-md-6">
				<div>
					<input type="button" id="cancel" style="width: 60pt; height: 30pt; color: black" value="취소">
				</div>
			</div>
			</div>
			
	
			
		</div>
		<div class="right" style="border:1px solid red; float:left; margin:10px; width:805px; height:600px;">
			<div style="text-align:center; margin:10px">
				<div class="farm">
				
				</div>
			</div>
		</div>
	</div>

<script>
		/* var r;
		var oc = function() {
			var c = $(this).val();
			alert(c);
			var tot = $('#total').attr('value', r*c);
			
			console.log(tot);
		} */
		
		var area = 1;
		
		$('#insert').click(function() {
			$('.qwer').submit();
		});
		
		$('#division').change(function() {
			$('#detaildiv').empty();
			if($("#division option:selected").val() == ""){
				$('#detaildiv').append('<option value="">선택해주세요</option>');
				
			} else if ($("#division option:selected").val() == "농장") {
				$('#detaildiv').append('<option value="농장">농장</option>');
				
			} else {
				$('#detaildiv').append('<option value="실버">실버</option>');
				$('#detaildiv').append('<option value="다둥이">다둥이</option>');
				$('#detaildiv').append('<option value="다문화">다문화</option>');
			}
			
		});
		
		$('#row').keyup(function(){
			var row = $(this).val();
			$('#row').attr('value',row);
			alert(row);
			
			$('#col').unbind('keyup');
			$('#col').keyup(function() {
				$('.farm').empty();
				var col = $(this).val();
				$('#col').attr('value',col);
				alert(col);
				$('#total').attr('value', row*col);
				var tot = $('#total').val();
				for(i=0; i<row; i++){
					$('.farm').append("<tr>")
					for(j=0; j<col; j++){
						if(area == total)
							break;
						else {
							$('.farm').append("<td><div class='box'></div></td>");
						}
					}
					$('.farm').append("</tr>");
					area++;				
				}
			});
		});
	
		
		
	  	/* $('#loc').change(function(){
	  	
	  		alert($(this).val());
	  		var data = {"fglocation":$("#loc option:selected").val()};
	  		
	  		$.ajax({
				url:"/ajaxsearch.do",
				dataType:"json",
				headers: {
	                  "Content-Type" : "application/json"
	              },
				data: JSON.stringify(data),
				type:"post",
				success:function(result) {
					var htmlStr="";
					
					$("#name").empty();
					$("#name").append("<option>선택해주세요</option>");
					$.each(result.LVL_RLIST, function(i,v){
						console.log(v.fgname);
						$("#name").append("<option value="+v.fgseq+ ">"+ v.fgname + "</option>");
					});
				}
			});
	  	});
	
	
	
	  	$('#name').change(function(){
	  		alert($(this).val())
			var data = {"fgseq":$("#name option:selected").val()};
	  		
	  		$.ajax({
				url:"/ajaxsearch2.do",
				dataType:"json",
				headers: {
	                  "Content-Type" : "application/json"
	              },
				data: JSON.stringify(data),
				type:"post",
				success:function(result) {
					
					console.log(result.LVL_ELIST);
					$("#dloc").empty();
					$("#dname").empty();
					$("#daddress").empty();
					$("#dphone").empty();
					$("#dadmin").empty();
					$.each(result.LVL_ELIST, function(i,v){
						$("#dloc").append("<input type=text value="+ v.fglocation +">");
						$("#dname").append("<input type=text value="+ v.fgname +">");
						$("#daddress").append("<input type=text value="+ v.fgaddress +">");
						$("#dphone").append("<input type=text value="+ v.fgphone +">");
						$("#dadmin").append("<input type=text value="+ v.fgmanager +">");
					});
			
				}
			});
	  	}) */
	
</script>
