<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
	#text_box{
		float: left;
	}
</style>
<script type="text/javascript">
	$(function(){
		alert(stage_val + " 스테이지");
	})
	
	function choice(){
		$.ajax({
			url: '${ pageContext.request.contextPath }/game/shop/shop.do',
			success: function(res_data){
				$('#disp').html(res_data);
			}
		})
	}
	
	function aa(){
		var auto_attack = 0;
		$.ajax({
			url: 'game/dungeon/battle/attack.do',
			data: {'s_idx': auto_attack},
			dataType: 'json',
			success: function(res_data){
				$('#main_ch_hp').html('hp: '+ res_data.main_ch_hp);
				$('#mop_hp').html('hp: '+ res_data.mop_hp);
				
				var content = $("#txt").val();
				content = content  + res_data.attack_mop_info + "\n"
									+	res_data.attack_main_ch_info + "\n"
									+ "--------------------------------------------------------------\n";
				$("#txt").html(content); 
			}
		})
	}
	
	function skill(s_idx){
		$.ajax({
			url: 'game/dungeon/battle/attack.do',
			data: {'s_idx': s_idx},
			dataType: 'json',
			success: function(res_data){
				
				$('#main_ch_hp').html('hp: '+ res_data.main_ch_hp);
				$('#mop_hp').html('hp: '+ res_data.mop_hp);
				
				//스탯
				$('#main_ch_ad').html('ad: '+ res_data.main_ch_ad);
				$('#main_ch_ap').html('ap: '+ res_data.main_ch_ap);
				$('#main_ch_armor').html('armor: '+ res_data.main_ch_armor+"(피해감소 "+ Math.round(100-5000/(res_data.main_ch_armor+50)) +"%)");
				$('#main_ch_critical').html('critical: '+ res_data.main_ch_critical);
				$('#main_ch_avd').html('avd: '+ res_data.main_ch_avd);
				
				$('#mop_ad').html('ad: '+ res_data.mop_ad);
				$('#mop_armor').html('armor: '+ res_data.mop_armor);
				
				var content = $("#txt").val();
				content = content  + res_data.attack_mop_info + "\n"
											+	res_data.attack_main_ch_info + "\n";
				$("#txt").html(content); 
				
				if(typeof res_data.extra_skill_main_ch != "undefined"){
					$("#txt").css("color", "red");
					var content2 = $("#txt").val();
					content2 = content2  + res_data.extra_skill_main_ch + "\n"
					$("#txt").html(content2); 
					
					$("#txt").css("color", "black");
				}
				
				if(typeof res_data.extra_skill_mop != "undefined"){
					$("#txt").css("color", "red");
					var content3 = $("#txt").val();
					content3 = content3  + res_data.extra_skill_mop + "\n"
					$("#txt").html(content3); 
					
					$("#txt").css("color", "black");
				}
				var content0 = $("#txt").val();
				content0 = content0  + "--------------------------------------------------------------\n";
				$("#txt").html(content0); 
				
				if(res_data.mop_hp<=0)
					next_stage();
				else if(res_data.main_ch_hp<=0)
					previous_shop();
			}
		});
	}
	
	function next_stage(){
		//스테이지 정보 ++
		alert("적을 무찔렀습니다");
		alert("다음 스테이지로 넘어갑니다");
		stage_val++;
		$.ajax({
			url: 'game/shop/shop.do',
			success: function(res_data){
				$('#disp').html(res_data);
			}
		}) 
	}
	
	function previous_shop(){
		//스테이지 정보--
		alert("사망하였습니다");
		alert("상점에서 부활합니다");
		$.ajax({
			url: 'game/shop/shop.do',
			success: function(res_data){
				$('#disp').html(res_data);
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
      <li id="main_ch_ad">ad: ${ main_ch.c_ad }</li>
      <li id="main_ch_ap">ap: ${ main_ch.c_ap }</li>
      <li id="main_ch_armor">armor: ${ main_ch.c_armor }(피해감소 ${ 100-5000/(main_ch.c_armor+50) }%)</li>
      <li id="main_ch_critical">critical: ${ main_ch.c_critical }</li>
      <li id="main_ch_avd">avd: ${ main_ch.c_avd }</li>
      <li>auto_attack: ${ main_ch.c_auto_attack }</li>
      <li>p_skill: ${ main_ch.c_p_skill }</li>
      
      
      <li><button onclick="skill(${ main_ch.skill_vo[s_idx[0] - 1].s_idx });">a_skill1: ${ main_ch.skill_vo[s_idx[0] - 1].s_name }</button></li>
      <li><button onclick="skill(${ main_ch.skill_vo[s_idx[1] - 1].s_idx });">a_skill2: ${ main_ch.skill_vo[s_idx[1] - 1].s_name }</button></li>
      <li><button onclick="skill(${ main_ch.skill_vo[s_idx[2] - 1].s_idx });">a_skill3: ${ main_ch.skill_vo[s_idx[2] - 1].s_name }</button></li>
      <li><button onclick="skill(${ main_ch.skill_vo[s_idx[3] - 1].s_idx });">a_skill4: ${ main_ch.skill_vo[s_idx[3] - 1].s_name }</button></li>
	</ul>
	
	<div id="text_box">
		<textarea id="txt" rows="20" cols="80"></textarea>
	</div>
	
	<ul id="mop">
		<li>몹 정보</li>
		<li>idx: ${ mop.m_idx }</li>
		<li>name: ${ mop.m_name }</li>
		<li id="mop_hp">hp: ${ mop.m_hp }</li>
		<li id="mop_ad">ad: ${ mop.m_ad }</li>
		<li id="mop_armor">armor: ${ mop.m_armor }</li>
		<li>skill: ${ mop.m_skill }</li>
		<li>level: ${ mop.m_level }</li>
	</ul>

</div>
<div id="btns">
	<button onclick="aa();">평타공격</button>
	<button onclick="shop();">상점</button>
</div>

</body>
</html>