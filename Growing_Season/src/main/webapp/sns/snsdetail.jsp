<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div class="typo">
	<!---728x90--->
	<div class="container">
		<div class="row" align="center">
		<div class="col-md-6" align="center">
		
		<img src="/uploads/${SNS_IMAGE_LIST.feimgname}" style="width:300px; height:300px;">
		</div>
		<div class="col-md-6" align="center">
		${SNS_FOLLOWER_CNT},${SNS_FOLLOWING_CNT} <br>
		<input type="text" value="${SNS_HASHTAG_LIST.htcon}">
		<table>
		
		</table>
		</div>
		
	</div>
	</div>
</div>