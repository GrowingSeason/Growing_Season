<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!-- sidebar쓰시는분들은 admin, user 페이지 메뉴에 맞게 메뉴이름 및 링크 수정해주시고  명명규칙 맞춰서 jsp파일 만드시면 되겟습니다-->

			<div class="nav-sidebar" style="margin-top:20%;margin-left:15%;">
                <ul class="nav">
               		<li class="active"><a>게시판</a></li>
                     <li><a href="/boardnoticelist.do">공지 게시판</a></li>
                    <li><a href="/boardfreelist.do">자유 게시판</a></li>
                    <li><a href="/boardproposallist.do">건의사항 게시판</a></li>
                    <li><a href="/boardnoticelist.do">게시글 신고 관리</a></li>
                    <li><a href="">댓글신고리스트</a></li>
               </ul>
            </div>