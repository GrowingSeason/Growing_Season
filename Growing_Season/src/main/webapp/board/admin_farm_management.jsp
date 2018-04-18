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
	<div class="row">
		<div class="span6">
			<h1 id="h1.-bootstrap-heading">친환경농장관리</h1>
		</div>
	</div>
	<div style="padding-bottom:5px;">
			<input type="button" class="btn btn-default" value="신청서 리스트" onClick="location.href='/alist.do'">
	</div>
	<br>
	<br>
	<div class="row">
	<div class="span16">
		<div style="text-align:center; border:3px solid black; float:left; margin:10px; width:400px; height:600px;">
			<br>
			<br>
			<br>
			<div class="span4">
				<div style="float:left; margin:20px;" >
					<span style="font-weight:bold">
						<font size="6" color="black" face="굴림">지역</font>
					</span>
				</div>
				<div style="float:right; margin:20px;">
					<select class="form-control" id="loc" style="width:150px">
						<option value="">선택해주세요</option>
						<c:forEach items="${LVL_FLOC}" var="vo">
							<option value="${vo.fglocation}">${vo.fglocation}</option>
						</c:forEach>
					</select>
				</div>
			</div>
				
			<br>
			<br>
			
			<div class="span4">
				<div style="float:left; margin:20px;" >
					<span style="font-weight:bold">
						<font size="6" color="black" face="굴림">농장이름</font>
					</span>
				</div>
				<div style="float:right; margin:20px;">
					<select class="form-control" id="name" style="width:150px">
					</select>
				</div>
			</div>
						
			<br>
			<br>
			<div class="span3">
				<div style="float:left; margin:20px;">
					<input type="button" class="btn btn-success" id="insert" style=" height:30pt; color:black" value="농장생성" onClick="location.href='/create.do'">
				</div>
				<div style="float:right; margin:20px;">
					<input type="button" class="btn btn-success" id="delete" style=" height:30pt; color:black" value="농장삭제">
				</div>
			</div>
		</div>
		<div style="border:3px solid black; float:right; margin:10px; width:700px; height:600px;">
			<div style="text-align:center; margin:10px">
					<div class="span6">
						<div class="row">
							<div class="span2">
								<input type="button" class="btn btn-info" id="detail" style=" height:30pt; color:black" value="농장상세" >
							</div>
							<div class="span2">
								<input type="button" class="btn btn-info" id="using" style=" height:30pt; color:black" value="이용자목록" >
							</div>
							<div class="span2">
								<input type="button" class="btn btn-info" id="area" style=" height:30pt; color:black" value="구획보기">
							</div>
						</div>
					</div>
			</div>
			<br>
			<br>
			
			<div class="fdetail" style="display:none">
				<form class="dform" action="/farmdelete.do" method="post">
				<input type="hidden" id="fgseq" name="fgseq" value="">
				</form>
				
				<form class="uform" action="/farmupdate.do" method="post">
				<input type="hidden" id="fgseqed" name="fgseq" value="">
					<div class="span2">
						<div style="float:right;">
							지역
						</div>
					</div>
					<div class="span4">
						<div id="dloc" style="float:right;">
						</div>
					</div>
				
					<div class="span2">
						<div  style="float:right;">
							농장이름
						</div>
					</div>
					<div class="span4">
						<div id="dname" style="float:right;">
						</div>
					</div>
					<div class="span2">
						<div style="float:right;">
							농장주소
						</div>
					</div>
					<div class="span4">
						<div id="daddress" style="float:right;">
						</div>
					</div>
					<div class="span2">
						<div style="float:right;">
							농장연락처
						</div>
					</div>
					<div class="span4">
						<div id="dphone" style="float:right;">
						</div>
					</div>
					<div class="span2">
						<div style="float:right;">
							농장관리인
						</div>
					</div>
					<div class="span4">
						<div id="dadmin" style="float:right;">
						</div>
					</div>
				</form>
				
				<br>
				<br>
				
					<div class="span3">
						<div style="float:right;">
							<input type="button" class="btn btn-default" id="edit" style="height:30pt; color:black" value="수정">
						</div>
					</div>
					<div class="span3">
						<div style="float:left;">
							<input type="button" class="btn btn-default" id="cancel" style="height:30pt; color:black" value="취소">
						</div>
					</div>
			</div>
			<div class="fusers" style="display:none">
				 <div style="width:650px; height:400px; padding:20px; padding-left:40px; padding-right:10px; overflow:auto;"> <!-- 회원리스트 테이블 부분 -->
				 		<form class="qwer" action="/assigncancel.do" method="post">
				 	<table class="table table-bordered" style="width:90%; height:450px; ">
				 		<thead>
					 		<tr>
					 			<th width="20%">회원번호</th>
					 			<th width="20%">회원이름</th>
					 			<th width="20%">회원아이디</th>
					 			<th width="20%">회원연락처</th>
					 			<th width="20%">체크박스</th>
					 		</tr>
				 		</thead>
				 		<!-- foreach부분 -->
				 		<tbody id="tr">
					 		<%-- <c:forEach items="${LVL_ULIST}" var="mvo">
						 		<tr>
						 			<td>${mvo.mseq}</td>
						 			<td>${mvo.mname}</td>
						 			<td>${mvo.mid}</td>
						 			<td>${mvo.mphone}</td>
						 			<td><input type="checkbox" value=""/></td>
						 		</tr>
					 		</c:forEach --%>
				 		</tbody>
				 		<!-- foreach 끝나는 부분 -->
				 	</table>
				 		</form>
				 </div>
				 <br>
				 <div class="span6">
					 <div class="row">
					 	<div class="span3">
					 		<input type="button" id="assigncancel" class="btn btn-default" style="float:right; height:30pt; color:black" value="배정취소">
					 	</div>
					 	<div class="span3">
					 		<input type="button" class="btn btn-default" style="float:left; height:30pt; color:black" value="취소">
					 	</div>
					 </div>
				 </div>
			</div>
			<div>
				<input type="hidden" id="fgcol" name="fgcol" value="">
				<input type="hidden" id="fgrow" name="fgrow" value="">
				<input type="hidden" id="fgtotalarea" name="fgtotalarea" value="">
				<div class="area" style="width:90%; height:450px; padding: 20px; overflow:auto;" >
					
				</div>
			</div>
		
		</div>
	</div>
	</div>
	</div>
   </section>

