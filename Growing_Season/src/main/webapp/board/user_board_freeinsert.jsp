<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<section id="inner-headline">
	<div class="container">
		<div class="row">
			<div class="span12">
				<div class="inner-heading">
					<h2><font color="#008000">자유게시판</font></h2>
				</div>
			</div>
			<div class="span8"></div>
		</div>
	</div>
</section>
<section id="content">
	<div class="container">
		<div class="row">
			<div class="span10">
					<form action="/boardfreeinsert.do" class="boardInsert"
						enctype="multipart/form-data" method="post">
						<div class="row">
							
								<input name="btitle" value="" type="text"
									placeholder="제목을 입력하세요"
									style="width: 950px; height: 30px; display: inline;">
								&nbsp;&nbsp;&nbsp;&nbsp;
								
								<div
									style="width: 300px; height: 30px; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px; border-top-left-radius: 10px; border-top-right-radius: 10px; border: 2px solid #ccc;">
									&nbsp;&nbsp;&nbsp;&nbsp;<input type='file' name='ufile'>
								</div>
						</div>
						<div class="row">
							
								<textarea name="bcon" style="width: 950px; height: 500px;"
										placeholder="내용을 입력하세요"></textarea>
						</div>
					</form>
					<div align="right">
						<input type="button" class="btn btn-inverse" value="완료" onClick="goPage()">
						<button class="btn btn-inverse">
							<a href="/boardfreelist.do"><b><font color="white">취소</font></b></a>
						</button>
					</div>
					</div>
					<style>
			h4 {
			color: black;
			background: #eceae6;   
			}
			</style>
				<div class="span2">
					<aside class="right-sidebar">
						<div class="widget">
							<h4 class="widgetheading"><font color="#008000">게시판</font></h4>
							<br>

							<ul class="cat">
								<li><i class="icon-angle-right"></i> <a
								href="/boardnoticelist.do"><b><font size="5" color="#464646">공지</font></b></a></li>
							<li><i class="icon-angle-right"></i> <a
								href="/boardfreelist.do"><b><font size="5" color="#464646">자유</font></b></a></li>
							<li><i class="icon-angle-right"></i> <a
								href="/boardproposallist.do"><b><font size="5" color="#464646">건의</font></b></a></li>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
				
							</ul>
						</div>
					</aside>
				</div>
				
			</div>
		</div>
</section>
<script>
	function goPage() {
		$(".boardInsert").submit();
	}
</script>



