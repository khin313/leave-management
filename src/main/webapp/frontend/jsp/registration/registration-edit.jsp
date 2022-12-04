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
    <h3 class="my-5 text-center">${empty param.id ? 'Add New' : 'Edit'} Registration</h3>
    <div class="row">
        <sf:form action="registration" modelAttribute="registForm"
                 cssClass="col-lg-6 col-md-9 col-sm-12 mx-auto"
                 method="post">
            <sf:hidden path="studentId"/>
            <sf:hidden path="classId"/>
            <sf:hidden path="regisDate"/>
            <div class="mb-3">
                <label class="form-label">Start Date</label>
                <span class="form-control">
                        ${classInf.start_date}
                </span>
            </div>
            <div class="mb-3">
                <label class="form-label">Teacher</label>
                <span class="form-control">
                        ${classInf.teacher}
                </span>
            </div>
            <div class="mb-3">
                <label class="form-label">Student Name</label>
                <sf:input type="text" path="studentName" cssClass="form-control"
                          placeholder="Student Name"/>
                <sf:errors path="studentName" cssClass="text-danger"/>
            </div>
            <div class="mb-3">
                <label class="form-label">Student Email</label>
                <sf:input type="email" path="email" cssClass="form-control"
                          placeholder="Student Email"/>
                <sf:errors path="email" cssClass="text-danger"/>
            </div>
            <div class="mb-3">
                <label class="form-label">Student Phone</label>
                <sf:input type="tel" path="phone" cssClass="form-control"
                          placeholder="Student Phone"/>
                <sf:errors path="phone" cssClass="text-danger"/>
            </div>
            <div class="mb-3">
                <label class="form-label">Last Education</label>
                <sf:input type="tel" path="education" cssClass="form-control"
                          placeholder="Education"/>
                <sf:errors path="education" cssClass="text-danger"/>
            </div>
            <button class="btn btn-outline-secondary">
                <i class="bi bi-save"></i>
                Save
            </button>
        </sf:form>
    </div>
</section>

</body>
</html>
