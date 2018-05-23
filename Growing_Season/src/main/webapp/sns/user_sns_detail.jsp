<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.net.URLEncoder"%> 

<style>
#wrapper
{
background-color: white;
}
</style>



<section id="content" style="background-color: white;">
	<!---728x90--->
	<div class="container" style="background-color: white;">
	<div class="row" style="border:3px solid ForestGreen;">
			<div class="span10" align="center">
            <input id="fmseq" type="hidden" name="fmseq" value="${SNS_DETAIL.mseq}">
			<input id="feseq" type="hidden" name="feseq" value="${SNS_DETAIL.feseq}">
         <table width="800" height="200">
            <tr align="center">
               <td rowspan="5" width="400"><img src="/uploads/${SNS_IMAGE_LIST.feimgname}" width="100%"></td>
             
               <td style="padding-top: 15px;">
               <button id="followerbtn" class="btn animated infinite pulse btn-primary">
						<div>${SNS_FOLLOWER_CNT}</div>
						<div>Follower</div>
						</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<button id="followingbtn" class="btn animated infinite pulse btn-primary">
						<div>${SNS_FOLLOWING_CNT}</div>
						<div>Following</div>
				</button>
				
				</td>
				</tr>
				<tr align="center">
				<td style="padding-top: 15px; padding-bottom: 15px;">
				<div class="like">
				
				<button class='icon-fighter-jet animated infinite pulse btn-color'
					onClick='location.href="/snsFollowerspage.do?feseq=${SNS_DETAIL.feseq}&fmseq=${SNS_DETAIL.mseq}"'>놀러가기</button>
				&nbsp;&nbsp;
				<c:choose>
				<c:when test="${SNS_LIKE == 'on'}">
				<button id="snslike" style="display: show;"
					class='icon-heart animated infinite pulse btn-color'>${SNS_LIKE_CNT}</button>
					</c:when>
				</c:choose>
				<c:choose>
				<c:when test="${SNS_LIKE == 'off'}">
				<button id="snslike" style="display: show;"
					class='icon-heart-empty animated infinite pulse btn-color'>${SNS_LIKE_CNT}</button>
					</c:when>
				</c:choose>
				</div>
				</td>
				</tr>
			  <tr style="padding-bottom: 15px;">
               <td>
               <div align="center">
               ${SNS_DETAIL.fecon}
            </div></td>
            </tr>
            <tr>
				<td>
				<c:choose>
					<c:when test="${LVL_SESS_MSEQ == SNS_DETAIL.mseq}">
						<a href="#testModal" class="btn btn-color pull-right"
							data-toggle="modal">수정</a>
						<button class='btn btn-warning pull-right'
							onClick='location.href="/snsFeedDelete.do?feseq=${SNS_DETAIL.feseq}"'>삭제</button>
					</c:when>
				</c:choose>
				<c:choose>
					<c:when test="${LVL_SESS_MSEQ != SNS_DETAIL.mseq}">
						<button id="fdreasen" class="btn btn-color pull-right">게시글 신고</button>
					</c:when>
				</c:choose>
				<form class="freason" action='/snsfdeclarationInsert.do' method='post'>
					<input type='hidden' name='feseq' value='${SNS_DETAIL.feseq}'>
						<div>
							<input type='text' id='fdcon'
								style='display: none; height: 10px; width: 400px; margin: 25px 20px 75px;'
								placeholder='feed 신고이유를 적어주세요' name='fdcon' value=''>
							<button id="btnfreason" class='btn btn-color'
								onClick='fdreason()' style="display: none;">확인</button>
						</div>
				</form>
				
				<form action="/snscommentInsert.do" class="commentInsert" method='post'>
					<input type="hidden" name="feseq" value="${SNS_DETAIL.feseq}">
					<c:choose>
						<c:when test="${LVL_SESS_MSEQ > 0}">
							<label for="ex_input">댓글</label>
							<input type="text"
								style="display: inline; height: 10px; width: 400px; margin: 15px 10px 10px;"
								placeholder="댓글을 작성 해주세요" name="sccon" value="">
							<input class="" type="button" value="입력" onClick="goInsert()">
						</c:when>
					</c:choose>
					</form>
					<c:choose>
						<c:when test="${LVL_SESS_MSEQ == null}">
						<label for="ex_input">댓글</label>
							<input type="text"
								style="display: inline; height: 10px; width: 400px; margin: 15px 10px 60px;"
								placeholder="댓글 작성을 위해 로그인 해주세요" id="comm" name="sccon" value="">
								</c:when>
					</c:choose>
					</td>
				</tr>
            <tr>
               <td>
               <table class="table">
							<c:forEach var="vo" items="${SNS_COMMENT_LIST}">
								<tr>
									<td>${vo.sccon}</td>
									<td>${vo.scregdate}</td>
									<c:choose>
										<c:when test="${LVL_SESS_MSEQ == vo.mseq}">
											<td style="cursor: pointer;">
											<button id="update" class="btn btn-color">수정</button>
											<td style="cursor: pointer;">
											<a href="/snsCommentDelete.do?scseq=${vo.scseq}&feseq=${vo.feseq}">삭제</a>
											</td>
										</c:when>
									</c:choose>
									<td><c:choose>
											<c:when test="${LVL_SESS_MSEQ != vo.mseq}">
												<button id="cdreasen" class="btn btn-color">댓글 신고</button>
											</c:when>
										</c:choose></td>
								</tr>
								<form class="reason" action='/snscdeclarationInsert.do'
									method='post'>
									<input id="scseq" type='hidden' name='scseq' value='${vo.scseq}'>
									<input type='hidden' name='feseq' value='${SNS_DETAIL.feseq}'>
									<div>
										<input type='text' id='cdcon'
											style='display: none; height: 10px; width: 400px; margin: 25px 20px 75px;'
											placeholder='reply 신고이유를 적어주세요' name='cdcon' value=''>
										<button id="btncreason" class='btn btn-color'
											onClick='creason()' style="display: none;">확인</button>
									</div>
								</form>
								<form class="cdupdate" action='/snsCommentupdate.do'
									method='post'>
									<input id="scseq" type='hidden' name='scseq' value='${vo.scseq}'>
									<input type="hidden" name="feseq" value="${SNS_DETAIL.feseq}">
									<div>
										<input type='text' id='sccon'
											style='display: none; height: 10px; width: 400px; margin: 25px 20px 75px;'
											placeholder='수정할 내용을 적어주세요' name='sccon' value=''>
										<button id="btnupdate" class='btn btn-color'
											onClick='btnupdate()' style="display: none;">확인</button>
									</div>
								</form>
							</c:forEach>
						</table>
						</td>
            <tr>
         </table>
         </div>
       </div>
	</div>
	</section>
	
	<script type="text/javascript">
	$(window).load(function() {
		$('.post-module').hover(function() {
			$(this).find('.description').stop().animate({
				height : "toggle",
				opacity : "toggle"
			}, 300);
		});
	});
	$("#cdreasen").click(function() {
		$("#cdcon").show();
		$("#btncreason").show();
	});
	$("#fdreasen").click(function() {
		$("#fdcon").show();
		$("#btnfreason").show();
	});
	$("#update").click(function() {
		$("#sccon").show();
		$("#btnupdate").show();
	});
	
	
</script>
<script type="text/javascript">
function goInsert() {
	$(".commentInsert").submit();
}
function dreason() {
	$(".reason").submit();
}
function mdbtn() {
	$(".fupdate").submit();
}
function fdreason() {
	$(".freason").submit();
}
function btnupdate() {
	$(".cdupdate").submit();
}

</script>

<script>
	$(function() {
		function convertArrayToJson(formArray) { //serialize data function
			var returnArray = {};
			for (var i = 0; i < formArray.length; i++) {
				returnArray[formArray[i]['name']] = formArray[i]['value'];
			}
			return returnArray;
		}

		$("#snslike").click(function() {
			alert($("#feseq").val());
			var jsonObjectData = {
					"feseq" : $("#feseq").val(),
					
				};
			$.ajax({
				type:"post",
				url:"/snsLikeInsert.do",
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
					
					if(xhr.status == 200 && result.SNS_LIKE_IN == "del") {
						alert("좋아요취소");
					} else if(xhr.status == 200 && result.SNS_LIKE_IN == "in") {
						alert("좋아요");
					}
				location.reload();
				}
			});
		});
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