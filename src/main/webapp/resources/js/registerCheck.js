$(function() {
	
let userName = document.getElementById('inputName');
let userBirth = document.getElementById('inputBirth');
let userNickname = document.getElementById('inputNickname');
let userEmail = document.getElementById('inputEmail');
let userAddress = document.getElementById('inputAddress');
let userPhone = document.getElementById('inputPhone');
let userPassword = document.getElementById('inputPassword');
let userPWcheck = document.getElementById('inputPWcheck');

const specialWord = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/;
const regEmail = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
const regPhone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
const regPassword = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,20}$/;

	
	
/* 1. 닉네임 유효성 검사(중복, 특수문자 불가 ...)*/
$("#inputNickname").focusout(function() {
	// console.log(userNickname.value);
	$.ajax({
		url : 'register.nicknameCheck?custom_user_nick='+ userNickname.value,
		type : 'get',
		success : function(data) {
			// console.log("1 = 중복o / 0 = 중복x : "+ data);							
			if (data >= 1) {
					// 1 : 아이디가 중복되는 문구
					$("#nickname_check").text("이미 사용중인 닉네임입니다.");
					$("#nickname_check").css("color", "red");
					$("#inputNickname").focus();
					$("#reg_account").attr("disabled", true);
			}else if(userNickname.value == ""){
					$('#nickname_check').text('닉네임을 입력해주세요.');
					$('#nickname_check').css('color', 'red');
			} else if(specialWord.test(userNickname.value) == true) {
					$('#nickname_check').text('Nickname 규칙 위배 (특수 문자 사용 불가)');
					$('#nickname_check').css('color', 'red');
					$("#inputNickname").focus();
					$("#reg_account").attr("disabled", true);		
			} else {
				$("#nickname_check").text("사용 가능한 닉네임입니다.");
				$("#nickname_check").css("color", "green");
				$("#reg_account").attr("disabled", false);
			}
				
			}, error : function() {
					console.log("실패");
			}
		});
	});
	
	
	
/* 2. 이메일 검사 */
$("#inputEmail").focusout(function() {
	
	$.ajax({
		url : 'register.emailCheck?custom_user_email='+ userEmail.value,
		type : 'get',
		success : function(data) {
			console.log("1 = 중복o / 0 = 중복x : "+ data);							
			
			if (data >= 1) {
					// 1 : 이메일이 중복되는 문구
					$("#email_check").text("이미 사용중인 이메일입니다.");
					$("#email_check").css("color", "red");
					$("#inputEmail").focus();
					$("#reg_account").attr("disabled", true);
			} else {
				
				if(regEmail.test(userEmail.value)){
					// 0 : 아이디 길이 / 문자열 검사
						$("#email_check").text("사용 가능한 이메일입니다.");
						$("#email_check").css("color", "green");
						$("#reg_account").attr("disabled", false);
					} 
					else if(userEmail.value == ""){
						$('#email_check').text('이메일을 입력해주세요.');
						$('#email_check').css('color', 'red');
					}			
					else {
						$('#email_check').text("이메일을 올바르게 입력해주세요.");
						$('#email_check').css('color', 'red');
						$("#inputEmail").focus();
						$("#reg_submit").attr("disabled", true);
					}
			
			}
				
			}, error : function() {
					console.log("실패");
			}
			});
	});
	
	


/* 3. 전화번호 형식 + 비밀번호 암호화 + 비밀번호 형식 */

/* 3-1. 전화번호 형식 */
$("#inputPhone").keyup(function() {
	
	$(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") );
	//console.log(userPhone.value);
});
	
$("#inputPhone").focusout(function() {
	
	if(regPhone.test(userPhone.value) == false){
		$("#phone_check").text("잘못된 전화번호 형식(ex. 010-0000-0000)");
		$("#phone_check").css("color", "red");
		$("#reg_account").attr("disabled", true);
	} else if(userPhone.value == "") {
		$("#phone_check").text("전화번호를 입력해주세요");
		$("#phone_check").css("color", "red");
		$("#reg_account").attr("disabled", false);
	} else {
		$("#phone_check").text("");
		$("#reg_account").attr("disabled", false);
	}
});


/* 3-2. 패스워드 규칙 */
$("#inputPassword").keyup(function() {
	if(regPassword.test(userPassword.value) == false) {
		$("#password_check").text("영문,숫자,특수문자 조합 8~20자리");
		$("#password_check").css("color", "red");
	} else if(regPassword.test(userPassword.value) == true) {
		$("#password_check").text("사용할 수 있는 패스워드입니다.");
		$("#password_check").css("color", "green");
		$("#reg_account").attr("disabled", false);
	};
});

$('#inputPassword').focusout(function() {
	if(userPassword.value == "") {
		$("#password_check").text("패스워드를 입력해주세요.");
		$("#password_check").css("color", "red")
	} else if(regPassword.test(userPassword.value) == false) {
		$("#inputPassword").focus();
		$("#reg_account").attr("disabled", true);
	}
});


$('#inputPWcheck').keyup(function() {
	if(userPWcheck.value == "") {
		$("#pwCheck_check").text("패스워드가 일치하지 않습니다.");
		$("#pwCheck_check").css("color", "red")
	} else if(userPWcheck.value != userPassword.value) {
		$("#pwCheck_check").text("패스워드가 일치하지 않습니다.");
		$("#pwCheck_check").css("color", "red")
		$("#reg_account").attr("disabled", true);
	} else if(userPWcheck.value == userPassword.value) {
		$("#pwCheck_check").text("패스워드가 일치합니다.");
		$("#pwCheck_check").css("color", "green")
		$("#reg_account").attr("disabled", false);
	} 
});



	
/* 4. 공백 검사 */

/* 4-1. 그 외 focusout 공백 */
$('#inputName').focusout(function() {
	if(userName.value == "") {
		$("#name_check").text("이름을 입력해주세요.");
		$("#name_check").css("color", "red");
	} else {
		$("#name_check").text("");
	}
});


$('#inputBirth').focusout(function() {
	if(userBirth.value == "") {
		$("#birth_check").text("생년월일을 입력해주세요.");
		$("#birth_check").css("color", "red");
	} else if(userBirth.value.length < 8) {
		$("#birth_check").text("생년월일을 확인해주세요.");
		$("#birth_check").css("color", "red");
		$("#inputBirth").focus();
	} else {
		$("#birth_check").text("");
	}
});


$('#inputAddress').focusout(function() {
	if(userAddress.value == "") {
		$("#address_check").text("주소를 입력해주세요.");
		$("#address_check").css("color", "red");
	} else {
		$("#address_check").text("");
	}
});



/* 4-2. 버튼 클릭시 체크 */
$("#reg_account").click(function() {
	
	if(userName.value == '') {
		
		alert('이름을 입력해주세요.');
		
		userName.focus();
		
		return false;	
		
	};
	
	
	if(userBirth.value == '') {
		
		alert('생일을 입력해주세요.');
		
		userBirth.focus();
		
		return false;	
		
	};
	
	if(userNickname.value == '') {
		
		alert('닉네임을 입력해주세요.');
		
		userNickname.focus();
		
		return false;	
		
	};
	
	
	if(userEmail.value == '') {
		
		alert('이메일을 입력해주세요.');
		
		userEmail.focus();
		
		return false;	
	}
		
	
	if(userAddress.value == '') {
		
		alert('주소를 입력해주세요.');
		
		userAddress.focus();
		
		return false;	
	}
	
	
		if(userPhone.value == '') {
		
		alert('전화번호를 입력해주세요.');
		
		userPhone.focus();
		
		return false;	
	}
	
	
		if(userPassword.value == '') {
		
		alert('패스워드를 입력해주세요.');
		
		userPassword.focus();
		
		return false;	
	}
	

		if(userPWcheck.value == '') {
		
		alert('패스워드를 한 번 더 입력해주세요.');
		
		userPWcheck.focus();
		
		return false;	
	}
	
	
	
	if(confirm("해당 내용을 저장하시겠습니까??")) {
		return true;
	} else {
		return false;
	};
	
	
});		




});