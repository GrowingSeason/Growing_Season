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
 <section id="inner-headline">
   <div class="container">
     <div class="row">
       <div class="span4">
         <div class="inner-heading">
         </div>
       </div>
       <div class="span8">            
       </div>
     </div>
   </div>
 </section>
 
 <section id="content"> <!-- 여기하단부터 수정하시고, 보여주실 화면은 <section id="content"></section> 으로 묶어주셔야 합니다-->
    <div class="container">
	<br>
		<div class="span6">
			<h1 id="h1.-bootstrap-heading">친환경농장생성</h1>
		</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<div class="row">
		<div class="left" style="border:3px solid black; text-align:center; float:left; margin:10px; width:500px; height:600px; ">
		
		<form class="ins" action="/farminsert.do" method="post">
			<div class="row" >
				<br>
				<br>
				
				<div class="span6">
					<div class="span2">
						<select class="form-control" id="division" name="fgdivision" style="width:150px">
							<option value="">선택해주세요</option>
							<option value="텃밭">텃밭</option>
							<option value="농장">농장</option>
						</select>
					</div>
					<div class="span2">
						<select class="form-control" id="detaildiv" name="fgdetaildiv" style="width:150px">
						</select>
					</div>
				</div>
			</div>
			<br>
			<div class="span6">
				<div class="span1">
					지역
				</div>
				<div class="span3">
					<input type="text" name="fglocation">
				</div>
			</div>
			
			<div class="span6">
				<div class="span1">
					농장이름
				</div>
				<div class="span3">
					<input type="text" name="fgname">
				</div>
			</div>
			
			<div class="span6">
				<div class="span1">
					농장주소
				</div>
				<div class="span3">
					<input type="text" name="fgaddress">
				</div>
			</div>
			
			<div class="span6">
				<div class="span1">
					관리인명
				</div>
				<div class="span3">
					<input type="text" name="fgmanager">
				</div>
			</div>
			<div class="span6">
				<div class="span1">
					관리인 연락처
				</div>
				<div class="span3">
					<input type="text" name="fgphone">
				</div>
			</div>
			<div class="span6">
				<div class="span1">
					농장특징
				</div>
				<div class="span3">
					<input type="text" name="fgfeature">
				</div>
			</div>
			<div class="span6">
				<div class="span1">
					찾아가는길
				</div>
				<div class="span3">
					<input type="text" name="fgguide" style="width:200px; height:100px;">
				</div>
			</div>
			<div class="span6" style="width: 100%; text-align:center; margin: 0%;">
				<div class="span1" style="width: 20%; margin-left: 0px;">
					<div>
						농장
					</div>
				</div>
				<div class="span1" style="width: 10%; margin-left: 0px;">
					<div>
						<input type="text" id="row" name="fgrow" style="width:40px">
					</div>
				</div>
				<div class="span1" style="width: 20%; margin-left: 0px;">
					<div>
						행 
					</div>
				</div>
				<div class="span1" style="width: 10%; margin-left: 0px;">
					<div>
						<input type="text" id="col" name="fgcol" style="width:40px">
					</div>
				</div>
				<div class="span1" style="width: 20%; margin-left: 0px;">
					<div>
						열 총 
					</div>
				</div>
				<div class="span1" style="width: 10%; margin-left: 0px;">
					<div>
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
				<div class="span6" style="width: 100%;margin-left: 0px;">
					<div>
						<input type="button" class="btn btn-success" id="insert" style="width:60pt; height:30pt; color:black" value="농장생성" >
						<input type="button" class="btn btn-success" id="cancel" style="width: 60pt; height: 30pt; color: black" value="취소" onClick="location.href='/manager.do'">
					</div>
				</div>
				
			</div>
			
	
			
		</div>
		<div class="right" style="border:3px solid black; float:left; margin:10px; width:640px; height:600px;">
			<div style="text-align:center; margin:10px">
				<div class="farm" style="height:570px; overflow:auto;">
				
				</div>
			</div>
		</div>
	</div>
	</div>
</section>

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
			$('.ins').submit();
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
			
			$('#col').unbind('keyup');
			$('#col').keyup(function() {
				$('.farm').empty();
				var col = $(this).val();
				$('#col').attr('value',col);
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
	
</script>