<script>
		$('#edit').click(function(){
			$('.uform').submit();
		});

		$('#delete').click(function(){
			$('.dform').submit();
		});
	
	  	$('#loc').change(function(){
	  	
	  		alert($(this).val());
	  		var data = {"fglocation":$("#loc option:selected").val()};
	  		
	  		$.ajax({
				url:"/flist.do",
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
						$("#name").append("<option value="+ v.fgseq + ">"+ v.fgname + "</option>");
					});
				}
			});
	  	});
	
	
	
	  	$('#name').change(function(){
	  		alert($(this).val())
			var data = {"fgseq":$("#name option:selected").val()};
	  		$("#fgseq").attr('value',$("#name option:selected").val());
	  		$("#fgseqed").attr('value',$("#name option:selected").val());
	  		
	  		$.ajax({
				url:"/detail.do",
				dataType:"json",
				headers: {
	                  "Content-Type" : "application/json"
	              },
				data: JSON.stringify(data),
				type:"post",
				success:function(result) {
					$(".fdetail").show();
					$('.fusers').hide();
			  		$('.area').hide();
					console.log(result.LVL_ELIST);
					$("#dloc").empty();
					$("#dname").empty();
					$("#daddress").empty();
					$("#dphone").empty();
					$("#dadmin").empty();
					$.each(result.LVL_ELIST, function(i,v){
						$("#dloc").append("<input type=text name='fglocation' value="+ v.fglocation +">");
						$("#dname").append("<input type=text name='fgname' value="+ v.fgname +">");
						$("#daddress").append("<input type=text name='fgaddress' value="+ v.fgaddress +">");
						$("#dphone").append("<input type=text name='fgphone' value="+ v.fgphone +">");
						$("#dadmin").append("<input type=text name='fgmanager' value="+ v.fgmanager +">");
					});
				}
			});
	  		
	  		$.ajax({
				url:"/arealist.do",
				headers: {
					"DataType" : "application/json",
	                "Content-Type" : "application/json"
	              },
				data: JSON.stringify(data),
				type:"post",
				success:function(result) {
					console.log("탄다");
					$('#fgcol').attr('value', result.fgcol);
					$('#fgrow').attr('value', result.fgrow);
					$('#fgtotalarea').attr('value', result.fgtotalarea);
					console.log(result.fgrow);
					console.log(result.fgcol);
					console.log(result.fgtotalarea);
				}
			});
	  		
	  		
	  	})
	  	$('#detail').click(function(){
  			$('.fdetail').show();
	  		$('.fusers').hide();
	  		$('.area').hide();
	  	});
	  	
	  	$('#using').click(function(){
	  		
	  		var data = new Object();
	  		data.fglocation =  $("#loc option:selected").val();
	  		data.fgname = $("#name option:selected").text();
	  		
	  		$.ajax({
				url:"/usinglist.do",
				headers: {
					"DataType" : "application/json",
	                "Content-Type" : "application/json"
	              },
				data: JSON.stringify(data),
				type:"post",
				success:function(result) {
					$('.fusers').show();
		  			$('.fdetail').hide();
		  			$('.area').hide();
					$('#tr').empty();
					$.each(result.LVL_ULIST, function(i,v){
						$("#tr").append("<tr>");
						$("#tr").append("<td>"+v.mseq+"</td>");
						$("#tr").append("<td>"+v.mname+"</td>");
						$("#tr").append("<td>"+v.mid+"</td>");
						$("#tr").append("<td>"+v.mphone+"</td>");
						$("#tr").append("<td><input type='checkbox' class='checkseq' name='arr' id='"+v.mseq+"'value='"+v.mseq+"'/></td>");
						$("#tr").append("</tr>");
					});
				}
			});
	  	});
	
	  	
	  	$('#area').click(function(){
	  		var data = new Object;
	  		data.fgseq = $("#name option:selected").val();
	  		var area = 1;
	  		var row = $('#fgrow').val();
	  		var col	= $('#fgcol').val();
	  		var total = $('#fgtotalarea').val();
	  		
	  		$('.area').show();
	  		$('.fdetail').hide();
	  		$('.fusers').hide();
	  		
	  		/* $.ajax({
				url:"/arealist.do",
				headers: {
					"DataType" : "application/json",
	                "Content-Type" : "application/json"
	              },
				data: JSON.stringify(data),
				type:"post",
				success:function(result) {
					console.log("탄다");
					$('#fgcol').attr(value, result.fgcol);
					$('#fgrow').attr(value, result.fgrow);
					$('#fgtotalarea').attr(value, result.fgtotalarea);
				}
			}); */
			$('.area').empty();
	  		for(i=0; i<row; i++){
				$('.area').append("<tr>")
				for(j=0; j<col; j++){
					if(area == total)
						break;
					else {
						$('.area').append("<td><div class='box'></div></td>");
					}
				}
				$('.area').append("</tr>");
				area++;				
			}
	  	});
	  	
	  	$('.box').click(function(){
	  		$(this).attr('class','selectbox');
	  	});
	  	
	  	var arr = [];
	  	
	  	$('#tr').on("click", ".checkseq" , function() {
	  		if($(this).is(":checked")){
	  		var b = $(this).val();
	  		}
	  	});
	  	
	  	$('#assigncancel').click(function(){
	  		$('.qwer').submit();
	  	});
	  	
	  	
</script>
