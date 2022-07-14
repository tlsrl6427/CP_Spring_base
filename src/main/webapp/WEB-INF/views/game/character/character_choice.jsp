<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
//선택한 캐릭터 정보 보내기
	function choice(){
		var c_idx = $("input:radio:checked").val();
		stage_val++;
		$.ajax({
			url: 'game/character/character_choice.do',
			data: { 'c_idx': c_idx},
			success: function(res_data){
				$('#disp').html(res_data);
			}
		}) 
	}
</script>
</head>
<body>
캐릭터 선택<br>
<form>
	<input type="radio" name="c_idx" value="1" checked="checked">전사<br>
	<input type="radio" name="c_idx" value="2">궁수<br>
	<input type="radio" name="c_idx" value="3">법사<br>
</form>
<button onclick="choice();">선택완료</button>
</body>
</html>