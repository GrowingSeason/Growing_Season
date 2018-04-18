<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<section id="inner-headline">
	<div class="container">
		<div class="row">
			<div class="span12">
				<div class="inner-heading">
					<h2><font color="#008000">댓글 신고 리스트</font></h2>
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
				<div class="bs-docs-example">
					<table class="table" BORDER=1>
						<thead>
							<tr style="background: #8fc04e">
								<th><font size="3" color="#464646">번호</font></th>
								<th><font size="3" color="#464646">작성자</font></th>
								<th><font size="3" color="#464646">신고자</font></th>
								<th><font size="3" color="#464646">신고사유</font></th>
								<th><font size="3" color="#464646">신고일</font></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${RDLIST}" var="vo">
								<tr>
									<td><font color="#008000">${vo.rseq}</font></td>
									<td>${vo.mid}</td>
									<td><c:forEach items="${vo.rDeclarationList}" var="rlist">
										 ${rlist.rdmid}<br><br>
										 </c:forEach>
										 <td>
										<c:forEach items="${vo.rDeclarationList}" var="rlist">
										 ${rlist.rdreason}<br><br>
										 </c:forEach>
										 </td> 
										<td> <c:forEach items="${vo.rDeclarationList}" var="rlist">
										 ${rlist.rdregdate}&nbsp;&nbsp;
										<button class="btn btn-inverse"><a href="/boardnoticedelete.do?bseq=${NOTICE_UPDATE_PAGE.bseq}"><b><font color="white">삭제</font></b></a></button> 
											<br><br>
										</c:forEach>
										</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
						
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