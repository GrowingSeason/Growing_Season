<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

    <footer>
      <div class="container">
        <div class="row">
          <div class="span4">
            <div class="widget">
              <div class="footer_logo">
                <h3><a href="/index.do"><i class="icon-tint"></i> Growing Season</a></h3>
              </div>
              <address>
							  <strong>KOSMO_DEV34</strong><br>
  							서울시 금천구 가산동<br>
  							월드메르디앙 2차 4층 410호
  						</address>
              <p>
                <i class="icon-phone"></i> 02-2638-5687 <br>
                <i class="icon-envelope-alt"></i> email@domainname.com
              </p>
            </div>
          </div>
          <div class="span4">
            <div class="widget">
              <h5 class="widgetheading">Browse pages</h5>
              <ul class="link-list">
                <li><a href="/boardnoticelist.do">공지사항</a></li>
                <li><a href="/apply/all/apply_main.do">신청하기</a></li>
                <li><a href="/myApplyCondition/all/applyCondition_main.do">신청현황</a></li>
                <li><a href="/snsmain.do">SNS</a></li>
                <li><a href="/boardfreelist.do">게시판</a></li>
                <li><a href="/location/all/farmLocation.do">농장위치확인</a></li>
                <li><a href="/crolling.do">쇼핑몰</a></li>
              </ul>

            </div>
          </div>
          <div class="span4">
            <div class="widget">
              <h5 class="widgetheading">From flickr</h5>
              <div class="flickr_badge">
                <script type="text/javascript" src="http://www.flickr.com/badge_code_v2.gne?count=8&amp;display=random&amp;size=s&amp;layout=x&amp;source=user&amp;user=34178660@N03"></script>
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
                <p><span>&copy; Growing Season. All right reserved</span></p>
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
							value="로 그 인" onClick="goLoginPage()" >
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
    <script>
	function goLoginPage() {
		/* location.href="/loginCheck.do"; */
		$("#login").submit();
		}
</script>