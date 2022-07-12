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
	<div id="content">
		<button onclick="start()">시작</button>
		<button onclick="location.href='user/login.do';">로그인</button>
	</div>	
<!------------------------------------------------------------------------>
	<div id = "footer">
		<p id="copyright">Copyright 2022.Chasing Paws All rights reserved.</p>
	</div>
<!------------------------------------------------------------------------>			
</div>


</body>
</html>