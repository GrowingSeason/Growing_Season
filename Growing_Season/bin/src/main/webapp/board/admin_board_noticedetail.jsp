<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div class="typo">
	<div class="container">

		<table border=1px width=80%>
			<thead>
				<tr align="center">
					<th>글제목</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>
				<tr align="center">
					<td>${NOTICE_DETAIL.btitle}</td>
					<td>${NOTICE_DETAIL.bregdate}</td>
				</tr>
				<tr align="center">
					<td colspan='2'>${NOTICE_DETAIL.bcon}</td>
				</tr>

			</tbody>
		</table>

		<div style="margin: 0px 0px 0px;">
			<button>
				<a href="/boardnoticelist.do">목록보기</a>
			</button>
			<button>
				<a href="/boardnoticeupdatepage.do?bseq=${NOTICE_DETAIL.bseq}">수정</a>
			</button>
			<button>
				<a href="/boardnoticedelete.do?bseq=${NOTICE_DETAIL.bseq}">삭제</a>
			</button>
		</div>
	</div>
</div>
<script>
	function OpenPopup() {
		var winfrom = window
				.open(
						"",
						"신고창",
						"toolbar=0, status=0, scrollbars=auto, location=0, menubar=0, width=500, height=600");
		winfrom.document.write("<p>신고창</p>");
		/*winfrom.moveTo(screen.availWidth/2-500/2,screen.availHeight/2-600/2);*/
	}
</script>
