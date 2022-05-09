function vaildCheck() {
	
let userName = document.getElementById('inputName');
let userBirth = document.getElementById('inputBirth');
let userNickname = document.getElementById('inputNickname');
let userEmail = document.getElementById('inputEmail');
let userAddress = document.getElementById('inputAddress');
let userPhone = document.getElementById('inputPhone');
let userPassword = document.getElementById('inputPassword');
let userPWcheck = document.getElementById('inputPWcheck');
	
	
	
	// 1. 아이디 체크(글자수 30, 중복, 특수문자 불가 ...)
	
	if(userNickname.value.size) {
		
		
		
	};
	
	
	
	
	
	// 4. 공백 검사
	
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
		alert('success!!');
		return true;
	} else {
		alert('fale!!');
		return false;
	};
	
			
};






