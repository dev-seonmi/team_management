<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container mt-3">
  <h2>팀원 수정</h2>
  <form action="update"
  		method="post">
  	<input type="hidden" name="teamno" value="${dto.teamno }">
  	<input type="hidden" name="col" value="${param.col }">
  	<input type="hidden" name="word" value="${param.word }">
  	<input type="hidden" name="nowPage" value="${param.nowPage }">
    <div class="mb-3 mt-3">
      <label for="tname">이름:</label>
      <input type="text" class="form-control" id="tname" value="${dto.tname}" name="tname">
    </div>
    <div class="mb-3 mt-3">
      <label for="skills">기술:</label>                
   	  <input type="checkbox" id="java" name="skills" value="java" /> java 
      <input type="checkbox" id="jsp" name="skills" value="jsp" /> jsp 
      <input type="checkbox" id="javascript" name="skills" value="javascript" /> javascript 
      <input type="checkbox" id="spring" name="skills" value="spring" /> spring
      <c:forTokens var="list" items="${dto.skills}" delims=",">
      	<script>
      		document.getElementById('${list}').checked = true;
      	</script>
      </c:forTokens>   
    </div>
    <div class="mb-3 mt-3">
      <label for="phone">전화번호:</label>
      <input type="tel" class="form-control" id="phone" value="${dto.phone}" name="phone">
    </div>
    <div class="mb-3 mt-3">
      <label for="address">주소:</label>
      <input type="text" class="form-control" id="address" value="${dto.address}" name="address">
    </div>
    <div class="mb-3 mt-3">
      <label for="zipcode">우편번호:</label>
      <input type="number" class="form-control" id="zipcode" value="${dto.zipcode}" name="zipcode">
    </div>
    <div class="mb-3 mt-3">
      <label for="gender">성별:</label>
      <input type="radio" id="male" name="gender" value="male" /> 남자 
      <input type="radio" id="female" name="gender" value="female" /> 여자 
      <input type="radio" id="other" name="gender" value="other" /> 그외
      <script>
      	document.getElementById('${dto.gender}').checked = true;
      </script> 
    </div>
    

    <button type="submit" class="btn btn-primary">Submit</button>
  </form>
</div>
</body>
</html>