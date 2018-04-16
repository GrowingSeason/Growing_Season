<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">

</script>

<div class="typo">
	<div class="container">

		<table border=1 width=80%>
			<thead>
				<tr align="center">
					<th>작성자</th>
					<th>글제목</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>
				<tr align="center">
					<td>${flistMap.freedetail.mid}</td>
					<td>${flistMap.freedetail.btitle}</td>
					<td>${flistMap.freedetail.bregdate}</td>
				</tr>
				<tr align="center">
					<td colspan='3'>${flistMap.freedetail.bcon}</td>
				</tr>

			</tbody>
		</table>

		<div style="margin: 0px 0px 0px;">
			<button>
				<a href="/boardfreelist.do">목록보기</a>
			</button>
			<c:choose>
				<c:when test="${MSEQ == flistMap.freedetail.mseq}">
					<button>
						<a href="/boardfreeupdatepage.do?bseq=${flistMap.freedetail.bseq}">수정</a>
					</button>
					<button>
						<a href="/boardfreedelete.do?bseq=${flistMap.freedetail.bseq}">삭제</a>
					</button>
				</c:when>
			</c:choose>
			<c:choose>
				<c:when test="${MSEQ != flistMap.freedetail.mseq}">
					<input type="button" value="신고" style="cursor: pointer;"
						onclick="OpenPopup('board', '')">
				</c:when>
			</c:choose>

		</div>

		<form action="/replyfreeinsert.do" class="replyInsert" method="post">
			<label for="ex_input">댓글</label> <input type="hidden" name="bseq"
				value="${flistMap.freedetail.bseq}"> <input type="hidden"
				name="mseq" value="${MSEQ}"> <input type="text"
				style="display: inline; height: 35px; width: 650px; margin: 25px 20px 75px;"
				placeholder="댓글 작성을 위해 로그인 해주세요" name="rcon" value=""> <input
				type="button" value="입력" onClick="goPage()">
		</form>


		<div style="margin: -25px -15px 75px;">

			<table class="table">
				<tbody>
					<c:forEach items="${flistMap.freerlist}" var="vo">
						<tr>
							<%-- <td><a href="/freerdeclarationPopup.do?rseq=${vo.rseq}">${vo.rseq}</a></td> --%>
							<td>${vo.mid}</td>
							<td>${vo.rcon}</td>
							<td>${vo.rregdate}</td>
							<c:choose>
								<c:when test="${MSEQ == vo.mseq}">
									<td style="cursor: pointer;"><a
										href="/freereplyupdatepage.do?rseq=${vo.rseq}" data-toggle="modal"
										data-target="#detailModal">수정</a></td>
									<td style="cursor: pointer;"><a
										href="/replyfreedelete.do?rseq=${vo.rseq}&bseq=${flistMap.freedetail.bseq}">삭제</a>
									</td>
								</c:when>
							</c:choose>
							<td><c:choose>
									<c:when test="${MSEQ != vo.mseq}">
										<input type="button" value="신고" style="cursor: pointer;"
											onclick="OpenPopup('reply', ${vo.rseq})">
									</c:when>
								</c:choose></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			${flistMap.FREE_REPLY_PAGING}

		</div>
		<div id="detailModal" class="modal">
			<div class="modal-dialog">
				<div class="modal-content"></div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	function OpenPopup(prm, seq) {
		
		if(prm=="board"){
		window.open("/freebdeclarationPopup.do?bseq=${flistMap.freedetail.bseq}",
						"게시글신고창",
						"toolbar=0, status=0, scrollbars=auto, location=0, menubar=0, width=500, height=600;");
		winfrom.document.write("<p>신고창</p>");
	
			
		} else if(prm=="reply"){
		window.open("/freerdeclarationPopup.do?rseq="+seq,
					"댓글신고창",
					"toolbar=0, status=0, scrollbars=auto, location=0, menubar=0, width=500, height=600;"); 
		
	
		}
		
	}
	
	function goPage() {
		$(".replyInsert").submit();
	}
</script>
