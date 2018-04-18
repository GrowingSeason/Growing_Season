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
				<table border=1px width=100%>
					<thead>
						<tr style="background: #8fc04e" align="center">
							<th><font size="3" color="#464646">글제목</font></th>
							<th><font size="3" color="#464646">작성일</font></th>
						</tr>
					</thead>
					<tbody>
						<tr align="center">
							<td height=50>${NOTICE_DETAIL.btitle}</td>
							<td height=50>${NOTICE_DETAIL.bregdate}</td>
						</tr>
						<tr style="background: #8fc04e" align="center">
							<th colspan='2'><font size="3" color="#464646">글내용</font></th>
						</tr>
						<tr align="center">
							<td colspan='2' height=500>${NOTICE_DETAIL.bcon}</td>
						</tr>

					</tbody>
				</table>
				<br>
				<div align="right">
					<button class="btn btn-inverse">
						<a href="/boardnoticelist.do"><b><font color="white">목록보기</font></b></a>
					</button>
					<button class="btn btn-inverse">
						<a href="/boardnoticeupdatepage.do?bseq=${NOTICE_DETAIL.bseq}"><b><font color="white">수정</font></b></a>
					</button>
					<button class="btn btn-inverse">
						<a href="/boardnoticedelete.do?bseq=${NOTICE_DETAIL.bseq}"><b><font color="white">삭제</font></b></a>
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
						</ul>
					</div>
				</aside>
			</div>
		</div>
	</div>
</section>

<script>
	function OpenPopup() {
		var winfrom = window
				.open(
						"",
						"신고창",
						"toolbar=0, status=0, scrollbars=auto, location=0, menubar=0, width=500, height=600");
		winfrom.document.write("<p>신고창</p>");
		/*winfrom.moveTo(screen.availWidth/2-500/2,screen.availHeight/2-600/2);*/
	}
</script>
