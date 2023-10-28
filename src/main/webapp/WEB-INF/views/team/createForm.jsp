<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/JavaScript"> 
  function checkIn(f){
	  if (f.tname.value == ""){
         alert("이름 입력하세요");
         f.tname.focus()
         return false;
     }
     if ($('[name=skills]:checked').length == 0){
         alert("기술을 선택하세요");
         $('[name=skills]:eq(0)').focus();
         return false;
     }
	  /* if (f.skills.value == ""){
	         alert("기술을 선택하세요");
	         f.java.focus();
	         return false;
	     } */
     if (f.phone.value == ""){
         alert("전화번호를 입력세요");
         f.phone.focus();
         return false;
 	 }
     if (f.address.value == ""){
         alert("주소를 입력세요");
         f.address.focus();
         return false;
 	 }
     if (f.zipcode.value == ""){
         alert("우편번호를 입력세요");
         f.zipcode.focus();
         return false;
 	 }
     if (f.gender.value == ""){
         alert("성별을 선택하세요");
         f.gender_male.focus();
         return false;
 	 }
}
 </script>
 
</head>
<body>
	<div class="container m-3">
        <h3>팀원 등록</h3>
        
        <form action="create" 
                  method="post"
                  onsubmit="return checkIn(this)"
                  name="aaform">
	        <div class="mb-3 mt-3">
		        <label for="tname">이름:</label> 
		        <input type="text"
		        	class="form-control" id="tname" name="tname" placeholder="이름을 입력하세요">
		    </div>
	        <div class="mb-3 mt-3">
                <label for="skills">기술</label> 
                <input type="checkbox" id="java" name="skills" value="java"/> java 
                <input type="checkbox" id="jsp" name="skills" value="jsp"/> jsp 
                <input type="checkbox" id="spring" name="skills" value="spring"/> spring 
                <input type="checkbox" id="javascript" name="skills" value="javascript" /> javascript                 
	        </div>
	        <div class="mb-3 mt-3">
	        	<label for="phone">전화번호:</label>
	            <input type="tel"
		        	class="form-control" id="phone" name="phone" pattern="[0-1]{3}-[0-9]{4}-[0-9]{4}" placeholder="전화번호를 입력하세요">
	        </div>
	        <div class="mb-3 mt-3">
				<label for="address">주소:</label> 
	            <input type="text" class="form-control" id="address" name="address" placeholder="주소를 입력하세요">
	        </div>
	        <div class="mb-3 mt-3">
				<label for="zipcode">우편번호:</label> 
	            <input type="number" class="form-control" id="zipcode" name="zipcode" pattern="[0-9]{6}" placeholder="우편번호를 입력하세요">
	        </div>
	        <div class="mb-3 mt-3">
				<label for="gender">성별:</label> 
	            <input type="radio" id="gender_male" name="gender" value="male"/> 남자 
                <input type="radio" id="gender_female" name="gender" value="female"/> 여자 
                <input type="radio" id="gender_other" name="gender" value="other"/> 그외 
	        </div>
	        <button type="submit" class="btn btn-primary">Submit</button>
        </form>
	</div>
</body>
</html>