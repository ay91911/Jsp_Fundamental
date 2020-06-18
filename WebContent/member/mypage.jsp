<%@page import="kr.or.kpc.dao.CustomerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp"%>

<%//다이렉트로 들어오는 것을 막아주는 것
	if(customerDto==null){
		response.sendRedirect("/member/login.jsp");
		return;
	}
	String email = customerDto.getEmail();
	CustomerDao dao = CustomerDao.getInstance();
	CustomerDto dto = dao.select(email);
	
%>

<nav aria-label="breadcrumb">
	<ol class="breadcrumb justify-content-end">
		<li class="breadcrumb-item"><a href="#">홈</a></li>
		<li class="breadcrumb-item active">회원수정</li>
	</ol>
</nav>
<div class="container">
	<div class="row">
		<div class="col-md-12">
			<h3>회원수정</h3>
			<form method="post" name="f" action="update.jsp">
				<div class="form-group">
					<input type="text" class="form-control" id="email" name="email"
						placeholder="Your Email *" value="<%=dto.getEmail()%>" readonly/>
					<div class="invalid-feedback" id="errorEmail">이메일을 입력하세요.</div>
					<div class="valid-feedback">Looks good!</div>
				</div>
				<div class="form-group">
					<input type="password" class="form-control" id="cpwd" name="cpwd"
						placeholder="현재비밀번호" value="" />
					<div class="invalid-feedback" id="errorcPwd">비밀번호를 입력하세요.</div>
					<div class="valid-feedback">Looks good!</div>
				</div>
				<div class="form-group">
					<input type="password" class="form-control" id="pwd" name="pwd"
						placeholder="신규비밀번호" value="" />
					<div class="invalid-feedback" id="errorPwd">비밀번호를 입력하세요.</div>
					<div class="valid-feedback">Looks good!</div>
				</div>
				<div class="form-group">
					<input type="password" class="form-control" id="repwd" name="repwd"
						placeholder="비밀번호 다시 입력" value="" />
					<div class="invalid-feedback" id="errorRePwd">비밀번호를 입력하세요.</div>
					<div class="valid-feedback">Looks good!</div>
				</div>
				<div class="form-group">
					<input type="text" class="form-control" id="name" name="name"
						placeholder="Your Name *" value="<%=dto.getName()%>" />
					<div class="invalid-feedback" id="errorName">이름을 입력하세요.</div>
					<div class="valid-feedback">Looks good!</div>
				</div>
			</form>

			<div class="text-right" style="margin-bottom: 20px;">
				<a href="" id="saveCustomer" class="btn btn-outline-danger">회원수정</a>
				<a href="" class="btn btn-outline-success">취소</a>
			</div>
		</div>

	</div>
</div>
<script>
	$(function() {
		const cpwd = $("#cpwd");
		const pwd = $("#pwd");
		const repwd = $("#repwd");
		const name = $("#name");
		let success = false;
		$("#saveCustomer").click(function(e) {
			e.preventDefault();
			
			if (!cpwd.val()) {
				cpwd.addClass("is-invalid");
				$("#errorcPwd").text('비밀번호를 입력하세요.');
			}else{
			if (cpwd.val().length >= 8 && cpwd.val().length <= 12) {
				cpwd.addClass("is-valid");
				success = true;
			} else {
				$("#errorcPwd").text('비밀번호는 8-12자리 이어야 합니다.');
				cpwd.addClass("is-invalid");
				cpwd.focus();
				return;
			}
			}
			
			if (!pwd.val()) {
				pwd.addClass("is-invalid");
				$("#errorPwd").text('비밀번호를 입력하세요.');
			}else{
			if (pwd.val().length >= 8 && pwd.val().length <= 12) {
				pwd.addClass("is-valid");
				success = true;
			} else {
				$("#errorPwd").text('비밀번호는 8-12자리 이어야 합니다.');
				pwd.addClass("is-invalid");
				pwd.focus();
				return;
			}
			}

			if (!repwd.val()) {
				repwd.removeClass("is-valid");
				repwd.addClass("is-invalid");
				$("#errorRePwd").text('비밀번호를 입력하세요.');
				
			}else{

			if (pwd.val() != repwd.val()) {
				repwd.removeClass("is-valid");
				repwd.addClass("is-invalid");
				$("#errorRePwd").text('비밀번호가 일치하지 않습니다.');
				repwd.focus();
				return;
			} else {
				repwd.addClass("is-valid");
				success = true;
			}
			}

			if (!name.val()) {
				name.removeClass("is-valid");
				name.addClass("is-invalid");
				$("#errorName").text('이름을 입력하세요.');
			} else {
				name.removeClass("is-invalid");
				name.addClass("is-valid");
				success = true;
			}
			
			if(!cpwd.val()){
				cpwd.focus();
				return;
			}
			if(!pwd.val()){
				pwd.focus();
				return;
			}
			if(!repwd.val()){
				repwd.focus();
				return;
			}
			if(!name.val()){
				name.focus();
				return;
			}
			
			if(success){
				f.submit();
			}
		});

		cpwd.keyup(function(e) {
			cpwd.removeClass("is-invalid");
			if (!cpwd.val()) {
				cpwd.removeClass("is-invalid");
				cpwd.removeClass("is-valid");
				return;
			}
			if (cpwd.val().length >= 8 && cpwd.val().length <= 12) {
				cpwd.addClass("is-valid");
			} else {
				cpwd.removeClass("is-valid");
				$("#errorcPwd").text('비밀번호는 8-12자리 이어야 합니다.');
				cpwd.addClass("is-invalid");
			}

		});
			
		pwd.keyup(function(e) {
			pwd.removeClass("is-invalid");
			if (!pwd.val()) {
				pwd.removeClass("is-invalid");
				pwd.removeClass("is-valid");
				return;
			}
			if (pwd.val().length >= 8 && pwd.val().length <= 12) {
				pwd.addClass("is-valid");
			} else {
				pwd.removeClass("is-valid");
				$("#errorPwd").text('비밀번호는 8-12자리 이어야 합니다.');
				pwd.addClass("is-invalid");
			}

		});

		repwd.blur(function() {//커서가 나갈떄 발생하는 이벤트
			if (!repwd.val()) {
				repwd.removeClass("is-valid");
				repwd.addClass("is-invalid");
				$("#errorRePwd").text('비밀번호를 입력하세요.');
				return;
			} else {

				if (pwd.val() != repwd.val()) {
					repwd.removeClass("is-valid");
					repwd.addClass("is-invalid");
					$("#errorRePwd").text('비밀번호가 일치하지 않습니다.');
				} else {
					repwd.removeClass("is-invalid");
					repwd.addClass("is-valid");
				}
			}
		});

	});
</script>
<%@ include file="../inc/footer.jsp"%>

