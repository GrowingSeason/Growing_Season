<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div class="typo">
	

		<div class="alert alert-info" role="alert" align="center">
			<strong><h3>[게시글 신고리스트]</h3></strong></br>
		</div>

		<div class="bs-docs-example">
			<table class="table">
				<thead>
					<tr>
						<th>신고당한게시글쓴사람mid</th>
						<th>신고당한게시글번호</th>
						<th>신고당한게시글제목</th>
						<th>신고당한게시글내용</th>
						<th>신고당한게시글작성일</th>
						<th>신고자mid</th>
						<th>신고이유</th>
						<th>신고일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${REPORTBOARD_LIST}" var="vo">
						<tr>
							<td>${BPOP_UP.mid}</td>
							<td>${vo.bseq}</td>
							<td>${BPOP_UP.btitle}</td>
							<td>${BPOP_UP.bcon}</td>
							<td>${BPOP_UP.bregdate}</td>
							<td>${vo.bdmid}</td>
							<td>${vo.bdreason}</td>
							<td>${vo.bdregdate}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div align="center">
			<nav>
				<ul class="pagination">
					<li>${REPORTBOARD_PAGING}</li>
				</ul>
			</nav>
		</div>
		
</div>
