<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- body부 sample입니다. 복사해서 이름 명명규칙에 맞춰 바꿔주시고 하단 코딩하시면 되겟습니다 -->
<!-- sample처럼 div class 하나 잡아주시면 되고, 스크립트 및 jquery, jstl 바로 사용하시면 됩니다-->
<!-- 별도 js가 필요한 경우 필요한 js파일이나 cdn경로를 주시고 test후 충돌없으면 반영하겟습니다 -->
<style>
.hidden {
	display: none;
}

.view {
	display: block;
}

.inputboxes input:hover {
	border-color: #ffae00;
}

.shadow {
	-webkit-box-shadow: 6px 10px 27px 7px rgba(194, 194, 194, 0.6);
	-moz-box-shadow: 6px 10px 27px 7px rgba(194, 194, 194, 0.6);
	box-shadow: 6px 10px 27px 7px rgba(194, 194, 194, 0.6);
	padding: 5%;
	border: rgba(0, 0, 0, 0.2);
	background-color:#ffffff;
}
</style>
<section id="inner-headline">
	<div class="container">
		<div class="row">
			<div class="span4">
				<div class="inner-heading">
					<h2>ERROR!</h2>
				</div>
			</div>
			<div class="span8"></div>
		</div>
	</div>
</section>
<section id="content">
	<div class="container">
		<div class="row">
			<div class="span12 shadow">
			 

				<div class="row">					
					<div class="span12">
					<div class="post-image">
						<div class="post-heading">
							<h3>잘못된 접근입니다! 다시 시도해주시기 바랍니다</h3>
						</div>
						<img src="/images/farm.jpg" alt="" />
					</div>
					</div>
				</div>

				
				<div class="row">
				
					<div class="span12">
						<div class="pricing-box-plain">
							<div class="action">
						
							
							<button onClick="location.href='/index.do'" class="btn-large btn-danger" type="button">확인</button>
							</div>
						</div>
					</div>
				
				</div>
			</div>
		</div>
	</div>
</section>
