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
    <h3 class="my-5 text-center">${empty param.id ? 'Add New' : 'Edit'} Teacher</h3>
    <div class="row">
        <c:url var="save" value="/teachers"></c:url>
        <sf:form method="post" modelAttribute="form" action="${save}"
                 cssClass="col-lg-6 col-md-9 col-sm-12 mx-auto">
            <sf:hidden path="id"/>
            <div class="mb-3">
                <label class="form-label">Name</label>
                <sf:input type="text" path="name" cssClass="form-control"
                          placeholder="Enter Teacher Name"/>
                <sf:errors path="name" cssClass="text-danger"/>
            </div>
            <div class="mb-3">
                <label class="form-label">Phone Number</label>
                <sf:input type="tel" path="phone" cssClass="form-control"
                          placeholder="Enter Teacher Phone"/>
                <sf:errors path="phone" cssClass="text-danger"/>
            </div>
            <div class="mb-3 ${empty param.id ? '' : "d-none"}">
                <label class="form-label">Email</label>
                <sf:input type="email" path="email" cssClass="form-control"
                          placeholder="Enter Teacher Email"/>
                <sf:errors path="email" cssClass="text-danger"/>
            </div>
            <div class="mb-5">
                <label class="form-label">Assign Date</label>
                <sf:input type="date" path="assignDate" cssClass="form-control"/>
                <sf:errors path="assignDate" cssClass="text-danger"/>
            </div>
            <div>
                <button class="btn btn-outline-primary w-100" type="submit">
                    <i class="bi bi-save"></i> Save
                </button>
            </div>

        </sf:form>
    </div>
</section>
</body>
</html>
