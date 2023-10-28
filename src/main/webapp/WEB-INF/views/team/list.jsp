<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   
<%@ taglib prefix="util" uri="/ELFunctions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function read(teamno){
		let url = "read";
		url += "?teamno="+teamno;
		url += "&col=${col}";
		url += "&word=${word}";
		url += "&nowPage=${nowPage}";
		
		//alert(url);
		
		location.href=url;
	}
</script>
</head>
<body>
<div class="container mt-3">
  <h2>팀원 목록</h2>
   <form action="list">
 <div class="row mb-3 mt-3"> 
   <div class="col">  
     <select class="form-select"  name="col">
      <option value="tname"
      <c:if test="${col=='tname'}">selected</c:if>
      >이름</option>
      <option value="skills" 
      <c:if test="${col=='skills'}">selected</c:if>
      >기술</option>
      <option value="phone"
      <c:if test="${col=='phone'}">selected</c:if>
      >전화번호</option>
      <option value="address" 
      <c:if test="${col=='address'}">selected</c:if>
      >주소</option>
      <option value="total"
     <c:if test="${col=='total'}">selected</c:if>
      >전체출력</option>
    </select>
   </div>
   <div class="col">
       <input type="search" class="form-control" name="word" 
       required="required" value="${word}">
   </div>
   <div class="col">
    <button type="submit" class="btn btn-primary">검색</button>
    <button type="button" class="btn btn-primary" 
    onclick="location.href='create'">등록</button>
   </div>
  </div>
  </form> 
   <table class="table table-bordered">
    <thead>
      <tr>
        <th>번호</th>
        <th>이름</th>
        <th>기술</th>
        <th>전화번호</th>
        <th>주소</th>
        <th>등록 날짜</th>
      </tr>
    </thead>
    <tbody>
    <c:choose>
      <c:when test="${empty list}">
       <tr><td colspan="6">등록된 공지사항이 없습니다.</td></tr>
      </c:when>
      <c:otherwise>
       <c:forEach var="dto" items="${list}" varStatus="status">
      <tr>
        <td>${status.count}</td>
        <td>
        	<a href="javascript:read('${dto.teamno }')">${dto.tname}</a>
        	<c:if test="${util:newimg(fn:substring(dto.rdate, 0, 10)) }">
        		<img src="/images/new.gif" />
        	</c:if>        	
        </td>
        <td>${dto.skills}</td>
        <td>${dto.phone}</td>
        <td>${dto.address}</td>
        <td>${fn:substring(dto.rdate, 0, 10)}</td>
      </tr>
        </c:forEach>
       </c:otherwise>
     </c:choose>
    </tbody>
  </table>
  
  ${paging}
</div>
</body>
</html>