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
    <c:import url="/frontend/include/navbar.jsp">
        <c:param name="view" value="classes"/>
    </c:import>
</header>
<section>
    <div class="container">
        <h3 class="my-4">Registration Details</h3>
        <div class="row">
            <div class="col">
                <div class="card">
                    <div class="card-header">Student Information</div>
                    <div class="card-body">
                        <div class="mb-3">
                            <label class="form-label">Student Name</label>
                            <span class="form-control">${dto.student.name}</span>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Student Phone</label>
                            <span class="form-control">${dto.student.phone}</span>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Student Email</label>
                            <span class="form-control">${dto.student.email}</span>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Student Education</label>
                            <span class="form-control">${dto.student.education}</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card">
                    <div class="card-header">Class Information</div>
                    <div class="card-body">
                        <div class="mb-3">
                            <label class="form-label">Teacher Name</label>
                            <span class="form-control">${dto.classInfo.teacherName}</span>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Start Date</label>
                            <span class="form-control">${dto.classInfo.startDate}</span>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Durations</label>
                            <span class="form-control">${dto.classInfo.months}</span>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Description</label>
                            <span class="form-control">${dto.classInfo.description}</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="mt-4">
            <c:url var="edit" value="/classes/registration">
                <c:param name="registId" value="1"/>
            </c:url>
            <a href="${edit}" class="btn btn-outline-danger">
                <i class="bi bi-pencil"></i>
                Edit Registration
            </a>
        </div>
    </div>
</section>
</body>
</html>
