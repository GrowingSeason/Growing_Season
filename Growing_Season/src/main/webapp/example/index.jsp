<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <title>Remember - Multipurpose bootstrap site template</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <meta name="description" content="Your page description here" />
  <meta name="author" content="" />

  <!-- css -->
  <link href="/css/bootstrapnew.css" rel="stylesheet" />
  <link href="/css/bootstrap-responsive.css" rel="stylesheet" />
  <link href="/css/prettyPhoto.css" rel="stylesheet" />
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
  <link href="/css/stylenew.css" rel="stylesheet">

  <!-- Theme skin -->
  <link id="t-colors" href="/color/default.css" rel="stylesheet" />

  <!-- Fav and touch icons -->
  <link rel="apple-touch-icon-precomposed" sizes="144x144" href="/ico/apple-touch-icon-144-precomposed.png" />
  <link rel="apple-touch-icon-precomposed" sizes="114x114" href="/ico/apple-touch-icon-114-precomposed.png" />
  <link rel="apple-touch-icon-precomposed" sizes="72x72" href="/ico/apple-touch-icon-72-precomposed.png" />
  <link rel="apple-touch-icon-precomposed" href="ico/apple-touch-icon-57-precomposed.png" />
  <link rel="shortcut icon" href="/ico/favicon.png" />

  <!-- =======================================================
    Theme Name: Remember
    Theme URL: https://bootstrapmade.com/remember-free-multipurpose-bootstrap-template/
    Author: BootstrapMade.com
    Author URL: https://bootstrapmade.com
  ======================================================= -->
</head>
<style>

header ul.nav li a {
border:none;
	background-color: white;
	border:0;
	font-weight:1000;
	font-size: 17px; /*세부메뉴 글자크기*/
	color: black;
}

</style>

 <header>
      <div class="top">
        <div class="container">
          <div class="row">
            <div class="span6">
              <ul class="topmenu">
                <li><a href="#">Home</a> &#47;</li>
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
                      <a href="/apply/all/apply_main.do">신청하기</a>
                    </li>
                    <li>
                      <a href="/myApplyCondition/all/applyCondition_main.do">신청현황</a>
                    </li>
                    <li>
                      <a href="/snsmain.do">SNS</a>
                    </li>
                    <li class="dropdown">
                      <a href="/boardfreelist.do">게시판 <i class="icon-angle-down"></i></a>
                      <ul class="dropdown-menu">
                        <li><a href="/boardfreelist.do">자유게시판</a></li>
                        <li><a href="/boardproposallist.do">건의사항</a></li>
                      </ul>
                    </li>
                    <li class="dropdown">
                      <a href="#">기타기능<i class="icon-angle-down"></i></a>
                      <ul class="dropdown-menu">
                        <li><a href="/location/all/farmLocation.do">농장위치확인</a></li>
                        <li><a href="/weather/all/weatherInfo.do">날씨정보</a></li>
                        <li><a href="/crolling.do">쇼핑몰</a></li>
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

    <!-- end header -->

    <!-- section intro -->
    <section id="intro">
      <div class="intro-content">
      </div>
    </section>
    <!-- /section intro -->

    <section id="content">
      <div class="container">


        <div class="row">
          <div class="span12">
            <div class="row">
              <div class="span3">
                <div class="box aligncenter">
                  <div class="icon">
                    
                    <i class="ico icon-leaf icon-5x" style="color: green;"></i>
                  </div>
                  <div class="text">
                    <h4><strong>농장신청</strong></h4>
                    <p>
                      	서울시와 함께하는 친환경농장<br>
                      	어르신,다둥이,다문화가정을 위한<br>서울시 도시텃밭                      	
                    </p>
                    <a href="/apply/all/apply_main.do"><span class="badge badge-info badge-circled" style="font-size: 15px; background-color: green;">More>></span></a>
                  </div>
                </div>
              </div>

              <div class="span3">
                <div class="box aligncenter">
                  <div class="icon">
                    
                    <i class="ico icon-list-alt icon-5x" style="color: black;"></i>
                  </div>
                  <div class="text">
                    <h4><strong>신청현황</strong></h4>
                    <p>
                      	농장,텃밭 신청현황을<br>확인해보세요.<br><br>  	
                    </p>
                    <a href="/apply/all/apply_main.do"><span class="badge badge-info badge-circled" style="font-size: 15px; background-color: black;">More >></span></a>
                  </div>
                </div>
              </div>
              <div class="span3">
                <div class="box aligncenter">
                  <div class="icon">
                    <i class="ico icon-camera-retro icon-5x" style="color: black;"></i>
                  </div>
                  <div class="text">
                    <h4><strong>SNS</strong></h4>
                    <p>
                      It's our Growing Season!<br><br><br>
                    </p>
                    <a href="/snsmain.do"><span class="badge badge-info badge-circled" style="font-size: 15px; background-color: black;">More >></span></a>
                  </div>
                </div>
              </div>
              <div class="span3">
                <div class="box aligncenter">
                  <div class="icon">
                    <i class="ico icon-shopping-cart icon-5x" style="color: black;"></i>
                  </div>
                  <div class="text">
                    <h4><strong>쇼핑몰</strong></h4>
                    <p>
                      	각종 물품을 구매할 수 있습니다<br><br><br>
                    </p>
                    <a href="#"><span class="badge badge-info badge-circled" style="font-size: 15px; background-color: black;">More >></span></a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>


      </div>
    </section>
    
    
 <!-- 
    <section id="works">
      <div class="container">
        <div class="row">
          <div class="span12">
            <h3>Recent works</h3>
            <div class="row">

              <div class="grid cs-style-3">
                <div class="span3">
                  <div class="item">
                    <figure>
                      <div><img src="/img/dummies/works/1.jpg" alt=""></div>
                      <figcaption>
                        <h3>Portfolio name</h3>
                        <p>
                          <a href="img/dummies/works/big.png" data-pretty="prettyPhoto[gallery1]" title="Portfolio caption here"><i class="icon-zoom-in icon-circled icon-bglight icon-2x active"></i></a>
                          <a href="#"><i class="icon-file icon-circled icon-bglight icon-2x active"></i></a>
                        </p>
                      </figcaption>
                    </figure>
                  </div>
                </div>
                <div class="span3">
                  <div class="item">
                    <figure>
                      <div><img src="/img/dummies/works/2.jpg" alt=""></div>
                      <figcaption>
                        <h3>Portfolio name</h3>
                        <p>
                          <a href="img/dummies/works/big.png" data-pretty="prettyPhoto[gallery1]" title="Portfolio caption here"><i class="icon-zoom-in icon-circled icon-bglight icon-2x active"></i></a>
                          <a href="#"><i class="icon-file icon-circled icon-bglight icon-2x active"></i></a>
                        </p>
                      </figcaption>
                    </figure>
                  </div>
                </div>
                <div class="span3">
                  <div class="item">
                    <figure>
                      <div><img src="/img/dummies/works/3.jpg" alt=""></div>
                      <figcaption>
                        <h3>Portfolio name</h3>
                        <p>
                          <a href="img/dummies/works/big.png" data-pretty="prettyPhoto[gallery1]" title="Portfolio caption here"><i class="icon-zoom-in icon-circled icon-bglight icon-2x active"></i></a>
                          <a href="#"><i class="icon-file icon-circled icon-bglight icon-2x active"></i></a>
                        </p>
                      </figcaption>
                    </figure>
                  </div>
                </div>
                <div class="span3">
                  <div class="item">
                    <figure>
                      <div><img src="/img/dummies/works/4.jpg" alt=""></div>
                      <figcaption>
                        <h3>Portfolio name</h3>
                        <p>
                          <a href="img/dummies/works/big.png" data-pretty="prettyPhoto[gallery1]" title="Portfolio caption here"><i class="icon-zoom-in icon-circled icon-bglight icon-2x active"></i></a>
                          <a href="#"><i class="icon-file icon-circled icon-bglight icon-2x active"></i></a>
                        </p>
                      </figcaption>
                    </figure>
                  </div>
                </div>
              </div>

            </div>
          </div>
        </div>
      </div>
    </section>
