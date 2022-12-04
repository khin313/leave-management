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
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
    <title>Leaves | Home</title>
</head>
<body>
<header>
    <%--  Nav  --%>
    <c:import url="/frontend/include/navbar.jsp">
        <c:param name="view" value="classes"/>
    </c:import>
</header>
<div class="container">
    <h3 class="my-4">Class Details</h3>
    <div class="card mb-4">
        <div class="card-header">Class Information</div>
        <div class="card-body row ">
            <div class="col">
                <label class="form-label">Teacher</label>
                <span class="form-control">${dto.classInfo.teacherName}</span>
            </div>
            <div class="col">
                <label class="form-label">Start Date</label>
                <span class="form-control">${dto.classInfo.startDate}</span>
            </div>
            <div class="col">
                <label class="form-label">Durations</label>
                <span class="form-control">${dto.classInfo.months}</span>
            </div>
            <div class="col">
                <label class="form-label">Description</label>
                <span class="form-control">${dto.classInfo.description}</span>
            </div>
        </div>
    </div>

    <div class="d-flex justify-content-between mb-5">
        <ul class="nav nav-pills">
            <li class="nav-item">
                <button class="nav-link active me-3" data-bs-toggle="pill"
                        data-bs-target="#registrations">
                    <i class="bi bi-people"></i>
                    Registration
                </button>
            </li>
            <li class="nav-item">
                <button class="nav-link" data-bs-toggle="pill" data-bs-target="#leaves">
                    <i class="bi bi-person-x"></i>
                    Leave Application
                </button>
            </li>
        </ul>
        <div>
            <c:url value="/classes/edit" var="editClass">
                <c:param name="id" value="${dto.classInfo.id}"/>
            </c:url>
            <a href="${editClass}" class="btn btn-outline-danger">
                <i class="bi bi-pencil"></i>
                Edit Class</a>
            <c:url value="/classes/registration" var="addClass">
                <c:param name="classId" value="${dto.classInfo.id}"/>
            </c:url>
            <a href="${addClass}" class="btn btn-outline-primary">
                <i class="bi bi-plus"></i>
                Add New Registration</a>
        </div>
    </div>
    <div class="tab-content" id="contents">
        <div class="tab-pane fade show active" id="registrations">
            <!-- Class Registration -->
            <c:choose>
                <c:when test="${empty dto.registrations}">
                    <div class="alert alert-info">There is no registration data</div>
                </c:when>
                <c:otherwise>
                    <c:import url="/frontend/include/class-registration.jsp"/>
                </c:otherwise>
            </c:choose>
        </div>
        <div class="tab-pane fade" id="leaves">
            <!-- Class Leaves -->
            <c:choose>
                <c:when test="${empty dto.leaves}">
                    <div class="alert alert-info">There is no leaves data</div>
                </c:when>
                <c:otherwise>
                    <c:import url="/frontend/include/class-leaves.jsp"/>
                </c:otherwise>
            </c:choose>
        </div>
    </div>

</div>
</body>
</html>
