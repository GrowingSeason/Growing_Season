<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="typo" align="center">
	<div class="container" >
		[신고페이지] <br> <br>
		<table border=1px width=80%>
			<thead>
				<tr align="center">
					<th>NO</th>
					<th>작성자</th>
					<th>제목</th>
					<th>내용</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>
				<tr align="center">
					<td>${BPOP_UP.bseq}</td>
					<td>${BPOP_UP.mid}</td>
					<td>${BPOP_UP.btitle}</td>
					<td>${BPOP_UP.bcon}</td>
					<td>${BPOP_UP
					.bregdate}</td>
				</tr>
			</tbody>
		</table>
		<br> <br>
		<button style="font-size: 18px;">
			<a href="/bdeclarationinsert.do?bseq=${BPOP_UP.bseq}">신고</a>
		</button>
		<button onclick="window.close()" style="font-size: 18px;">닫기</button>
		<br> <br> <br> <br>

	</div>
</div>
