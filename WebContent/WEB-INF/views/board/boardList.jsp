<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<!-- section1 -->
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/common.css">
    <script src="<%=request.getContextPath()%>/resources/js/docSlider.min.js"></script>
    <title>테스트</title>
</head>

<jsp:include page="/WEB-INF/views/include/include_header.jsp"></jsp:include>

<body>

	<div class="docSlider">
		<section class="section1">
	        <div class="inner">
				<table class="tb1">
					<thead>
						<tr>
							<th>게시글번호</th>
							<th>작성자</th>
							<th>제목</th>
							<th>등록일</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="items" items="${boardList }">
					<tr>
						<td>${items.board_no }</td>
						<td>${items.name }</td>
						<td>${items.title }</td>
						<td>${items.reg_dt }</td>
					</tr>
					</c:forEach>
					</tbody>
				</table>
				<button class="btn-open-popup">게시글 작성</button> 
			</div>
			
			<div class="modal">
		      <div class="modal_body">
		      	<h1>게시글</h1>
		      	<form id="boardForm" name="boardForm" method="post" action="/boardRegist.do">
		      		<fieldset>
		      		<legend>내용입력</legend>
		      			<input type="hidden" name="mem_no" value="${loginUser.mem_no }">
			      		<input id="title" name="title" type="text" placeholder="게시글 제목 입력" />
			      		<input id="content" name="content" type="text" placeholder="게시글 내용 입력" />
			      		<input type="submit" value="등록하기"  />
		      		</fieldset>
		      	</form>
		      </div>
		    </div>
		</section>
	</div>
	
<script>

	const body = document.querySelector('body');
	const modal = document.querySelector('.modal');
	const btnOpenPopup = document.querySelector('.btn-open-popup');
	
	btnOpenPopup.addEventListener('click', function(event){
		modal.classList.toggle('show');
		
		  if (modal.classList.contains('show')) {
		    body.style.overflow = 'hidden';
		  }
	});
	
	modal.addEventListener('click', function(event){
		if (event.target === modal) {
		    modal.classList.toggle('show');
		
		    if (!modal.classList.contains('show')) {
		      body.style.overflow = 'auto';
		    }
		  }		
	});

</script>	
	
<jsp:include page="/WEB-INF/views/include/include_footer.jsp"></jsp:include>