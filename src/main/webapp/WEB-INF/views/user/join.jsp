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
<link rel = "stylesheet" href = "../css/join.css">
<link rel="stylesheet" href="../css/login_join_main.css">
<link rel="stylesheet" type="text/css" href="../css/login_util.css">
<link rel="stylesheet" type="text/css" href="../css/login_main.css">
<link rel="stylesheet" type="text/css" href="../css/logo.css">

<script type="text/javascript">
   var regular_id      = /^[a-zA-Z0-9]{3,16}$/;
   var regular_email = /^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;
   var regular_pwd   = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{4,}$/;
      
   // 문서 내 Element의 배치가 완료가 되면
   $(document).ready(
         
         
         
         function() {

            // 아이디 입력 창에서 키가 입력되면
            $("#m_id").keyup(
                  function(event) {

                     var m_id = $(this).val();
                     console.log(m_id);

                     if (!regular_id.test(m_id)) {
                        $("#id_msg").html("영문자,숫자로 3~16자리만 가능합니다.")
                              .css("color", "red");
                        
                        // 가입 하기 버튼 비활성화
                        $("#btn_register").attr("disabled", true);
                        return;
                     }

                     /* $("#id_msg").html("사용 가능한 아이디입니다.").css("color",
                           "blue"); */

                     // 서버에 사용 가능 여부 확인(Ajax)
                     $.ajax({

                        url : "check_id.do",         // MemberCheckIdAction
                        data : {"m_id": m_id},         // parameter: check_id.od?m_id=one
                        dataType : "json",
                        success : function(res_data) {
                           // res_data = {"result": true}   // 사용 가능
                           // res_data = {"result": false}   // 사용 중
                           
                           if (res_data.result) { // 사용 가능
                              $("#id_msg").html("사용 가능한 아이디입니다.").css("color",
                              "blue");
                           
                           // 가입 하기 버튼 활성화
                           $("#btn_register").attr("disabled", false);
                           
                           } else {            // 이미 사용 중인 아이디
                              $("#id_msg").html("! 이미 사용 중인 아이디 입니다.")
                              .css("color", "red");
                              
                              // 가입 하기 버튼 비활성화
                              $("#btn_register").attr("disabled", true);
                           }
                           
                        },
                        error : function(err) {
                           alert(err.responseText);
                        }

                     });

                  });
            
            // 이메일 입력 창에서 키가 입력되면
            $("#m_email").keyup(
                  function(event) {

                     var m_email = $(this).val();
                     console.log(m_email);

                     if (!regular_email.test(m_email)) {
                        $("#email_msg").html("! 올바른 이메일 형식을 입력해주세요.")
                              .css("color", "red");
                        
                        // 가입 하기 버튼 비활성화
                        $("#btn_register").attr("disabled", true);
                        return;
                     }

                     /* $("#id_msg").html("사용 가능한 아이디입니다.").css("color",
                           "blue"); */

                     // 서버에 사용 가능 여부 확인(Ajax)
                     $.ajax({

                        url : "check_email.do",               // NewPlerCheckEmailAction
                        data : {"m_email": m_email},         // parameter: check_id.od?m_email=이메일
                        dataType : "json",
                        success : function(res_data) {
                           // res_data = {"result": true}   // 사용 가능
                           // res_data = {"result": false}   // 사용 중
                           
                           if (res_data.result) { // 사용 가능
                              $("#email_msg").html("사용 가능한 이메일입니다.").css("color",
                              "blue");
                           
                           // 가입 하기 버튼 활성화
                           $("#btn_register").attr("disabled", false);
                           
                           } else {            // 이미 사용 중인 아이디
                              $("#email_msg").html("! 이미 사용 중인 아이디 입니다.")
                              .css("color", "red");
                              
                              // 가입 하기 버튼 비활성화
                              $("#btn_register").attr("disabled", true);
                           }
                           
                        },
                        error : function(err) {
                           alert(err.responseText);
                        }

                     });

                  });
            
            
            // 비밀번호 입력 창에서 키가 입력되면
            $("#m_pwd").keyup(
                  function(event) {
                     
                     var m_pwd   = $("#m_pwd").val();
                     var m_cpwd  = $("#m_cpwd").val();
                     
                     console.log(m_pwd, m_cpwd);
                     
                     if (!regular_pwd.test(m_pwd)) {
                        $("#pwd_msg").html("! 4자리 이상 숫자와 문자를 하나 이상 사용하여 설정해주세요")
                              .css("color", "red");
                        
                        // 가입 하기 버튼 비활성화
                        $("#btn_register").attr("disabled", true);
                        return;
                     } else {
                        $("#pwd_msg").html("올바른 비밀번호 형식입니다.")
                        .css("color", "blue");
                     }
                     
                     if (m_pwd == m_cpwd) {
                         
                         $("#cpwd_msg").html("비밀번호가 일치합니다").css("color",
                         "blue");
                      } else {
                     	 
                         $("#cpwd_msg").html("! 비밀번호가 일치하지 않습니다")
                         .css("color", "red");
                      }

                  });
            
            // 비밀번호 확인 입력 창에서 키가 입력되면
            $("#m_cpwd").keyup(
                  function(event) {
                     
                     var m_pwd   = $("#m_pwd").val();
                     var m_cpwd  = $("#m_cpwd").val();
                     
                     if (m_pwd == m_cpwd) {
                        
                        $("#cpwd_msg").html("비밀번호가 일치합니다").css("color",
                        "blue");
                     } else {
                    	 
                        $("#cpwd_msg").html("! 비밀번호가 일치하지 않습니다")
                        .css("color", "red");
                     }
                     

                  });
            
            
            
            
            
            
         })

