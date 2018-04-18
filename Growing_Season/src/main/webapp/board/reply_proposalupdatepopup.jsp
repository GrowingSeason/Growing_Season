<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

 <section id="inner-headline">
      <div class="container">
        <div class="row">
          <div class="span4">
            <div class="inner-heading">
              <h2><font color="#008000">댓글 수정페이지</font></h2>
            </div>
          </div>
          <div class="span8">            
          </div>
        </div>
      </div>
    </section>

<section id="content">
      <div class="container">
        <div class="row">
          <div class="span12">
		 <br> <br>
		
			<form action="/proposalreplyupdate.do" class="replyUpdates" name="replyUpdates" method="post">
							<input type="hidden" id="rseq" name="rseq" value="${PROPOSAL_REPLY_UPDATE_VO.rseq}">
							<input type="hidden" id="bseq" name="bseq" value="${PROPOSAL_REPLY_UPDATE_VO.bseq}">
							<label for="ex_input"><b><font color="#008000">댓글</font></b></label>
			<br><br>
				<table align="center" border=1px width=95%>
					<tbody>
						<tr>
							<td>${PROPOSAL_REPLY_UPDATE_VO.mid}</td>
							<td><input id="rcon" name="rcon" value=""
								type="text" placeholder="${PROPOSAL_REPLY_UPDATE_VO.rcon}"></td>
							<td>${PROPOSAL_REPLY_UPDATE_VO.rregdate}</td>
						</tr>
					</tbody>
				</table>
				<br><br>
				<div align="center">
				
				<input type="submit" style="font-size: 18px; background:white;" value="완료" onclick=alert("수정되었습니다");>
							<button onclick="window.close()" style="font-size: 18px; background:white;">닫기</button>
			</div>
			</form>
		</div>
	</div>
</div>
</section>
<script>
	function goPage() {
		$(".replyUpdates").submit();
	}
</script>