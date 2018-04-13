<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div class="typo">
	<div class="container">

		<table border=1px width=80%>
			<thead>
				<tr align="center">
					<th>작성자</th>
					<th>글제목</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>
				<tr align="center">
					<td>${PROPOSAL_DETAIL.mid}</td>
					<td>${PROPOSAL_DETAIL.btitle}</td>
					<td>${PROPOSAL_DETAIL.bregdate}</td>
				</tr>
				<tr align="center">
					<td colspan='3'>${PROPOSAL_DETAIL.bcon}</td>
				</tr>

			</tbody>
		</table>

		<div style="margin: 0px 0px 0px;">
			<button>
				<a href="/boardproposallist.do">목록보기</a>
			</button>
			<c:choose>
				<c:when test="${MSEQ == PROPOSAL_DETAIL.mseq}">
					<button>
						<a href="/boardproposalupdatepage.do?bseq=${PROPOSAL_DETAIL.bseq}">수정</a>
					</button>
					<button>
						<a href="/boardproposaldelete.do?bseq=${PROPOSAL_DETAIL.bseq}">삭제</a>
					</button>
				</c:when>
			</c:choose>
			<c:choose>
				<c:when test="${MSEQ != PROPOSAL_DETAIL.mseq}">					
					<input type ="button" value="신고" style="cursor: pointer;" onclick="OpenPopup()">
				</c:when>
			</c:choose>
					
		</div>

		<form action="/replyproposalinsert.do" class="replyInsert" method="post">
			<label for="ex_input">댓글</label> 
			<input type="hidden" name="bseq" value="${PROPOSAL_DETAIL.bseq}"> 
			<input type="hidden" name="mseq" value="${MSEQ}"> 
				<input type="text"
				style="display: inline; height: 35px; width: 650px; margin: 25px 20px 75px;"
				placeholder="댓글 작성을 위해 로그인 해주세요" name="rcon" value=""> <input
				type="button" value="입력" onClick="goPage()">
		</form>


		<div style="margin: -25px -15px 75px;">

			<table class="table">
				<tbody>
					<c:forEach items="${PROPOSAL_REPLY_LIST}" var="vo">
						<tr>
							<td>${vo.mid}</td>
							<td>${vo.rcon}</td>
							<td>${vo.rregdate}</td>
							
							<c:choose>
								<c:when test="${MSEQ == vo.mseq}">
									<td style="cursor: pointer;"><a
										href="/replyupdatepage.do?rseq=${vo.rseq}">수정</a></td>
									<td style="cursor: pointer;">삭제</td>
								</c:when>
							</c:choose>
							<td style="cursor: pointer;" onclick='javascript:OpenPopup();'>신고</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			${PROPOSAL_REPLY_PAGING}

		</div>


	</div>
</div>

<script type="text/javascript">
	function OpenPopup() {
		
		window.open("/bdeclarationPopup.do?bseq=${PROPOSAL_DETAIL.bseq}",
						"게시글신고창",
						'toolbar=no, status=no, scrollbars=no, location=no, menubar=no, width=500, height=600, resizable=no');
		winfrom.document.write("<p>신고창</p>");
	}

	function goPage() {
		$(".replyInsert").submit();
	}
</script>