-->
    <footer>
      <div class="container">
        <div class="row">
          <div class="span4">
            <div class="widget">
              <div class="footer_logo">
                <h3><a href="index.html"><i class="icon-tint"></i> Growing Season</a></h3>
              </div>
              <address>
							  <strong>KOSMO Dev34</strong><br>
  							Gasan-<br>
  							Digital Complex-
  						</address>
              <p>
                <i class="icon-phone"></i> (123) 456-7890 - (123) 555-7891 <br>
                <i class="icon-envelope-alt"></i> email@domainname.com
              </p>
            </div>
          </div>
          <div class="span4">
            <div class="widget">
              <h5 class="widgetheading">Browse pages</h5>
              <ul class="link-list">
                <li><a href="#">Our company</a></li>
                <li><a href="#">Terms and conditions</a></li>
                <li><a href="#">Privacy policy</a></li>
                <li><a href="#">Press release</a></li>
                <li><a href="#">What we have done</a></li>
                <li><a href="#">Our support forum</a></li>
              </ul>

            </div>
          </div>
          <div class="span4">
            <div class="widget">
              <h5 class="widgetheading">From flickr</h5>
              <div class="flickr_badge">
                <script type="text/javascript" src="http://www.flickr.com/badge_code_v2.gne?count=8&amp;display=random&amp;size=s&amp;lay	=x&amp;source=user&amp;user=34178660@N03"></script>
              </div>
              <div class="clear"></div>
            </div>
          </div>
        </div>
      </div>
      <div id="sub-footer">
        <div class="container">
          <div class="row">
            <div class="span6">
              <div class="copyright">
                <p><span>&copy; Remember Inc. All right reserved</span></p>
              </div>

            </div>

            <div class="span6">
              <div class="credits">
                <!--
                  All the links in the footer should remain intact.
                  You can delete the links only if you purchased the pro version.
                  Licensing information: https://bootstrapmade.com/license/
                  Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/buy/?theme=Remember
                -->
                Created by <a href="https://bootstrapmade.com/">BootstrapMade</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </footer>
  
  <a href="#" class="scrollup"><i class="icon-angle-up icon-rounded icon-bglight icon-2x"></i></a>

  <!-- javascript
    ================================================== -->
  <!-- Placed at the end of the document so the pages load faster -->
  <script src="/js/jquery.js"></script>
  <script src="/js/jquery.easing.1.3.js"></script>
  <script src="/js/bootstrap.js"></script>
  <script src="/js/modernizr.custom.js"></script>
  <script src="/js/toucheffects.js"></script>
  <script src="/js/google-code-prettify/prettify.js"></script>
  <script src="/js/jquery.prettyPhoto.js"></script>
  <script src="/js/portfolio/jquery.quicksand.js"></script>
  <script src="/js/portfolio/setting.js"></script>
  <script src="/js/animate.js"></script>

  <!-- Template Custom JavaScript File -->
  <script src="/js/custom.js"></script>
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

 

</body>

</html>
