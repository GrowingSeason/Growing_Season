<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<section id="inner-headline">
	<div class="container">
		<div class="row">
			<div class="span12">
				<div class="inner-heading">
					<h2><font color="#008000">건의사항게시판</font></h2>
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
				<form action="/boardproposalupdate.do" class="boardUpdate"
					method="get">
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
								value="${PROPOSAL_UPDATE_PAGE.btitle}"
								style="width: 999px; height: 50px;">
						</div>
					</div>
					<div class="row">
						<label style="display: inline-block;"><h6><font color="#008000">내용</font></h6></label>
						<div class="input-group" align="center"
							style="display: inline-block;">
							<textarea name="bcon" style="width: 999px; height: 500px;">${PROPOSAL_UPDATE_PAGE.bcon}</textarea>
						</div>
					</div>
					<div align="right">
						<input type="hidden" name="bseq"
							value="${PROPOSAL_UPDATE_PAGE.bseq}"> 
						<input
							type="button" class="btn btn-inverse" value="완료" onClick="goPage()">
					</div>
				</form>
				<div align="right">
					<button class="btn btn-inverse">
						<a
							href="/boardproposaldelete.do?bseq=${PROPOSAL_UPDATE_PAGE.bseq}"><b><font color="white">삭제</font></b></a>
					</button>
					<button class="btn btn-inverse">
						<a
							href="/boardproposaldetail.do?bseq=${PROPOSAL_UPDATE_PAGE.bseq}"><b><font color="white">취소</font></b></a>
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
							<br>
						</ul>
					</div>
				</aside>
			</div>
	</div>
</div>
</section>
<script>

function goPage(){
		$(".boardUpdate").submit();
	}
	
</script>