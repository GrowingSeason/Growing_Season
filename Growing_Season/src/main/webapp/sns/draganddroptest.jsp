<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">
input[type=file] {
   display: none;
}

.my_button {
   display: inline-block;
   width: 200px;
   text-align: center;
   padding: 10px;
   background-color: #006BCC;
   color: #fff;
   text-decoration: none;
   border-radius: 5px;
}

.imgs_wrap {
   width: 70%;
   border: 2px solid #A8A8A8;
   margin-top: 30px;
   margin-bottom: 30px;
   padding-top: 10px;
   padding-bottom: 10px;
}

.imgs_wrap img {
   width: 30%;
   margin-left: 10px;
   margin-right: 10px;
}
</style>

<script type="text/javascript" src="./js/jquery-3.1.0.min.js"
   charset="utf-8"></script>
<script type="text/javascript">
   // 이미지 정보들을 담을 배열
   var sel_files = [];

   $(document).ready(function() {
      $("#input_imgs").on("change", handleImgFileSelect);
   });

   function fileUploadAction() {
      console.log("fileUploadAction");
      $("#input_imgs").trigger('click');
   }

   function handleImgFileSelect(e) {

      // 이미지 정보들을 초기화
      sel_files = [];
      //$(".imgs_wrap").empty();

      var files = e.target.files;
      var filesArr = Array.prototype.slice.call(files);

      var index = 0;
      filesArr
            .forEach(function(f) {

               sel_files.push(f);

               var reader = new FileReader();
               reader.onload = function(e) {
                  var html = "<a href=\"javascript:void(0);\" onclick=\"deleteImageAction("
                        + index
                        + ")\" id=\"img_id_"
                        + index
                        + "\"><img src=\"" + e.target.result + "\" data-file='"+f.name+"' class='selProductFile' title='"+f.name+"'></a>";
                  $(".imgs_wrap").append(html);
                  index++;

               }
               reader.readAsDataURL(f);

            });

      var html2 = "<input type=\"submit\" class=\"my_button\" value=\"다음단계로\">";
      $("#nextButton").empty();
      $("#nextButton").append(html2);

   }

   function deleteImageAction(index) {
      console.log("index : " + index);
      console.log("sel length : " + sel_files.length);

      sel_files.splice(index, 1);

      var img_id = "#img_id_" + index;
      $(img_id).remove();
   }

   function zoomImageAction(index) {

   }

   function fileUploadAction() {
      console.log("fileUploadAction");
      $("#input_imgs").trigger('click');
   }
</script>




</head>
<body>
   <div id="all" style="width: 80%; margin-bottom: 500px;">
      <form action="/documentInsert.do" enctype="multipart/form-data"
         method="post">
         
         
         <input type="hidden" name="mseq" value="2">  <!--  -->
         <input type="hidden" name="apname" value="sessionName"> 
         <input type="hidden" name="apphone" value="010-1234-1234">
         <input type="hidden" name="apemail" value="session@s.com">
         <input type="hidden" name="apbirth" value="50/01/01"> <!--  -->
   
         <input type="hidden" name="dseq" value="1"> 
         <input type="hidden" name="apseq" value="1"> 
         <input type="hidden" name="dname" value="dd">          
         
         <input id="input_imgs" multiple="multiple" type="file" name="files"/>
         <table>
            <tr>
               <td>
                  <div style="align: center;">
                     <img width="100%" alt="applyLevel"
                        src="/images/applygarden_step2.png">
                  </div>
               </td>
            </tr>
            <tr align="center" style="width: 200px;"><h1>신청유형</h1></td>
               <td align="center" style="width: 500px;">

                  <h3>
                     <input type="radio" name="apdivision" value="실버" checked>실버
                     <input type="radio" name="apdivision" value="다둥이">다둥이
                     <input type="radio" name="apdivision" value="다문화">다문화
                  </h3>

               </td>
            </tr>
            <tr>
               <td>
                  <div>
                     <div class="imgs_wrap" style="width: 100%"></div>
                  </div>
               </td>
            </tr>
            <tr>
               <td>
                  <div class="input_wrap">
                     <a href="javascript:" onclick="fileUploadAction();"
                        class="my_button">파일찾기</a>
                  </div>
               </td>
            </tr>
            <tr>
               <td>
                  <div id="nextButton" align="right">
                     <!-- <input type="submit" class="my_button" value="다음단계로"> -->
                  </div>
               </td>
            </tr>
         </table>
      </form>
   </div>

</body>
</html>