<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<!-- css적용이 안되거나 css에 없는 스타일을 적용할경우 스타일 사이에 적용해주세요-->
	<!-- js 및 스크립트 사용시 원하시는 곳에 스크립트 태그 열어서 사용해주세요-->
	<!-- 해당 예제 그대로 카피해서 사용하시고, 타이틀부는 수정하지 말고 그대로 사용해주세요 -->
	<!-- 보여주실 화면은 <section id="content"></section> 으로 묶어주셔야 합니다-->
	
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

/* Caption Style 3 */
.cs-style-3 figure {
	overflow: hidden;
}

.cs-style-3 figure img {
	-webkit-transition: -webkit-transform 0.4s;
	-moz-transition: -moz-transform 0.4s;
	transition: transform 0.4s;
}

.no-touch .cs-style-3 figure:hover img,
.cs-style-3 figure.cs-hover img {
	-webkit-transform: translateY(-50px);
	-moz-transform: translateY(-50px);
	-ms-transform: translateY(-50px);
	transform: translateY(-50px);
}

.cs-style-3 figcaption {
	height: 100px;
	width: 100%;
	top: auto;
	bottom: 0;
	opacity: 0;
	-webkit-transform: translateY(100%);
	-moz-transform: translateY(100%);
	-ms-transform: translateY(100%);
	transform: translateY(100%);
	-webkit-transition: -webkit-transform 0.4s, opacity 0.1s 0.3s;
	-moz-transition: -moz-transform 0.4s, opacity 0.1s 0.3s;
	transition: transform 0.4s, opacity 0.1s 0.3s;
}

.no-touch .cs-style-3 figure:hover figcaption,
.cs-style-3 figure.cs-hover figcaption {
	opacity: 1;
	-webkit-transform: translateY(70px);
	-moz-transform: translateY(70px);
	-ms-transform: translateY(70px);
	transform: translateY(70px);
	-webkit-transition: -webkit-transform 0.2s, opacity 0.1s;
	-moz-transition: -moz-transform 0.2s, opacity 0.1s;
	transition: transform 0.2s, opacity 0.1s;
}

.cs-style-3 figcaption p {
	text-align:center;
	margin-top:20px;
}

.cs-style-3 figcaption p i {
	color:#fff;
}

</style>
			


	<!-- 상단 타이틀부입니다. h2사이에 원하는 타이틀을 입력해주세요 -->
	 <section id="inner-headline">
      <div class="container">
        <div class="row">
          <div class="span4">
            <div class="inner-heading">
              <h2>신청하기</h2>
            </div>
          </div>
          <div class="span8">
          	<ul class="breadcrumb">
              <li><a href="/index.do">메인</a> <i class="icon-angle-right"></i></li>
              <li><a href="#">신청하기</a></li>
            </ul>
          </div>
        </div>
      </div>
    </section>

<section id="content">
      <div class="container">
        <div class="row">
          <div class="span12">
            <div class="clearfix"></div>
            <div class="row">
              <section id="projects">
                <ul id="thumbs" class="grid cs-style-3 portfolio">
                  <!-- Item Project and Filter Name -->
                  <li class="item-thumbs span6 design" data-id="id-0" data-type="web">
                    <div class="item">
                      <figure>
                        <div><a href=""><img src="/img/fafa.png" alt=""></a></div>
                        <figcaption>
                          <h3>친환경농장 신청하기</h3>
                        </figcaption>
                      </figure>
                    </div>
                  </li>
                  <!-- End Item Project -->

                  <!-- Item Project and Filter Name -->
                  <li class="item-thumbs span6 design" data-id="id-1" data-type="icon">
                    <div class="item">
                      <figure>
                        <div><a href="/applyGarden/user/applyGarden_step1.do"><img src="/img/gaga.png" alt=""></a></div>
                        <figcaption>
                          <h3>서울시텃밭 신청하기</h3>
                          <h6 align="center" style="color: white; font-size: 15px;">어르신, 다둥이가족, 다문화가족</h6>
                        </figcaption>
                      </figure>
                    </div>
                  </li>
                </ul>
              </section>
            </div>
          </div>
        </div>
      </div>
    </section>