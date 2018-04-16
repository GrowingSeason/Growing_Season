<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div class="typo">
	<div class="container">

		<div style="margin: -25px -15px 75px;">
		<form action="/replyupdate.do" class="replyupdate" method="get">
			<table class="table">
				<tbody>
						<tr>
							<td>${vo.mid}</td>
							<td>${vo.rcon}</td>
			<div class="row">
				<div class="col-lg-6 in-gp-tl">
					<div class="input-group">
						<input name="rcon" value="" type="text" size=160
							placeholder="댓글내용" aria-label="...">
					</div>
				</div>
			</div>
			<input type="button" value="완료" onClick="goPage()">
							<td>${vo.rregdate}</td>
						</tr>
				
				</tbody>
			</table>
			</form>
			${FREE_REPLY_PAGING}
		</div>

	</div>
</div>