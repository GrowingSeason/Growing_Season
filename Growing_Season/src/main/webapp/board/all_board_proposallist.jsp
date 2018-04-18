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
	<!-- 여기하단부터 수정하시고, 보여주실 화면은 <section id="content"></section> 으로 묶어주셔야 합니다-->
	<div class="container">
		<div class="row">
			<div class="span10">
				<div class="bs-docs-example">
					<table class="table">
						<thead>
							<tr style="background: #8fc04e">
								<th><font size="3" color="#464646">NO</font></th>
								<th><font size="3" color="#464646">작성자</font></th>
								<th width=60%><font size="3" color="#464646">제목</font></th>
								<th><font size="3" color="#464646">작성일</font></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${PROPOSAL_LIST}" var="vo">
								<tr>
									<td><font color="#008000">${vo.bseq}</font></td>
									<td>${vo.mid}</td>
									<td><a href="/boardproposaldetail.do?bseq=${vo.bseq}">${vo.btitle}</a></td>
									<td>${vo.bregdate}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div align="right">
					<button class="btn btn-inverse" value="글쓰기">
								<a href="/boardproposalinsert.do"><b><font color="white">글쓰기</font></b></a>
							</button>
				</div>
				<div align="center">
					<nav>
						<ul class="pagination">
						${PROPOSAL_PAGING}
						</ul>
					</nav>
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
					<div class="widget"> <!-- style="background: #eceae6 "-->
						<h4 class="widgetheading" align="center"><font color="#008000">게시판</font></h4>
						<br>
						<ul class="cat" >    <!-- style="background: #4d779d" -->
							<li><i class="icon-angle-right"></i> 
							<a href="/boardnoticelist.do"><b><font size="5" color="#464646">공지</font></b></a></li>
							<li><i class="icon-angle-right"></i> 
							<a href="/boardfreelist.do"><b><font size="5" color="#464646">자유</font></b></a></li>
							<li><i class="icon-angle-right"></i> 
							<a href="/boardproposallist.do"><b><font size="5" color="#464646">건의</font></b></a></li>
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
