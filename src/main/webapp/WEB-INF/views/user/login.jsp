<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap');
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<link rel = "stylesheet" href = "../resources/css/login.css">
<link rel="stylesheet" type="text/css" href="../resources/css/login_util.css">
<link rel="stylesheet" type="text/css" href="../resources/css/login_main.css">
<link rel="stylesheet" type="text/css" href="../resources/css/login_join_main.css">
<link rel="stylesheet" type="text/css" href="../resources/css/logo.css">

<script type="text/javascript">
	
	function signup(){
		a++;
		console.log("a: "+a);
		$.ajax({
			url: 'user/signup_form.do',
			success: function(res_data){
				$('#disp').html(res_data);
			}
		});
	}
	
	function signin(){
		a++;
		console.log("a: "+a);
		$.ajax({
			url: 'user/after_login.do',
			success: function(res_data){
				$('#disp').html(res_data);
			}
		});
	}
</script>
<script type="text/javascript">
   
  function enterkey() {
       if (window.event.keyCode == 13) {
          $('#login').click();
       }
   }
   
   function send(f){
      
      var m_id = f.m_id.value.trim();
      var m_pwd = f.m_pwd.value.trim();
      
      if(m_id==''){
         alert('아이디를 입력하세요');   
         f.m_id.value='';
         f.m_id.focus();
         return;
      }
      
      if(m_pwd==''){
         alert('비밀번호를 입력하세요');   
         f.m_pwd.value='';
         f.m_pwd.focus();
         return;
      }
      
      f.action="login.do"  //memberloginaction
      f.submit();
      
   }

</script>

<!-- 윈도우 초기화 -->
<script type="text/javascript">
   $(document).ready(function(){   
      
      setTimeout(showMessage,100); 
   });
   
   function showMessage(){
         
      if("${ param.reason == 'fail_id'}"=="true"){     
         alert('회원정보가 일치하지 않습니다');
         document.getElementById("ID").focus();
         return;
      }
      
      if("${ param.reason == 'fail_pwd'}"=="true"){     
         alert('회원정보가 일치하지 않습니다');
         document.getElementById("ID").focus();
         return;   
      }
      
      if("${ param.reason == 'session_timeout'}"=="true"){    
         alert('일정시간이 지나 로그아웃 되었습니다');
         return;   
      }
   }

</script>
</head>
<body>
<div id="box">
	<div id="header">
		<a href="../index.jsp">
			<img id="logo" src="../resources/img/logo.png">
		</a>						
	</div>
<!------------------------------------------------------------------------>
	<div id="content">
		<div class="limiter">
			<div class="container-login100">
				<div class="wrap-login100 p-t-50 p-b-90">
					<form class="login100-form validate-form flex-sb flex-w">
						<span class="login100-form-title p-b-30" style="font-weight: bold;"> Login </span>
							<div class="wrap-input100 validate-input m-b-16">
								<input class="input100" type="text" name="m_id" id="ID" placeholder="ID" value="${ param.m_id }" onkeyup="enterkey();">
								<span class="focus-input100"></span>
							</div>
							<div class="wrap-input100 validate-input m-b-16">
								<input class="input100" type="password" name="m_pwd" id="PWD" onkeyup="enterkey();" placeholder="Password">
								<span class="focus-input100"></span>
							</div>
								
							<div class="container-login100-form-btn m-t-17">
								<input type="button" class="login100-form-btn" id="join" value="Join" onclick="location.href='join.do';">
							</div>
							<div class="container-login100-form-btn m-t-17" align="right">
								<input type="button" class="login100-form-btn" id="login" value="Login" onclick="send(this.form);">
							</div>
						<br><br><br><br><br><br><br>				
					</form>				
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