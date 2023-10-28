<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	p#red {
		color : red;
	}
</style>
</head>
<body>
<div class='container mt-3'>
<h3>삭제</h3>
<p id='red'>삭제하면 복구할 수 없습니다.</p>
<p id='red'>아래의 메세지를 똑같이 따라 쓰세요.</p>
<form action="delete"
      method="post">
    <input type="hidden" name='teamno' value="${param.teamno}">
    <input type="hidden" name='nowPage' value="${param.nowPage}">
    <input type="hidden" name='col' value="${param.col}">
    <input type="hidden" name='word' value="${param.word}">
     <div class="row">
  	<div class="col">
  	 <input type="password" name="passwd" placeholder="delete" class="form-control" required>
  	</div>
	<div class="col">
	 <button class="btn btn-outline-dark">삭제</button>
	</div>
  </div>          
</form>
</div>
</body>
</html>