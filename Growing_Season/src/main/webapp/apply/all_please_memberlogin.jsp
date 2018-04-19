<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- body부 sample입니다. 복사해서 이름 명명규칙에 맞춰 바꿔주시고 하단 코딩하시면 되겟습니다 -->
<!-- sample처럼 div class 하나 잡아주시면 되고, 스크립트 및 jquery, jstl 바로 사용하시면 됩니다-->
<!-- 별도 js가 필요한 경우 필요한 js파일이나 cdn경로를 주시고 test후 충돌없으면 반영하겟습니다 -->
<style>

select{
    width: 350px;
    height: 40px;
    padding-left: 10px;
    font-size: 18px;
    color: black;
    border: 1px solid gray;
    border-radius: 3px;
    background: url(/img/selectbox.png) 180px center no-repeat;
    /*-webkit-appearance: none; 
   -moz-appearance: none;     
   appearance: none;*/          
}
select::-ms-expand {
   /*display: none;             화살표 없애기 for IE10, 11*/
}

	label{
		font-size: 15px;
	
	}
	
	.inputboxes input:hover {
	    border-color: #ffae00;
	}
	
	.agile-map div {
		min-height: 370px;
		width: 100%;
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
              <h2>로그인 필요</h2>
            </div>
          </div>
          <div class="span8">            
          </div>
        </div>
      </div>
    </section>
    
<section id="content">
    <div class="container" >
		<div class="row">
			<div class="page-header">
				<h2 class="h-two">로그인이 필요한 서비스입니다 <small>로그인해주세요</small></h2>			
			</div>
		</div>
        <div class="row" style="width:100%; margin-left: 25%;">
          <div class="span5 shadow">
            <h4 align="center">회원 로그인</h4>
            <form id="contactform" action="/member/user/loginCheck.do" method="post" role="form" class="contactForm">
              <div class="row">
                <div class="span5 margintop10 field form-group">
                  <label>아이디</label>	
                  <input type="text" name="mid" placeholder="아이디" value='' required>
                  <div class="validation"></div>
                </div>
                <div class="span5 margintop10 field form-group">
                  <label>비밀번호</label>	
                  <input type="text" name="mpw" placeholder="비밀번호"  value='' required>
                  <div class="validation"></div>
                </div>

                <div class="span5" style="margin-top: 25px;" align="center">
					<div class="action" align="right">
						<button class="btn-large btn-danger" id="select" type="submit"style="width: 150px; height:70px; font-size: 30px;"> 로그인 </button>
					</div>
				</div>
              </div>
            </form>
          </div>
          
        </div>
  	</div>
  
</section>
