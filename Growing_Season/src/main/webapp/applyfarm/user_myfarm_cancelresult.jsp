<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- body부 sample입니다. 복사해서 이름 명명규칙에 맞춰 바꿔주시고 하단 코딩하시면 되겟습니다 -->
<!-- sample처럼 div class 하나 잡아주시면 되고, 스크립트 및 jquery, jstl 바로 사용하시면 됩니다-->
<!-- 별도 js가 필요한 경우 필요한 js파일이나 cdn경로를 주시고 test후 충돌없으면 반영하겟습니다 -->

<style>
.different{
    background:url(/images/farm.jpg)no-repeat center 0px fixed;
    background-size: 100%;
	padding:5em 0;
}
</style>
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
<div class=newsletter>
<div class="row">
<div class="col-md-12">
	<div class="w3ls-heading">
		<h2 class="h-two">농장 취소가 완료되었습니다</h2>
		
	</div>
	<div style="width:90%;margin-left:auto; margin-right:auto;">
	<img src="/images/farm.jpg" class="img-fluid">
	</div>
	<button onClick="location.href='/index.do'" class="btn-large btn-danger" type="button">확인</button>
</div>
</div>
</div>
</div>
</section>