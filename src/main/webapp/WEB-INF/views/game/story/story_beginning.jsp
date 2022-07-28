<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/resources/css/story_main.css">
<link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/resources/css/logo.css">
<link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/resources/css/btn.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">

	function choice(){
			$.ajax({
				url: 'game/character/character_choice_form.do',
				success: function(res_data){
					$('#disp').html(res_data);
				}
			})
	}
	
	$( document ).ready( function() {
		$( '#story_textbox' ).fadeToggle(0);
        $( '#story_textbox' ).fadeIn( 2000 );
    });
	

	
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
   	 	<div id="story_back" style="background-image: url('resources/img/back1_op.png');">
   	 		<img id="story_textbox" src="${ pageContext.request.contextPath }/resources/img/story_textbox.png">
	   		<!-- <br><button onclick="choice();">캐릭터 선택</button> -->
	   		<div class="btn-container">
			  <a href="javascript:choice();" class="btn-3d green">캐릭터선택</a>
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