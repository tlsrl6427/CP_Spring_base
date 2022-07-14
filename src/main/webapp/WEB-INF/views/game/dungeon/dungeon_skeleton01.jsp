<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/css/game_main.css">
<link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/css/logo.css">

<script type="text/javascript">
	function choice(){
		a++;
		console.log("a: "+a);
		$.ajax({
			url: 'game/shop/shop.do',
			success: function(res_data){
				$('#disp').html(res_data);
			}
		})
	}
	
	function aa(){
		$.ajax({
			url: 'game/dungeon/battle/attack.do',
			dataType: 'json',
			success: function(res_data){
				alert(res_data.main_ch_damage+"의 피해를 입혔습니다");
				alert(res_data.mop1_damage+"의 피해를 입었습니다");
				$('#main_ch_hp').html('hp: '+ res_data.main_ch_hp);
				$('#mop1_hp').html('hp: '+ res_data.mop1_hp);
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
			<img id="logo" src="${ pageContext.request.contextPath }/img/logo.png">
		</a>					
	</div>
<!------------------------------------------------------------------------>
	<div id="content">
		
		<div id="guard_info">
			<table></table>
		</div>
		
		<div id="right">
			<div id="stage_info">
				스테이지정보
			</div>
			
			<div id="game_page">
				<td><img id="warrior" src="${ pageContext.request.contextPath }/img/warrior.png" ></td>
			</div>
			
			<div id="state_story">
				
				<div id="story_page">
					텍스트창
				</div>
				
				<div id="state_page">
					<div style="background: green; height: 60px;">
						상태창1
					</div>
					<div style="background: lightgreen; height: 60px;">
						상태창2
					</div>
				</div>
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