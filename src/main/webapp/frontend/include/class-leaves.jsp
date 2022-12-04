<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<table class="table table-hover">
    <thead>
    <tr>
        <th>Student</th>
        <th>Phone</th>
        <th>Apply Date</th>
        <th>Leave Start</th>
        <th>Leave Day</th>
        <th>Reason</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${dto.leaves}" var="item">
        <tr>
            <td>Aung Aung</td>
            <td>09978645189</td>
            <td>2022-10-1</td>
            <td>2022-10-15</td>
            <td>3</td>
            <td>For JLPT Exam</td>
            <td>
                <c:url var="edit" value="/classes/registration">
                    <c:param name="id" value="1" />
                </c:url>
                <a href="${edit}" class="">
                    <i class="bi bi-pencil"></i>
                    Edit</a>
            </td>
        </tr>
    </c:forEach>

    </tbody>
</table>
