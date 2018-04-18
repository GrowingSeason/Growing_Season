<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <title>Remember - Multipurpose bootstrap site template</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <meta name="description" content="Your page description here" />
  <meta name="author" content="" />

  <!-- css -->
  <link href="/css/bootstrapnew.css" rel="stylesheet" />
  <link href="/css/bootstrap-responsive.css" rel="stylesheet" />
  <link href="/css/prettyPhoto.css" rel="stylesheet" />
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
  <link href="/css/stylenew.css" rel="stylesheet">

  <!-- Theme skin -->
  <link id="t-colors" href="/color/default.css" rel="stylesheet" />

  <!-- Fav and touch icons -->
  <link rel="apple-touch-icon-precomposed" sizes="144x144" href="/ico/apple-touch-icon-144-precomposed.png" />
  <link rel="apple-touch-icon-precomposed" sizes="114x114" href="/ico/apple-touch-icon-114-precomposed.png" />
  <link rel="apple-touch-icon-precomposed" sizes="72x72" href="/ico/apple-touch-icon-72-precomposed.png" />
  <link rel="apple-touch-icon-precomposed" href="ico/apple-touch-icon-57-precomposed.png" />
  <link rel="shortcut icon" href="/ico/favicon.png" />
  
  <script src="//code.jquery.com/jquery-latest.min.js"></script> 

  <!-- =======================================================
    Theme Name: Remember
    Theme URL: https://bootstrapmade.com/remember-free-multipurpose-bootstrap-template/
    Author: BootstrapMade.com
    Author URL: https://bootstrapmade.com
  ======================================================= -->
</head>
<body>
	<div id="wrapper">
	<!-- start header -->
	<tiles:insertAttribute name="top" />
	<!-- end header -->
	<!-- start body -->

	<tiles:insertAttribute name="body" />
	
	<!-- end body -->

	<!-- footer start here --> 
	<tiles:insertAttribute name="footer" />
	</div>
	 <!-- javascript ================================================== -->
  <!-- Placed at the end of the document so the pages load faster -->
  
  <script src="/js/jquery.easing.1.3.js"></script>
  <script src="/js/bootstrap.js"></script>
  <script src="/js/modernizr.custom.js"></script>
  <script src="/js/toucheffects.js"></script>
  <script src="/js/google-code-prettify/prettify.js"></script>
  <script src="/js/jquery.prettyPhoto.js"></script>
  <script src="/js/portfolio/jquery.quicksand.js"></script>
  <script src="/js/portfolio/setting.js"></script>
  <script src="/js/animate.js"></script>

  <!-- Template Custom JavaScript File 
  <script src="/js/custom.js"></script>
-->
</body>

</html>
