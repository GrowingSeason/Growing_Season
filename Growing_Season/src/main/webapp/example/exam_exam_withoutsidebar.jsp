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
              <h2>사이드바없는 예제입니니다</h2>
            </div>
          </div>
          <div class="span8">            
          </div>
        </div>
      </div>
    </section>

<section id="content">
      <div class="container">
        <div class="row">
          <div class="span12">
            <ul class="portfolio-categ filter">
              <li class="all active"><a href="#">All</a></li>
              <li class="web"><a href="#" title="">Web design</a></li>
              <li class="icon"><a href="#" title="">Icons</a></li>
              <li class="graphic"><a href="#" title="">Graphic design</a></li>
            </ul>

            <div class="clearfix"></div>
            <div class="row">
              <section id="projects">
                <ul id="thumbs" class="grid cs-style-3 portfolio">

                  <!-- Item Project and Filter Name -->
                  <li class="item-thumbs span6 design" data-id="id-0" data-type="web">
                    <div class="item">
                      <figure>
                        <div><img src="img/dummies/works/1.jpg" alt=""></div>
                        <figcaption>
                          <h3>Portfolio name</h3>
                          <p>
                            <a href="img/dummies/works/big.png" data-pretty="prettyPhoto[gallery1]" title="Portfolio caption here"><i class="icon-zoom-in icon-circled icon-bglight icon-2x active"></i></a>
                            <a href="#"><i class="icon-file icon-circled icon-bglight icon-2x active"></i></a>
                          </p>
                        </figcaption>
                      </figure>
                    </div>
                  </li>
                  <!-- End Item Project -->

                  <!-- Item Project and Filter Name -->
                  <li class="item-thumbs span6 design" data-id="id-1" data-type="icon">
                    <div class="item">
                      <figure>
                        <div><img src="img/dummies/works/2.jpg" alt=""></div>
                        <figcaption>
                          <h3>Portfolio name</h3>
                          <p>
                            <a href="img/dummies/works/big.png" data-pretty="prettyPhoto[gallery1]" title="Portfolio caption here"><i class="icon-zoom-in icon-circled icon-bglight icon-2x active"></i></a>
                            <a href="#"><i class="icon-file icon-circled icon-bglight icon-2x active"></i></a>
                          </p>
                        </figcaption>
                      </figure>
                    </div>
                  </li>
                  <!-- End Item Project -->

                  <!-- Item Project and Filter Name -->
                  <li class="item-thumbs span6 photography" data-id="id-2" data-type="graphic">
                    <div class="item">
                      <figure>
                        <div><img src="img/dummies/works/3.jpg" alt=""></div>
                        <figcaption>
                          <h3>Portfolio name</h3>
                          <p>
                            <a href="img/dummies/works/big.png" data-pretty="prettyPhoto[gallery1]" title="Portfolio caption here"><i class="icon-zoom-in icon-circled icon-bglight icon-2x active"></i></a>
                            <a href="#"><i class="icon-file icon-circled icon-bglight icon-2x active"></i></a>
                          </p>
                        </figcaption>
                      </figure>
                    </div>
                  </li>
                  <!-- End Item Project -->

                  <!-- Item Project and Filter Name -->
                  <li class="item-thumbs span6 design" data-id="id-0" data-type="web">
                    <div class="item">
                      <figure>
                        <div><img src="img/dummies/works/4.jpg" alt=""></div>
                        <figcaption>
                          <h3>Portfolio name</h3>
                          <p>
                            <a href="img/dummies/works/big.png" data-pretty="prettyPhoto[gallery1]" title="Portfolio caption here"><i class="icon-zoom-in icon-circled icon-bglight icon-2x active"></i></a>
                            <a href="#"><i class="icon-file icon-circled icon-bglight icon-2x active"></i></a>
                          </p>
                        </figcaption>
                      </figure>
                    </div>
                  </li>
                  <!-- End Item Project -->

                  <!-- Item Project and Filter Name -->
                  <li class="item-thumbs span6 photography" data-id="id-4" data-type="web">
                    <div class="item">
                      <figure>
                        <div><img src="img/dummies/works/5.jpg" alt=""></div>
                        <figcaption>
                          <h3>Portfolio name</h3>
                          <p>
                            <a href="img/dummies/works/big.png" data-pretty="prettyPhoto[gallery1]" title="Portfolio caption here"><i class="icon-zoom-in icon-circled icon-bglight icon-2x active"></i></a>
                            <a href="#"><i class="icon-file icon-circled icon-bglight icon-2x active"></i></a>
                          </p>
                        </figcaption>
                      </figure>
                    </div>
                  </li>
                  <!-- End Item Project -->

                  <!-- Item Project and Filter Name -->
                  <li class="item-thumbs span6 photography" data-id="id-5" data-type="icon">
                    <div class="item">
                      <figure>
                        <div><img src="img/dummies/works/6.jpg" alt=""></div>
                        <figcaption>
                          <h3>Portfolio name</h3>
                          <p>
                            <a href="img/dummies/works/big.png" data-pretty="prettyPhoto[gallery1]" title="Portfolio caption here"><i class="icon-zoom-in icon-circled icon-bglight icon-2x active"></i></a>
                            <a href="#"><i class="icon-file icon-circled icon-bglight icon-2x active"></i></a>
                          </p>
                        </figcaption>
                      </figure>
                    </div>
                  </li>
                  <!-- End Item Project -->
                </ul>
              </section>

            </div>
          </div>
        </div>
      </div>
    </section>