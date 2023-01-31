<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/resources/css/character_choice.css">
<link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/resources/css/logo.css">
<link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/resources/css/btn.css">
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap');
</style>
<script type="text/javascript">
//선택한 캐릭터 정보 보내기
	function choice(idx){
		var c_idx = idx;
		
		if(confirm("캐릭터를 선택하시겠습니까?")==false) return;
		
		$.ajax({
			url: 'game/character/character_choice.do',
			data: { 'c_idx': c_idx},
			success: function(res_data){
				$('#disp').html(res_data);
			}
		});
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
   <div id="content" style="background-image: url('resources/img/char_back.png');"> 
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
	     
	     <div style="margin-top: 245px;">
	     	<a href='javascript:void(0);' onclick="choice(1);" class="btn-3d_s red rounded">선택</a>
	     	<a href='javascript:void(0);' onclick="choice(3);" class="btn-3d_s red rounded" style="margin-left: 175px; margin-right: 175px;">선택</a>
	     	<a href='javascript:void(0);' onclick="choice(2);" class="btn-3d_s red rounded">선택</a>
		    <!-- <button onclick="choice();">선택완료</button> -->
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