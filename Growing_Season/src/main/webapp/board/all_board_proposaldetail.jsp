<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<section id="inner-headline">
	<div class="container">
		<div class="row">
			<div class="span12">
				<div class="inner-heading">
					<h2>
						<font color="#008000">건의사항게시판</font>
					</h2>
				</div>
			</div>
			<div class="span8"></div>
		</div>
	</div>
</section>

<section id="content">
	<div class="container">
		<div class="row">
			<div class="span10">
				<table border=1px width=100%>
					<thead>
						<tr style="background: #8fc04e" align="center">
							<th><font size="3" color="#464646">작성자</font></th>
							<th><font size="3" color="#464646">글제목</font></th>
							<th><font size="3" color="#464646">작성일</font></th>
						</tr>
					</thead>
					<tbody>
						<tr align="center">
							<td height=50>${plistMap.proposaldetail.mid}</td>
							<td height=50>${plistMap.proposaldetail.btitle}</td>
							<td height=50>${plistMap.proposaldetail.bregdate}</td>
						</tr>
						<tr style="background: #8fc04e" align="center">
							<th colspan='3'><font size="3" color="#464646">글내용</font></th>
						</tr>
						<tr align="center">
							<td colspan='3' height=500>${plistMap.proposaldetail.bcon}</td>
						</tr>

					</tbody>
				</table>
				<br>
				<div align="right">
					<button class="btn btn-inverse">
						<a href="/boardproposallist.do"><b><font color="white">목록보기</font></b></a>
					</button>
					<c:choose>
						<c:when test="${MSEQ == plistMap.proposaldetail.mseq}">
							<button class="btn btn-inverse">
								<a href="/boardproposalupdatepage.do?bseq=${plistMap.proposaldetail.bseq}"><b><font color="white">수정</font></b></a>
							</button>
							<button class="btn btn-inverse">
								<a href="/boardproposaldelete.do?bseq=${plistMap.proposaldetail.bseq}"><b><font color="white">삭제</font></b></a>
							</button>
						</c:when>
					</c:choose>
					<c:choose>
						<c:when test="${MSEQ != plistMap.proposaldetail.mseq}">
							<input type="button" class="btn btn-inverse" value="신고" style="cursor: pointer;"
								onclick="OpenPopup('board', '')">
						</c:when>
					</c:choose>

				</div>
				<br>
				<div>
					<form action="/replyproposalinsert.do" class="replyInsert"
						method="post">

						<label style="display: inline;">댓글</label> &nbsp;&nbsp;&nbsp;
						<div style="display: inline;">
							<input type="hidden" name="bseq"
								value="${plistMap.proposaldetail.bseq}"> <input
								type="hidden" name="mseq" value="${MSEQ}"> <input
								type="text" style="display: inline; height: 35px; width: 800px;"
								placeholder="댓글 작성을 위해 로그인 해주세요" name="rcon" value="">
							&nbsp;&nbsp;&nbsp; <input type="button" class="btn btn-inverse" value="입력"
								onClick="goPage()">
						</div>
					</form>
					<br>
					<div style="margin: -25px -15px 75px;">

						<table class="table">
							<tbody>
								<c:forEach items="${plistMap.proposalrlist}" var="vo">
									<tr>
										<td><font color="#008000">${vo.rseq}</font></td>
										<td>${vo.mid}</td>
										<td>${vo.rcon}</td>
										<td>${vo.rregdate}</td>
										<c:choose>
											<c:when test="${MSEQ == vo.mseq}">
												<td><input type="button" class="btn btn-inverse" value="수정"
													style="cursor: pointer;" onclick="UpPopup(${vo.rseq})"></td>
												<td style="cursor: pointer;"><a
													href="/replyproposaldelete.do?rseq=${vo.rseq}&bseq=${plistMap.proposaldetail.bseq}">삭제</a>
												</td>
											</c:when>
										</c:choose>
										<td><c:choose>
												<c:when test="${MSEQ != vo.mseq}">
													<input type="button" class="btn btn-inverse" value="신고" style="cursor: pointer;"
														onclick="OpenPopup('reply', ${vo.rseq})">
												</c:when>
											</c:choose></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>

						<div align="center">
							<ul class="pagination">${PROPOSAL_REPLY_PAGING}
							</ul>
						</div>
					</div>
				</div>
			</div>
				<style>
			h4 {
			color: black;
			background: #eceae6;   
			}
			</style>
			<div class="span2">
				<aside class="right-sidebar">
					<div class="widget">
						<h4 class="widgetheading"><font color="#008000">게시판</font></h4>
						<br>
						<ul class="cat">
					<li><i class="icon-angle-right"></i> <a
								href="/boardnoticelist.do"><b><font size="5" color="#464646">공지</font></b></a></li>
							<li><i class="icon-angle-right"></i> <a
								href="/boardfreelist.do"><b><font size="5" color="#464646">자유</font></b></a></li>
							<li><i class="icon-angle-right"></i> <a
								href="/boardproposallist.do"><b><font size="5" color="#464646">건의</font></b></a></li>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
						</ul>
					</div>
				</aside>
			</div>
		</div>
	</div>
</section>
<script>
function UpPopup(seq) {
	window.open("/proposalreplyupdatepopup.do?rseq="+seq,
			"댓글수정창",
			"toolbar=0, status=0, scrollbars=auto, location=0, menubar=0, width=500, height=600;");
	winfrom.document.write("<p>댓글수정창</p>");
}
</script>

<script type="text/javascript">
	function OpenPopup(prm, seq) {
		
		if(prm=="board"){
		window.open("/proposalbdeclarationPopup.do?bseq=${plistMap.proposaldetail.bseq}",
						"게시글신고창",
						"toolbar=0, status=0, scrollbars=auto, location=0, menubar=0, width=500, height=600;");
		winfrom.document.write("<p>신고창</p>");
	
			
		} else if(prm=="reply"){
		window.open("/proposalrdeclarationPopup.do?rseq="+seq,
					"댓글신고창",
					"toolbar=0, status=0, scrollbars=auto, location=0, menubar=0, width=500, height=600;"); 
		
	
		}
		
	}
	
	function goPage() {
		$(".replyInsert").submit();
	}
</script>
