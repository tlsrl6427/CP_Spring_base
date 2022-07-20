<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap');
</style>
<link rel="stylesheet" type="text/css" href="resources/css/shop_main.css">
<link rel="stylesheet" type="text/css" href="resources/css/logo.css">
<style type="text/css">

	.tooltip .tooltiptext {
		  visibility: hidden;
		  width: 150px;
		  background-color: black;
		  color: #fff;
		  text-align: center;
		  border-radius: 6px;
		  padding: 5px 0;
		
		  /* Position the tooltip */
		  position: absolute;
		  z-index: 1;
		  /*
		  bottom: 100%;
		 left: 50%;
		  margin-left: -50px; */
	}
	
	.tooltip:hover .tooltiptext {
		  visibility: visible;
	}

</style>
<script type="text/javascript">
//던전 정보 보내기
//스테이지 넘어갈때마다 dungeon변수에 +해줘서 불러내야할 던전정보 특정하기
var s_val = [];
   
   function dungeon(){
   
      if ($("input:checkbox:checked").length < 4) {
         alert("스킬은 총 4개를 선택해 주세요!");
         return;
      }
      
      if (document.getElementById('total_no').value != 0) {
         alert("스킬 포인트를 모두 사용해 주세요!");
          return;
      }
      
      var s_idx = [];
      var s_num = [];

      $("input:checkbox:checked").each(function(i,iVal) {
         s_idx.push($(this).val());
         //console.log($(this).closest($("input[id=skill_no]")));
         s_num.push($(this).attr('name'));
      });

      console.log(s_num);
      
      jQuery.ajaxSettings.traditional = true;   // 이거 추가 안 하면 parameter 넘어갈 때 %5B%5D가 추가되어서 넘어감
      $.ajax({
         url: 'game/dungeon/dungeon.do',
         data: {"stage_val": stage_val, "s_idx": s_idx, "s_num": s_num, "s_val": s_val},
         success: function(res_data){
            $('#disp').html(res_data);
         }
      })
   }
	
	function item_buy(t){
		if(confirm($(t).text().split("\n")[0]+"을(를) 구매하시겠습니까?")==false) return;
		var i_idx=$(t).prop("id");
		$.ajax({
			url: 'game/shop/item_buy.do',
			data: {"i_idx": i_idx},
			success: function(res_data){
				alert(res_data.i_name+"을 구매하였습니다");
				$(t).css('visibility', 'hidden');
				var item_category;
				if(res_data.i_category=="머리"){
					$("#helmet").text(res_data.i_name);
					item_category = $("#helmet");
				}
				else if(res_data.i_category=="상체"){
					$("#upper_body").text(res_data.i_name);
					item_category = $("#upper_body");
				}
				else if(res_data.i_category=="하체"){
					$("#lower_body").text(res_data.i_name);
					item_category = $("#lower_body");
				}
				else if(res_data.i_category=="무기"){
					$("#weapon").text(res_data.i_name);
					item_category = $("#weapon");
				}
				else{
					$("#potion").text(res_data.i_name);
					item_category = $("#potion");
				}
				
				var span_tag = $("<span class=\"tooltiptext\"><ul></ul></span>");
				$(span_tag).append("<li>"+
						res_data.i_name+"</li><li>" +
						res_data.i_class+"</li><li>" +
						res_data.i_category+"</li><li>" +
						res_data.i_level+"</li>" );
				if(res_data.i_hp!=0) $(span_tag).append("<li>HP "+res_data.i_hp+" 증가</li>");
				if(res_data.i_hp_percent!=0) $(span_tag).append("<li>HP "+res_data.i_hp_percent+"% 증가</li>");
				if(res_data.i_ad!=0) $(span_tag).append("<li>공격력 "+res_data.i_ad+" 증가</li>");
				if(res_data.i_ad_percent!=0) $(span_tag).append("<li>공격력 "+res_data.i_ad_percent+"% 증가</li>");
				if(res_data.i_ap!=0) $(span_tag).append("<li>주문력 "+res_data.i_ap+" 증가</li>");
				if(res_data.i_ap_percent!=0) $(span_tag).append("<li>주문력 "+res_data.i_ap_percent+"% 증가</li>");
				if(res_data.i_armor!=0) $(span_tag).append("<li>방어력 "+res_data.i_armor+" 증가</li>");
				if(res_data.i_armor_percent!=0) $(span_tag).append("<li>방어력 "+res_data.i_armor_percent+"% 증가</li>");
				if(res_data.i_critical!=0) $(span_tag).append("<li>크리티컬 "+res_data.i_critical+"% 증가</li>");
				if(res_data.i_avd!=0) $(span_tag).append("<li>회피율 "+res_data.i_avd+"% 증가</li>");
				item_category.append(span_tag);
			}
		})
	}
	
	function item_shuffle(){
		if(confirm("아이템을 새로고침 하시겠습니까?")==false) return;
		$.ajax({
			url: 'game/shop/item_shuffle.do',
			data: {"stage_val": stage_val},
			success: function(res_data){
				$('#random_items > div').each(function(index, item){
					$(item).css('visibility', 'visible');
					$(item).attr("id", res_data[index].i_idx);
					$(item).text(res_data[index].i_name);
					var span_tag = $("<span class=\"tooltiptext\"><ul></ul></span>");
					$(span_tag).append("<li>"+
							res_data[index].i_name+"</li><li>" +
							res_data[index].i_class+"</li><li>" +
							res_data[index].i_category+"</li><li>" +
							res_data[index].i_level+"</li>" );
					if(res_data[index].i_hp!=0) $(span_tag).append("<li>HP "+res_data[index].i_hp+" 증가</li>");
					if(res_data[index].i_hp_percent!=0) $(span_tag).append("<li>HP "+res_data[index].i_hp_percent+"% 증가</li>");
					if(res_data[index].i_ad!=0) $(span_tag).append("<li>공격력 "+res_data[index].i_ad+" 증가</li>");
					if(res_data[index].i_ad_percent!=0) $(span_tag).append("<li>공격력 "+res_data[index].i_ad_percent+"% 증가</li>");
					if(res_data[index].i_ap!=0) $(span_tag).append("<li>주문력 "+res_data[index].i_ap+" 증가</li>");
					if(res_data[index].i_ap_percent!=0) $(span_tag).append("<li>주문력 "+res_data[index].i_ap_percent+"% 증가</li>");
					if(res_data[index].i_armor!=0) $(span_tag).append("<li>방어력 "+res_data[index].i_armor+" 증가</li>");
					if(res_data[index].i_armor_percent!=0) $(span_tag).append("<li>방어력 "+res_data[index].i_armor_percent+"% 증가</li>");
					if(res_data[index].i_critical!=0) $(span_tag).append("<li>크리티컬 "+res_data[index].i_critical+"% 증가</li>");
					if(res_data[index].i_avd!=0) $(span_tag).append("<li>회피율 "+res_data[index].i_avd+"% 증가</li>");
					
					$(item).append(span_tag);
				});
			}
		})
	}
