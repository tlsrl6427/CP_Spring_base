<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/resources/css/game_main.css">
<link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/resources/css/logo.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap');
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
                           +   res_data.attack_main_ch_info + "\n"
                           + "-------------------------------------------------------\n";
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
                                 +   res_data.attack_main_ch_info + "\n";
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
            content0 = content0  + "-------------------------------------------------------\n";
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
<div id="box">
<!------------------------------------------------------------------------>
   <div id="header">
      <a href="index.jsp">
         <img id="logo" src="${ pageContext.request.contextPath }/resources/img/logo.png">
      </a>               
   </div>
<!------------------------------------------------------------------------>
   <div id="content">
      <div id="right">
         <div id="stage_info">
            스테이지정보
         </div>
         
         <div id="game_page">
            <div>
               <div id="guard_info">
                  <table></table>
           	   </div>
           	</div>  
           	
           	<div id="user_hp_bar">
	            <div>
		            <div class="progress" style="width: 100%; margin-top: 10px;">
						<div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width:100%;">
							HP
						</div>
					</div>
					<img id="warrior" src="${ pageContext.request.contextPath }/resources/img/warrior.png">
	            </div>
            </div>
            
            <div id="mop_hp_bar">
	            <div>
		            <div class="progress" style="width: 100%; margin-top: 10px;">
						<div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width:100%;">
							HP
						</div>
					</div>
					<img id="warrior" src="${ pageContext.request.contextPath }/resources/img/magician.png">
	            </div>
            </div>
            
         </div>
         
         
         <div id="state_story">
            <div id="story_page">
               <textarea id="txt" readonly="readonly"></textarea>
            </div>
            
            <div id="state_page">
               <div id="user_state">
                    <table border="1" style="font-size: small;">
                        <tr>
                           <td>idx: ${ main_ch.c_idx }</td>
                       <td>name: ${ main_ch.c_name }</td>
                       <td id="main_ch_hp">hp: ${ main_ch.c_hp }</td>
                       <td id="main_ch_ad">ad: ${ main_ch.c_ad }</td>
                    </tr>
                    <tr>
                       <td id="main_ch_ap">ap: ${ main_ch.c_ap }</td>
                       <td id="main_ch_avd">avd: ${ main_ch.c_avd }</td>
                       <td id="main_ch_critical">critical: ${ main_ch.c_critical }</td>
                       <td>auto_attack: ${ main_ch.c_auto_attack }</td>
                    </tr>
                    <tr>
                       <td colspan="3" id="main_ch_armor">armor: ${ main_ch.c_armor } (피해감소 ${ 100-5000/(main_ch.c_armor+50) }%)</td>
                       <td>p_skill: ${ main_ch.c_p_skill }</td>
                    </tr>
               </table>
               </div>
               <div id="btn_state">
               <a onclick="aa();"><img id="btn_skill1" src="${ pageContext.request.contextPath }/resources/img/general.png"></a>
               <a onclick="shop();"><img id="btn_skill2" src="${ pageContext.request.contextPath }/resources/img/shop.png"></a>
               <a onclick="skill(${ main_ch.skill_vo[s_idx[0] - 1].s_idx });"><img id="btn_skill" src="${ pageContext.request.contextPath }/resources/img/skill1.png"></a>
               <a onclick="skill(${ main_ch.skill_vo[s_idx[1] - 1].s_idx });"><img id="btn_skill" src="${ pageContext.request.contextPath }/resources/img/skill1.png"></a>
               <a onclick="skill(${ main_ch.skill_vo[s_idx[2] - 1].s_idx });"><img id="btn_skill" src="${ pageContext.request.contextPath }/resources/img/skill1.png"></a>
               <a onclick="skill(${ main_ch.skill_vo[s_idx[3] - 1].s_idx });"><img id="btn_skill" src="${ pageContext.request.contextPath }/resources/img/skill1.png"></a>
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