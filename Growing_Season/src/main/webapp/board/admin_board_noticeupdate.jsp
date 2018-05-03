<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<section id="inner-headline">
	<div class="container">
		<div class="row">
			<div class="span12">
				<div class="inner-heading">
					<h2><font color="#008000">공지게시판</font></h2>
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
		<form action="/boardnoticeupdate.do" class="boardUpdate" method="get">
			<div class="row">
			<style>
			h6 {
			color: black;
			background: #eceae6;   
			}
			</style>
				<label style="display: inline-block;"><h6><font color="#008000">제목</font></h6></label>
				<div class="input-group" align="center"
					style="display: inline-block;">
					<input name="btitle" type="text"
						value="${NOTICE_UPDATE_PAGE.btitle}"
						style="width: 999px; height: 50px;">
				</div>
			</div>
			<div class="row" >
				<label style="display: inline-block;"><h6><font color="#008000">내용</font></h6></label>
				<div class="input-group" align="center"
					style="display: inline-block;">
					<textarea name="bcon" style="width: 999px; height: 500px;">${NOTICE_UPDATE_PAGE.bcon}</textarea>
				</div>
			</div>
			<div align="right" >
				<input type="hidden" name="bseq" value="${NOTICE_UPDATE_PAGE.bseq}">
				<input type="button" class="btn btn-inverse" value="완료" onClick="goPage()">
			</div>
		</form>
		<div style="display:inline;">
			<button class="btn btn-inverse"><a href="/boardnoticedelete.do?bseq=${NOTICE_UPDATE_PAGE.bseq}"><b><font color="white">삭제</font></b></a></button>
			<button class="btn btn-inverse"><a href="/boardnoticedetail.do?bseq=${NOTICE_UPDATE_PAGE.bseq}"><b><font color="white">취소</font></b></a></button>
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
							<li><i class="icon-angle-right"></i> <a
								href="/bdeclarationlist.do"><b><font size="4" color="#464646">신고게시글<br>리스트</font></b></a></li>
							<li><i class="icon-angle-right"></i> <a
								href="/rdeclarationlist.do"><b><font size="4" color="#464646">신고댓글<br>리스트</font></b></a></li>
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
		$(".boardUpdate").submit();
	}
</script>