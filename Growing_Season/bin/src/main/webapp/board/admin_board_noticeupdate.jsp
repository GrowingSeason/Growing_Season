<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="typo">
	<div class="container">

	<form action="/boardnoticeupdate.do" class="boardUpdate" method="get">
		<div class="row">
				 <div class="col-lg-6 in-gp-tl">
					<div class="input-group">
						<input name="btitle" type="text" size=160 value="${NOTICE_UPDATE_PAGE.btitle}">
					</div>
				</div>
		</div>
		<div class="row">
				<div class="col-lg-6 in-gp-tl">
					<div class="input-group">
						<textarea name="bcon" cols="160" rows="30">${NOTICE_UPDATE_PAGE.bcon}</textarea>
					</div>
				</div>
        </div>
      	<input type="hidden" name="bseq" value="${NOTICE_UPDATE_PAGE.bseq}">
        <input type="button" value="완료" onClick="goPage()">
        </form>
        
        <div align="right">
		<button><a href="/boardnoticedelete.do?bseq=${NOTICE_UPDATE_PAGE.bseq}">삭제</a></button>
		<button><a href="/boardnoticedetail.do?bseq=${NOTICE_UPDATE_PAGE.bseq}">취소</a></button>
		</div>
	
	</div>
</div>	
<script>

function goPage(){
		$(".boardUpdate").submit();
	}
	
</script>