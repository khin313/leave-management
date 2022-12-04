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
        <c:param name="view" value="teachers"/>
    </c:import>
</header>
<section class="container">
    <h3 class="my-5 text-center">Teacher Management</h3>

    <%--Search Bar--%>
    <form class="row mb-5">
        <div class="col-auto mb-3">
            <label class="form-label">Name</label>
            <input type="text" name="name" value="${param.name}" class="form-control"
                   placeholder="Search Name">
        </div>
        <div class="col-auto mb-3">
            <label class="form-label">Phone</label>
            <input type="tel" name="phone" value="${param.phone}" class="form-control"
                   placeholder="Search Phone">
        </div>
        <div class="col-auto mb-3">
            <label class="form-label">Email</label>
            <input type="email" name="email" value="${param.email}" class="form-control"
                   placeholder="Search Email">
        </div>
        <div class="col-auto btn-wrapper">
            <button class="btn btn-outline-success me-3" type="submit">
                <i class="bi bi-search"></i>
                Search
            </button>
            <c:url var="addNew" value="/teachers/edit"/>
            <a href="${addNew}" class="btn btn-outline-primary">
                <i class="bi bi-plus"></i>
                Add New</a>
        </div>
    </form>

    <c:choose>
        <c:when test="${empty list}">
            <div class="alert alert-info">There is no data</div>
        </c:when>
        <c:otherwise>
            <%--Table view--%>
            <table class="table table-hover">
                <thead>
                <tr>
                    <th>Id</th>
                    <th>Name</th>
                    <th>Phone</th>
                    <th>Email</th>
                    <th>Assign Date</th>
                    <th>Classes</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${list}" var="teacher">
                    <tr>
                        <td>${teacher.id}</td>
                        <td>${teacher.name}</td>
                        <td>${teacher.phone}</td>
                        <td>${teacher.email}</td>
                        <td>${teacher.assignDate}</td>
                        <td>${teacher.classCount}</td>
                        <td>
                            <c:url var="edit" value="/teachers/edit">
                                <c:param name="id" value="${teacher.id}"/>
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
