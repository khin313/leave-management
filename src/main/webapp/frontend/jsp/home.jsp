<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <c:url value="/resources/css/bootstrap.min.css" var="bootstrapCss"/>
    <c:url value="/resources/js/bootstrap.bundle.min.js" var="bootstrapJs"/>

    <link rel="stylesheet" href="${bootstrapCss}">
    <script src="${bootstrapJs}"></script>
    <title>Leaves | Home</title>
</head>
<body>
<header>
<%--  Nav  --%>
    <c:import url="/frontend/include/navbar.jsp" />
</header>
</body>
</html>
