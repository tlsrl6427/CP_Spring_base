<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/resources/css/story_choice.css">
<link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/resources/css/logo.css">
<script type="text/javascript">
	function choice(){
			$.ajax({
				url: 'game/character/character_choice_form.do',
				success: function(res_data){
					$('#disp').html(res_data);
				}
			})
	}
</script>
</head>
<body>
<div id="box">
<!------------------------------------------------------------------------>
   <div id="header">
      <a href="index.jsp">
         <img id="logo" src="${ pageContext.request.contextPath }/resources/img/logo.png">
      </a>               
   </div>
<!------------------------------------------------------------------------>
   <div id="content">
	     <button onclick="choice();">캐릭터 선택</button>
   </div>
<!------------------------------------------------------------------------>
   <div id = "footer">
      <p id="copyright">Copyright 2022.Chasing Paws All rights reserved.</p>
   </div>
<!------------------------------------------------------------------------>   
</div>   

</body>
</html>