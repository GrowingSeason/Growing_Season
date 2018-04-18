<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<section id="inner-headline">
      <div class="container">
        <div class="row">
          <div class="span4">
            <div class="inner-heading">
              <h2><font color="#008000">신고페이지</font></h2>
            </div>
          </div>
          <div class="span8">            
          </div>
        </div>
      </div>
    </section>

<section id="content">
      <div class="container">
        <div class="row">
          <div class="span12">
		<br> <br>
		<table align="center" border=1px width=95%>
			<thead>
				<tr align="center">
					<th>NO</th>
					<th>작성자</th>
					<th>제목</th>
					<th>내용</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>
				<tr align="center">
					<td>${PBPOP_UP.bseq}</td>
					<td>${PBPOP_UP.mid}</td>
					<td>${PBPOP_UP.btitle}</td>
					<td>${PBPOP_UP.bcon}</td>
					<td>${PBPOP_UP.bregdate}</td>
				</tr>
			</tbody>
		</table>

		<br>

<form action="/proposalbdeclarationinsert.do" class="bdeclarationInsert" method="post">
<input type="hidden" name="bseq" value="${PBPOP_UP.bseq}">
		<div class="row" align="center">
			<label for="ex_input"><b><font color="#008000">신고사유</font></b></label>
			<br><br>
			<div class="col-lg-12">
				<div class="input-group" align="center">
					<input name="bdreason" value="" type="text" size=55
						aria-label="...">
				</div>
			</div>
		</div>
		
		<br> <br>
				<div align="center">
		<input type="submit" style="font-size: 18px; background:white;" value="신고">
			
		<button onclick="window.close()" style="font-size: 18px; background:white;">닫기</button>
		<br> <br> <br> <br>
			</div>
</form>
	</div>
</div>
</div>
</section>