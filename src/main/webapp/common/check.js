/**
 *  회원가입 유효성 검사
 */
function join() {
	
	let id = document.getElementById("id");
	let pwd = document.getElementById("pwd");
	let repwd = document.getElementById("repwd");
	let name = document.getElementById("name");
	let birth = document.getElementById("birth");
	let tel = document.getElementById("tel");
	let email = document.getElementById("email");
	let zipcode = document.getElementById("zipcode");
	let detailAddr = document.getElementById("detailAddr");
	let hangleCheck = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/
			
	if (id.value == "") {
		alert("아이디를 입력하세요.");
		id.focus();
		return false;
	}
	if(id.value.length < 4 || id.value.length > 12) {
		alert("아이디는 4자 이상 12자 이하로 작성하세요.");
		return false;
	}
	if(hangleCheck.test(id.value)) {
		alert("아이디는 영문만 가능합니다.");
		return false;
	}
	
	// 비밀번호 유효성 검사
	if(hangleCheck.test(pwd.value)){
		alert("비밀번호에 한글을 사용할 수 없습니다.");
		pwd.focus();
		return false;
	}
	
	if (pwd.value == "") {
		alert("비밀번호를 입력하세요.");
		pwd.focus();
		return false;
	}
	
	if(pwd.value.search(/\s/) != -1){
		alert("비밀번호에 공백 없이 입력해주세요.");
		pwd.focus();
		return false;
	}
	
	// 정규표현식을 통한 비밀번호 유효성 검사
	let pwdReg = /^(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]{6,}$/
	if (!pwdReg.test(pwd.value)) {
		alert("비밀번호는 6자 이상, 숫자, 소문자나 대문자를 포함해야 합니다.");
		pwd.focus();
		return false;
	}
	if (repwd.value == "") {
		alert("비밀번호를 다시 확인하세요.");
		repwd.focus();
		return false;
	}
	if (pwd.value != repwd.value) {
		alert("비밀번호가 일치하지 않습니다.");
		return false;
	}
	
	// 이름, 생일 유효성 검사
	if (name.value == "") {
		alert("이름을 입력하세요.");
		name.focus();
		return false;
	}
	if (name.value.length <= 1) {
		alert("이름이 한글자 일 수 없습니다.")
		name.focus();
		return false;
	}
	if (!hangleCheck.test(name.value)) {
		alert("이름은 한글만 입력할 수 있습니다.");
		name.focus();
		return false;
	}
	if(name.value.search(/\s/) != -1){
		alert("이름에 공백 없이 입력해주세요.");
		form.password.focus();
		return false;
	}
	
	if (birth.value == "") {
		alert("생일을 입력하세요");
		birth.focus();
		return false;
	}
	
	// 전화번호 정규식을 통한 유효성 검사
	let telReg = /^(?:(010-\d{4})|(01[1|6|7|8|9]-\d{3,4}))-(\d{4})$/;
	if (!telReg.test(tel.value)) {
		alert("휴대폰번호가 올바르지 않습니다.");
		tel.focus();
		return false;
	}
	if (!isNaN(tel.value)) {
		alert("번호는 숫자만 입력가능합니다.");
		tel.focus();
		return false;
	}
	if (tel.value == "") {
		alert("휴대폰번호를 입력하세요.");
		tel.focus();
		return false;
	}

	// 이메일 정규식을 통한 유효성 검사
	let emailReg = /^(([^<>()[\].,;:\s@"]+(\.[^<>()[\].,;:\s@"]+)*)|(".+"))@(([^<>()[\].,;:\s@"]+\.)+[^<>()[\].,;:\s@"]{2,})$/i
	if (!emailReg.test(email.value)) {
		alert("이메일 형식에 올바르지 않습니다.");
		email.focus();
		return false;
	}

	if (zipcode.value == "") {
		alert("우편번호를 검색하세요.");
		sample6_DaumPostcode();
		return false;
	}
	if (detailAddr.value == "") {
		alert("상세주소를 입력하세요.");
		detailAddr.focus();
		return false;
	}
	return true;
}

