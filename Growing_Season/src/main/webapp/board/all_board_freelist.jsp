<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div class="typo">
	

		<div class="alert alert-info" role="alert" align="center">
			<strong><h3>[자유게시판]</h3></strong></br>
			<h4>※농장관련 글을 자유롭게 올려주세요※</h4>
		</div>

		<div class="bs-docs-example">
			<table class="table">
				<thead>
					<tr>
						<th>NO</th>
						<th>작성자</th>
						<th>제목</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${FREE_LIST}" var="vo">
						<tr>
							<td>${vo.bseq}</td>
							<td>${vo.mid}</td>
							<td><a href="/boardfreedetail.do?bseq=${vo.bseq}">${vo.btitle}</a></td>
							<td>${vo.bregdate}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div align="center">
			<nav>
				<ul class="pagination">
					<li>${FREE_PAGING}</li>
				</ul>
			</nav>
		</div>
		<div align="right">
			<button>
				<a href="/boardfreeinsert.do">글쓰기</a>
			</button>
		</div>
	

</div>
