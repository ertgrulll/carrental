<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page session="false" pageEncoding="utf-8"%>
<html>
<head>
<title>Home</title>
<link rel="stylesheet" href="<c:url value="/resources/css/index.css" />" />
<script src="<c:url value="/resources/js/index.js" />"></script>
</head>
<body>
	<div class="login-wrap">
		<div class="login-html">
			<input id="tab-1" type="radio" name="tab" class="sign-in" checked>
			<label for="tab-1" class="tab">Giriş Yap</label>
			<!-- on login error rotate to register ${error ? 'checked' : ''} -->
			<input id="tab-2" type="radio" name="tab" class="sign-up"> <label
				for="tab-2" class="tab">Kayıt Ol</label>
			<div class="login-form">

				<form method="POST" action="login">
					<div class="sign-in-htm">
						<div class="group">
							<label for="user" class="label">Kullanıcı adı</label> <input
								name="username" type="text" class="input" id="user"
								pattern="(?=.*\d*)(?=.*[a-z]*)(?=.*[A-Z]*).{6,32}"
								title="Kullanıcı adı için en az 6 karakter girin!" required
								autofocus />
						</div>

						<div class="group">
							<label for="pass" class="label">ŞİFRE</label> <input id="pass"
								name="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,32}"
								title="Şifreniz doğru bir formda değil, tekrar deneyin!"
								type="password" class="input" data-type="password" required />
						</div>

						<div class="group">
							<input type="submit" class="button" value="Giriş Yap">
						</div>
						<div class="hr"></div>
						<div class="foot-lnk">
							<span>${error}</span>
						</div>
					</div>
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
				</form>

				<form:form method="POST" modelAttribute="userForm"
					action="registration">
					<div class="sign-up-htm">
						<spring:bind path="username">
							<div class="group">
								<label for="user" class="label">Kullanıcı adı</label>
								<form:input path="username" id="user" type="text" class="input"
									pattern="(?=.*\d*)(?=.*[a-z]*)(?=.*[A-Z]*).{6,32}"
									title="En az 6 karakter girmelisiniz!" required="true" autofocus="true" />
									<form:errors style="float:right; color:#FF6461; margin-top: 5px;" path="username"></form:errors>
							</div>
						</spring:bind>

						<spring:bind path="password">
							<div class="group">
								<label for="pass" class="label">Şifre</label>
								<form:input id="pass" path="password" type="password"
									class="input" data-type="password"
									pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,32}"
									title="Şifre en az 8 karakter, bir rakam, bir büyük ve bir küçük harf içermeli"
									required="true" />
							</div>
						</spring:bind>

						<spring:bind path="passwordConfirm">
							<div class="group">
								<label for="pass" class="label">Tekrar Şifre</label>
								<form:input path="PasswordConfirm" id="pass" type="password"
									class="input" data-type="password"
									pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,32}"
									title="Şifre en az 8 karakter, bir rakam, bir büyük ve bir küçük harf içermeli"
									required="true" />
									<form:errors style="float:right; color:#FF6461; margin-top: 5px;" path="passwordConfirm"></form:errors>
							</div>
						</spring:bind>

						<spring:bind path="email">
							<div class="group">
								<label for="pass" class="label">Email Adresi</label>
								<form:input path="email" id="pass" type="text" class="input"
									required="true" />
							</div>
						</spring:bind>

						<div class="group">
							<input type="submit" class="button" value="Kayıt Ol">
						</div>
						<div class="hr"></div>
						<div class="foot-lnk">
							<label for="tab-1">Zaten üye misiniz?</a>
						</div>
					</div>
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>
