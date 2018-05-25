<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.net.URLEncoder"%> 

<!-- body부 sample입니다. 복사해서 이름 명명규칙에 맞춰 바꿔주시고 하단 코딩하시면 되겟습니다 -->
<!-- sample처럼 div class 하나 잡아주시면 되고, 스크립트 및 jquery, jstl 바로 사용하시면 됩니다-->
<!-- 별도 js가 필요한 경우 필요한 js파일이나 cdn경로를 주시고 test후 충돌없으면 반영하겟습니다 -->
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
	
	
	   <div class="row" align="center">
         <table border='1' width="800" height="200" >
            
            <tr align="center">
               <td rowspan="2" width="400"><img src='uploads/sns/default.jpg' width="60%"></td>
             
               <td colspan="2">
               <button id="followerbtn" class="btn btn-primary">
						<div class="day">${SNS_FOLLOWER_CNT}</div>
						<div class="month">Follower</div>
						</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<button id="followingbtn" class="btn btn-primary">
						<div class="day">${SNS_FOLLOWING_CNT}</div>
						<div class="month">Following</div>
						</button>
						</td>
            </tr>
           
            <tr>
               <td colspan="3">
               <div align="center">
               
                     <button class="btn btn-color" value="글쓰기" style="width:200px;">
                        <a href="/snsFeedInsert.do"><b><font color="white">글쓰기</font></b></a>
                     </button>
                 
            </div></td>
            <tr>
         </table>
      </div>
      <br>
	
		<div class="span12">
		<div id="mypage" class="row" align="center">
				<c:forEach var="vo" items="${SNS_MYPAGE_LIST}">
					<div class="span4">
					 	<a href="/snsdetail.do?feseq=${vo.feseq}">
					 	<img src="/uploads/${vo.feimgname}" style="width:300px; height:300px;"></a> <br>
						<br> <br> <br>
					</div>
				</c:forEach>
			</div>
			</div>


		<div class="span4">

            <aside class="right-sidebar" id="follower" style="display:none;">
				<div class="widget">

                <h5 class="widgetheading">팔로워</h5>

                <ul class="cat">
                <c:forEach var="vo" items="${SNS_FOLLOWER_LIST}">
                  <li><i class="icon-angle-right"></i> <a href="#">${vo.fmid}</a><span> (20)</span></li>
                </c:forEach>
                </ul>
              </div>
              </aside>
              <aside class="right-sidebar" id="follower" style="display:none;">
              <div class="widget">

                <h5 class="widgetheading">팔로잉</h5>

                <ul class="cat">
                <c:forEach var="vo" items="${SNS_FOLLOWING_LIST}">
                  <li><i class="icon-angle-right"></i> <a href="#">${vo.fmid}</a><span> (20)</span></li>
                </c:forEach>
                </ul>
              </div>
              
              </aside>
              </div>

</div>
</section>


