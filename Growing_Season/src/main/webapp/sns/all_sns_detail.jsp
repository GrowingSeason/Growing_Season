<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<meta charset='UTF-8'>
<meta name="robots" content="noindex">
<link rel="shortcut icon" type="image/x-icon" href="//static.codepen.io/assets/favicon/favicon-8ea04875e70c4b0bb41da869e81236e54394d63638a1ef12fa558a4a835f1164.ico" />
<link rel="mask-icon" type="" href="//static.codepen.io/assets/favicon/logo-pin-f2d2b6d2c61838f7e76325261b7195c27224080bc099486ddd6dccb469b8e8e6.svg" color="#111" />
<link rel="canonical" href="https://codepen.io/andytran/pen/BNjymy/" />
<link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css'>
<link rel='stylesheet prefetch' href='//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css'>

<style class="cp-pen-styles">
body {
  background: #f2f2f2;
  font-family: 'proxima-nova-soft', sans-serif;
  font-size: 14px;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
.post-module {
  position: relative;
  z-index: 1;
  display: block;
  background: #FFFFFF;
  min-width: 270px;
  height: 800px;
  -webkit-box-shadow: 0px 1px 2px 0px rgba(0, 0, 0, 0.15);
  -moz-box-shadow: 0px 1px 2px 0px rgba(0, 0, 0, 0.15);
  box-shadow: 0px 1px 2px 0px rgba(0, 0, 0, 0.15);
  -webkit-transition: all 0.3s linear 0s;
  -moz-transition: all 0.3s linear 0s;
  -ms-transition: all 0.3s linear 0s;
  -o-transition: all 0.3s linear 0s;
  transition: all 0.3s linear 0s;
}
.post-module:hover,
.hover {
  -webkit-box-shadow: 0px 1px 35px 0px rgba(0, 0, 0, 0.3);
  -moz-box-shadow: 0px 1px 35px 0px rgba(0, 0, 0, 0.3);
  box-shadow: 0px 1px 35px 0px rgba(0, 0, 0, 0.3);
}
.post-module:hover .thumbnail img,
.hover .thumbnail img {
  -webkit-transform: scale(1.1);
  -moz-transform: scale(1.1);
  transform: scale(1.1);
  opacity: .6;
}
.post-module .thumbnail {
  background: #000000;
  height: 100px;
  overflow: hidden;
}
.post-module .thumbnail .date {
  position: absolute;
  top: 20px;
  right: 20px;
  z-index: 1;
  background: #23c768;
  width: 60px;
  height: 55px;
  padding: 10px 0;
  -webkit-border-radius: 100%;
  -moz-border-radius: 100%;
  border-radius: 100%;
  color: #fd6102;
  font-weight: 700;
  text-align: center;
  -webkti-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
}
.post-module .thumbnail .date .day {
  font-size: 18px;
}
.post-module .thumbnail .date .month {
  font-size: 10px;
  text-transform: uppercase;
}
.post-module .thumbnail img {
  display: block;
  width: 120%;
  -webkit-transition: all 0.3s linear 0s;
  -moz-transition: all 0.3s linear 0s;
  -ms-transition: all 0.3s linear 0s;
  -o-transition: all 0.3s linear 0s;
  transition: all 0.3s linear 0s;
}
.post-module .post-content {
  position: absolute;
  bottom: 0;
  background: #FFFFFF;
  width: 100%;
  padding: 30px;
  -webkti-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
  -webkit-transition: all 0.3s cubic-bezier(0.37, 0.75, 0.61, 1.05) 0s;
  -moz-transition: all 0.3s cubic-bezier(0.37, 0.75, 0.61, 1.05) 0s;
  -ms-transition: all 0.3s cubic-bezier(0.37, 0.75, 0.61, 1.05) 0s;
  -o-transition: all 0.3s cubic-bezier(0.37, 0.75, 0.61, 1.05) 0s;
  transition: all 0.3s cubic-bezier(0.37, 0.75, 0.61, 1.05) 0s;
}
.post-module .post-content .category {
  position: absolute;
  top: -34px;
  left: 0;
  background: #e74c3c;
  padding: 10px 15px;
  color: #FFFFFF;
  font-size: 14px;
  font-weight: 600;
  text-transform: uppercase;
}
.post-module .post-content .title {
  margin: 0;
  padding: 0 0 10px;
  color: #333333;
  font-size: 26px;
  font-weight: 700;
}
.post-module .post-content .sub_title {
  margin: 0;
  padding: 0 0 20px;
  color: #e74c3c;
  font-size: 20px;
  font-weight: 400;
}
.post-module .post-content .description {
  display: none;
  color: #666666;
  font-size: 14px;
  line-height: 1.8em;
}
.post-module .post-content .post-meta {
  margin: 30px 0 0;
  color: #999999;
}
.post-module .post-content .post-meta .timestamp {
  margin: 0 16px 0 0;
}
.post-module .post-content .post-meta a {
  color: #999999;
  text-decoration: none;
}
.hover .post-content .description {
  display: block !important;
  height: auto !important;
  opacity: 1 !important;
}
.container {
  max-width: 800px;
  min-width: 640px;
  margin: 0 auto;
}
.container:before,
.container:after {
  content: '';
  display: block;
  clear: both;
}
.container .column {
  width: 50%;
  padding: 0 25px;
  -webkti-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
  float: left;
}
.container .column .demo-title {
  margin: 0 0 15px;
  color: #666666;
  font-size: 18px;
  font-weight: bold;
  text-transform: uppercase;
}
.container .info {
  width: 300px;
  margin: 50px auto;
  text-align: center;
}
.container .info h1 {
  margin: 0 0 15px;
  padding: 0;
  font-size: 24px;
  font-weight: bold;
  color: #333333;
}
.container .info span {
  color: #666666;
  font-size: 12px;
}
.container .info span a {
  color: #000000;
  text-decoration: none;
}	
.container .info span .fa {
  color: #e74c3c;
}


</style></head>

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


<body>
<section id="content">
<div class="container">
   <div class="info">
    <h1>상세 보기</h1>
    <span>Made with <i class='fa fa-heart animated infinite pulse'></i>
     by <a href='http://andy.design'>Andy Tran</a> | Designed by 
     <a href='http://justinkwak.com'>JustinKwak</a></span>
  </div>
  <!-- Normal Demo-->
  
    <div class="demo-title col-mg-6"></div>
    <!-- Post-->
			<div class="post-module span8">
				<!-- Thumbnail-->
				<div class="thumbnail" style="height: 300px;" align="right">
						<button id="follower" class="btn btn-primary">
						<div class="day">${SNS_FOLLOWER_CNT}</div>
						<div class="month">Follower</div>
						</button>
						<button id="follow" class="btn btn-primary">
						<div class="day">${SNS_FOLLOWING_CNT}</div>
						<div class="month">Following</div>
						</button>
					
					<img src="/uploads/${SNS_IMAGE_LIST.feimgname}"
						style="width: 90%; height: 200px;" />
				</div>
				<!-- Post Content-->
				<div class="post-content">
					<h2 class="title">${SNS_DETAIL.fecon}</h2>
					<button id="snslike"
								class='fa fa-heart animated infinite pulse btn-danger'>${SNS_LIKE_CNT}</button>
					<div class="post-meta">
					
					</div>
					<!-- SNS : 글쓴이번호 (하단 폼안에 넣지 말것~!) -->
					<input id="fmseq" type="hidden" name="fmseq" value="${SNS_DETAIL.mseq}"> 
					
					<!-- 커맨트 작성 -->
					<form action="/snscommentInsert.do" class="commentInsert" method="post">
						<input id="feseq" type="hidden" name="feseq" value="${SNS_DETAIL.feseq}"> 
						<label for="ex_input">댓글</label> <input type="text"
							style="display: inline; height: 10px; width: 400px; margin: 25px 20px 75px;"
							placeholder="댓글 작성을 위해 로그인 해주세요" name="sccon" value=""> 
						<input type="button" value="입력" onClick="goPage()">
					</form>
					<div class="span8">
						<table class="table">
							<c:forEach var="vo" items="${SNS_COMMENT_LIST}">
								<tr>
									<td>${vo.sccon}</td>
									<td>${vo.scregdate}</td>
								</tr>
							</c:forEach>
						</table>
						${SNS_COMMENT_PAGING}
					</div>
				</div>
			</div>


		</div>
</section>
<!-- <script src='//codepen.io/andytran/pen/vLmRVp.js'></script> -->
<script >
$(window).load(function() {
  $('.post-module').hover(function() {
    $(this).find('.description').stop().animate({
      height: "toggle",
      opacity: "toggle"
    }, 300);
  });
});
//# sourceURL=pen.js
</script>
<script type="text/javascript">
function goPage() {
	$(".commentInsert").submit();
}
</script>
<script src='//static.codepen.io/assets/common/stopExecutionOnTimeout-b2a7b3fe212eaa732349046d8416e00a9dec26eb7fd347590fbced3ab38af52e.js'></script>
<script src='//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='//static.codepen.io/assets/editor/live/console_runner-ce3034e6bde3912cc25f83cccb7caa2b0f976196f2f2d52303a462c826d54a73.js'></script>
<script src='//static.codepen.io/assets/editor/live/css_live_reload_init-890dc39bb89183d4642d58b1ae5376a0193342f9aed88ea04330dc14c8d52f55.js'></script>
<script src="//use.typekit.net/xyl8bgh.js"></script>
<script>try{Typekit.load();}catch(e){}</script>
</body></html>