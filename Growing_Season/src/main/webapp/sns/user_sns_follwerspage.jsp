<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.net.URLEncoder"%> 

<!-- body부 sample입니다. 복사해서 이름 명명규칙에 맞춰 바꿔주시고 하단 코딩하시면 되겟습니다 -->
<!-- sample처럼 div class 하나 잡아주시면 되고, 스크립트 및 jquery, jstl 바로 사용하시면 됩니다-->
<!-- 별도 js가 필요한 경우 필요한 js파일이나 cdn경로를 주시고 test후 충돌없으면 반영하겟습니다 -->


<script>
	$(function() {
		function convertArrayToJson(formArray) { //serialize data function
			var returnArray = {};
			for (var i = 0; i < formArray.length; i++) {
				returnArray[formArray[i]['name']] = formArray[i]['value'];
			}
			return returnArray;
		}

		$("#follower").click(function() {
			alert($("#feseq").val());
			var jsonObjectData = {
					"feseq" : $("#feseq").val(),
					"fmseq" : $("#fmseq").val()  //글쓴이번호
				};
			$.ajax({
				type:"post",
				url:"/snsFollowersInsert.do",
				//data:jsonObjectData,
				headers: {
			        'Accept': 'application/json',
			        'Content-Type': 'application/json'
			    },
				dataType: "json",
				//data:JSON.stringify(jsonObjectData),
				data:// $.param(
              	 JSON.stringify(jsonObjectData),
              	success:function(result, textStatus, xhr) {
					console.log(result);
					 console.log(xhr.status);
					 
					var htmlStr = "";
					
					if(xhr.status == 200 && result.SNS_FOLLOW_IN == "del") {
						alert("팔로우 해제 되었습니다");
					} else if(xhr.status == 200 && result.SNS_FOLLOW_IN == "in") {
						alert("팔로우 되었습니다");
					}
				location.reload();
				}
			});
		});
	});
</script>

<style>
.day {
  font-size: 18px;
}
.month {
  font-size: 10px;
  text-transform: uppercase;
}s
</style>
<script>
$("#followerbtn").click(function() {
		$("#follower").show();
});
$("#followingbtn").click(function() {
	$("#following").show();
});
</script>

<section id="content">
	<!---728x90--->
	<div class="container">
	<input id="feseq" type="hidden" name="feseq" value="${SNS_DETAIL.feseq}"> 
	<input id="fmseq" type="hidden" name="fmseq" value="${SNS_DETAIL.mseq}"> 
	   <div class="row" align="center">
         <table border='1' width="800" height="200" >
            
            <tr align="center">
               <td rowspan="2" width="400"><img src='h.gif' width=""></td>
             
               <td colspan="2">
               <button id="followerbtn" class="btn animated infinite pulse btn-primary">
						<div class="day">${SNS_FOLLOWER_CNT}</div>
						<div class="month">Follower</div>
						</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<button id="followingbtn" class="btn animated infinite pulse btn-primary">
						<div class="day">${SNS_FOLLOWING_CNT}</div>
						<div class="month">Following</div>
						</button>
						</td>
            </tr>
           
            <tr>
               <td colspan="3">
               <div align="center">
               
                     <button class="btn btn-color" value="main페이지로" style="width:200px;">
                        <a href="/snsmain.do"><b><font color="white">main페이지로</font></b></a>
                     </button>
                 
            </div></td>
            <tr>
         </table>
      </div>
      <br>
	
		<div class="span10">
		<div id="mypage" class="row" align="center">
				<c:forEach var="vo" items="${SNS_FOLLOW_LIST}">
					<div class="span3">
					 	<a href="/snsdetail.do?feseq=${vo.feseq}">
					 	<img src="/uploads/${vo.feimgname}" style="width:300px; height:300px;"></a> <br>
						<br> <br> <br>
					</div>
				</c:forEach>
			</div>
			</div>


		<div class="span2">

			<aside class="right-sidebar" id="follower" style="display: none;">
				<div class="widget">

					<h5 class="widgetheading">팔로워</h5>

					<ul class="cat">
						<c:forEach var="vo" items="${SNS_FOLLOWER_LIST}">
							<li><i class="icon-angle-right"></i> <a href="#">${vo.fmid}</a></li>
						</c:forEach>
					</ul>
				</div>
			</aside>
			<aside class="right-sidebar" id="follower" style="display: none;">
				<div class="widget">

					<h5 class="widgetheading">팔로잉</h5>

					<ul class="cat">
						<c:forEach var="vo" items="${SNS_FOLLOWING_LIST}">
							<li><i class="icon-angle-right"></i> <a href="#">${vo.fmid}</a></li>
						</c:forEach>
					</ul>
				</div>

			</aside>
		</div>

	</div>
</section>


