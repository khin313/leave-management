<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet"
	  href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<%--Dynamic Links--%>
<c:url var="home" value="/home"/>
<c:url var="teachers" value="/teachers"/>
<c:url var="classes" value="/classes"/>
<c:url var="students" value="/students"/>
<c:url var="leaves" value="/leaves"/>
<c:url var="signOut" value="/sign-out"/>
<c:url var="signJs" value="/resources/logout.js"/>

<script src="${signJs}" defer></script>

<nav class="navbar navbar-expand-lg bg-dark navbar-dark text-white px-5">
	<div class="container">
		<div>
			<a href="${home}" class="navbar-brand">Leave Management</a>
		</div>
		<ul class="navbar-nav">
			<sec:authorize access="hasAuthority('ADMIN')">
				<li class="nav-item">
					<a href="${teachers}"
					   class="nav-link ${param.view eq 'teachers' ? 'active' : ''}">
						<i class="bi bi-people"></i>
						Teachers</a>
				</li>
			</sec:authorize>
			<sec:authorize access="hasAnyAuthority('ADMIN', 'TEACHER')">
				<li class="nav-item">
					<a href="${classes}"
					   class="nav-link ${param.view eq 'classes' ? 'active' : ''}">
						<i class="bi bi-mortarboard"></i>
						Classes</a>
				</li>
				<li class="nav-item">
					<a href="${students}"
					   class="nav-link ${param.view eq 'students' ? 'active' : ''}">
						<i class="bi bi-people"></i>
						Students</a>
				</li>
			</sec:authorize>
			<li class="nav-item">
				<a href="${leaves}" class="nav-link ${param.view eq 'leaves' ? 'active' : ''}">
					<i class="bi bi-inbox"></i>
					Leaves</a>
			</li>
			<li class="nav-item">
				<sf:form action="${signOut}" method="post">
					<button type="submit" class="btn btn-outline-light ms-3">
						<i class="bi bi-box-arrow-left"></i>
						Sign Out
					</button>
				</sf:form>
			</li>
		</ul>
	</div>
</nav>

<%--<sf:form id="logoutForm" action="${signOut}" method="post" cssClass="d-none"></sf:form>--%>
