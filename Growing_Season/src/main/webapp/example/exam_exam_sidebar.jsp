<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
	<!-- css적용이 안되거나 css에 없는 스타일을 적용할경우 스타일 사이에 적용해주세요-->
	<!-- js 및 스크립트 사용시 원하시는 곳에 스크립트 태그 열어서 사용해주세요-->
	<!-- 해당 예제 그대로 카피해서 사용하시고, 타이틀부는 수정하지 말고 그대로 사용해주세요 -->
	<!-- 보여주실 화면은 <section id="content"></section> 으로 묶어주셔야 합니다-->
	
	<style>

	</style>
	
	<!-- 상단 타이틀부입니다. h2사이에 원하는 타이틀을 입력해주세요 -->
	
	 <section id="inner-headline">
      <div class="container">
        <div class="row">
          <div class="span4">
            <div class="inner-heading">
              <h2>사이드바있는 예제입니다</h2>
            </div>
          </div>
          <div class="span8">            
          </div>
        </div>
      </div>
    </section>

<section id="content"> <!-- 여기하단부터 수정하시고, 보여주실 화면은 <section id="content"></section> 으로 묶어주셔야 합니다-->
      <div class="container">
        <div class="row">

          <div class="span8">
            <article>
              <div class="row">

                <div class="span8">
                  <div class="post-image">
                    <div class="post-heading">
                      <h3><a href="#">This is an example of standard post format</a></h3>
                    </div>

                    <img src="img/dummies/blog/img1.jpg" alt="" />
                  </div>
                  <div class="meta-post">
                    <a href="#" class="author">By<br /> Admin</a>
                    <a href="#" class="date">10 Jun<br /> 2013</a>
                  </div>
                  <div class="post-entry">
                    <p>
                      Qui ut ceteros comprehensam. Cu eos sale sanctus eligendi, id ius elitr saperet, ocurreret pertinacia pri an. No mei nibh consectetuer, semper laoreet perfecto ad qui, est rebum nulla argumentum ei. Fierent adipisci iracundia est ei, usu timeam persius
                      ea. Usu ea justo malis, pri quando everti electram ei, ex homero omittam salutatus...
                    </p>
                    <a href="#" class="btn btn-color">Read more <i class="icon-angle-right"></i></a>
                  </div>
                </div>
              </div>
            </article>

            <article>
              <div class="row">

                <div class="span8">
                  <div class="post-slider">
                    <div class="post-heading">
                      <h3><a href="#">This is an example of slider post format</a></h3>
                    </div>
                    <div class="clear"></div>
                    <!-- start flexslider -->
                    <div class="flexslider">
                      <ul class="slides">
                        <li>
                          <img src="img/dummies/blog/img1.jpg" alt="" />
                        </li>
                        <li>
                          <img src="img/dummies/blog/img2.jpg" alt="" />
                        </li>
                        <li>
                          <img src="img/dummies/blog/img3.jpg" alt="" />
                        </li>
                      </ul>
                    </div>
                    <!-- end flexslider -->
                  </div>
                  <div class="meta-post">
                    <a href="#" class="author">By<br /> Admin</a>
                    <a href="#" class="date">10 Jun<br /> 2013</a>
                  </div>
                  <div class="post-entry">
                    <p>
                      Qui ut ceteros comprehensam. Cu eos sale sanctus eligendi, id ius elitr saperet, ocurreret pertinacia pri an. No mei nibh consectetuer, semper laoreet perfecto ad qui, est rebum nulla argumentum ei. Fierent adipisci iracundia est ei, usu timeam persius
                      ea. Usu ea justo malis, pri quando everti electram ei, ex homero omittam salutatus...
                    </p>
                    <a href="#" class="btn btn-color">Read more <i class="icon-angle-right"></i></a>
                  </div>

                </div>
              </div>
            </article>


            <article>
              <div class="row">

                <div class="span8">
                  <div class="post-quote">
                    <div class="post-heading">
                      <h3><a href="#">Nice example of quote post format below</a></h3>
                    </div>


                  </div>
                  <div class="meta-post">
                    <a href="#" class="author">By<br /> Admin</a>
                    <a href="#" class="date">10 Jun<br /> 2013</a>
                  </div>
                  <div class="post-entry">
                    <blockquote>
                      Lorem ipsum dolor sit amet, ei quod constituto qui. Summo labores expetendis ad quo, lorem luptatum et vis. No qui vidisse signiferumque...
                    </blockquote>
                    <a href="#" class="btn btn-color">Read more <i class="icon-angle-right"></i></a>
                  </div>

                </div>
              </div>
            </article>

            <article>
              <div class="row">

                <div class="span8">
                  <div class="post-video">
                    <div class="post-heading">
                      <h3><a href="#">Amazing video post format here</a></h3>
                    </div>
                    <div class="video-container">
                      <iframe src="http://player.vimeo.com/video/30585464?title=0&amp;byline=0">			</iframe>
                    </div>
                  </div>
                  <div class="meta-post">
                    <a href="#" class="author">By<br /> Admin</a>
                    <a href="#" class="date">10 Jun<br /> 2013</a>
                  </div>
                  <div class="post-entry">
                    <p>
                      Qui ut ceteros comprehensam. Cu eos sale sanctus eligendi, id ius elitr saperet, ocurreret pertinacia pri an. No mei nibh consectetuer, semper laoreet perfecto ad qui, est rebum nulla argumentum ei. Fierent adipisci iracundia est ei, usu timeam persius
                      ea. Usu ea justo malis, pri quando everti electram ei, ex homero omittam salutatus...
                    </p>
                    <a href="#" class="btn btn-color">Read more <i class="icon-angle-right"></i></a>
                  </div>
                </div>
              </div>
            </article>

            <div id="pagination">
              <span class="all">Page 1 of 3</span>
              <span class="current">1</span>
              <a href="#" class="inactive">2</a>
              <a href="#" class="inactive">3</a>
            </div>
          </div>

          <div class="span4">

            <aside class="right-sidebar">
	
              <div class="widget">
                <form>
                  <div class="input-append">
                    <input class="span2" id="appendedInputButton" type="text" placeholder="Type here">
                    <button class="btn btn-color" type="submit">Search</button>
                  </div>
                </form>
              </div>

              <div class="widget">

                <h5 class="widgetheading">Categories</h5>

                <ul class="cat">
                  <li><i class="icon-angle-right"></i> <a href="#">Web design</a><span> (20)</span></li>
                  <li><i class="icon-angle-right"></i> <a href="#">Online business</a><span> (11)</span></li>
                  <li><i class="icon-angle-right"></i> <a href="#">Marketing strategy</a><span> (9)</span></li>
                  <li><i class="icon-angle-right"></i> <a href="#">Technology</a><span> (12)</span></li>
                  <li><i class="icon-angle-right"></i> <a href="#">About finance</a><span> (18)</span></li>
                </ul>
              </div>

              <div class="widget">

                <h5 class="widgetheading">Recent posts</h5>

                <ul class="cat">
                  <li><i class="icon-angle-right"></i> <a href="#">Lorem ipsum dolor sit amet</a></li>
                  <li><i class="icon-angle-right"></i> <a href="#">Ancillae senserit scribentur ea vel</a></li>
                  <li><i class="icon-angle-right"></i> <a href="#">Persius nostrum eleifend ad has</a></li>
                  <li><i class="icon-angle-right"></i> <a href="#">Facilis mediocrem urbanitas ad sed</a></li>
                  <li><i class="icon-angle-right"></i> <a href="#">Eripuit veritus docendi cum ut</a></li>
                </ul>
              </div>

              <div class="widget">

                <h5 class="widgetheading">Video widget</h5>
                <div class="video-container">
                  <iframe src="http://player.vimeo.com/video/30585464?title=0&amp;byline=0">			</iframe>
                </div>
              </div>

              <div class="widget">
                <h5 class="widgetheading">Flickr photostream</h5>
                <div class="flickr_badge">
                  <script type="text/javascript" src="http://www.flickr.com/badge_code_v2.gne?count=8&amp;display=random&amp;size=s&amp;layout=x&amp;source=user&amp;user=34178660@N03"></script>
                </div>
                <div class="clear"></div>
              </div>
              <div class="widget">

                <h5 class="widgetheading">Text widget</h5>
                <p>
                  Lorem ipsum dolor sit amet, quo everti torquatos rationibus an, graeci splendide mel cu. Sed ad vidisse eruditi maluisset, et duo mazim placerat adipiscing.
                </p>

              </div>
            </aside>
          </div>

        </div>
      </div>
    </section>