<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- body부 sample입니다. 복사해서 이름 명명규칙에 맞춰 바꿔주시고 하단 코딩하시면 되겟습니다 -->
<!-- sample처럼 div class 하나 잡아주시면 되고, 스크립트 및 jquery, jstl 바로 사용하시면 됩니다-->
<!-- 별도 js가 필요한 경우 필요한 js파일이나 cdn경로를 주시고 test후 충돌없으면 반영하겟습니다 -->
<script src="https://code.jquery.com/jquery-3.3.1.js"
	type="text/javascript"></script>
<style>
.red {
	color : red;
	width:60pt; 
	height:30pt;
}

.black {
	color : black;
	width:60pt; 
	height:30pt;
}
</style>
<script>
	
</script>
<div class="typo">
	<!---728x90--->
	<div class="container">

		<div class="page-header">
			<h3 class="bars">텃밭 신청자 리스트   신청서 : ${LVL_COUNT}개</h3>
		</div>

		<div class="bs-docs-example">
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>유형</th>
						<th>신청번호</th>
						<th>회원번호</th>
						<th>회원이름</th>
						<th>전화번호</th>
						<th>이메일</th>
						<th>신청일</th>
						<th>당첨여부</th>
						<th>텃밭취소여부</th>
					</tr>
				</thead>
				<tbody>
				
				<c:forEach items="${LVL_LIST}" var="avo"> 
					<tr>
						<td>${avo.apdivision}</td>
						<td>${avo.apseq}</td>
						<td>${avo.mseq}</td>
						<td>${avo.apname}</td>
						<td>${avo.apphone}</td>
						<td>${avo.apemail}</td>
						<td>${avo.apdate}</td>
						<td>${avo.awinner}</td>
						<td>${avo.apcancel}</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="newsletter" style="height:50px;">
		${LVL_PAGING}
		</div>
		<div class="newsletter">
			<input type="button" id="lotto" style="width:60pt; height:30pt; color:black;" value="추첨하기" onClick="location.href='/lotto.do'">
		</div>
	</div>
</div>