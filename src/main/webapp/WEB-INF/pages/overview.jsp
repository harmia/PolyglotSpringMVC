<%--
  Created by IntelliJ IDEA.
  User: harmia
  Date: 16.4.2013
  Time: 21:13
  Copyright (C) 2013 Juhana "harmia" Harmanen
  Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
  The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta name="activePage" content="OVERVIEW"/>
    <title><fmt:message key="overview.title" /></title>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="span8 offset2">

            <h3><fmt:message key="overview.total" ><fmt:param value="${departments.size()}"/><fmt:param value="${employees.size()}"/></fmt:message></h3>

            <ul class="nav nav-pills" data-tabs="tabs">
                <c:forEach items="${departments}" var="department" varStatus="status">
                    <li ${status.first ? 'class="active"' : ''}><a href="#${department.id}" data-toggle="tab"><c:out value="${department.name}"/></a></li>
                </c:forEach>
            </ul>

            <div class="pill-content">
                <c:forEach items="${departments}" var="department" varStatus="status">
                    <div class="pill-pane ${status.first ? ' active' : ''}" id="${department.id}">
                        <table class="table table-bordered table-striped">
                            <thead>
                            <tr>
                                <th>Name</th>
                                <th>Email</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${employees}" var="employee">
                                <c:if test="${employee.department.id == department.id}">
                                    <tr>
                                        <td><c:out value="${employee.lastName}"/>, <c:out value="${employee.firstName}"/></td>
                                        <td><c:out value="${employee.email}"/></td>
                                    </tr>
                                </c:if>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
</body>
</html>
<script>
    $(function () {
        $('.nav.nav-pills').tabs();
    });
</script>