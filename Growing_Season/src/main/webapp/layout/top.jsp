<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>

header ul.nav li a {
border:none;
	background-color: white;
	border:0;
	font-weight:1000;
	font-size: 17px; /*세부메뉴 글자크기*/
	color: black;
}header ul.nav li a i {
	color:red;
}

</style>

 <header>
      <div class="top">
        <div class="container">
          <div class="row">
            <div class="span6">
              <ul class="topmenu">
                <li><a href="/index.do">Home</a> &#47;</li>
                <li><a href="#">Terms</a> &#47;</li>
                <li><a href="#">Privacy policy</a></li>
              </ul>
            </div>
            <div class="span6">

              <ul class="social-network">
              <c:choose>
             <c:when test="${LVL_SESS_GUBUN == ''}">
                <li><a href="#myModal" class="btn btn-inverse" data-placement="bottom" data-toggle="modal" title="로그인 해주세요">login</a></li>
                <li><a href="/member/user/memberInput.do" class="btn btn-inverse" data-placement="bottom" title="휘원가입">join</a></li>
              </c:when>
              <c:otherwise>
              	<li><a href="/logout.do" class="btn btn-inverse" data-placement="bottom" title="로그아웃">logout</a></li>
              </c:otherwise>
              </c:choose>
                <li><a href="#" data-placement="bottom" title="Facebook"><i class="icon-circled icon-bglight icon-facebook"></i></a></li>
                <li><a href="#" data-placement="bottom" title="Twitter"><i class="icon-circled icon-bglight icon-twitter"></i></a></li>
                <li><a href="#" data-placement="bottom" title="Linkedin"><i class="icon-circled icon-linkedin icon-bglight"></i></a></li>
                <li><a href="#" data-placement="bottom" title="Google +"><i class="icon-circled icon-google-plus icon-bglight"></i></a></li>
              </ul>

            </div>
          </div>
        </div>
      </div>
      <div class="container">


        <div class="row nomargin">
          <div class="span4">
            <div class="logo">
              <h1><a href="/index.do"><i class="icon-tint"></i> Growing Season</a></h1>
            </div>
          </div>
          <div class="span8">
            <div class="navbar navbar-static-top">
              <div class="navigation">
                <nav>
                  <ul class="nav topnav">
                    <li>
                      <a href="/boardnoticelist.do">공지사항</a>
                    </li>
                    <li>
                      <a href="#">신청하기</a>
                    </li>
                    <li>
                      <a href="#">신청현황</a>
                    </li>
                    <li class="dropdown">
                      <a href="#">SNS <i class="icon-angle-down"></i></a>
                      <ul class="dropdown-menu">
                        <li><a href="">여기는</a></li>
                        <li><a href="">모르겠는걸</a></li>
                      </ul>
                    </li>
                    <li class="dropdown">
                      <a href="#">게시판 <i class="icon-angle-down"></i></a>
                      <ul class="dropdown-menu">
                        <li><a href="/boardfreelist.do">자유게시판</a></li>
                        <li><a href="/boardproposallist.do">팁게시판</a></li>
                        <li><a href="/boardproposallist.do">건의사항</a></li>
                      </ul>
                    </li>
                    <li class="dropdown">
                      <a href="#">기타기능<i class="icon-angle-down"></i></a>
                      <ul class="dropdown-menu">
                        <li><a href="/crolling.do">농장위치확인</a></li>
                        <li><a href="/weather/all/weatherInfo.do">날씨정보</a></li>
                        <li><a href="">쇼핑몰</a></li>
                      </ul>
                    </li>
                  </ul>
                </nav>
              </div>
              <!-- end navigation -->
            </div>
          </div>
        </div>
      </div>
    </header>
    <div id="myModal" class="modal fade" style="margin-top: 13%;">
	<div class="modal-dialog modal-login">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">로그인</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">×</button>
			</div>
			<div class="modal-body">
				<form id="login" action="/member/user/loginCheck.do" method="post">
					<div class="form-group">
						<input style="width: 100%" type="text" name="mid" id="mid" class="form-control" placeholder="id"
							required="required">
					</div>
					<div class="form-group">
						<input style="width: 100%" type="password" name="mpw" id="mpw" class="form-control"
							placeholder="Password" required="required">
					</div>
					<div class="form-group">
						<input type="button" class="btn btn-primary btn-block btn-lg"
							value="로 그 인" onClick="goPage()" >
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
    <script>
	function goPage() {
		/* location.href="/loginCheck.do"; */
		$("#login").submit();
		}
</script>