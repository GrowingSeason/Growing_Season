<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
header{
background-color: gray;

}
header ul.nav li a {
border:none;
	background-color: gray;
	border:0;
	font-weight:1000;
	font-size: 17px; /*세부메뉴 글자크기*/
	color: white;
}header ul.nav li a i {
	color:white;
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
            <div class="logo" style="width: 400px;">
              <h1><a href="/index.do" style="color:white">Growing Season(밤)</a></h1>
            </div>
          </div>
          <div class="span8">
            <div class="navbar navbar-static-top">
              <div class="navigation">
                <nav >
                  <ul class="nav topnav">
                    <li>
                      <a href="/member/admin/memberList.do"  style="color: white;">회원</a>
                    </li>
                    <li>
                      <a href="/manager.do" style="color: white;">농장과텃밭</a>
                    </li>
                    <li>
                      <a href="/alist.do" style="color: white;">신청서</a>
                    </li>
                    <li>
                      <a href="/boardnoticelist.do" style="color: white;">공지</a>
                    </li>
                    <li class="dropdown">
                      <a href="#" style="color: white;">게시판 <i class="icon-angle-down"></i></a>
                      <ul class="dropdown-menu">
                        <li><a href="">신고글 관리</a></li>
                        <li><a href="">신고댓글 관리</a></li>
                      </ul>
                    </li>
                    <li class="dropdown">
                      <a href="/snsadmin.do" style="color: white;">SNS<i class="icon-angle-down"></i></a>
                      <ul class="dropdown-menu">
                        <li><a href="">신고글 관리</a></li>
                        <li><a href="">신고댓글 관리</a></li>
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
