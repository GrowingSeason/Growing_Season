<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div class="typo">
	<div class="container">

		<div>

			<form action="/freereplyupdate.do" class="replyUpdates" name="replyUpdates" method="post">
							<input type="hidden" id="rseq" name="rseq" value="${FREE_REPLY_UPDATE_VO.rseq}">
							<input type="hidden" id="bseq" name="bseq" value="${FREE_REPLY_UPDATE_VO.bseq}">
							<label for="ex_input">댓글</label>
				<table class="table">
					<tbody>
						<tr>
							<%-- <input type="hidden" name="mseq" value="${MSEQ}"> --%>
							<td>${FREE_REPLY_UPDATE_VO.mid}</td>
							<td><input id="rcon" name="rcon" value=""
								type="text" placeholder="${FREE_REPLY_UPDATE_VO.rcon}"></td>
								</tr>
								<tr>
							<td>${FREE_REPLY_UPDATE_VO.rregdate}</td>
							<td><input type="button" value="완료" onClick="goPage()"></td>

						</tr>

					</tbody>
				</table>
			</form>

			
		</div>
	</div>
</div>
<script>
	function goPage() {
		$(".replyUpdates").submit();
	}
</script>