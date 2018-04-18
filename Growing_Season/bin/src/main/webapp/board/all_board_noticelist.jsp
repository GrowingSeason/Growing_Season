<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="typo">
	<div class="container">

		<div class="alert alert-info" role="alert" align="center">
			<strong><h3>[공지게시판]</h3></strong></br>
			<h4>※농장관련 새로운 정보와 뉴스를 전달해드립니다※</h4>
		</div>

		<div class="bs-docs-example">
			<table class="table">
				<thead>
					<tr>
						<th>NO</th>
						<th>제목</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody>
				
					<c:forEach items="${NOTICE_LIST}" var="vo">
						<tr>
							<td>${vo.bseq}</td>
							<td><a href="/boardnoticedetail.do?bseq=${vo.bseq}">${vo.btitle}</a></td>
							<td>${vo.bregdate}</td>
						</tr>
					</c:forEach>
					
				</tbody>
			</table>
		</div>
		<div align="center">
			<nav>
				<ul class="pagination">
					<li>${NOTICE_PAGING}</li>
				</ul>
			</nav>
		
</div>
			<c:choose>
				<c:when test="${NOTICE_LIST_MGUBUN == 'A'}">
					<button value="글쓰기">
						<a href="/boardnoticeinsert.do">글쓰기</a>
					</button>
				</c:when>
				

			</c:choose>


		</div>
</div>

