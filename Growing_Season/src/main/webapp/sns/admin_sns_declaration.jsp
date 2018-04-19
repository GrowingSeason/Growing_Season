<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
h4 {
	color: black;
	background: #eceae6;
}
</style>
<section id="inner-headline">
	<div class="container">
		<div class="row">
			<div class="span12">
				<div class="inner-heading">
					
				</div>
			</div>
		</div>
	</div>
</section>
<section id="content">
	<div class="container">
		<div class="row">
			<div class="span6">
				<div class="bs-docs-example">
					<table class="table" BORDER=1>
					<h4><font color="#008000">FEED신고글 리스트</font></h4>
						<thead>
							<tr style="background: #8fc04e">
								<th><font size="3" color="#464646">글번호</font></th>
								<th><font size="3" color="#464646">내용</font></th>
								<th><font size="3" color="#464646">신고날짜</font></th>
								<th><font size="3" color="#464646">삭제</font></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${SNS_FD_LIST}" var="vo">
								<tr>
									<td>${vo.feseq}</td>
									<td>${vo.fdcon}</td>
									<td>${vo.fdregdate}</td>
									<td>
									<button class="btn btn-inverse" onClick="location.href = '/fdeclarationdelete.do?feseq=${vo.feseq}&fdmseq=${vo.fdmseq}'"><b><font color="white">삭제</font></b></button>
									<br><br>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div class="span6">
				<div class="bs-docs-example">
					<table class="table" BORDER=1>
					<h4><font color="#008000">comment신고글 리스트</font></h4>
						<thead>
							<tr style="background: #8fc04e">
								<th><font size="3" color="#464646">글번호</font></th>
								<th><font size="3" color="#464646">내용</font></th>
								<th><font size="3" color="#464646">신고날짜</font></th>
								<th><font size="3" color="#464646">삭제</font></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${SNS_CD_LIST}" var="vo">
								<tr>
									<td>${vo.scseq}</td>
									<td>${vo.cdcon}</td>
									<td>${vo.cdregdate}</td>
									<td>
									<button class="btn btn-inverse" onClick="location.href = '/cdeclarationdelete.do?cdmseq=${vo.cdmseq}&scseq=${vo.scseq}'"><b><font color="white">삭제</font></b></button>
									<br><br>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</section>