<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/resources/css/character_choice.css">
<link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/resources/css/logo.css">
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap');
</style>
<script type="text/javascript">
//선택한 캐릭터 정보 보내기
	function choice(){
		var c_idx = $("input:radio:checked").val();
		stage_val++;
		$.ajax({
			url: 'game/character/character_choice.do',
			data: { 'c_idx': c_idx},
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
	  <div>
	     <div id="warrior_div">
	     	<img id="warrior_name" src="${ pageContext.request.contextPath }/resources/img/warrior_name.png">
	     	<img id="warrior" src="${ pageContext.request.contextPath }/resources/img/warrior.png">
	     	<img id="explain" src="${ pageContext.request.contextPath }/resources/img/textbox.png">
	     </div>	
	     
	     <div id="wizard_div">
	     	<img id="wizard_name" src="${ pageContext.request.contextPath }/resources/img/wizard_name.png">
	     	<img id="wizard" src="${ pageContext.request.contextPath }/resources/img/wizard.png">
	     	<img id="explain" src="${ pageContext.request.contextPath }/resources/img/textbox.png">
	     </div>	
	     
	     <div id="archor_div">
	     	<img id="archor_name" src="${ pageContext.request.contextPath }/resources/img/archor_name.png">
	     	<img id="archor" src="${ pageContext.request.contextPath }/resources/img/archor.png">
	     	<img id="explain" src="${ pageContext.request.contextPath }/resources/img/textbox.png">
	     </div>
	     <div style="clear: both;"></div>
	     
	     <div style="margin-top: 270px;">
	     	<input id="pick_war" type="radio" name="pick" value="1">
	     	<input id="pick_wiz" type="radio" name="pick" value="3">
	     	<input id="pick_arc" type="radio" name="pick" value="2"><br>
		    <button onclick="choice();">선택완료</button>
	     </div>
	  </div>  
	     
	     
     </div>
<!------------------------------------------------------------------------>
   <div id = "footer">
      <p id="copyright">Copyright 2022.Chasing Paws All rights reserved.</p>
   </div>
<!------------------------------------------------------------------------>   
</div>   

</body>
</html>