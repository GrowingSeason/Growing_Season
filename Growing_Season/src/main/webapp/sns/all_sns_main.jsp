<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- body부 sample입니다. 복사해서 이름 명명규칙에 맞춰 바꿔주시고 하단 코딩하시면 되겟습니다 -->
<!-- sample처럼 div class 하나 잡아주시면 되고, 스크립트 및 jquery, jstl 바로 사용하시면 됩니다-->
<!-- 별도 js가 필요한 경우 필요한 js파일이나 cdn경로를 주시고 test후 충돌없으면 반영하겟습니다 -->

<script>
	$(function() {
		function convertArrayToJson(formArray) { //serialize data function
			var returnArray = {};
			for (var i = 0; i < formArray.length; i++) {
				returnArray[formArray[i]['name']] = formArray[i]['value'];
			}
			return returnArray;
		}

		$("#seach").click(function() {
			alert($("#searchStr").val());
			//$("#searchStr").keyup(function() {
			var jsonObjectData = {
				"searchStr" : $("#searchStr").val()
			};

			console.log(jsonObjectData); //{searchGubun: "btitle", searchStr: "d"}

			$.ajax({
				type:"post",
				url:"/hashtagSearch.do",
				//data:jsonObjectData,
				headers: {
			        'Accept': 'application/json',
			        'Content-Type': 'application/json'
			    },
				dataType: "json",
				//data:JSON.stringify(jsonObjectData),
				data:// $.param(
              	 JSON.stringify(jsonObjectData),
				success:function(result, textStatus, xhr) {
					console.log(result);
					 console.log(xhr.status);
					 
					 
					//[{??, {??, {??, {??, {??, {??]
					var htmlStr = "";
					
					
					if(xhr.status == 200 && result.SNS_HASHTAGSERCH_LIST.length > 0) {
						$("#returnTrue").show();  //.attr("style","display:none");
						$("#returnFalse").hide(); //.attr("style","display:block");
					} else {
						$("#returnTrue ").hide(); //.attr("style","display:block");
						$("#returnFalse").show(); //.attr("style","display:none");
						alert("검색된 글이 없습니다")
					}
					
					$.each(result.SNS_HASHTAGSERCH_LIST, function(i, v) {
						htmlStr += "<a href = /snsdetail.do?feseq=+"+v.feseq;
					
						htmlStr += ">"+v.htcon+"</a>";
						console.log(v.htcon);
					
						
						/* htmlStr += "'<a href='+'/snsdetail.do?feseq='+v.feseq+'>'+v.bcon"; */
					});
					$("#searchRes").html(htmlStr);
				}
			});
		});
	});
</script>


<div class="typo">
	<!---728x90--->
	<div class="container">
		<div class="grid_3 grid_5 agileits">
			<form action="/hashtagSearch.do" method="post">
				<div class="input-group">
					<input type="text" class="form-control" placeholder="Search for..."
						id="searchStr"> <span class="input-group-btn">
						<button class="btn btn-default" type="button" id="seach">Go!</button>
					</span>
				</div>
			</form>
			<!-- /input-group -->
		</div>
		<!-- /.col-lg-6 -->



		

			<div id="returnFalse" class="row" align="center">
				<c:forEach var="vo" items="${SNS_FEED_LIST}">
					<div class="col-md-4">
						<a href=/snsdetail.do?feseq=${vo.feseq}>${vo.fecon}</a> <br>
						<br> <br> <br>
					</div>
				</c:forEach>
			</div>


		<div  id="returnTrue" class="row" align="center">
			<div class="col-md-4" id="searchRes"></div>
		</div>


	</div>

</div>


