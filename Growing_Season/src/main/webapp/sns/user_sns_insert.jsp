<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
<!--

button{
  background:#1AAB8A;
  color:#fff;
  border:none;
  position:relative;
  height:60px;
  font-size:1.6em;
  padding:0 2em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
}
button:hover{
  background:#fff;
  color:#1AAB8A;
}
button:before,button:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #1AAB8A;
  transition:400ms ease all;
}
button:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
button:hover:before,button:hover:after{
  width:100%;
  transition:800ms ease all;
}

-->
</style>

<div class="typo">
	<!---728x90--->
	<div class="container">
		<p id="status" align="center">Feed Insert</p>
		<form action="/snsFeedInsert.do" enctype="multipart/form-data" method="post">

			<div id="holder" align="center" style="border: 2px; width: 300;">
			</div>

			<div class="row" align="right">
			<div class='span4' id="snstext" style='float: left; display:none;'>
				<select class='form-control' id='division' name='ferange' style='width: 150px'>
					<option value="all">모두공개</option>
					<option value="friend">팔로우공개</option>
					<option value="secret">비공개</option>
				</select>
			</div>
			<div class='span4' id="snstextarea" style='float: left; display:none;'>
				<textarea name="fecon" style="margin:0px; width:400px; height:225px;">
				</textarea>
			</div>
			</div>
			
			<div id="imgfile" align="center">
				<p>
					<input type="file" name="ufile">
				</p><br><br>
				<button id="btn" type="submit" align="right" style="display: none;">
				글올리기
				</button>
			</div>

		</form>

	</div>
</div>
<script>
var upload = document.getElementsByTagName('input')[0],
    holder = document.getElementById('holder'),
    state = document.getElementById('status');

if (typeof window.FileReader === 'undefined') {
  state.className = 'fail';
} else {
  state.className = 'success';
  
}
 
upload.onchange = function (e) {
  e.preventDefault();

  var file = upload.files[0],
      reader = new FileReader();
  reader.onload = function (event) {
    var img = new Image();
    img.src = event.target.result;
    // note: no onload required since we've got the dataurl...I think! :)
    if (img.width > 560) { // holder width
      img.width = 560;
    }
    holder.innerHTML = '';
    holder.appendChild(img);
    
    $('#snstext').show();
    $('#snstextarea').show();
    $('#btn').show();
  };
  reader.readAsDataURL(file);

  return false;
};
</script>