<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<table class="table table-hover">
    <thead>
    <tr>
        <th>ID</th>
        <th>Registration Date</th>
        <th>Student</th>
        <th>Phone</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td>1</td>
        <td>2022-10-1</td>
        <td>Aung Aung</td>
        <td>09978645189</td>
        <td>
            <c:url var="detail" value="/classes/registration/1" />
            <a href="${detail}" class="btn btn-outline-success me-3">
                <i class="bi bi-cursor"></i>
                Detail</a>
            <c:url var="edit" value="/classes/registration">
                <c:param name="registId" value="1" />
            </c:url>
            <a href="${edit}" class="btn btn-outline-success">
                <i class="bi bi-pencil"></i>
                Edit</a>
        </td>
    </tr>
    </tbody>
</table>