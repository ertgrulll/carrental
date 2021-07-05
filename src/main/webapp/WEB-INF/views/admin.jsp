<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false" pageEncoding="utf-8"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html>
<head>
<title>Home</title>
<link rel="stylesheet"
	href="<c:url value="/resources/css/bootstrap.min.css" />">
<link rel="stylesheet"
	href="<c:url value="/resources/css/home/fonts/font-awesome.min.css" />">
<link rel="stylesheet"
	href="<c:url value="/resources/css/home/Navigation-with-Button.css" />">
<link rel="stylesheet"
	href="<c:url value="/resources/css/home/Sidebar-Cool-SB-Admin-Inspirate.css" />">
<link rel="stylesheet"
	href="<c:url value="/resources/css/home/styles.css" />">
</head>
<body>
	<nav id="nav-container"
		class="navbar navbar-dark bg-info navbar-expand-md navigation-clean-button">
		<div class="container">
			<a class="navbar-brand" href="#">Car Rental</a>
			<button data-toggle="collapse" class="navbar-toggler"
				data-target="#navcol-1">
				<span class="sr-only">Toggle navigation</span><span
					class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navcol-1">
				<ul class="nav navbar-nav mr-auto">
					<li class="nav-item dropdown"><a
						class="dropdown-toggle nav-link" data-toggle="dropdown"
						aria-expanded="false" href="#">Kullanıcı İşlemleri</a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="#">Kullanıcı ekle</a><a
								class="dropdown-item" href="#">Kullanıcı sil</a>
						</div></li>
					<li class="nav-item dropdown"><a
						class="dropdown-toggle nav-link" data-toggle="dropdown"
						aria-expanded="false" href="#">Bayi İşlemleri</a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="#">Bayi ekle</a><a
								class="dropdown-item" href="#">Bayi sil</a>
							<!-- 							<a	class="dropdown-item" href="#"></a> -->
						</div></li>
				</ul>
				<form id="logoutForm" action="${contextPath}/logout" method="POST">
					<span class="navbar-text actions"> <a
						class="btn btn-primary action-button" role="button"
						onclick="document.forms['logoutForm'].submit()">Çıkış Yap</a> <input
						type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					</span>
				</form>
			</div>
		</div>
	</nav>
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<div id="sidenavAccordion"
				class="sb-sidenav accordion sb-sidenav-dark">
				<div class="sb-sidenav-menu">
					<div class="nav">
						<div>
							<div class="sb-sidenav-menu-heading">
								<span>Bayiler</span>
							</div>
							<a class="nav-link active" href="#">
								<div class="sb-nav-link-icon">
									<i class="fa fa-dashboard"></i>
								</div> <span>Dashboard</span>
							</a>
						</div>
						<div>
							<div class="sb-sidenav-menu-heading">
								<span>Araçlar</span>
							</div>
							<a class="nav-link collapsed" href="#" data-toggle="collapse"
								data-target="#collapseLayouts" aria-expanded="false"
								aria-controls="collapseLayouts">
								<div class="sb-nav-link-icon">
									<i class="fa fa-dashboard"></i>
								</div> <span>Araç İşlemleri</span>
								<div class="sb-sidenav-collapse-arrow">
									<i class="fa fa-angle-down"></i>
								</div>
							</a>
							<div id="collapseLayouts" class="collapse"
								aria-labelledby="headingOne" data-parent="#sidenavAccordion">
								<div class="sb-sidenav-menu-nested nav">
									<a class="nav-link" href="#">Araçları listele</a><a
										class="nav-link" href="#">Araç işlemleri</a>
								</div>
							</div>
						</div>
						<div>
							<div class="sb-sidenav-menu-heading">
								<span>Kullanıcılar</span>
							</div>
							<a class="nav-link collapsed" href="#" data-toggle="collapse"
								data-target="#collapse2" aria-expanded="false"
								aria-controls="collapse2">
								<div class="sb-nav-link-icon">
									<i class="fa fa-dashboard"></i>
								</div> <span>Kullanıcı Görüntüle</span>
								<div class="sb-sidenav-collapse-arrow">
									<i class="fa fa-angle-down"></i>
								</div>
							</a>
							<div id="collapse2" class="collapse" aria-labelledby="heading2"
								data-parent="#sidenavAccordion">
								<div id="sidenavAccordionPages"
									class="sb-sidenav-menu-nested nav accordion">
									<a class="nav-link collapsed" href="#" data-toggle="collapse"
										data-target="#pagesCollapseAuth" aria-expanded="false"
										aria-controls="pagesCollapseAuth"><span>Menu secenek</span>
										<div class="sb-sidenav-collapse-arrow">
											<i class="fa fa-angle-down"></i>
										</div></a>
									<div id="pagesCollapseAuth" class="collapse"
										aria-labelledby="headingOne"
										data-parent="#sidenavAccordionPages">
										<div class="sb-sidenav-menu-nested nav">
											<a class="nav-link" href="#">Menu secenek</a><a class="nav-link"
												href="#">Menü</a><a class="nav-link" href="#">Menu secenek</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="sb-sidenav-footer">
					<div class="small">
						<span>Kullanıcı: ${username}</span>
					</div>
				</div>
			</div>
		</div>
		<div id="layoutSidenav_content">
			<main>
				<c:forEach var="user" items="${user}">
					<p>${user.username}</p>
					<p>${user.password }</p>
					<p>${user.email }</p>
					<br>
				</c:forEach>
			</main>
		</div>
	</div>
	<script src="<c:url value="/resources/js/jquery.min.js" />"></script>
	<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
</body>
</html>
