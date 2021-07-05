<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">

<title>Yetki Dışı</title>
</head>
<body>
	<div class="container">
		<h2 class="text-center font-monospace">Bu sayafaya erişim yetkisine sahip değilsiniz</h2>
		<p class="fs-2 text-center font-monospace">5 saniye içinde giriş sayfasına yönleniriliyorsunuz!</p>
		<script>setTimeout(() => {window.location.href = "/index"}, 5000)</script>
	</div>
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>