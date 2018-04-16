<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div class="typo">
	

		<div class="alert alert-info" role="alert" align="center">
			<strong><h3>[게시글 신고리스트]</h3></strong></br>
		</div>

		<div class="bs-docs-example">
			<table class="table" BORDER=1>
				<thead>
					<tr>
						<th>글번호</th>
						<th>글쓴이</th>
						<th>제목</th>
						<th>신고내용(신고자,신고사유,신고일)</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${BDLIST}" var="vo">
					<tr>
						<td>${vo.bseq}</td>
						<td>${vo.mid}</td>
						<td>${vo.btitle}</td>
						<td>
							<c:forEach items="${vo.declarationList}" var="dlist">
								${dlist.bdmid}  ${dlist.bdreason} ${dlist.bdregdate}<br>
							</c:forEach>
						</td>
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
