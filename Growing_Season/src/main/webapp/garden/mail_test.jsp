<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form"  uri="http://www.springframework.org/tags/form" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 
<!-- Bootstrap -->
  <link href="/css/bootstrapnew.css" rel="stylesheet" />
  <link href="/css/bootstrap-responsive.css" rel="stylesheet" />
  <link href="/css/prettyPhoto.css" rel="stylesheet" />
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
  <link href="/css/stylenew.css" rel="stylesheet">

 
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="/js/jquery.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="/js/bootstrap.js"></script>
<script src="/js/html2canvas.js"></script>
 
<title>메일 보내기</title>
</head>
<body>
<div class="container">
  <h4>메일 보내기</h4>
  <form action="/MailTest.do" method="post">
    <div align="center"><!-- 받는 사람 이메일 -->
      <input type="text" name="tomail" size="120" style="width:100%" placeholder="상대의 이메일" class="form-control" >
    </div>     
    <div align="center"><!-- 제목 -->
      <input type="text" name="title" size="120" style="width:100%" placeholder="제목을 입력해주세요" class="form-control" >
    </div>
    <p>
    <!-- <div align="center" >--><!-- 내용 --> 
      <!--<textarea name="content" cols="120" rows="12" style="width:100%; resize:none;" placeholder="내용#" class="form-control">
      </textarea>
    </div>  -->
    <p>
    <div align="center">
      <input type="submit" value="메일 보내기" class="btn btn-warning">
    </div>
  </form>
  
</div>

<div style="width: 800px; height: 800px; background-color: gray;">
	
		<table  style="width:80%; margin-left:10%; padding-top:10%;">
			
			<tr><td style="width: 100%; height: 300px; background-color: white;"><img src="https://images.tech.co/wp-content/uploads/2013/12/Growth.jpg"  style="width: 100%;height: 100%;"></td></tr>
			<tr><td></td></tr>
			<tr><td></td></tr>
			<tr><td></td></tr>
		</table>
	
</div>
<canvas>
</canvas>
<script>
html2canvas(document.body).then(function(canvas) {
    document.body.appendChild(canvas);
});
</script>
</body>
</html> 