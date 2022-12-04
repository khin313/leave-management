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
    <h3 class="my-5 text-center">${empty param.id ? 'Add New' : 'Edit'} Class</h3>
    <div class="row">
        <c:url var="save" value="/classes"/>
        <sf:form method="post" modelAttribute="classForm" action="${save}"
                 cssClass="col-lg-6 col-md-9 col-sm-12 mx-auto">
            <sf:hidden path="id"/>
            <div class="mb-3">
                <label class="form-label">Teacher</label>
                <sf:select path="teacher" items="${teachers}" itemLabel="name" itemValue="id"
                           cssClass="form-select"/>
                <sf:errors path="teacher" cssClass="text-danger"/>
            </div>
            <div class="row mb-3">
                <div class="col">
                    <label class="form-label">Start Date</label>
                    <sf:input type="date" path="start_date" cssClass="form-control"/>
                    <sf:errors path="start_date" cssClass="text-danger"/>
                </div>
                <div class="col">
                    <label class="form-label">Months</label>
                    <sf:input type="number" path="months" cssClass="form-control"
                              placeholder="Enter Months"/>
                    <sf:errors path="months" cssClass="text-danger"/>
                </div>
            </div>
            <div class="mb-5">
                <label class="form-label">Description</label>
                <sf:textarea path="description" cssClass="form-control"/>
                <sf:errors path="description" cssClass="text-danger"/>
            </div>
            <div>
                <button class="btn btn-outline-primary w-100" type="submit">
                    <i class="bi bi-save"></i>
                    Save
                </button>
            </div>

        </sf:form>
    </div>
</section>

</body>
</html>