</script>
<script type="text/javascript">
	$("input:checkbox").click(function() {
		var max = $("input:checkbox:checked").length >= 4;     
		$("input:checkbox").not(":checked").attr("disabled",max);
		});
	
	var Myelement = document.getElementById('total_no');
	   
	   $("input[type=number]").bind('keyup input', function(){
	      
	      var num = 0;
	      var t_num = 0;
	      
	      
	      for (var a of $("input[id=skill_no]")) {
	         t_num = 0;
	         t_num = Number($(a).val());
	         s_val.push(t_num);
	         num = num + Number($(a).val());
	      }
	      
	      Myelement.value = 10 - num;
	      
	      //console.log(s_val);
	      
	      if (Myelement.value == 0) {
	         $('input[id=skill_no]').prop('disabled', true);
	      }
	      
	      
	   });
	   Myelement = document.getElementById('total_no');
</script>
</head>
<body>

<div id="box">
<!------------------------------------------------------------------------>
	<div id="header">
		<a href="index.jsp">
			<img id="logo" src="resources/img/logo.png">
		</a>						
	</div>
<!------------------------------------------------------------------------>
	<div id="content">
			<div id="shop_table">
				<table border="2">
					<tr id="skill_point">
						<td colspan="10">스킬포인트: <input type="number" id="total_no" name="total_no" min="0" max="10" value="10" readonly="readonly"></td>
					</tr>
					<tr>
						<td colspan="10" id="skill_check">
							<input id="skill_l" type="checkbox" name="${ main_ch.skill_vo[0].s_num }" value="${ main_ch.skill_vo[0].s_idx }">${ main_ch.skill_vo[0].s_name }
                     <input type="number" id="skill_no" name="skill_no" min="0" max="10" value="0">
                     
                     <input id="skill" type="checkbox" name="${ main_ch.skill_vo[1].s_num }" value="${ main_ch.skill_vo[1].s_idx }">${ main_ch.skill_vo[1].s_name }
                     <input type="number" id="skill_no" name="skill_no" min="0" max="10" value="0"><br><br>
                     
                     <input id="skill_l" type="checkbox" name="${ main_ch.skill_vo[2].s_num }" value="${ main_ch.skill_vo[2].s_idx }">${ main_ch.skill_vo[2].s_name }
                     <input type="number" id="skill_no" name="skill_no" min="0" max="10" value="0">
                     
                     <input id="skill" type="checkbox" name="${ main_ch.skill_vo[3].s_num }" value="${ main_ch.skill_vo[3].s_idx }">${ main_ch.skill_vo[3].s_name }
                     <input type="number" id="skill_no" name="skill_no" min="0" max="10" value="0"><br><br>
                     
                     <input id="skill_l" type="checkbox" name="${ main_ch.skill_vo[4].s_num }" value="${ main_ch.skill_vo[4].s_idx }">${ main_ch.skill_vo[4].s_name }
                     <input type="number" id="skill_no" name="skill_no" min="0" max="10" value="0">
                     
                     <input id="skill" type="checkbox" name="${ main_ch.skill_vo[5].s_num }" value="${ main_ch.skill_vo[5].s_idx }">${ main_ch.skill_vo[5].s_name }
                     <input type="number" id="skill_no" name="skill_no" min="0" max="10" value="0"><br><br>
                     
                     <input id="skill_l" type="checkbox" name="${ main_ch.skill_vo[6].s_num }" value="${ main_ch.skill_vo[6].s_idx }">${ main_ch.skill_vo[6].s_name }
                     <input type="number" id="skill_no" name="skill_no" min="0" max="10" value="0">
                     
                     <input id="skill" type="checkbox" name="${ main_ch.skill_vo[7].s_num }" value="${ main_ch.skill_vo[7].s_idx }">${ main_ch.skill_vo[7].s_name }
                     <input type="number" id="skill_no" name="skill_no" min="0" max="10" value="0"><br><br>
							<input type="button" value="스킬올려조" >
						</td>
					</tr>
					<tr id="inventory">
							<c:if test="${ not empty main_ch.item_list[0].i_name }">
								<td id="helmet" class="tooltip">${ main_ch.item_list[0].i_name }</td>
							</c:if>
							<c:if test="${ empty main_ch.item_list[0].i_name}">
								<td id="helmet" class="tooltip">머리</td>
							</c:if>
							
							<c:if test="${ not empty main_ch.item_list[1].i_name }">
								<td id="upper_body" class="tooltip">${ main_ch.item_list[1].i_name }</td>
							</c:if>
							<c:if test="${ empty main_ch.item_list[1].i_name}">
								<td id="upper_body" class="tooltip">상체</td>
							</c:if>
							
							<c:if test="${ not empty main_ch.item_list[2].i_name }">
								<td id="lower_body" class="tooltip">${ main_ch.item_list[2].i_name }</td>
							</c:if>
							<c:if test="${ empty main_ch.item_list[2].i_name}">
								<td id="lower_body" class="tooltip">하체</td>
							</c:if>
							
							<c:if test="${ not empty main_ch.item_list[3].i_name }">
								<td id="weapon" class="tooltip">${ main_ch.item_list[3].i_name }</td>
							</c:if>
							<c:if test="${ empty main_ch.item_list[3].i_name}">
								<td id="weapon" class="tooltip">무기</td>
							</c:if>
							
						<td  id="potion" class="tooltip">물약</td>
					</tr>
				</table>
			</div>
			

			<div id="random_items">
				<div id="${ selected_item_list[0].i_idx }" class="tooltip" onclick="item_buy(this)">${ selected_item_list[0].i_name }<br>
					<span class="tooltiptext">
						<ul>
							<li>${ selected_item_list[0].i_name }</li>
							<li>${ selected_item_list[0].i_class }</li>
							<li>${ selected_item_list[0].i_category } </li>
							<li>${ selected_item_list[0].i_level } </li>
							<c:if test="${ not (selected_item_list[0].i_hp eq 0)}">
								<li>HP ${ selected_item_list[0].i_hp } 증가</li>
							</c:if>
							<c:if test="${ not (selected_item_list[0].i_hp_percent eq 0)}">
								<li>HP ${ selected_item_list[0].i_hp_percent }% 증가</li>
							</c:if>
							<c:if test="${ not (selected_item_list[0].i_ad eq 0)}">
								<li>공격력 ${ selected_item_list[0].i_ad } 증가</li>
							</c:if>
							<c:if test="${ not (selected_item_list[0].i_ad_percent eq 0)}">
								<li>공격력 ${ selected_item_list[0].i_ad_percent }% 증가</li>
							</c:if>
							<c:if test="${ not (selected_item_list[0].i_ap eq 0)}">
								<li>주문력 ${ selected_item_list[0].i_ap } 증가</li>
							</c:if>
							<c:if test="${ not (selected_item_list[0].i_ap_percent eq 0)}">
								<li>주문력 ${ selected_item_list[0].i_ap_percent }% 증가</li>
							</c:if>
							<c:if test="${ not (selected_item_list[0].i_armor eq 0)}">
								<li>방어력 ${ selected_item_list[0].i_armor } 증가</li>
							</c:if>
							<c:if test="${ not (selected_item_list[0].i_armor_percent eq 0)}">
								<li>방어력 ${ selected_item_list[0].i_armor_percent }% 증가</li>
							</c:if>
							<c:if test="${ not (selected_item_list[0].i_critical eq 0)}">
								<li>크리티컬 ${ selected_item_list[0].i_critical }% 증가</li>
							</c:if>
							<c:if test="${ not (selected_item_list[0].i_avd eq 0)}">
								<li>회피율 ${ selected_item_list[0].i_avd }% 증가</li>
							</c:if>
						</ul>
					</span>
				</div>
				<div id="${ selected_item_list[1].i_idx }"  class="tooltip" onclick="item_buy(this)">${ selected_item_list[1].i_name }<br>
					<span class="tooltiptext">
						<ul>
							<li>${ selected_item_list[1].i_name }</li>
							<li>${ selected_item_list[1].i_class }</li>
							<li>${ selected_item_list[1].i_category } </li>
							<li>${ selected_item_list[1].i_level } </li>
							<c:if test="${ not (selected_item_list[1].i_hp eq 0)}">
								<li>HP ${ selected_item_list[1].i_hp } 증가</li>
							</c:if>
							<c:if test="${ not (selected_item_list[1].i_hp_percent eq 0)}">
								<li>HP ${ selected_item_list[1].i_hp_percent }% 증가</li>
							</c:if>
							<c:if test="${ not (selected_item_list[1].i_ad eq 0)}">
								<li>공격력 ${ selected_item_list[1].i_ad } 증가</li>
							</c:if>
							<c:if test="${ not (selected_item_list[1].i_ad_percent eq 0)}">
								<li>공격력 ${ selected_item_list[1].i_ad_percent }% 증가</li>
							</c:if>
							<c:if test="${ not (selected_item_list[1].i_ap eq 0)}">
								<li>주문력 ${ selected_item_list[1].i_ap } 증가</li>
							</c:if>
							<c:if test="${ not (selected_item_list[1].i_ap_percent eq 0)}">
								<li>주문력 ${ selected_item_list[1].i_ap_percent }% 증가</li>
							</c:if>
							<c:if test="${ not (selected_item_list[1].i_armor eq 0)}">
								<li>방어력 ${ selected_item_list[1].i_armor } 증가</li>
							</c:if>
							<c:if test="${ not (selected_item_list[1].i_armor_percent eq 0)}">
								<li>방어력 ${ selected_item_list[1].i_armor_percent }% 증가</li>
							</c:if>
							<c:if test="${ not (selected_item_list[1].i_critical eq 0)}">
								<li>크리티컬 ${ selected_item_list[1].i_critical }% 증가</li>
							</c:if>
							<c:if test="${ not (selected_item_list[1].i_avd eq 0)}">
								<li>회피율 ${ selected_item_list[1].i_avd }% 증가</li>
							</c:if>
						</ul>
					</span>
				</div>
				<div id="${ selected_item_list[2].i_idx }"  class="tooltip" onclick="item_buy(this)">${ selected_item_list[2].i_name }<br>
					<span class="tooltiptext">
						<ul>
							<li>${ selected_item_list[2].i_name }</li>
							<li>${ selected_item_list[2].i_class }</li>
							<li>${ selected_item_list[2].i_category } </li>
							<li>${ selected_item_list[2].i_level } </li>
							<c:if test="${ not (selected_item_list[2].i_hp eq 0)}">
								<li>HP ${ selected_item_list[2].i_hp } 증가</li>
							</c:if>
							<c:if test="${ not (selected_item_list[2].i_hp_percent eq 0)}">
								<li>HP ${ selected_item_list[2].i_hp_percent }% 증가</li>
							</c:if>
							<c:if test="${ not (selected_item_list[2].i_ad eq 0)}">
								<li>공격력 ${ selected_item_list[2].i_ad } 증가</li>
							</c:if>
							<c:if test="${ not (selected_item_list[2].i_ad_percent eq 0)}">
								<li>공격력 ${ selected_item_list[2].i_ad_percent }% 증가</li>
							</c:if>
							<c:if test="${ not (selected_item_list[2].i_ap eq 0)}">
								<li>주문력 ${ selected_item_list[2].i_ap } 증가</li>
							</c:if>
							<c:if test="${ not (selected_item_list[2].i_ap_percent eq 0)}">
								<li>주문력 ${ selected_item_list[2].i_ap_percent }% 증가</li>
							</c:if>
							<c:if test="${ not (selected_item_list[2].i_armor eq 0)}">
								<li>방어력 ${ selected_item_list[2].i_armor } 증가</li>
							</c:if>
							<c:if test="${ not (selected_item_list[2].i_armor_percent eq 0)}">
								<li>방어력 ${ selected_item_list[2].i_armor_percent }% 증가</li>
							</c:if>
							<c:if test="${ not (selected_item_list[2].i_critical eq 0)}">
								<li>크리티컬 ${ selected_item_list[2].i_critical }% 증가</li>
							</c:if>
							<c:if test="${ not (selected_item_list[2].i_avd eq 0)}">
								<li>회피율 ${ selected_item_list[2].i_avd }% 증가</li>
							</c:if>
						</ul>
					</span>
				</div><br>
				<!-- <img id="random1" src="resources/img/logo.png">
				<img id="random2" src="resources/img/logo.png">
				<img id="random3" src="resources/img/logo.png"><br>-->
				<input type="button" id="again" value="again(cost cookie 10)"
																onclick="item_shuffle();"><br>
				<button id="next_level" onclick="dungeon();">NEXT LEVEL</button>
			</div>
			<div id="clear">
			
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