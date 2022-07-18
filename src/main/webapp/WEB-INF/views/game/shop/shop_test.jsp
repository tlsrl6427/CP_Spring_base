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
<link rel="stylesheet" type="text/css" href="resources/css/shop_main.css">
<link rel="stylesheet" type="text/css" href="resources/css/logo.css">
<script type="text/javascript">
//던전 정보 보내기
//스테이지 넘어갈때마다 dungeon변수에 +해줘서 불러내야할 던전정보 특정하기
	function dungeon(){
	    let s_idx = [];
	      
	      if ($("input:checkbox:checked").length < 4) {
	         alert("스킬은 총 4개를 선택해 주세요!");
	         return;
	      }

	      $("input:checkbox:checked").each(function(i,iVal) {
	         s_idx.push($(this).val());
	      });
	      
	      jQuery.ajaxSettings.traditional = true;   // 이거 추가 안 하면 parameter 넘어갈 때 %5B%5D가 추가되어서 넘어감
	      
		$.ajax({
			url: 'game/dungeon/dungeon.do',
			data: {"stage_val": stage_val, "s_idx": s_idx},
			success: function(res_data){
				$('#disp').html(res_data);
			}
		})
	}
	
	function item_buy(t){
		if(confirm($(t).text()+"을(를) 구매하시겠습니까?")==false) return;
		var i_idx=$(t).prop("id");
		$.ajax({
			url: 'game/shop/item_buy.do',
			data: {"i_idx": i_idx},
			success: function(res_data){
				alert(res_data.item_name+"을 구매하였습니다");
				$(t).css('visibility', 'hidden');
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
					$(item).text(res_data[index].i_name);
					$(item).attr("id", res_data[index].i_idx);
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
						<td colspan="10">스킬포인트:</td>
					</tr>
					<tr>
						<td colspan="10" id="skill_check">
							<input id="skill" type="checkbox" name="skill" value="${ main_ch.skill_vo[0].s_num }">${ main_ch.skill_vo[0].s_name }
		                     <input id="skill" type="checkbox" name="skill" value="${ main_ch.skill_vo[1].s_num }">${ main_ch.skill_vo[1].s_name }
		                     <input id="skill" type="checkbox" name="skill" value="${ main_ch.skill_vo[2].s_num }">${ main_ch.skill_vo[2].s_name }
		                     <input id="skill" type="checkbox" name="skill" value="${ main_ch.skill_vo[3].s_num }">${ main_ch.skill_vo[3].s_name }<br><br>
		                     <input id="skill" type="checkbox" name="skill" value="${ main_ch.skill_vo[4].s_num }">${ main_ch.skill_vo[4].s_name }
		                     <input id="skill" type="checkbox" name="skill" value="${ main_ch.skill_vo[5].s_num }">${ main_ch.skill_vo[5].s_name }
		                     <input id="skill" type="checkbox" name="skill" value="${ main_ch.skill_vo[6].s_num }">${ main_ch.skill_vo[6].s_name }
		                     <input id="skill" type="checkbox" name="skill" value="${ main_ch.skill_vo[7].s_num }">${ main_ch.skill_vo[7].s_name }<br><br>
							<input type="button" value="스킬올려조" >
						</td>
					</tr>
					<tr id="inventory">
						<td>1</td>
						<td>2</td>
						<td>3</td>
						<td>4</td>
						<td>5</td>
						<td>6</td>
						<td>7</td>
						<td>8</td>
						<td>9</td>
						<td>1</td>
					</tr>
					<tr id="inventory">
						<td>1</td>
						<td>2</td>
						<td>3</td>
						<td>4</td>
						<td>5</td>
						<td>6</td>
						<td>7</td>
						<td>8</td>
						<td>9</td>
						<td>1</td>
					</tr>
					<tr id="inventory">
						<td>1</td>
						<td>2</td>
						<td>3</td>
						<td>4</td>
						<td>5</td>
						<td>6</td>
						<td>7</td>
						<td>8</td>
						<td>9</td>
						<td>1</td>
					</tr>
					<tr id="inventory">
						<td>1</td>
						<td>2</td>
						<td>3</td>
						<td>4</td>
						<td>5</td>
						<td>6</td>
						<td>7</td>
						<td>8</td>
						<td>9</td>
						<td>1</td>
					</tr>
				</table>
			</div>
			

			<div id="random_items">
				<div id="${ selected_item_list[0].i_idx }" onclick="item_buy(this)">${ selected_item_list[0].i_name }</div>
				<div id="${ selected_item_list[1].i_idx }"  onclick="item_buy(this)">${ selected_item_list[1].i_name }</div>
				<div id="${ selected_item_list[2].i_idx }"  onclick="item_buy(this)">${ selected_item_list[2].i_name }</div><br>
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