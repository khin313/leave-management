<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
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

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
    <title>Leaves | Sign In</title>
</head>
<body class="vh-100">
    <div class="d-flex vh-100 justify-content-center align-items-center">
        <div class="card w-25">
            <div class="card-header">
                <i class="bi bi-door-open"></i>
                Sign In
            </div>
            <div class="card-body">

                <c:if test="${not empty param.error}">
                    <div class="alert alert-danger">Login Error.</div>
                </c:if>

                <c:url var="signin" value="/sign-in"/>
                <sf:form action="${signin}" method="post">
                    <div class="my-3">
                        <label class="form-label">Email</label>
                        <input type="email" name="username" placeholder="Enter Your Email" class="form-control">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Password</label>
                        <input type="password" name="password" placeholder="Enter Your Password" class="form-control">
                    </div>
                    <div class="my-3">
                        <button type="submit" class="btn btn-outline-success">
                            <i class="bi bi-door-open"></i>
                            Sign In
                        </button>
                    </div>
                </sf:form>
            </div>
        </div>
    </div>
</body>
</html>
