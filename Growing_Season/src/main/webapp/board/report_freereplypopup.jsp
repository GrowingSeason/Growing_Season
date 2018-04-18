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
					<th>내용</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>
				<tr align="center">
					<td>${FRPOP_UP.rseq}</td>
					<td>${FRPOP_UP.mid}</td>
					<td>${FRPOP_UP.rcon}</td>
					<td>${FRPOP_UP.rregdate}</td>
				</tr>
			</tbody>
		</table>

		<br>

<form action="/freerdeclarationinsert.do" class="rdeclarationInsert" method="post">
<input type="hidden" name="rseq" value="${FRPOP_UP.rseq}">
		<div class="row" align="center">
			<label for="ex_input"><b><font color="#008000">신고사유</font></b></label>
			<br><br>
			<div class="col-lg-12">
				<div class="input-group" align="center">
					<input name="rdreason" value="" type="text" size=55
						>
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