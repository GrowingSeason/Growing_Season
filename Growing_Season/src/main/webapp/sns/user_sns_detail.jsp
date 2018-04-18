<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
$(function () {
     var obj = $("#dropzone");

     obj.on('dragenter', function (e) {
          e.stopPropagation();
          e.preventDefault();
          $(this).css('border', '2px solid #5272A0');
     });

     obj.on('dragleave', function (e) {
          e.stopPropagation();
          e.preventDefault();
          $(this).css('border', '2px dotted #8296C2');
     });

     obj.on('dragover', function (e) {
          e.stopPropagation();
          e.preventDefault();
     });

     obj.on('drop', function (e) {
          e.preventDefault();
          $(this).css('border', '2px dotted #8296C2');

          var files = e.originalEvent.dataTransfer.files;
          if(files.length < 1)
               return;

          F_FileMultiUpload(files, obj);
     });

});

</script>

<div class="typo">
	<!---728x90--->
	<div class="container">
		<div class="row" align="center">

			<div class="col-md-4">

				<img src="C:\DEV34\HTML\image\097_4_hbg0214.gif">
			</div>
			<div class="col-md-4">
				
				<div id="dropzone" class="col-md-4">
<textarea>글내용이나 해쉬태그</textarea>
</div>
				
		

			</div>
			

		</div>

	</div>
	</div>