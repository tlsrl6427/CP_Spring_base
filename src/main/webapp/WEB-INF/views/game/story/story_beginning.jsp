<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function choice(){
			$.ajax({
				url: 'game/character/character_choice_form.do',
				success: function(res_data){
					$('#disp').html(res_data);
				}
			})
	}
</script>
</head>
<body>
스토리 시작<br>
<button onclick="choice();">캐릭터 선택</button>
</body>
</html>