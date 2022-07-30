<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap');
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/main.css">
<link rel="stylesheet" type="text/css" href="resources/css/logo.css">
<link rel="stylesheet" type="text/css" href="resources/css/btn.css">

<script type="text/javascript">
	function start(){
		$.ajax({
			url: 'game/story/story_beginning.do',
			success: function(res_data){
				$('#disp').html(res_data);
			}
		})
	}
</script>
</head>
<body>
<!------------------------------------------------------------------------>
<div id="box">
	<div id="header">
		<a href="index.jsp">
			<img id="logo" src="resources/img/logo.png">
		</a>						
	</div>
<!------------------------------------------------------------------------>
	<div id="content" style="background-image: url('resources/img/main_back.png');">
		<img src="resources/img/logo.png" style="width: 350px;"><br>
		<a href="javascript:start();" class="btn-3d red">Start</a><br>
		<a href="#" class="btn-3d blue">Ranking</a>
	</div>	
<!------------------------------------------------------------------------>
	<div id = "footer">
		<p id="copyright">Copyright 2022.Chasing Paws All rights reserved.</p>
	</div>
<!------------------------------------------------------------------------>			
</div>


</body>
</html>