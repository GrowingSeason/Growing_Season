<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="typo" align="center">
	<div class="container">
		[신고페이지] <br> <br>
		<table border=1px width=80%>
			<thead>
				<tr align="center">
					<th>NO</th>
					<th>작성자</th>
					<th>내용</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>
				<tr align="center">
					<td>${FRPOP_UP.rseq}</td>
					<td>${FRPOP_UP.mid}</td>
					<td>${FRPOP_UP.rcon}</td>
					<td>${FRPOP_UP.rregdate}</td>
				</tr>
			</tbody>
		</table>

		<br>

<form action="/freerdeclarationinsert.do" class="rdeclarationInsert" method="post">
<input type="hidden" name="rseq" value="${FRPOP_UP.rseq}">
		<div class="row">
			<label for="ex_input">신고사유</label>
			<div class="col-lg-12">
				<div class="input-group">
					<input name="rdreason" value="" type="text" size=65
						aria-label="...">
				</div>
			</div>
		</div>
		
		<br> <br>
		
		<input type="submit" style="font-size: 18px;" value="신고">
			
		<button onclick="window.close()" style="font-size: 18px;">닫기</button>
		<br> <br> <br> <br>
</form>
	</div>
</div>
