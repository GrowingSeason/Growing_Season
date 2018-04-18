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
	function openZoom(productCode) {
		//제품 확대보기
		//http://www.dytechtool.com/bigsee.asp?division=0&p_code=2122640800
		window.open("http://www.dytechtool.com/bigsee.asp?division=0&p_code="+productCode, "zoom", "width=816, height=600");
	}

	function openDetail(productCode) {
		//제품 상세보기
		//http://www.dytechtool.com/Prod_Detail.asp?p_code=2122640800#pageStart
		window.open("http://www.dytechtool.com/Prod_Detail.asp?p_code="+productCode+"#pageStart", "detail", "width=1384, height=753");
	}

</script>
<div class="typo">
	<!---728x90--->
	<div class="container">

		<div class="page-header">
			<h3 class="bars">총 상품수 : <font color="red">${LVL_COUNT}</font> 개의 상품이 있습니다.</h3>
		</div>

		<div class="bs-docs-example">
			<table class="table table-bordered">
				<tbody>
				<tr>
				<c:forEach items="${LVL_LIST}" var="cvo" varStatus="status"> 
						<td align="center">
							<img src="${cvo.productImg}" onClick="openDetail(${cvo.productCode})"  style="cursor: pointer;"><br>
							<b>${cvo.productName}</b><br>
							<font color="red"><b>${cvo.productPrice}</b></font><br>
							<img src="http://www.dytechtool.com/img/icon/ic_zoom.gif" style="cursor: pointer;" alt="확대보기" onClick="openZoom(${cvo.productCode})">
							<img src="http://www.dytechtool.com/img/icon/ic_save.gif"> ${cvo.productSave}
							
						</td>
					<c:if test="${status.count%4 == 0}" >
						</tr>
						<tr>
					</c:if>
				</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>