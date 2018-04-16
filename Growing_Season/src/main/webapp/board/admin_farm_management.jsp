<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



	<br/>
		<div class="col-md-6">
			<h1 id="h1.-bootstrap-heading">친환경농장관리</h1>
		</div>
	<br/>
	<br/>
	<br/>
	<br/>
	<br/>
	<div class="total" style="border:1px solid black; float:left; margin:10px; width:100%; height:100%;">
		<div class="left" style="text-align:center; border:1px solid blue; float:left; margin:10px; width:400px; height:600px;">
			<div class="row">
				<div class="col-md-6">
					<div style="float:right; margin:17px;" >
						<span style="font-weight:bold">
							<font size="6" color="black" face="굴림">지역</font>
						</span>
					</div>
				</div>
				<div class="col-md-6" >
					<div style="float:left; margin:20px;">
						<select class="form-control" id="loc" style="width:150px">
							<option value="">선택해주세요</option>
							<c:forEach items="${LVL_FLOC}" var="vo">
								<option value="${vo.fglocation}">${vo.fglocation}</option>
							</c:forEach>
						</select>
					</div>
				</div>
						
			</div>
				
			<br/>
			<br/>
			
			<div class="row">
				<div class="col-md-6">
					<div style="float:right; margin:17px;" >
						<span style="font-weight:bold">
							<font size="6" color="black" face="굴림">농장이름</font>
						</span>
					</div>
				</div>
				<div class="col-md-6" >
					<div style="float:left; margin:20px;">
						<select class="form-control" id="name" style="width:150px">
							<%-- <c:forEach items="${LVL_FNAME}" var="vo">
								<option>${vo.fgname}</option>
							</c:forEach> --%>
						</select>
					</div>
				</div>
						
			</div>
			<br/>
			<br/>
			
			<div>
				<input type="button" id="delete" style="width:60pt; height:30pt; color:black" value="농장삭제">
			</div>
			<br/>
			<br/>
	
			<div>
				<input type="button" id="insert" style="width:60pt; height:30pt; color:black" value="농장생성" onClick="location.href='/create.do'">
			</div>
		</div>
		<div class="right" style="border:1px solid red; float:left; margin:10px; width:805px; height:600px;">
			<div style="text-align:center; margin:10px">
				<div class="row">
					<div class="col-md-4">
						<div style="float:right;">
							<input type="button" id="fdetail" style="width:60pt; height:30pt; color:black" value="농장상세">
						</div>
					</div>
					<div class="col-md-4">
						<div>
							<input type="button" id="fusers"style="width:60pt; height:30pt; color:black" value="이용자목록">
						</div>
					</div>
					<div class="col-md-4" >
						<div style="float:left;">
							<input type="button" id="fdiv" style="width:60pt; height:30pt; color:black" value="구획보기">
						</div>
					</div>
				</div>
			</div>
			<br/>
			<br/>
			
			<form class="dform" action="/farmdelete.do" method="post">
			<input type="hidden" id="fgseq" name="fgseq" value="">
			</form>
			
			<form class="uform" action="/farmupdate.do" method="post">
			<input type="hidden" id="fgseqed" name="fgseq" value="">
			<div class="row">
				<div class="col-md-4">
					<div  style="float:right;">
						지역
					</div>
				</div>
				<div class="col-md-8">
					<div id="dloc" style="float:left;">
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
					<div id="dname" style="float:left;">
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
					<div id="daddress" style="float:left;">
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-4">
					<div style="float:right;">
						농장연락처
					</div>
				</div>
				<div class="col-md-8">
					<div id="dphone" style="float:left;">
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-4">
					<div style="float:right;">
						농장관리인
					</div>
				</div>
				<div class="col-md-8">
					<div id="dadmin" style="float:left;">
					</div>
				</div>
			</div>
			</form>
			<div class="row">
				<div class="col-md-6">
					<div style="float:right;">
						<input type="button" id="edit" style="width:60pt; height:30pt; color:black" value="수정">
					</div>
				</div>
				<div class="col-md-6">
					<div>
						<input type="button" id="cancel"style="width:60pt; height:30pt; color:black" value="취소">
					</div>
				</div>
			</div>
			
			
		</div>
	</div>

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
	  		$("#fgseq").attr('value',$("#name option:selected").val());
	  		$("#fgseqed").attr('value',$("#name option:selected").val());
	  		
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
						$("#dloc").append("<input type=text name='fglocation' value="+ v.fglocation +">");
						$("#dname").append("<input type=text name='fgname' value="+ v.fgname +">");
						$("#daddress").append("<input type=text name='fgaddress' value="+ v.fgaddress +">");
						$("#dphone").append("<input type=text name='fgphone' value="+ v.fgphone +">");
						$("#dadmin").append("<input type=text name='fgmanager' value="+ v.fgmanager +">");
					});
					/* var htmlStr="";
					$("#name").empty();
					$("#name").append("<option>선택해주세요</option>");
					$.each(result.LVL_RLIST, function(i,v){
						console.log(v.fgname);
						htmlStr += "<option value="+v.fgname+ ">"+ v.fgname + "</option>"
						$("#name").html(htmlStr);
					}); */
				}
			});
	  	})
	
</script>