function send(f) {
      
      // 입력값 체크(이름/비번/우편번호/주소)
      var m_name = f.m_name.value.trim();
      var m_id   = f.m_id.value.trim();   
      var m_pwd  = f.m_pwd.value.trim();
      var m_cpwd = f.m_cpwd.value.trim();
      var m_email = f.m_email.value.trim();
      
      
      
      // 이름 체크
      if (m_name == "") {
         alert("이름을 입력하세요.");
         f.m_name.value = "";
         f.m_name.focus();
         return;
      }
      
      // 아이디 체크
      if (m_id == "") {
         alert("아이디를 입력하세요.");
         f.m_id.value = "";
         f.m_id.focus();
         return;
      }
      
      // 비번 체크
      if (m_pwd == "") {
         alert("비밀번호를 입력하세요.");
         f.m_pwd.value = "";
         f.m_pwd.focus();
         return;
      }
      
      // 비밀번호 확인 체크
      if (m_cpwd == "") {
         alert("비밀번호 확인란을 입력하세요.");
         f.m_cpwd.value = "";
         f.m_cpwd.focus();
         return;
      }
      
      // 이메일 체크
      if (m_email == "") {
         alert("이메일을 입력하세요.");
         f.m_email.value = "";
         f.m_email.focus();
         return;
      }
      
      f.action = "join.do"; // NewPlerInsertAction
      f.submit();
      
      alert("회원가입이 완료되었습니다. 로그인 페이지로 이동합니다.");
      
   }



</script>

<!-- 윈도우 초기화 -->
<script type="text/javascript">
   $(document).ready(function(){    /* 배치가 완료되면 ~(초기화): Jquery의 $ */
      
      setTimeout(showMessage,100); /* 일정시간 경과후 showmessage 함수 호출 */
   });
   
   function showMessage(){
      
      // /member/login_form.do?reason=fail_id      
      if("${ param.reason == 'fail_id'}"=="true"){      //parameter에 들어온 reason이 fail id야? 맞으면 알림창 띄워
         alert('회원정보가 일치하지 않습니다');
         document.getElementById("ID").focus();
         return;
      }
      
      // /member/login_form.do?reason=fail_pwd
      if("${ param.reason == 'fail_pwd'}"=="true"){      //parameter에 들어온 reason이 fail pwd야? 맞으면 알림창 띄워
         alert('회원정보가 일치하지 않습니다');
         document.getElementById("ID").focus();
         return;   
      }
      
      // /member/login_form.do?reason=session_timeout
      if("${ param.reason == 'session_timeout'}"=="true"){      //parameter에 들어온 reason이 fail pwd야? 맞으면 알림창 띄워
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
			<img id="logo" src="../img/logo.png">
		</a>						
	</div>
<!------------------------------------------------------------------------>

	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-b-45">
				<form class="login100-form validate-form flex-sb flex-w">
				<input type="hidden" name="m_idx" value="${ vo.m_idx }">
					<span class="login100-form-title p-b-30" style="font-weight: bold;"> Join </span>
<!------------------------------------------------------------------------타이틀--> 				
						<div class="wrap-input100 validate-input m-b-10">
							<input class="input100" type="text" name="m_name" id="name" placeholder="Name">
							<span class="focus-input100"></span>
						</div>
						
						<span id="id_msg"><br></span>
						<div class="wrap-input100 validate-input m-b-10">
							<input class="input100" type="text" name="m_id" id="m_id" placeholder="ID">
							<span class="focus-input100"></span>
						</div>
							
							<span id="pwd_msg"><br></span>
						<div class="wrap-input100 validate-input m-b-10">
							<input class="input100" type="password" name="m_pwd" id="m_pwd" placeholder="Password">
							<span class="focus-input100"></span>
						</div>
							
							<span id="cpwd_msg"><br></span>
						<div class="wrap-input100 validate-input m-b-10">
							<input class="input100" type="password" name="m_cpwd" id="m_cpwd" placeholder="Password Confirm">
							<span class="focus-input100"></span>
						</div>
							
							<span id="email_msg"><br></span>
						<div class="wrap-input100 validate-input m-b-10">
							<input class="input100" type="text" name="m_email" id="m_email" placeholder="Email">
							<span class="focus-input100"></span>
						</div>
							
							
							<input type="button" class="login100-form-btn" id="btn_email" value="인증번호발송">
					
					<div class="container-login100-form-btn m-t-17">
						<input type="button" class="login100-form-btn" id="join" value="Join" onclick="send(this.form);">
					</div>
					<div class="container-login100-form-btn m-t-17">
						<input type="button" class="login100-form-btn" id="cancel" value="Cancel" onclick="location.href='../index.jsp';">
					</div>
				</form>
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
