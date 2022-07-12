<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#character{
		float: left;
	}

	#mop{
		float: right;
	}
	#btns{
		clear: both;
	}
</style>
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
던전<br><br><br><br>

<div>
	<ul id="character">
		<li>캐릭터 정보</li>
		<li>idx: ${ main_ch.c_idx }</li>
		<li>name: ${ main_ch.c_name }</li>
		<li id="main_ch_hp">hp: ${ main_ch.c_hp }</li>
		<li>ad: ${ main_ch.c_ad }</li>
		<li>ap: ${ main_ch.c_ap }</li>
		<li>armor: ${ main_ch.c_armor }</li>
		<li>critical: ${ main_ch.c_critical }</li>
		<li>avd: ${ main_ch.c_avd }</li>
		<li>p_skill: ${ main_ch.c_p_skill }</li>
		<li>a_skill1: ${ main_ch.c_a_skill1 }</li>
		<li>a_skill2: ${ main_ch.c_a_skill2 }</li>
		<li>a_skill3: ${ main_ch.c_a_skill3 }</li>
		<li>a_skill4: ${ main_ch.c_a_skill4 }</li>
		<li>a_skill5: ${ main_ch.c_a_skill5 }</li>
		<li>a_skill6: ${ main_ch.c_a_skill6 }</li>
	</ul>
	
	<ul id="mop">
		<li>몹 정보</li>
		<li>idx: ${ mop1.m_idx }</li>
		<li>name: ${ mop1.m_name }</li>
		<li id="mop1_hp">hp: ${ mop1.m_hp }</li>
		<li>ad: ${ mop1.m_ad }</li>
		<li>skill: ${ mop1.m_skill }</li>
		<li>level: ${ mop1.m_level }</li>
	</ul>

</div>
<div id="btns">
	<button onclick="aa();">평타공격</button>
	<button onclick="shop();">상점</button>
</div>

</body>
</html>