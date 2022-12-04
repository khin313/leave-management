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
    <c:url value="/resources/application.css" var="commonCss"/>
    <link rel="stylesheet" href="${bootstrapCss}">
    <link rel="stylesheet" href="${commonCss}">
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
<section class="container">
    <h3 class="my-5 text-center">Class Management</h3>

    <%--Search Bar--%>
    <form class="row mb-5">
        <div class="col-auto mb-3">
            <label class="form-label">Class Name</label>
            <input type="text" name="name" class="form-control" placeholder="Search Class Name"
                   value="${param.teacher}">
        </div>
        <div class="col-auto mb-3">
            <label class="form-label">Date From</label>
            <input type="date" name="from" class="form-control" value="${param.from}">
        </div>
        <div class="col-auto mb-3">
            <label class="form-label">Date To</label>
            <input type="date" name="to" class="form-control" value="${param.to}">
        </div>
        <div class="col-auto btn-wrapper">
            <button class="btn btn-outline-success me-3" type="submit">
                <i class="bi bi-search"></i>
                Search
            </button>
            <c:url var="addNew" value="/classes/edit"/>
            <a href="${addNew}" class="btn btn-outline-primary">
                <i class="bi bi-plus"></i>
                Add New</a>
        </div>
    </form>

    <%--Table view--%>
    <c:choose>
        <c:when test="${empty list}">
            <div class="alert alert-info">There is no data</div>
        </c:when>
        <c:otherwise>
            <table class="table table-hover">
                <thead>
                <tr>
                    <th>Id</th>
                    <th>Teacher Name</th>
                    <th>Teacher Phone</th>
                    <th>Start Date</th>
                    <th>Months</th>
                    <th>Students Count</th>
                    <th>Description</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${list}" var="c">
                    <tr>
                        <td>${c.id}</td>
                        <td>${c.teacherName}</td>
                        <td>${c.teacherPhone}</td>
                        <td>${c.startDate}</td>
                        <td>${c.months}</td>
                        <td>${c.studentCount}</td>
                        <td>${c.description}</td>
                        <td>
                            <c:url var="details" value="/classes/${c.id}"/>
                            <a href="${details}" class="btn btn-outline-secondary me-3">
                                <i class="bi bi-cursor"></i>
                                Detail</a>
                            <c:url var="edit" value="/classes/edit">
                                <c:param name="id" value="${c.id}"/>
                            </c:url>
                            <a href="${edit}" class="btn btn-outline-success">
                                <i class="bi bi-pencil"></i>
                                Edit</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </c:otherwise>
    </c:choose>

</section>
</body>
</html>
