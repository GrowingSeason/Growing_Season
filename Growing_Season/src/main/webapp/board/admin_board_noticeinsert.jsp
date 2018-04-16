<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="typo">
	<div class="container">

		<form action="/boardnoticeinsert.do" class="boardInsert" enctype="multipart/form-data" method="post">
			<div class="row">
				<div class="col-lg-6 in-gp-tl">
					<div class="input-group">
						<input name="btitle" value="" type="text" size=160
							placeholder="글제목" aria-label="...">
					</div>
				</div>
			</div>


			<div class="row">
				<div class="col-lg-6 in-gp-tl">
					<div class="input-group">
						<textarea name="bcon" value="" cols="160" rows="30"></textarea>
					</div>
				</div>
			</div>
			<INPUT type='file'
						name='ufile' size='25'>
			<input type="button" value="완료" onClick="goPage()">
		</form>
		<button>
			<a href="/boardnoticelist.do">취소</a>
		</button>

	</div>
</div>

<script>

function goPage(){
		$(".boardInsert").submit();
	}
	
</script>